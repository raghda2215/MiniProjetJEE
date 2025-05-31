package com.trainapp.controller;

import com.trainapp.dao.BilletDAO;
import com.trainapp.model.Billet;
import com.trainapp.model.Utilisateur;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/TelechargerPDFServlet")
public class TelechargerPDFServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int billetId = Integer.parseInt(request.getParameter("billetId"));
        BilletDAO billetDAO = new BilletDAO();
        Billet billet = billetDAO.getById(billetId);

        // Vérifier que l'utilisateur connecté est bien le propriétaire
        HttpSession session = request.getSession();
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");
        if (billet == null || billet.getUtilisateur().getId() != utilisateur.getId()) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        // Simule un PDF (à remplacer avec iText ou autre lib PDF réelle)
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=billet_" + billetId + ".pdf");

        OutputStream out = response.getOutputStream();
        out.write(("BILLET PDF\nTrajet : " + billet.getTrajet().getVilleDepart() + " → " + billet.getTrajet().getVilleArrivee()).getBytes());
        out.flush();
        out.close();
    }
}
