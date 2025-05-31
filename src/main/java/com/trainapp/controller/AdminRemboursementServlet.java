package com.trainapp.controller;

import com.trainapp.dao.DemandeRemboursementDAO;
import com.trainapp.model.DemandeRemboursement;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/remboursements")
public class AdminRemboursementServlet extends HttpServlet {
    private DemandeRemboursementDAO dao = new DemandeRemboursementDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<DemandeRemboursement> demandes = dao.getAll();
        request.setAttribute("demandes", demandes);
        request.getRequestDispatcher("/WEB-INF/views/admin-remboursements.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action");

        if (action != null && (action.equals("approuver") || action.equals("refuser"))) {
            dao.changerStatut(id, action.equals("approuver") ? "approuvée" : "refusée");
        }

        response.sendRedirect(request.getContextPath() + "/admin/remboursements");
    }
}
