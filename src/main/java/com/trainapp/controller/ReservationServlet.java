
package com.trainapp.controller;

import com.trainapp.dao.TrajetDAO;
import com.trainapp.model.Trajet;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int trajetId = Integer.parseInt(request.getParameter("trajetId"));
        Trajet trajet = new TrajetDAO().getById(trajetId);

        request.setAttribute("trajet", trajet);
        request.getRequestDispatcher("options.jsp").forward(request, response);
    }
}
