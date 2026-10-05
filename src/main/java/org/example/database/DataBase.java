package org.example.database;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class DataBase {

    private static final EntityManagerFactory factory =
            Persistence.createEntityManagerFactory("medicalPU");

    public static EntityManager jpa() {
        return factory.createEntityManager();
    }
}