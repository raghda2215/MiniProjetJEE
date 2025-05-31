package com.trainapp.controller;

import com.trainapp.dao.BilletDAO;

import com.trainapp.model.Billet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ValiderModificationServlet")
public class ValiderModificationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int billetId = Integer.parseInt(request.getParameter("billetId"));
        String classe = request.getParameter("classe");
        String preferences = request.getParameter("preferences");

        BilletDAO billetDAO = new BilletDAO();
        Billet billet = billetDAO.getById(billetId);
        billet.setClasse(classe);
        billet.setPreferences(preferences);

        billetDAO.mettreAJour(billet);

        response.sendRedirect("EspaceUtilisateurServlet");
    }
}
