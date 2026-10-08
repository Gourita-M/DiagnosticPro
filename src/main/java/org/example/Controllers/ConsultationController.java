package org.example.Controllers;

import java.io.IOException;

import org.example.dao.PatientDAO;
import org.example.Models.*;
import java.util.List;
import java.util.stream.Collectors;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/consultation")
public class ConsultationController extends HttpServlet{
    
    @Override
    public void doGet(
        HttpServletRequest request,
        HttpServletResponse response
    )throws ServletException, IOException{

        List<Patient> patients = PatientDAO.getAll().stream()
        .filter(p -> p.getInQueue() == 1)
        .collect(Collectors.toList());

        request.setAttribute("patients", patients);

        request.getRequestDispatcher("/consultation.jsp")
               .forward(request, response);
    }
}
