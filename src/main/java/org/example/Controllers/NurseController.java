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

        int ConnectedUserId = (Integer) request.getSession().getAttribute("userId");
        Person person = PersonDao.getPersonById(ConnectedUserId);
        Patient patient = new Patient();

        patient.setFullName(request.getParameter("fullName"));
        patient.setEmail(request.getParameter("email"));
        patient.setPhoneNumber(request.getParameter("phoneNumber"));
        patient.setSocialNumber(request.getParameter("socialNumber"));
        patient.setHealthInsurance(request.getParameter("healthInsurance"));
        patient.setBloodPressure(Integer.parseInt(request.getParameter("bloodPressure")));
        patient.setHeartRate(Integer.parseInt(request.getParameter("heartRate")));
        patient.setBodyTemperature(Integer.parseInt(request.getParameter("bodyTemperature")));
        patient.setRespiratoryRate(Integer.parseInt(request.getParameter("respiratoryRate")));
        patient.setWeight(Integer.parseInt(request.getParameter("weight")));
        patient.setHeight(Integer.parseInt(request.getParameter("height")));
        patient.setPerson(person);

        if(PatientDAO.addPatient(patient)){
            request.getSession().setAttribute(
                    "success",
                    "New Patient " + patient.getFullName() + " is Added"
            );

            response.sendRedirect(request.getContextPath() + "/patients");

            System.out.println("Patient is added");

            return;
        }else {
            request.getSession().setAttribute(
                    "error",
                    "Error Adding new Patient"
            );
            response.sendRedirect(request.getContextPath() + "/nurse");
        } 
    }
}
