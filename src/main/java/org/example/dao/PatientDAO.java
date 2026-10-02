package org.example.dao;

import org.example.Models.Patient;
import org.example.database.DataBase;

import jakarta.persistence.EntityManager;

public class PatientDAO {
    private static final EntityManager entityManager = DataBase.jpa();

    public static boolean addPatient(Patient patient){
        
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(patient);
            entityManager.getTransaction().commit();

            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
