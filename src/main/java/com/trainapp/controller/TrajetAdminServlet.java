package com.trainapp.controller;

import com.trainapp.dao.TrajetDAO;
import com.trainapp.model.Trajet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/trajets")
public class TrajetAdminServlet extends HttpServlet {
    private TrajetDAO trajetDAO = new TrajetDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("modifier".equals(action)) {
            // Chargement du trajet pour modification
            int id = Integer.parseInt(request.getParameter("id"));
            Trajet trajet = trajetDAO.getById(id);
            request.setAttribute("trajet", trajet);
            request.getRequestDispatcher("/WEB-INF/views/admin-modifier-trajet.jsp").forward(request, response);
        } else {
            // Liste des trajets par défaut
            List<Trajet> trajets = trajetDAO.getAllTrajets();
            request.setAttribute("trajets", trajets);
            request.getRequestDispatcher("/WEB-INF/views/admin-trajets.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("ajouter".equals(action)) {
            Trajet trajet = new Trajet();
            trajet.setVilleDepart(request.getParameter("depart"));
            trajet.setVilleArrivee(request.getParameter("destination"));
            trajet.setDate(request.getParameter("date"));
            trajet.setHeureDepart(request.getParameter("heureDepart"));
            trajet.setHeureArrivee(request.getParameter("heureArrivee"));
            trajet.setPrix(Double.parseDouble(request.getParameter("prix")));
            trajet.setPlacesDisponibles(Integer.parseInt(request.getParameter("placesDisponibles")));
            trajetDAO.ajouterTrajet(trajet);

        } else if ("supprimer".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            trajetDAO.supprimerTrajet(id);

        } else if ("modifier".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Trajet trajet = trajetDAO.getById(id);
            trajet.setVilleDepart(request.getParameter("depart"));
            trajet.setVilleArrivee(request.getParameter("destination"));
            trajet.setDate(request.getParameter("date"));
            trajet.setHeureDepart(request.getParameter("heureDepart"));
            trajet.setHeureArrivee(request.getParameter("heureArrivee"));
            trajet.setPrix(Double.parseDouble(request.getParameter("prix")));
            trajet.setPlacesDisponibles(Integer.parseInt(request.getParameter("placesDisponibles")));

            trajetDAO.modifierTrajet(trajet);
        }
        else if ("majPlaces".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            int places = Integer.parseInt(request.getParameter("placesDisponibles"));
            Trajet trajet = trajetDAO.getById(id);
            trajet.setPlacesDisponibles(places);
            trajetDAO.modifierTrajet(trajet);
        }


        response.sendRedirect("trajets");
    }
}
