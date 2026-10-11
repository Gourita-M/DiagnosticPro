package org.example.dao;

import java.util.List;

import org.example.Models.ExpertiseRequest;
import org.example.Models.Patient;
import org.example.Models.Person;
import org.example.database.DataBase;
import org.example.enums.ExpertiseStatus;
import org.example.enums.RoleType;

import jakarta.persistence.EntityManager;

public class ExpertiseRequestDAO {

    public static List<Person> getSpecialists() {
        EntityManager entityManager = DataBase.jpa();
        try {
            return entityManager.createQuery(
                    "SELECT p FROM Person p WHERE p.role = :role ORDER BY p.fullName",
                    Person.class)
                    .setParameter("role", RoleType.SPECIALIST)
                    .getResultList();
        } finally {
            entityManager.close();
        }
    }

    public static boolean createRequest(ExpertiseRequest expertiseRequest, int patientId,
            int practitionerId, int specialistId) {
        EntityManager entityManager = DataBase.jpa();
        try {
            entityManager.getTransaction().begin();

            Patient patient = entityManager.find(Patient.class, patientId);
            Person practitioner = entityManager.find(Person.class, practitionerId);
            Person specialist = entityManager.find(Person.class, specialistId);
            if (patient == null || patient.getInQueue() != 1
                    || practitioner == null || practitioner.getRole() != RoleType.PRACTITIONER
                    || specialist == null || specialist.getRole() != RoleType.SPECIALIST) {
                entityManager.getTransaction().rollback();
                return false;
            }

            expertiseRequest.setPatient(patient);
            expertiseRequest.setPractitioner(practitioner);
            expertiseRequest.setSpecialist(specialist);
            expertiseRequest.setStatus(ExpertiseStatus.PENDING);
            patient.setInQueue(0);
            entityManager.persist(expertiseRequest);
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

    public static List<ExpertiseRequest> getRequestsForSpecialist(int specialistId) {
        EntityManager entityManager = DataBase.jpa();
        try {
            return entityManager.createQuery(
                    "SELECT er FROM ExpertiseRequest er "
                            + "JOIN FETCH er.patient "
                            + "JOIN FETCH er.practitioner "
                            + "WHERE er.specialist.id = :specialistId "
                            + "ORDER BY er.id DESC",
                    ExpertiseRequest.class)
                    .setParameter("specialistId", specialistId)
                    .getResultList();
        } finally {
            entityManager.close();
        }
    }
}