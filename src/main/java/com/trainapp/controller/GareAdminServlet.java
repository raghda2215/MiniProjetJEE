package com.trainapp.controller;

import com.trainapp.dao.GareDAO;
import com.trainapp.model.Gare;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/gares")
public class GareAdminServlet extends HttpServlet {
    private GareDAO gareDAO = new GareDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("modifier".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Gare gare = gareDAO.getById(id);
            request.setAttribute("gare", gare);
            request.getRequestDispatcher("/WEB-INF/views/admin-modifier-gare.jsp").forward(request, response);
        } else {
            List<Gare> gares = gareDAO.getAll();
            request.setAttribute("gares", gares);
            request.getRequestDispatcher("/WEB-INF/views/admin-gares.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("ajouter".equals(action)) {
            Gare gare = new Gare();
            gare.setNom(request.getParameter("nom"));
            gare.setVille(request.getParameter("ville"));
            gareDAO.ajouterGare(gare);

        } else if ("modifier".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Gare gare = gareDAO.getById(id);
            gare.setNom(request.getParameter("nom"));
            gare.setVille(request.getParameter("ville"));
            gareDAO.modifierGare(gare);

        } else if ("supprimer".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            gareDAO.supprimerGare(id);
        }

        response.sendRedirect("gares");
    }
}
