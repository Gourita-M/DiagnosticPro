package org.example.Models;

import org.example.enums.Priority;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

import org.example.enums.ExpertiseStatus;

@Entity
@Table(name = "ExpertiseRequest")
public class ExpertiseRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(columnDefinition = "TEXT")
    private String question;
    @Enumerated(EnumType.STRING)
    private Priority priority;
    @Enumerated(EnumType.STRING)
    private ExpertiseStatus status;

    @ManyToOne
    @JoinColumn(name = "specialist_id")
    private Person specialist;

    @ManyToOne
    @JoinColumn(name = "practitioner_id")
    private Person practitioner;

    @ManyToOne
    @JoinColumn(name = "patient_id")
    private Patient patient;

    public ExpertiseRequest() {
    }

    public ExpertiseRequest(int id, String question, Priority priority, ExpertiseStatus status) {
        this.id = id;
        this.question = question;
        this.priority = priority;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public Priority getPriority() {
        return priority;
    }

    public void setPriority(Priority priority) {
        this.priority = priority;
    }

    public ExpertiseStatus getStatus() {
        return status;
    }

    public void setStatus(ExpertiseStatus status) {
        this.status = status;
    }

    public Person getSpecialist() {
        return specialist;
    }

    public void setSpecialist(Person specialist) {
        this.specialist = specialist;
    }

    public Person getPractitioner() {
        return practitioner;
    }

    public void setPractitioner(Person practitioner) {
        this.practitioner = practitioner;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }
}
