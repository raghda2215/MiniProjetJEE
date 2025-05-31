package com.trainapp.dao;

import com.trainapp.model.Employe;
import com.trainapp.util.HibernateUtil;
import org.hibernate.Session;

public class EmployeDAO {
    public Employe getById(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Employe employe = session.get(Employe.class, id);
        session.close();
        return employe;
    }
}
