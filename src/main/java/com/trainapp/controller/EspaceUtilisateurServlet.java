package com.trainapp.controller;

import com.trainapp.dao.BilletDAO;

import com.trainapp.model.Billet;

import com.trainapp.model.Utilisateur;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
@WebServlet("/EspaceUtilisateurServlet")
public class EspaceUtilisateurServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");
        if (utilisateur == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        BilletDAO billetDAO = new BilletDAO();
        List<Billet> billets = billetDAO.getBilletsByUtilisateur(utilisateur.getId());
        request.setAttribute("billets", billets);
        request.getRequestDispatcher("espaceUtilisateur.jsp").forward(request, response);
    }
}
