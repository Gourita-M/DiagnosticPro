package org.example.dao;

import java.util.List;

import org.example.Models.Patient;
import org.example.Models.Person;
import org.example.database.DataBase;

import jakarta.persistence.EntityManager;

public class PatientDAO {

    private static final EntityManager entityManager = DataBase.jpa();


    public static boolean addPatient(Patient patient) {

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

    public static List<Patient> getAll(){

        List<Patient> patients = entityManager
        .createQuery("FROM Patient", Patient.class)
        .getResultList();

        if(patients.isEmpty()){
            patients = null;
        }
        return patients;
    }

    public static 
}
