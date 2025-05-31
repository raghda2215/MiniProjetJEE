package com.trainapp.controller;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/RetourReservationServlet")
public class RetourReservationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String trajetIdStr = (String) session.getAttribute("trajetId");
        String classe = (String) session.getAttribute("classe");
        String preferences = (String) session.getAttribute("preferences");

        // Supprimer les attributs de session après récupération
        session.removeAttribute("trajetId");
        session.removeAttribute("classe");
        session.removeAttribute("preferences");

        if (trajetIdStr == null || classe == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        // On transfère les infos comme paramètres à ConfirmationServlet (GET)
        response.sendRedirect("ConfirmationServlet?trajetId=" + trajetIdStr
                + "&classe=" + classe
                + "&preferences=" + (preferences != null ? preferences : ""));
    }
}
