package org.example.dao;

import org.example.database.DataBase;

import jakarta.persistence.EntityManager;

public class ConsultationDAO {
    
    public static boolean createConsultation(){
        EntityManager entityManager = DataBase.jpa();

        try{

            entityManager.getTransaction().begin();

            entityManager.persist();

            entityManager.getTransaction().commit();

        }catch(Exception e){
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }

            e.printStackTrace();

            return false;

        }finally{

            entityManager.close();
        }

    }
}
