
package com.trainapp.controller;

import com.trainapp.dao.AffectationDAO;
import com.trainapp.dao.BilletDAO;
import com.trainapp.model.Employe;
import com.trainapp.model.Utilisateur;
import com.trainapp.model.Voyage;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
@WebServlet("/MesVoyagesServlet")
public class MesVoyagesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Employe employe = (Employe) session.getAttribute("employe");

        AffectationDAO dao = new AffectationDAO();
        List<Voyage> voyages = dao.getVoyagesParEmploye(employe.getId());

        request.setAttribute("voyages", voyages);
        request.getRequestDispatcher("employe/mesVoyages.jsp").forward(request, response);
    }
}
