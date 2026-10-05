package org.example.dao;

import java.util.List;

import org.example.Models.Patient;
import org.example.Models.Person;
import org.example.database.DataBase;

import jakarta.persistence.EntityManager;

public class PatientDAO {

    public static boolean addPatient(Patient patient) {

        EntityManager entityManager = DataBase.jpa();

        try {
            entityManager.getTransaction().begin();

            entityManager.persist(patient);

            entityManager.getTransaction().commit();

            return true;

        } catch (Exception e) {

            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }

            e.printStackTrace();
            return false;

        } finally {
            entityManager.close();
        }
    }

    public static List<Patient> getNursePatients(Person nurse){

        List<Patient> patients = nurse.getPatients();

        if(patients.isEmpty()){
            patients = null;
        }

        return patients;
    }
}
