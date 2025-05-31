
package com.trainapp.controller;

import com.trainapp.dao.BilletDAO;

import com.trainapp.model.Billet;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ModifierReservationServlet")
public class ModifierReservationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int billetId = Integer.parseInt(request.getParameter("billetId"));
        Billet billet = new BilletDAO().getById(billetId);
        request.setAttribute("billet", billet);
        request.getRequestDispatcher("modifierReservation.jsp").forward(request, response);
    }
}

