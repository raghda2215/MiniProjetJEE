package com.trainapp.dao;

import com.trainapp.model.Affectation;
import com.trainapp.model.Employe;
import com.trainapp.model.Voyage;
import com.trainapp.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class AffectationDAO {

    public void ajouterAffectation(Employe employe, Voyage voyage, String role) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();

        Affectation a = new Affectation();
        a.setEmploye(employe);
        a.setVoyage(voyage);
        a.setRole(role);

        session.save(a);
        tx.commit();
        session.close();
    }

    public List<Voyage> getVoyagesParEmploye(int employeId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Voyage> voyages = session.createQuery(
                "SELECT a.voyage FROM Affectation a WHERE a.employe.id = :id", Voyage.class)
                .setParameter("id", employeId)
                .getResultList();
        session.close();
        return voyages;
    }
}
