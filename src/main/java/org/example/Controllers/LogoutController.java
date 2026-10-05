package org.example.Controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/logout")
public class LogoutController extends HttpServlet{

    @Override
    public void doPost(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws ServletException, IOException{
        request.getSession().removeAttribute("userId");
        request.getSession().removeAttribute("userName");
        response.sendRedirect(request.getContextPath() + "/login");
        request.getSession().removeAttribute("success");
        request.getSession().removeAttribute("error");   
    }
}
