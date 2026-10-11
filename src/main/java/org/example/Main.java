package org.example;

import org.example.Models.Person;
import org.example.dao.PersonDao;
import org.example.enums.RoleType;

public class Main {
    public static void main(String[] args) {

    Person person = new Person(RoleType.SPECIALIST,"123456","spe@gmail.com","Mouad Gouritaa");
    
    PersonDao.addPerson(person);

    }
}