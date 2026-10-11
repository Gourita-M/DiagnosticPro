package org.example.Models;

import org.example.enums.ConsultationStatus;

import jakarta.persistence.Entity;
import jakarta.persistence.Column;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Consultation")
public class Consultation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String reason;
    @Column(columnDefinition = "TEXT")
    private String observations;
    @Column(columnDefinition = "TEXT")
    private String diagnosis;
    @Column(columnDefinition = "TEXT")
    private String symptoms;
    @Column(columnDefinition = "TEXT")
    private String examination;
    @Column(columnDefinition = "TEXT")
    private String prescribedTreatment;
    private Double cost;
    @Enumerated(EnumType.STRING)
    private ConsultationStatus status;

    @ManyToOne
    @JoinColumn(name = "patient_id")
    private Patient patient;

    @ManyToOne
    @JoinColumn(name = "practitioner_id")
    private Person practitioner;


    public Consultation(){}

    public Consultation(int id, ConsultationStatus status, Double cost, String diagnosis, String observations, String reason) {
        this.id = id;
        this.status = status;
        this.cost = cost;
        this.diagnosis = diagnosis;
        this.observations = observations;
        this.reason = reason;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getObservations() {
        return observations;
    }

    public void setObservations(String observations) {
        this.observations = observations;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public String getSymptoms() {
        return symptoms;
    }

    public void setSymptoms(String symptoms) {
        this.symptoms = symptoms;
    }

    public String getExamination() {
        return examination;
    }

    public void setExamination(String examination) {
        this.examination = examination;
    }

    public String getPrescribedTreatment() {
        return prescribedTreatment;
    }

    public void setPrescribedTreatment(String prescribedTreatment) {
        this.prescribedTreatment = prescribedTreatment;
    }

    public Double getCost() {
        return cost;
    }

    public void setCost(Double cost) {
        this.cost = cost;
    }

    public ConsultationStatus getStatus() {
        return status;
    }

    public void setStatus(ConsultationStatus status) {
        this.status = status;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Person getPractitioner() {
        return practitioner;
    }

    public void setPractitioner(Person practitioner) {
        this.practitioner = practitioner;
    }
}
