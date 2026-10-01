package org.example.database;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class DataBase {
    
    public static EntityManager jpa() {

        EntityManagerFactory factory = Persistence.createEntityManagerFactory("medicalPU");

        EntityManager entityManager = factory.createEntityManager();

        return entityManager;
    }
}
