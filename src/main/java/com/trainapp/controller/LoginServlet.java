package com.trainapp.controller;

import com.trainapp.dao.UtilisateurDAO;
import com.trainapp.model.Utilisateur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String motDePasse = request.getParameter("motDePasse");

        UtilisateurDAO utilisateurDAO = new UtilisateurDAO();
        Utilisateur utilisateur = utilisateurDAO.trouverParEmailEtMotDePasse(email, motDePasse);

        if (utilisateur != null) {
            HttpSession session = request.getSession();
            session.setAttribute("utilisateur", utilisateur);

            // Redirection si une réservation était en attente (connexion pendant achat)
            if (session.getAttribute("trajetId") != null) {
                response.sendRedirect("RetourReservationServlet");
                return;
            }

            // Redirection selon le rôle de l'utilisateur
            String role = utilisateur.getRole();
            if ("admin".equalsIgnoreCase(role)) {
                response.sendRedirect("adminDashboard.jsp");
            } else {
                response.sendRedirect("espaceUtilisateur.jsp");
            }
        } else {
            request.setAttribute("erreur", "Email ou mot de passe incorrect.");
            request.getRequestDispatcher("connexion.jsp").forward(request, response);
        }
    }
}

