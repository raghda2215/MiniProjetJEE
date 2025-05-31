package com.trainapp.controller;

import com.trainapp.dao.BilletDAO;
import com.trainapp.dao.ReservationDAO;
import com.trainapp.dao.TrajetDAO;
import com.trainapp.model.Billet;
import com.trainapp.model.Reservation;
import com.trainapp.model.Trajet;
import com.trainapp.model.Utilisateur;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/PaiementServlet")
public class PaiementServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");

        // Récupération des paramètres depuis la requête POST (venant du formulaire)
        String trajetIdStr = request.getParameter("trajetId");
        String classe = request.getParameter("classe");
        String preferences = request.getParameter("preferences");

        if (utilisateur == null || trajetIdStr == null || classe == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        int trajetId;
        try {
            trajetId = Integer.parseInt(trajetIdStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("index.jsp");
            return;
        }

        Trajet trajet = new TrajetDAO().getById(trajetId);
        if (trajet == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        // Création de la réservation avec l'état 'acheté' et association utilisateur
        Reservation reservation = new Reservation();
        reservation.setUtilisateur(utilisateur);
        reservation.setTrajet(trajet);
        reservation.setClasse(classe);
        reservation.setPreferences(preferences);
        reservation.setEtat("acheté");

        new ReservationDAO().enregistrer(reservation);
        Billet billet = new Billet();
        billet.setUtilisateur(utilisateur);
        billet.setTrajet(trajet);
        billet.setClasse(classe);
        billet.setPreferences(preferences);
        billet.setEtat("acheté");
        new BilletDAO().enregistrer(billet);

        // Chargement des prochains trajets à partir de la ville d'arrivée pour proposer une continuation
        List<Trajet> prochainsTrajets = new TrajetDAO().rechercherParDepart(trajet.getVilleArrivee());

        // Envoi des attributs à la JSP, incluant l'indicateur que paiement a été effectué
        request.setAttribute("trajet", trajet);
        request.setAttribute("classe", classe);
        request.setAttribute("preferences", preferences);
        request.setAttribute("prochainsTrajets", prochainsTrajets);
        request.setAttribute("paiementEffectue", true);

        request.getRequestDispatcher("confirmation.jsp").forward(request, response);
    }
}
