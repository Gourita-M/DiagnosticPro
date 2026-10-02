package org.example.Controllers;

import java.io.IOException;

import org.example.Models.Person;
import org.example.dao.PersonDao;
import org.mindrot.jbcrypt.BCrypt;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/login.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(
        HttpServletRequest request,
        HttpServletResponse response)
        throws  ServletException, IOException{
            
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Person person = PersonDao.getPersonByEmail(email);

            if(person == null || !BCrypt.checkpw(password, person.getPassword())){
                request.getSession().setAttribute(
                    "error",
                    "Your Email or Password is Incorrect"
                );
                response.sendRedirect(request.getContextPath() + "/login");
            }else{
                request.getSession().setAttribute(
                    "userId",
                    person.getId()
                );
                request.getSession().setAttribute(
                    "userName",
                    person.getFullName()
                );
                response.sendRedirect(request.getContextPath() + "/nurse");
            }

        }
}