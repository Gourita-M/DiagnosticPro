package org.example.dao;

import org.example.Models.Person;
import org.example.database.DataBase;
import org.mindrot.jbcrypt.BCrypt;

import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;

public class PersonDao {
    private static final EntityManager entityManager = DataBase.jpa();
    
    public static void addPerson(Person person){
        String passHash = BCrypt.hashpw(person.getPassword(), BCrypt.gensalt());
        person.setPassword(passHash);

        entityManager.getTransaction().begin();
        entityManager.persist(person);
        entityManager.getTransaction().commit();

    }
    public static Person getPersonByEmail(String email){

        Person person;

        try{
            person = entityManager
            .createQuery(
            "SELECT p FROM Person p WHERE p.email = :email",
            Person.class
            ).setParameter("email", email)
            .getSingleResult();

        } catch(NoResultException e){
            person = null;
        }

        return person;
    }
}
