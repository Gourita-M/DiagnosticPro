package org.example.Models;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "Patient")
public class Patient {

    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String fullName;
    private String email;
    private String phoneNumber;
    private String socialNumber;
    private Boolean healthInsurance;
    private int inQueue;
    private String bloodPressure;
    private int heartRate;
    private double bodyTemperature;
    private int respiratoryRate;
    private double weight;
    private double height;
    @Column(columnDefinition = "TEXT")
    private String medicalHistory;
    @Column(columnDefinition = "TEXT")
    private String allergies;
    @Column(columnDefinition = "TEXT")
    private String currentTreatments;
    private String medicalState;

    @ManyToOne
    @JoinColumn(name = "nurse_id")
    private Person person;

    @OneToMany
    List<Consultation> consultations = new ArrayList<>();

    public Patient() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getSocialNumber() {
        return socialNumber;
    }

    public void setSocialNumber(String socialNumber) {
        this.socialNumber = socialNumber;
    }

    public Boolean getHealthInsurance() {
        return healthInsurance;
    }

    public void setHealthInsurance(Boolean healthInsurance) {
        this.healthInsurance = healthInsurance;
    }

    public String getBloodPressure() {
        return bloodPressure;
    }

    public void setBloodPressure(String bloodPressure) {
        this.bloodPressure = bloodPressure;
    }

    public int getHeartRate() {
        return heartRate;
    }

    public void setHeartRate(int heartRate) {
        this.heartRate = heartRate;
    }

    public double getBodyTemperature() {
        return bodyTemperature;
    }

    public void setBodyTemperature(double bodyTemperature) {
        this.bodyTemperature = bodyTemperature;
    }

    public int getRespiratoryRate() {
        return respiratoryRate;
    }

    public void setRespiratoryRate(int respiratoryRate) {
        this.respiratoryRate = respiratoryRate;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public String getMedicalHistory() {
        return medicalHistory;
    }

    public void setMedicalHistory(String medicalHistory) {
        this.medicalHistory = medicalHistory;
    }

    public String getAllergies() {
        return allergies;
    }

    public void setAllergies(String allergies) {
        this.allergies = allergies;
    }

    public String getCurrentTreatments() {
        return currentTreatments;
    }

    public void setCurrentTreatments(String currentTreatments) {
        this.currentTreatments = currentTreatments;
    }

    public String getMedicalState() {
        return medicalState;
    }

    public void setMedicalState(String medicalState) {
        this.medicalState = medicalState;
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    public int getInQueue() {
        return inQueue;
    }

    public void setInQueue(int inQueue) {
        this.inQueue = inQueue;
    }

    public List<Consultation> getConsultations() {
        return consultations;
    }

    public void setConsultations(List<Consultation> consultations) {
        this.consultations = consultations;
    }
}
