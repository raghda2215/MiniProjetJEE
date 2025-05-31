<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Réservation Confirmée</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary: #4e73df;
            --success: #1cc88a;
            --info: #36b9cc;
            --warning: #f6c23e;
            --danger: #e74a3b;
            --light: #f8f9fc;
            --dark: #5a5c69;
        }
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 0;
            font-family: 'Nunito', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
        }
        .confirmation-card {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 35px;
            max-width: 800px;
            width: 100%;
            margin: 0 auto;
            position: relative;
            overflow: hidden;
        }
        .confirmation-header {
            text-align: center;
            margin-bottom: 30px;
            position: relative;
        }
        .confirmation-title {
            color: #3a4a6d;
            font-weight: 700;
            margin-bottom: 10px;
            font-size: 2rem;
        }
        .success-icon {
            font-size: 60px;
            color: var(--success);
            margin-bottom: 20px;
        }
        .ticket-details {
            background-color: var(--light);
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 30px;
            border-left: 4px solid var(--primary);
            position: relative;
        }
        .ticket-corner {
            position: absolute;
            top: -10px;
            right: -10px;
            background-color: var(--primary);
            color: white;
            width: 60px;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            font-size: 1.5rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        .detail-row {
            display: flex;
            margin-bottom: 15px;
            align-items: center;
        }
        .detail-label {
            font-weight: 600;
            color: #4e5d78;
            width: 150px;
            display: flex;
            align-items: center;
        }
        .detail-label i {
            margin-right: 10px;
            color: var(--primary);
            width: 20px;
            text-align: center;
        }
        .detail-value {
            color: #5a5c69;
            flex: 1;
        }
        .route-value {
            font-weight: 600;
            color: #3a4a6d;
            display: flex;
            align-items: center;
        }
        .route-arrow {
            margin: 0 10px;
            color: var(--primary);
        }
        .continue-section {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #e3e6f0;
        }
        .continue-question {
            text-align: center;
            margin-bottom: 20px;
            font-size: 1.1rem;
            color: #4e5d78;
        }
        .continue-question strong {
            color: var(--primary);
        }
        .btn-action {
            border-radius: 8px;
            font-weight: 500;
            padding: 10px 20px;
            transition: all 0.3s;
        }
        .btn-primary {
            background-color: var(--primary);
            border-color: var(--primary);
        }
        .btn-primary:hover {
            background-color: #3a5ccc;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(78, 115, 223, 0.2);
        }
        .btn-secondary {
            background-color: #858796;
            border-color: #858796;
        }
        .btn-secondary:hover {
            background-color: #717384;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(133, 135, 150, 0.2);
        }
        .continue-buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
        }
        .next-trips {
            margin-top: 30px;
        }
        .next-trips-title {
            color: #3a4a6d;
            font-weight: 600;
            margin-bottom: 20px;
            font-size: 1.2rem;
            display: flex;
            align-items: center;
        }
        .next-trips-title i {
            margin-right: 10px;
            color: var(--primary);
        }
        .trip-card {
            background-color: var(--light);
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 15px;
            border-left: 4px solid var(--primary);
            transition: all 0.3s;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .trip-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        .trip-info {
            flex: 1;
        }
        .trip-route {
            font-weight: 600;
            color: #3a4a6d;
            display: flex;
            align-items: center;
            margin-bottom: 5px;
        }
        .trip-details {
            color: #6c757d;
            font-size: 0.9rem;
        }
        .trip-price {
            font-weight: 600;
            color: var(--success);
            font-size: 1.2rem;
            margin-left: 15px;
            background-color: rgba(28, 200, 138, 0.1);
            padding: 5px 15px;
            border-radius: 20px;
        }
        .thank-you-message {
            text-align: center;
            margin-top: 30px;
            padding: 25px;
            background-color: rgba(78, 115, 223, 0.1);
            border-radius: 12px;
            color: var(--primary);
            font-weight: 500;
        }
        .thank-you-message i {
            font-size: 2.5rem;
            margin-bottom: 15px;
            color: var(--success);
        }
        .corner-decoration {
            position: absolute;
            width: 150px;
            height: 150px;
            background-color: rgba(78, 115, 223, 0.1);
            border-radius: 50%;
            z-index: 0;
        }
        .corner-top-right {
            top: -75px;
            right: -75px;
        }
        .corner-bottom-left {
            bottom: -75px;
            left: -75px;
        }
        .reservation-btn {
            display: inline-block;
            background-color: var(--primary);
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s;
        }
        .reservation-btn:hover {
            background-color: #3a5ccc;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(78, 115, 223, 0.2);
            color: white;
        }
        .reservation-btn i {
            margin-right: 8px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="confirmation-card">
            <!-- Décorations d'arrière-plan -->
            <div class="corner-decoration corner-top-right"></div>
            <div class="corner-decoration corner-bottom-left"></div>
            
            <!-- En-tête de confirmation -->
            <div class="confirmation-header">
                <i class="fas fa-check-circle success-icon"></i>
                <h2 class="confirmation-title">Réservation Confirmée</h2>
            </div>
            
            <!-- Détails du billet -->
            <div class="ticket-details">
                <div class="ticket-corner">
                    <i class="fas fa-ticket-alt"></i>
                </div>
                <div class="detail-row">
                    <div class="detail-label">
                        <i class="fas fa-route"></i>Trajet
                    </div>
                    <div class="detail-value route-value">
                        <span>${trajet.villeDepart}</span>
                        <i class="fas fa-arrow-right route-arrow"></i>
                        <span>${trajet.villeArrivee}</span>
                    </div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">
                        <i class="fas fa-calendar-alt"></i>Date
                    </div>
                    <div class="detail-value">${trajet.date}</div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">
                        <i class="fas fa-couch"></i>Classe
                    </div>
                    <div class="detail-value">${classe}</div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">
                        <i class="fas fa-sliders-h"></i>Préférences
                    </div>
                    <div class="detail-value">${preferences}</div>
                </div>
            </div>
            
            <!-- Étape 1 : proposer à l'utilisateur de continuer -->
            <c:if test="${empty continuer}">
                <div class="continue-section">
                    <p class="continue-question">
                        Voulez-vous réserver un autre trajet à partir de <strong>${trajet.villeArrivee}</strong> ?
                    </p>
                    <div class="continue-buttons">
                        <form action="ContinuerReservationServlet" method="get">
                            <input type="hidden" name="trajetId" value="${trajet.id}" />
                            <input type="hidden" name="classe" value="${classe}" />
                            <input type="hidden" name="preferences" value="${preferences}" />
                            <button type="submit" name="continuer" value="oui" class="btn btn-primary btn-action">
                                <i class="fas fa-check me-2"></i>Oui, je continue
                            </button>
                            <button type="submit" name="continuer" value="non" class="btn btn-secondary btn-action">
                                <i class="fas fa-times me-2"></i>Non, merci
                            </button>
                        </form>
                    </div>
                </div>
            </c:if>

            <!-- Étape 2 : afficher les trajets si l'utilisateur a cliqué "Oui" -->
            <c:if test="${continuer == 'oui'}">
                <div class="next-trips">
                    <h3 class="next-trips-title">
                        <i class="fas fa-map-marked-alt"></i>
                        Trajets disponibles à partir de ${trajet.villeArrivee}
                    </h3>
                    <c:forEach var="t" items="${prochainsTrajets}">
                        <div class="trip-card">
                            <div class="trip-info">
                                <div class="trip-route">
                                    <span>${t.villeDepart}</span>
                                    <i class="fas fa-arrow-right route-arrow"></i>
                                    <span>${t.villeArrivee}</span>
                                </div>
                                <div class="trip-details">
                                    ${t.date} | ${t.heureDepart} - ${t.heureArrivee}
                                </div>
                            </div>
                            <div class="trip-price">${t.prix}dt</div>
                            <a href="ReservationServlet?trajetId=${t.id}" class="reservation-btn">
                                <i class="fas fa-ticket-alt"></i>Réserver
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </c:if>

            <!-- Étape 3 : message si l'utilisateur a dit "Non" -->
            <c:if test="${continuer == 'non'}">
                <div class="thank-you-message">
                    <i class="fas fa-heart"></i>
                    <p class="mb-0">Merci pour votre réservation. Vous pouvez quitter ou effectuer une autre recherche.</p>
                </div>
            </c:if>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

