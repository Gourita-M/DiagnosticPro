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

    public static List<Patient> getAll(){
        EntityManager entityManager = DataBase.jpa();

        try{
        List<Patient> patients = entityManager
        .createQuery("FROM Patient", Patient.class)
        .getResultList();

        if(patients.isEmpty()){
            patients = null;
        }
        return patients;

        }finally{
            entityManager.close();
        }
    }

    public static void updateInQueueById(Patient p){
        EntityManager entityManager = DataBase.jpa();

        try{
            entityManager.getTransaction().begin();
            entityManager.merge(p);
            entityManager.getTransaction().commit();
        }catch(Exception e){
            if(entityManager.getTransaction().isActive()){
                entityManager.getTransaction().rollback();
            }
            throw e;
        }finally{
            entityManager.close();
        }
    }

}
