package org.example.dao;

import org.example.database.DataBase;
import org.example.Models.Consultation;
import org.example.Models.Patient;
import org.example.Models.Person;

import jakarta.persistence.EntityManager;

public class ConsultationDAO {

    public static boolean createConsultation(Consultation consultation, int patientId, int practitionerId) {
        EntityManager entityManager = DataBase.jpa();

        try {
            entityManager.getTransaction().begin();

            Patient patient = entityManager.find(Patient.class, patientId);
            if (patient == null || patient.getInQueue() != 1) {
                entityManager.getTransaction().rollback();
                return false;
            }

            consultation.setPatient(patient);
            consultation.setPractitioner(entityManager.getReference(Person.class, practitionerId));
            patient.setInQueue(0);
            entityManager.persist(consultation);

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
}
