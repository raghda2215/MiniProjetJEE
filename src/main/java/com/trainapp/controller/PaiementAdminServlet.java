package com.trainapp.controller;

import com.trainapp.dao.PaiementDAO;
import com.trainapp.model.Paiement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/paiements")
public class PaiementAdminServlet extends HttpServlet {

    private PaiementDAO paiementDAO = new PaiementDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Récupération des filtres
        String email = request.getParameter("email");
        String statut = request.getParameter("statut");

        List<Paiement> paiements;

        if ((email != null && !email.isEmpty()) || (statut != null && !statut.isEmpty())) {
            paiements = paiementDAO.filtrer(email, statut);
        } else {
            paiements = paiementDAO.getAll();
        }

        request.setAttribute("paiements", paiements);
        request.getRequestDispatcher("/WEB-INF/views/admin-paiements.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));

        switch (action) {
            case "verifier":
                paiementDAO.mettreAJourStatut(id, "vérifié");
                break;

            case "annuler":
                paiementDAO.mettreAJourStatut(id, "annulé");
                break;

            case "modifierMontant":
                try {
                    double montant = Double.parseDouble(request.getParameter("montant"));
                    paiementDAO.modifierMontant(id, montant);
                } catch (NumberFormatException e) {
                    // gérer l’erreur si le montant n’est pas valide
                    request.setAttribute("erreur", "Montant invalide");
                }
                break;
        }

        // Après action, rediriger vers GET pour éviter resoumission du formulaire
        response.sendRedirect(request.getContextPath() + "/admin/paiements");
    }
}

