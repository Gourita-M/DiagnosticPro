package org.example.Models;

import java.util.ArrayList;
import java.util.List;

import org.example.enums.RoleType;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "Person")
public class Person {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String fullName;
    private String email;
    private String password;
    @Enumerated(EnumType.STRING)
    private RoleType role;

    @OneToMany(mappedBy = "person")
    private List<Patient> patients = new ArrayList<>();

    @OneToMany(mappedBy = "practitioner")
    private List<Consultation> consultation = new ArrayList<>();

    @OneToMany(mappedBy = "specialist")
    private List<ExpertiseRequest> expertiseRequest = new ArrayList<>();
    
    protected Person(){
        
    }

    public Person(RoleType role, String password, String email, String fullName) {
        this.role = role;
        this.password = password;
        this.email = email;
        this.fullName = fullName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public RoleType getRole() {
        return role;
    }

    public void setRole(RoleType role) {
        this.role = role;
    }

    public List<Patient> getPatients() {
        return patients;
    }

    public void setPatients(List<Patient> patients) {
        this.patients = patients;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Consultation> getConsultation() {
        return consultation;
    }

    public void setConsultation(List<Consultation> consultation) {
        this.consultation = consultation;
    }

    public List<ExpertiseRequest> getExpertiseRequest() {
        return expertiseRequest;
    }

    public void setExpertiseRequest(List<ExpertiseRequest> expertiseRequest) {
        this.expertiseRequest = expertiseRequest;
    }
}
