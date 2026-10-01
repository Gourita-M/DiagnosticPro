package org.example;

import org.example.Moduls.Person;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class Main {
    public static void main(String[] args) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("medicalPU");

        EntityManager entityManager = factory.createEntityManager();

        Person person = entityManager.find(Person.class, 22);

        System.out.println(person.getFullName());
        System.out.println(person.getEmail());

        entityManager.close();
        factory.close();
    }
}