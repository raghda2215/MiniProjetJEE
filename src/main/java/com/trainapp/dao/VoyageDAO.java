package com.trainapp.dao;

import com.trainapp.model.Voyage;
import com.trainapp.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class VoyageDAO {

    public void ajouterVoyage(Voyage voyage) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            session.save(voyage);
            tx.commit();
        }
    }

    public void modifierVoyage(Voyage voyage) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            session.update(voyage);
            tx.commit();
        }
    }

    public void supprimerVoyage(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            Voyage voyage = session.get(Voyage.class, id);
            if (voyage != null) {
                session.delete(voyage);
            }
            tx.commit();
        }
    }

    public Voyage getById(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Voyage.class, id);
        }
    }

    public List<Voyage> getAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Voyage", Voyage.class).list();
        }
    }


    public void update(Voyage voyage) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            session.update(voyage);
            tx.commit();
        }
    }
  
}
