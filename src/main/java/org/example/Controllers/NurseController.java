package org.example.Controllers;

import java.io.IOException;

import org.example.Models.Patient;
import org.example.Models.Person;
import org.example.dao.PatientDAO;
import org.example.dao.PersonDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/nurse")
public class NurseController extends HttpServlet{
    
    @Override
    protected void doGet(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws ServletException, IOException {

        if (request.getSession().getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        request.getRequestDispatcher("/nurse.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws ServletException, IOException{
        request.getSession().removeAttribute("success");
        request.getSession().removeAttribute("error");    

        Integer connectedUserId = (Integer) request.getSession().getAttribute("userId");
        if (connectedUserId == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int ConnectedUserId = connectedUserId;
        Person person = PersonDao.getPersonById(ConnectedUserId);
        Patient patient = new Patient();

        patient.setFullName(request.getParameter("fullName"));
        patient.setEmail(request.getParameter("email"));
        patient.setPhoneNumber(request.getParameter("phoneNumber"));
        patient.setSocialNumber(request.getParameter("socialNumber"));
        patient.setHealthInsurance(Boolean.valueOf(request.getParameter("healthInsurance")));
        patient.setBloodPressure(request.getParameter("bloodPressure"));
        patient.setHeartRate(parseInteger(request.getParameter("heartRate")));
        patient.setBodyTemperature(parseDecimal(request.getParameter("bodyTemperature")));
        patient.setRespiratoryRate(parseInteger(request.getParameter("respiratoryRate")));
        patient.setWeight(parseDecimal(request.getParameter("weight")));
        patient.setHeight(parseDecimal(request.getParameter("height")));
        patient.setMedicalHistory(request.getParameter("name"));
        patient.setMedicalState(request.getParameter("state"));
        patient.setAllergies(request.getParameter("allergies"));
        patient.setCurrentTreatments(request.getParameter("currentTreatments"));
        patient.setInQueue(1);
        patient.setPerson(person);

        if(PatientDAO.addPatient(patient)){
            request.getSession().setAttribute(
                    "success",
                    "New Patient " + patient.getFullName() + " is Added"
            );

            response.sendRedirect(request.getContextPath() + "/nurse");

            System.out.println("Patient is added");

            return;
        }else {
            request.getSession().setAttribute(
                    "error",
                    "Unable to save patient. Confirm the email is unique and the database schema is up to date."
            );
            response.sendRedirect(request.getContextPath() + "/nurse");
        } 
    }

    private int parseInteger(String value) {
        return value == null || value.isBlank() ? 0 : Integer.parseInt(value);
    }

    private double parseDecimal(String value) {
        return value == null || value.isBlank() ? 0 : Double.parseDouble(value);
    }
}
