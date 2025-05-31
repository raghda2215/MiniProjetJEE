package com.trainapp.model;

import javax.persistence.*;

@Entity
public class Affectation {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    private Employe employe;

    @ManyToOne
    private Voyage voyage;

    private String role;

    // Getters et Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Employe getEmploye() { return employe; }
    public void setEmploye(Employe employe) { this.employe = employe; }

    public Voyage getVoyage() { return voyage; }
    public void setVoyage(Voyage voyage) { this.voyage = voyage; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
}
