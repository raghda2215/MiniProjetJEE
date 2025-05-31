package com.trainapp.model;

import javax.persistence.*;

@Entity
public class Utilisateur {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String nom;
    private String email;
    private String motDePasse;

    private String role; // "client" ou "admin"

    public boolean isBloque() {
		return bloque;
	}
	public void setBloque(boolean bloque) {
		this.bloque = bloque;
	}
	private boolean bloque; // ← bien écrit "bloque" et non "bloqué"


    // Getters et Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getMotDePasse() { return motDePasse; }
    public void setMotDePasse(String motDePasse) { this.motDePasse = motDePasse; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

}
