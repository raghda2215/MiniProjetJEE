

package com.trainapp.dao;

import com.trainapp.model.DemandeRemboursement;
import com.trainapp.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class DemandeRemboursementDAO {

    public List<DemandeRemboursement> getAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM DemandeRemboursement", DemandeRemboursement.class).list();
        }
    }

    public void changerStatut(int id, String statut) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            DemandeRemboursement demande = session.get(DemandeRemboursement.class, id);
            if (demande != null) {
                demande.setStatut(statut);
                session.update(demande);
            }
            tx.commit();
        }
    }
}
