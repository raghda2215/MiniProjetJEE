package com.trainapp.controller;
import com.trainapp.dao.TrajetDAO;
import com.trainapp.dao.UtilisateurDAO;
import com.trainapp.model.Trajet;
import com.trainapp.model.Utilisateur;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/utilisateurs")
public class UtilisateurAdminServlet extends HttpServlet {

    private UtilisateurDAO utilisateurDAO = new UtilisateurDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Utilisateur> utilisateurs = utilisateurDAO.getAllUtilisateurs();
        req.setAttribute("utilisateurs", utilisateurs);
        req.getRequestDispatcher("/WEB-INF/views/admin-utilisateurs.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        boolean bloque = Boolean.parseBoolean(req.getParameter("bloque"));
        utilisateurDAO.setBloque(id, bloque);
        resp.sendRedirect("utilisateurs");
    }
}
