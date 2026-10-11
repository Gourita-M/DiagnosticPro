package org.example.Controllers;

import java.io.IOException;

import org.example.Models.ExpertiseRequest;
import org.example.Models.Person;
import org.example.dao.ExpertiseRequestDAO;
import org.example.dao.PersonDao;
import org.example.enums.RoleType;

import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Specialist")
public class SpecialistContriller extends HttpServlet{
    
    @Override
    public void doGet(
        HttpServletRequest request,
        HttpServletResponse response
    )throws ServletException, IOException{

        Integer specialistId = (Integer) request.getSession().getAttribute("userId");

        RoleType role = (RoleType) request.getSession().getAttribute("role");

        if (request.getSession().getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }else if(role != RoleType.SPECIALIST || role == null){
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        Person specialist = PersonDao.getPersonById(specialistId);
        if (specialist == null || specialist.getRole() != RoleType.SPECIALIST) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        List<ExpertiseRequest> expertiseRequests = ExpertiseRequestDAO.getRequestsForSpecialist(specialistId);
        request.setAttribute("expertiseRequests", expertiseRequests);

        request.getRequestDispatcher("/Specialist.jsp")
               .forward(request, response);

    }
}
