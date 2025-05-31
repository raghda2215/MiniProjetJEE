package com.trainapp.model;

import javax.persistence.*;

@Entity
public class Reservation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "utilisateur_id")
    private Utilisateur utilisateur;  // <-- ici

    @ManyToOne
    @JoinColumn(name = "trajet_id")
    private Trajet trajet;

    private String classe;
    private String preferences;
    private String etat;
   

   
// "acheté", "utilisé", "annulé"

    // Getters et setters

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public Utilisateur getUtilisateur() {
        return utilisateur;
    }
    public void setUtilisateur(Utilisateur utilisateur) {
        this.utilisateur = utilisateur;  // <-- cette méthode est obligatoire
    }

    public Trajet getTrajet() {
        return trajet;
    }
    public void setTrajet(Trajet trajet) {
        this.trajet = trajet;
    }

    public String getClasse() {
        return classe;
    }
    public void setClasse(String classe) {
        this.classe = classe;
    }

    public String getPreferences() {
        return preferences;
    }
    public void setPreferences(String preferences) {
        this.preferences = preferences;
    }

    public String getEtat() {
        return etat;
    }
    public void setEtat(String etat) {
        this.etat = etat;
    }
}
