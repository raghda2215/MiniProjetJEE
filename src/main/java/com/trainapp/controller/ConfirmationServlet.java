package com.trainapp.controller;

import com.trainapp.dao.TrajetDAO;
import com.trainapp.dao.ReservationDAO;
import com.trainapp.model.Reservation;
import com.trainapp.model.Trajet;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ConfirmationServlet")
public class ConfirmationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Object utilisateur = session.getAttribute("utilisateur");

        // 🔁 Récupérer données depuis paramètres OU session
        String trajetIdStr = request.getParameter("trajetId");
        String classe = request.getParameter("classe");
        String preferences = request.getParameter("preferences");

        if (trajetIdStr == null) trajetIdStr = (String) session.getAttribute("trajetId");
        if (classe == null) classe = (String) session.getAttribute("classe");
        if (preferences == null) preferences = (String) session.getAttribute("preferences");

        // Si infos manquantes → erreur
        if (trajetIdStr == null || classe == null) {
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

        // 🔐 Si pas connecté, rediriger vers login
        if (utilisateur == null) {
            session.setAttribute("trajetId", trajetIdStr);
            session.setAttribute("classe", classe);
            session.setAttribute("preferences", preferences);
            response.sendRedirect("login.jsp");
            return;
        }

        // ✅ Connexion OK, traiter réservation
        TrajetDAO trajetDAO = new TrajetDAO();
        Trajet trajet = trajetDAO.getById(trajetId);

        Reservation reservation = new Reservation();
        reservation.setTrajet(trajet);
        reservation.setClasse(classe);
        reservation.setPreferences(preferences);
        new ReservationDAO().enregistrer(reservation);

        List<Trajet> prochainsTrajets = trajetDAO.rechercherParDepart(trajet.getVilleArrivee());

        request.setAttribute("trajet", trajet);
        request.setAttribute("classe", classe);
        request.setAttribute("preferences", preferences);
        request.setAttribute("prochainsTrajets", prochainsTrajets);

        // Nettoyer la session
        session.removeAttribute("trajetId");
        session.removeAttribute("classe");
        session.removeAttribute("preferences");

        request.getRequestDispatcher("confirmation.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}

