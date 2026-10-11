package org.example.Models;

import org.example.enums.ProcedureType;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "MedicalProcedure")
public class MedicalProcedure {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private ProcedureType type;
    private Double cost;

    public MedicalProcedure(){}

    public MedicalProcedure(int id, ProcedureType type, Double cost) {
        this.id = id;
        this.type = type;
        this.cost = cost;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ProcedureType getType() {
        return type;
    }

    public void setType(ProcedureType type) {
        this.type = type;
    }

    public Double getCost() {
        return cost;
    }

    public void setCost(Double cost) {
        this.cost = cost;
    }


}
