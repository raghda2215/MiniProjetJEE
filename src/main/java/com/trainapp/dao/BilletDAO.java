package com.trainapp.dao;

import com.trainapp.model.Billet;
import com.trainapp.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class BilletDAO {

    // Enregistrer un nouveau billet
    public void enregistrer(Billet billet) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            session.save(billet);
            tx.commit();
        }
    }

    // Obtenir tous les billets d’un utilisateur
    public List<Billet> getBilletsByUtilisateur(int utilisateurId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM Billet WHERE utilisateur.id = :id";
            Query<Billet> query = session.createQuery(hql, Billet.class);
            query.setParameter("id", utilisateurId);
            return query.getResultList();
        }
    }

    // Annuler un billet (demande d’annulation par l’utilisateur)
    public void annulerBillet(int billetId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            Billet billet = session.get(Billet.class, billetId);
            if (billet != null) {
                billet.setEtat("en_attente_annulation");
                session.update(billet);
            }
            tx.commit();
        }
    }

    // Récupérer un billet par son ID
    public Billet getById(int billetId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Billet.class, billetId);
        }
    }

    // Mettre à jour un billet (utile pour modifier une réservation)
    public void mettreAJour(Billet billet) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            session.update(billet);
            tx.commit();
        }
    }
}
