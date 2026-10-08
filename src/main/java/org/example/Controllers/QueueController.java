package org.example.Controllers;

import java.io.IOException;

import org.example.Models.Patient;
import org.example.Models.Person;
import org.example.dao.PatientDAO;
import org.example.dao.PersonDao;
import org.example.database.DataBase;

import jakarta.persistence.EntityTransaction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.persistence.EntityManager;

@WebServlet("/patient/Queue")
public class QueueController extends HttpServlet {

    @Override
    public void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        int patientId = Integer.parseInt(
                request.getParameter("patientId")
        );
        int ConnectedUserId = (Integer) request.getSession().getAttribute("userId");

        Person person = PersonDao.getPersonById(ConnectedUserId);

        Patient patient = null;
        for(Patient pat : person.getPatients()){
            if(pat.getId() == patientId){
                patient = pat;
            }
        }
        if(patient != null){
            patient.setInQueue(1);
            PatientDAO.updateInQueueById(patient);
        }

        response.sendRedirect(request.getContextPath() + "/patients");

    }
}
