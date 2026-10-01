package org.example.dao;

import org.example.Models.Patient;
import org.example.Models.Person;
import org.example.database.DataBase;

import jakarta.persistence.EntityManager;

public class PatientDAO {
    private static final EntityManager entityManager = DataBase.jpa();

    public static boolean addPatient(Patient patient, int connectedUserId){
        
        Person person = PersonDao.getPersonById(connectedUserId);
        patient.setPerson(person);

        return true;
    }
}
