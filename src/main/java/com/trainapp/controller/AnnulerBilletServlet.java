package com.trainapp.controller;

import com.trainapp.dao.BilletDAO;


import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;


@WebServlet("/AnnulerBilletServlet")
public class AnnulerBilletServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int billetId = Integer.parseInt(request.getParameter("billetId"));
        new BilletDAO().annulerBillet(billetId);
        response.sendRedirect("EspaceUtilisateurServlet");
    }
}
