package org.example.dao;

import org.example.Moduls.Person;
import org.example.database.DataBase;

import jakarta.persistence.NoResultException;

public class PersonDao {
    
    public static void addPerson(Person person){
        
    }
    public static Person getPersonByEmail(String email){

        Person person;

        try{
            person = DataBase.jpa()
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
