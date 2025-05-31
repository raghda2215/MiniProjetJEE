package com.trainapp.controller;

import com.trainapp.dao.TrajetDAO;
import com.trainapp.dao.VoyageDAO;
import com.trainapp.model.Trajet;
import com.trainapp.model.Voyage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.sql.Date;
import java.sql.Time;
@WebServlet("/admin/voyages")
public class VoyageAdminServlet extends HttpServlet {
    private VoyageDAO voyageDAO = new VoyageDAO();
    private TrajetDAO trajetDAO = new TrajetDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("modifier".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Voyage voyage = voyageDAO.getById(id);
            List<Trajet> trajets = trajetDAO.getAllTrajets();

            request.setAttribute("voyage", voyage);
            request.setAttribute("listeTrajets", trajets);
            request.getRequestDispatcher("/WEB-INF/views/admin-modifier-voyage.jsp").forward(request, response);
        } else {
            List<Voyage> voyages = voyageDAO.getAll();
            List<Trajet> trajets = trajetDAO.getAllTrajets();

            request.setAttribute("voyages", voyages);
            request.setAttribute("trajets", trajets);
            request.getRequestDispatcher("/WEB-INF/views/admin-voyages.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("ajouter".equals(action) || "modifier".equals(action)) {
                int trajetId = Integer.parseInt(request.getParameter("trajetId"));
                Trajet trajet = trajetDAO.getById(trajetId);

                Date date = Date.valueOf(request.getParameter("date"));

                String heureStr = request.getParameter("heureDepart");
                if (heureStr != null && heureStr.length() == 5) {
                    heureStr += ":00"; // transforme "HH:mm" en "HH:mm:ss"
                }
                Time heureDepart = Time.valueOf(heureStr);

                int places = Integer.parseInt(request.getParameter("placesDisponibles"));

                if ("ajouter".equals(action)) {
                    Voyage voyage = new Voyage();
                    voyage.setTrajet(trajet);
                    voyage.setDate(date);
                    voyage.setHeureDepart(heureDepart);
                    voyage.setPlacesDisponibles(places);
                    voyageDAO.ajouterVoyage(voyage);
                } else {
                    int id = Integer.parseInt(request.getParameter("id"));
                    Voyage voyage = voyageDAO.getById(id);
                    voyage.setTrajet(trajet);
                    voyage.setDate(date);
                    voyage.setHeureDepart(heureDepart);
                    voyage.setPlacesDisponibles(places);
                    voyageDAO.modifierVoyage(voyage);
                }
            } else if ("supprimer".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                voyageDAO.supprimerVoyage(id);
            }

            response.sendRedirect("voyages");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("erreur", "Une erreur est survenue : " + e.getMessage());
            doGet(request, response);
        }
    }
}