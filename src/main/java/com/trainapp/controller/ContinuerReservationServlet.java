package com.trainapp.controller;

import com.trainapp.dao.TrajetDAO;
import com.trainapp.model.Trajet;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ContinuerReservationServlet")
public class ContinuerReservationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int trajetId = Integer.parseInt(request.getParameter("trajetId"));
        String classe = request.getParameter("classe");
        String preferences = request.getParameter("preferences");
        String continuer = request.getParameter("continuer"); // "oui" ou "non"

        TrajetDAO trajetDAO = new TrajetDAO();
        Trajet trajet = trajetDAO.getById(trajetId);

        request.setAttribute("trajet", trajet);
        request.setAttribute("classe", classe);
        request.setAttribute("preferences", preferences);
        request.setAttribute("continuer", continuer);

        if ("oui".equals(continuer)) {
            List<Trajet> prochainsTrajets = trajetDAO.rechercherParDepart(trajet.getVilleArrivee());
            request.setAttribute("prochainsTrajets", prochainsTrajets);
        }

        request.getRequestDispatcher("confirmationPaiement.jsp").forward(request, response);
    }
}

