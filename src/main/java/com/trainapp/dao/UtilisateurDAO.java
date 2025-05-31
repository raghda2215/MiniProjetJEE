package com.trainapp.dao;

import com.trainapp.model.Utilisateur;
import com.trainapp.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.util.List;

public class UtilisateurDAO {

    public void enregistrer(Utilisateur utilisateur) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            session.save(utilisateur);
            tx.commit();
        }
    }

    public Utilisateur trouverParEmailEtMotDePasse(String email, String motDePasse) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            List<Utilisateur> utilisateurs = session.createQuery(
                "FROM Utilisateur WHERE email = :email AND motDePasse = :mdp", Utilisateur.class)
                .setParameter("email", email)
                .setParameter("mdp", motDePasse)
                .list();
            return utilisateurs.isEmpty() ? null : utilisateurs.get(0);
        }
    }
    public List<Utilisateur> getAllUtilisateurs() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Utilisateur", Utilisateur.class).list();
        }
    }

    public void setBloque(int id, boolean bloque) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            Utilisateur utilisateur = session.get(Utilisateur.class, id);
            if (utilisateur != null) {
                utilisateur.setBloque(bloque);
                session.update(utilisateur);
            }
            tx.commit();
        }
    }

    
}
