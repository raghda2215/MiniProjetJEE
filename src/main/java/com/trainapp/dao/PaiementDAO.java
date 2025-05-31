package com.trainapp.dao;

import com.trainapp.model.Paiement;
import com.trainapp.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class PaiementDAO {

    public List<Paiement> getAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Paiement", Paiement.class).list();
        }
    }

    public List<Paiement> filtrer(String email, String statut) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM Paiement p WHERE 1=1";
            if (email != null && !email.isEmpty()) {
                hql += " AND p.utilisateur.email LIKE :email";
            }
            if (statut != null && !statut.isEmpty()) {
                hql += " AND p.statut = :statut";
            }

            Query<Paiement> query = session.createQuery(hql, Paiement.class);

            if (email != null && !email.isEmpty()) {
                query.setParameter("email", "%" + email + "%");
            }
            if (statut != null && !statut.isEmpty()) {
                query.setParameter("statut", statut);
            }

            return query.list();
        }
    }

    public void mettreAJourStatut(int id, String nouveauStatut) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            Paiement paiement = session.get(Paiement.class, id);
            if (paiement != null) {
                paiement.setStatut(nouveauStatut);
                session.update(paiement);
            }
            tx.commit();
        }
    }

    public void modifierMontant(int id, double montant) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            Paiement paiement = session.get(Paiement.class, id);
            if (paiement != null) {
                paiement.setMontant(montant);
                session.update(paiement);
            }
            tx.commit();
        }
    }
}
