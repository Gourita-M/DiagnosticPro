package org.example.Controllers;

import java.io.IOException;

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

        request.getRequestDispatcher("/Specialist.jsp")
               .forward(request, response);

    }
}
