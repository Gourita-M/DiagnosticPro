package org.example.Moduls;

import org.example.enums.Priority;
import org.example.enums.ExpertiseStatus;

public class ExpertiseRequest {
    private int id;
    private String question;
    private Priority priority;
    private ExpertiseStatus status;

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
}
