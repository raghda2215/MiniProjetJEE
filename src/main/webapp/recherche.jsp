<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Résultats de recherche - Réservation de Train</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary: #3f51b5;
            --secondary: #6c757d;
            --success: #4caf50;
            --light: #f8f9fa;
            --dark: #343a40;
        }
        body {
            background-color: #f5f5f5;
            font-family: 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            padding: 20px;
        }
        .search-results-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin: 40px auto;
            max-width: 900px;
        }
        .page-title {
            color: var(--primary);
            font-weight: 600;
            margin-bottom: 25px;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .page-title i {
            margin-right: 15px;
            font-size: 2rem;
        }
        .trip-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 20px;
            transition: transform 0.2s, box-shadow 0.2s;
            overflow: hidden;
            border: 1px solid #e0e0e0;
        }
        .trip-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        .trip-header {
            background-color: var(--light);
            padding: 15px 20px;
            border-bottom: 1px solid #e0e0e0;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .trip-route {
            display: flex;
            align-items: center;
            font-size: 1.2rem;
            font-weight: 600;
            color: var(--dark);
        }
        .trip-route i {
            margin: 0 15px;
            color: var(--primary);
        }
        .trip-date {
            background-color: var(--primary);
            color: white;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 500;
            display: flex;
            align-items: center;
        }
        .trip-date i {
            margin-right: 5px;
        }
        .trip-body {
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }
        .trip-details {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 15px;
        }
        .detail-item {
            display: flex;
            flex-direction: column;
            min-width: 120px;
        }
        .detail-label {
            font-size: 0.85rem;
            color: var(--secondary);
            margin-bottom: 5px;
        }
        .detail-value {
            font-size: 1.1rem;
            font-weight: 500;
            color: var(--dark);
        }
        .detail-value i {
            margin-right: 5px;
            color: var(--primary);
        }
        .trip-price {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--primary);
            margin-right: 20px;
        }
        .trip-price small {
            font-size: 1rem;
            font-weight: 400;
        }
        .btn-reserve {
            background-color: var(--primary);
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: 500;
            transition: all 0.2s;
            border: none;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
        }
        .btn-reserve:hover {
            background-color: #303f9f;
            box-shadow: 0 4px 8px rgba(63, 81, 181, 0.3);
            color: white;
        }
        .btn-reserve i {
            margin-right: 8px;
        }
        .seats-available {
            background-color: #e8f5e9;
            color: var(--success);
            padding: 5px 10px;
            border-radius: 4px;
            font-weight: 500;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            margin-right: 15px;
        }
        .seats-available i {
            margin-right: 5px;
        }
        .seats-limited {
            background-color: #fff3e0;
            color: #ff9800;
        }
        .seats-critical {
            background-color: #ffebee;
            color: #f44336;
        }
        .trip-actions {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }
        .no-results {
            text-align: center;
            padding: 40px 20px;
            color: var(--secondary);
        }
        .no-results i {
            font-size: 3rem;
            margin-bottom: 15px;
            color: var(--primary);
        }
        @media (max-width: 768px) {
            .trip-header {
                flex-direction: column;
                align-items: flex-start;
            }
            .trip-date {
                margin-top: 10px;
            }
            .trip-actions {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }
            .trip-price {
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="search-results-container">
            <h2 class="page-title">
                <i class="fas fa-search"></i>
                Résultats de recherche
            </h2>
            
            <c:choose>
                <c:when test="${not empty trajets}">
                    <c:forEach items="${trajets}" var="trajet">
                        <div class="trip-card">
                            <div class="trip-header">
                                <div class="trip-route">
                                    <span>${trajet.villeDepart}</span>
                                    <i class="fas fa-arrow-right"></i>
                                    <span>${trajet.villeArrivee}</span>
                                </div>
                                <div class="trip-date">
                                    <i class="fas fa-calendar-alt"></i>
                                    ${trajet.date}
                                </div>
                            </div>
                            <div class="trip-body">
                                <div class="trip-details">
                                    <div class="detail-item">
                                        <span class="detail-label">Départ</span>
                                        <span class="detail-value">
                                            <i class="fas fa-clock"></i>
                                            ${trajet.heureDepart}
                                        </span>
                                    </div>
                                    <div class="detail-item">
                                        <span class="detail-label">Arrivée</span>
                                        <span class="detail-value">
                                            <i class="fas fa-clock"></i>
                                            ${trajet.heureArrivee}
                                        </span>
                                    </div>
                                    <div class="detail-item">
                                        <span class="detail-label">Durée</span>
                                        <span class="detail-value">
                                            <i class="fas fa-hourglass-half"></i>
                                            2h30
                                        </span>
                                    </div>
                                </div>
                                <div class="trip-actions">
                                    <c:choose>
                                        <c:when test="${trajet.placesDisponibles > 20}">
                                            <div class="seats-available">
                                                <i class="fas fa-check-circle"></i>
                                                ${trajet.placesDisponibles} places disponibles
                                            </div>
                                        </c:when>
                                        <c:when test="${trajet.placesDisponibles > 5}">
                                            <div class="seats-available seats-limited">
                                                <i class="fas fa-exclamation-circle"></i>
                                                ${trajet.placesDisponibles} places restantes
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="seats-available seats-critical">
                                                <i class="fas fa-exclamation-triangle"></i>
                                                Dernières ${trajet.placesDisponibles} places !
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="trip-price">
                                        ${trajet.prix} <small>Dt</small>
                                    </div>
                                    <a href="ReservationServlet?trajetId=${trajet.id}" class="btn-reserve">
                                        <i class="fas fa-ticket-alt"></i>
                                        Réserver
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="no-results">
                        <i class="fas fa-search d-block"></i>
                        <p>Aucun trajet ne correspond à votre recherche.</p>
                        <p>Veuillez modifier vos critères et réessayer.</p>
                    </div>
                </c:otherwise>
            </c:choose>
            
            <div class="mt-4 text-center">
                <a href="javascript:history.back()" class="btn btn-secondary">
                    <i class="fas fa-arrow-left"></i> Retour à la recherche
                </a>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>