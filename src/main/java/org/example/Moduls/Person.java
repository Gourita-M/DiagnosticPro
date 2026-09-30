package org.example.Moduls;

import org.example.enums.RoleType;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.Id;

@Entity
@Table(name = "Person")
public class Person {

    @Id
    protected int id;
    protected String fullName;
    protected String email;
    protected String password;
    protected RoleType role;

    public Person(Integer id, RoleType role, String password, String email, String fullName) {
        this.id = id;
        this.role = role;
        this.password = password;
        this.email = email;
        this.fullName = fullName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
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
}
