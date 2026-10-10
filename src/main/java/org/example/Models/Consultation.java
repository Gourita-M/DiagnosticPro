package org.example.Models;

import org.example.enums.ConsultationStatus;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "Consultation")
public class Consultation {
    private int id;
    private String reason;
    private String observations;
    private String diagnosis;
    private Double cost;
    private ConsultationStatus status;

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
}
