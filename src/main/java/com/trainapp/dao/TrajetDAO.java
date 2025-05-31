package com.trainapp.dao;

import com.trainapp.model.Trajet;
import com.trainapp.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class TrajetDAO {

    // Rechercher trajet par villes + date
    public List<Trajet> rechercher(String depart, String arrivee, String date) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery(
                "FROM Trajet WHERE villeDepart = :depart AND villeArrivee = :arrivee AND date = :date", Trajet.class)
                .setParameter("depart", depart)
                .setParameter("arrivee", arrivee)
                .setParameter("date", date)
                .list();
        }
    }

    // Obtenir un trajet par ID
    public Trajet getById(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Trajet.class, id);
        }
    }

    // Rechercher par ville de départ
    public List<Trajet> rechercherParDepart(String villeDepart) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Trajet WHERE villeDepart = :ville", Trajet.class)
                    .setParameter("ville", villeDepart)
                    .list();
        }
    }

    // 🔹 Obtenir tous les trajets (Admin)
    public List<Trajet> getAllTrajets() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Trajet", Trajet.class).list();
        }
    }

    // 🔹 Ajouter un trajet
    public void ajouterTrajet(Trajet trajet) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(trajet);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                try { transaction.rollback(); } catch (Exception ex) { ex.printStackTrace(); }
            }
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
    }


    // 🔹 Supprimer un trajet
    public void supprimerTrajet(int id) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            Trajet trajet = session.get(Trajet.class, id);
            if (trajet != null) {
                session.delete(trajet);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }

    public void modifierTrajet(Trajet trajet) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.update(trajet); // Hibernate sait que c’est une mise à jour si l’ID existe
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null && transaction.getStatus().canRollback()) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

}
