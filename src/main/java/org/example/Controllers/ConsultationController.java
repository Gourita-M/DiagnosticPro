package org.example.Controllers;

import java.io.IOException;

import org.example.dao.ConsultationDAO;
import org.example.dao.ExpertiseRequestDAO;
import org.example.dao.PatientDAO;
import org.example.dao.PersonDao;
import org.example.Models.*;
import org.example.enums.ConsultationStatus;
import org.example.enums.ExpertiseStatus;
import org.example.enums.Priority;
import org.example.enums.RoleType;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/consultation")
public class ConsultationController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer practitionerId = (Integer) request.getSession().getAttribute("userId");
        if (practitionerId == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Person practitioner = PersonDao.getPersonById(practitionerId);
        if (practitioner == null || practitioner.getRole() != RoleType.PRACTITIONER) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        int patientId;
        try {
            patientId = Integer.parseInt(request.getParameter("patientId"));
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        if ("expertise".equals(request.getParameter("action"))) {
            handleExpertiseRequest(request, response, patientId, practitionerId);
            return;
        }

        Consultation consultation = new Consultation();
        consultation.setReason(request.getParameter("reason"));
        consultation.setSymptoms(request.getParameter("symptoms"));
        consultation.setExamination(request.getParameter("examination"));
        consultation.setObservations(request.getParameter("observations"));
        consultation.setDiagnosis(request.getParameter("diagnosis"));
        consultation.setPrescribedTreatment(request.getParameter("prescribedTreatment"));
        consultation.setStatus(ConsultationStatus.COMPLETED);

        if (isBlank(consultation.getReason()) || isBlank(consultation.getSymptoms())
                || isBlank(consultation.getExamination()) || isBlank(consultation.getDiagnosis())
                || isBlank(consultation.getPrescribedTreatment())) {
            request.getSession().setAttribute("consultationError", "Complete the complaint, symptoms, examination, diagnosis, and treatment before closing.");
            response.sendRedirect(request.getContextPath() + "/consultation?patientId=" + patientId);
            return;
        }

        if (ConsultationDAO.createConsultation(consultation, patientId, practitionerId)) {
            response.sendRedirect(request.getContextPath() + "/consultation");
        } else {
            request.getSession().setAttribute("consultationError", "Unable to save consultation. The patient may no longer be waiting.");
            response.sendRedirect(request.getContextPath() + "/consultation?patientId=" + patientId);
        }
    }

    private boolean isBlank(String value) {
        return value == null || value.isBlank();
    }

    private void handleExpertiseRequest(HttpServletRequest request, HttpServletResponse response,
            int patientId, int practitionerId) throws IOException {
        int specialistId;
        Priority priority;
        try {
            String specialistIdParameter = request.getParameter("specialistId");
            if (isBlank(specialistIdParameter)) {
                throw new IllegalArgumentException("A specialist is required");
            }
            specialistId = Integer.parseInt(specialistIdParameter);
            priority = Priority.valueOf(request.getParameter("priority"));
        } catch (RuntimeException e) {
            request.getSession().setAttribute("consultationError", "Select a specialist and a valid priority.");
            response.sendRedirect(request.getContextPath() + "/consultation?patientId=" + patientId);
            return;
        }

        String reason = request.getParameter("reason");
        String symptoms = request.getParameter("symptoms");
        String question = request.getParameter("specialistQuestion");
        if (isBlank(reason) || isBlank(symptoms) || isBlank(question)) {
            request.getSession().setAttribute("consultationError",
                    "Add the chief complaint, patient symptoms, and question for the specialist.");
            response.sendRedirect(request.getContextPath() + "/consultation?patientId=" + patientId);
            return;
        }

        StringBuilder summary = new StringBuilder()
                .append("Chief complaint: ").append(reason.trim())
                .append("\nPatient symptoms: ").append(symptoms.trim());
        appendSection(summary, "GP examination", request.getParameter("examination"));
        appendSection(summary, "Observations", request.getParameter("observations"));
        appendSection(summary, "Question for specialist", question);

        ExpertiseRequest expertiseRequest = new ExpertiseRequest();
        expertiseRequest.setQuestion(summary.toString());
        expertiseRequest.setPriority(priority);
        expertiseRequest.setStatus(ExpertiseStatus.PENDING);

        if (ExpertiseRequestDAO.createRequest(expertiseRequest, patientId, practitionerId, specialistId)) {
            response.sendRedirect(request.getContextPath() + "/consultation?expertiseSent=1");
        } else {
            request.getSession().setAttribute("consultationError",
                    "Unable to send this request. Confirm the selected specialist and patient are still available.");
            response.sendRedirect(request.getContextPath() + "/consultation?patientId=" + patientId);
        }
    }

    private void appendSection(StringBuilder summary, String label, String value) {
        if (!isBlank(value)) {
            summary.append("\n").append(label).append(": ").append(value.trim());
        }
    }
    
    @Override
    protected void doGet(
        HttpServletRequest request,
        HttpServletResponse response
    )throws ServletException, IOException{

        Integer practitionerId = (Integer) request.getSession().getAttribute("userId");
        if (practitionerId == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Person practitioner = PersonDao.getPersonById(practitionerId);
        if (practitioner == null || practitioner.getRole() != RoleType.PRACTITIONER) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        String patientIdParameter = request.getParameter("patientId");
        if (patientIdParameter != null) {
            try {
                Patient patient = PatientDAO.getPatientById(Integer.parseInt(patientIdParameter));
                if (patient == null || patient.getInQueue() != 1) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                    return;
                }
                request.setAttribute("patient", patient);
                request.setAttribute("specialists", ExpertiseRequestDAO.getSpecialists());
                request.getRequestDispatcher("/consultation-form.jsp").forward(request, response);
                return;
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST);
                return;
            }
        }

        List<Patient> allPatients = PatientDAO.getAll();
        List<Patient> patients = allPatients == null ? List.of() : allPatients.stream()
                .filter(patient -> patient.getInQueue() == 1)
                .toList();

        request.setAttribute("patients", patients);

        request.getRequestDispatcher("/consultation.jsp")
               .forward(request, response);
    }
}
