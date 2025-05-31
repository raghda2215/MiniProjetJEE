package com.trainapp.dao;

import com.trainapp.model.Reservation;
import com.trainapp.util.HibernateUtil;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class ReservationDAO {

	public void enregistrer(Reservation reservation) {
	    Session session = HibernateUtil.getSessionFactory().openSession();
	    Transaction tx = session.beginTransaction();
	    session.save(reservation);
	    tx.commit();
	    session.close();
	}
	

}
