package com.trainapp.controller;

import com.trainapp.dao.AffectationDAO;
import com.trainapp.dao.EmployeDAO;
import com.trainapp.dao.VoyageDAO;
import com.trainapp.model.Employe;
import com.trainapp.model.Voyage;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;


@WebServlet("/AffecterEmployeServlet")
public class AffecterEmployeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int employeId = Integer.parseInt(request.getParameter("employeId"));
        int voyageId = Integer.parseInt(request.getParameter("voyageId"));
        String role = request.getParameter("role");

        EmployeDAO employeDAO = new EmployeDAO();
        VoyageDAO voyageDAO = new VoyageDAO();
        AffectationDAO affectationDAO = new AffectationDAO();

        Employe employe = employeDAO.getById(employeId);
        Voyage voyage = voyageDAO.getById(voyageId);

        affectationDAO.ajouterAffectation(employe, voyage, role);

        response.sendRedirect("admin/gestionEmployes.jsp");
    }
}
