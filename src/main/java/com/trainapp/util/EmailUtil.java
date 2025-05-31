package com.trainapp.util;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailUtil {
    public static void envoyerEmail(String destinataire, String sujet, String contenu) {
        final String expediteur = "votre.email@gmail.com"; // Ton email
        final String motDePasse = "ton-mot-de-passe-app"; // Mot de passe d'application

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(expediteur, motDePasse);
                    }
                });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(expediteur));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destinataire));
            message.setSubject(sujet);
            message.setText(contenu);

            Transport.send(message);
            System.out.println("Email envoyé avec succès à " + destinataire);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
