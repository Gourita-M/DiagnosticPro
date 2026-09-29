package org.example.Moduls;

import org.example.enums.MedicalState;

public class MedicalHistory {
    private int id;
    private String name;
    private String currentTreatments;
    private MedicalState state;

    public MedicalHistory(int id, MedicalState state, String currentTreatments, String name) {
        this.id = id;
        this.state = state;
        this.currentTreatments = currentTreatments;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCurrentTreatments() {
        return currentTreatments;
    }

    public void setCurrentTreatments(String currentTreatments) {
        this.currentTreatments = currentTreatments;
    }

    public MedicalState getState() {
        return state;
    }

    public void setState(MedicalState state) {
        this.state = state;
    }
}
