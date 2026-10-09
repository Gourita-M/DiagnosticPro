package org.example.Controllers;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.rmi.ServerException;

import org.example.Models.Patient;
import org.example.dao.PatientDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/info")
public class PatientInfoController extends HttpServlet{
    
    @Override
    public void doGet(
        HttpServletRequest request,
        HttpServletResponse response
    )throws ServletException, IOException{

        int patientId = Integer.parseInt(request.getParameter("patientId"));
        
        Patient patient = PatientDAO.getPatientById(patientId);

        request.setAttribute("patient", patient);

        request.getRequestDispatcher("/patientinfo.jsp")
               .forward(request, response);
    }
}
