package com.trainapp.controller;

import com.trainapp.dao.TrajetDAO;
import com.trainapp.model.Trajet;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
@WebServlet("/TrajetServlet")
public class TrajetServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String depart = request.getParameter("depart");
        String arrivee = request.getParameter("arrivee");
        String date = request.getParameter("date");

        List<Trajet> trajets = new TrajetDAO().rechercher(depart, arrivee, date);

        request.setAttribute("trajets", trajets);
        request.getRequestDispatcher("recherche.jsp").forward(request, response);
    }
}
