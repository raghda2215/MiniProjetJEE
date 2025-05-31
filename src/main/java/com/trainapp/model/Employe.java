
package com.trainapp.model;

import javax.persistence.*;
@Entity
public class Employe {
    @Id @GeneratedValue
    private int id;
    private String nom;
    private String prenom;
    private String poste; // chauffeur, contrôleur, etc.
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getPoste() {
		return poste;
	}
	public void setPoste(String poste) {
		this.poste = poste;
	}

}
