package com.trainapp.controller;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.trainapp.dao.UtilisateurDAO;
import com.trainapp.model.Utilisateur;

import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String nom = request.getParameter("nom");
        String email = request.getParameter("email");
        String motDePasse = request.getParameter("motDePasse");

        Utilisateur utilisateur = new Utilisateur();
        utilisateur.setNom(nom);
        utilisateur.setEmail(email);
        utilisateur.setMotDePasse(motDePasse);

        UtilisateurDAO dao = new UtilisateurDAO();
        dao.enregistrer(utilisateur);  // <-- méthode corrigée

        // Auto-login
        request.getSession().setAttribute("utilisateur", utilisateur);

        response.sendRedirect("RetourReservationServlet"); // Reprise de la réservation
    }
}
