package com.trainapp.controller;

import com.trainapp.dao.BilletDAO;
import com.trainapp.model.Utilisateur;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");

        if (utilisateur == null || !"admin".equals(utilisateur.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
    }
}
