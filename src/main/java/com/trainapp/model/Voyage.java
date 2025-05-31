package com.trainapp.model;

import javax.persistence.*;



import java.sql.Date;
import java.sql.Time;
import java.util.List;

@Entity
@Table(name = "voyage")
public class Voyage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "trajet_id", nullable = false)
    private Trajet trajet;

    @Column(name = "date", nullable = false)
    private Date date;

    @Column(name = "heure_depart", nullable = false)
    private Time heureDepart;

    @Column(name = "heure_arrivee")
    private Time heureArrivee;

    @Column(name = "places_disponibles", nullable = false)
    private int placesDisponibles;
    @Column(name = "statut", nullable = false)
    private String statut = "prévu"; // Valeur par défaut
    @OneToMany(mappedBy = "voyage", cascade = CascadeType.ALL)
    private List<Affectation> affectations;


    public String getStatut() {
        return statut;
    }

    public void setStatut(String statut) {
        this.statut = statut;
    }
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Trajet getTrajet() {
		return trajet;
	}

	public void setTrajet(Trajet trajet) {
		this.trajet = trajet;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Time getHeureDepart() {
		return heureDepart;
	}

	public void setHeureDepart(Time heureDepart) {
		this.heureDepart = heureDepart;
	}

	public Time getHeureArrivee() {
		return heureArrivee;
	}

	public void setHeureArrivee(Time heureArrivee) {
		this.heureArrivee = heureArrivee;
	}

	public int getPlacesDisponibles() {
		return placesDisponibles;
	}

	public void setPlacesDisponibles(int placesDisponibles) {
		this.placesDisponibles = placesDisponibles;
	}

    // getters / setters
}

