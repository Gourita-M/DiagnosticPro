package org.example.Controllers;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import org.example.Models.Patient;
import org.example.Models.Person;
import org.example.dao.PatientDAO;
import org.example.dao.PersonDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Collections;

@WebServlet("/patients")
public class PatientController extends HttpServlet{
    
    @Override
    protected void doGet(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws ServletException, IOException{
        request.getSession().removeAttribute("success");
        request.getSession().removeAttribute("error");    

        if (request.getSession().getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        int ConnectedUserId = (Integer) request.getSession().getAttribute("userId");

        Person nurse = PersonDao.getPersonById(ConnectedUserId);

        List<Patient> patients = PatientDAO.getNursePatients(nurse).stream()
          .filter(p -> p.getInQueue() == 0)
          .collect(Collectors.toList());

        request.setAttribute("patients", patients);

        request.getRequestDispatcher("/patients.jsp")
               .forward(request, response);
    }
}
