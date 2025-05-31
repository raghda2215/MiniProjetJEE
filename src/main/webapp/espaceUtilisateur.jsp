<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mon Espace</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary: #4e73df;
            --secondary: #858796;
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
            padding: 40px 0;
            font-family: 'Nunito', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
        }
        .user-space-container {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 35px;
            max-width: 1000px;
            width: 100%;
            margin: 0 auto;
            position: relative;
            overflow: hidden;
        }
        .page-header {
            text-align: center;
            margin-bottom: 30px;
            position: relative;
        }
        .page-title {
            color: #3a4a6d;
            font-weight: 700;
            margin-bottom: 10px;
            font-size: 2rem;
            display: inline-block;
            position: relative;
        }
        .page-title:after {
            content: '';
            position: absolute;
            width: 50%;
            height: 4px;
            background-color: var(--primary);
            bottom: -10px;
            left: 25%;
            border-radius: 2px;
        }
        .ticket-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-bottom: 20px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }
        .ticket-table th {
            background-color: var(--primary);
            color: white;
            padding: 15px;
            text-align: left;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.9rem;
            letter-spacing: 1px;
        }
        .ticket-table td {
            padding: 15px;
            border-bottom: 1px solid #e3e6f0;
            vertical-align: middle;
        }
        .ticket-table tr:last-child td {
            border-bottom: none;
        }
        .ticket-table tr:nth-child(even) {
            background-color: var(--light);
        }
        .ticket-table tr:hover {
            background-color: rgba(78, 115, 223, 0.05);
        }
        .route-cell {
            font-weight: 600;
            color: #3a4a6d;
            display: flex;
            align-items: center;
        }
        .route-arrow {
            margin: 0 10px;
            color: var(--primary);
        }
        .status-badge {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 30px;
            font-size: 0.8rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .status-purchased {
            background-color: rgba(28, 200, 138, 0.1);
            color: var(--success);
        }
        .status-used {
            background-color: rgba(54, 185, 204, 0.1);
            color: var(--info);
        }
        .status-cancelled {
            background-color: rgba(231, 74, 59, 0.1);
            color: var(--danger);
        }
        .status-pending {
            background-color: rgba(246, 194, 62, 0.1);
            color: var(--warning);
        }
        .btn-action {
            border-radius: 8px;
            font-weight: 500;
            padding: 8px 15px;
            transition: all 0.3s;
            margin-right: 5px;
            margin-bottom: 5px;
            font-size: 0.85rem;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        .btn-action i {
            margin-right: 5px;
        }
        .btn-cancel {
            background-color: var(--danger);
            border-color: var(--danger);
            color: white;
        }
        .btn-cancel:hover {
            background-color: #d52a1a;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(231, 74, 59, 0.2);
        }
        .btn-modify {
            background-color: var(--warning);
            border-color: var(--warning);
            color: #5a5c69;
        }
        .btn-modify:hover {
            background-color: #e6b14c;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(246, 194, 62, 0.2);
        }
        .btn-download {
            background-color: var(--info);
            border-color: var(--info);
            color: white;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
        }
        .btn-download:hover {
            background-color: #2aa3b9;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(54, 185, 204, 0.2);
            color: white;
        }
        .action-cell {
            display: flex;
            flex-wrap: wrap;
            gap: 5px;
        }
        .corner-decoration {
            position: absolute;
            width: 200px;
            height: 200px;
            background-color: rgba(78, 115, 223, 0.05);
            border-radius: 50%;
            z-index: 0;
        }
        .corner-top-right {
            top: -100px;
            right: -100px;
        }
        .corner-bottom-left {
            bottom: -100px;
            left: -100px;
        }
        .no-tickets-message {
            text-align: center;
            padding: 40px 20px;
            background-color: var(--light);
            border-radius: 10px;
            color: var(--secondary);
            font-size: 1.1rem;
        }
        .no-tickets-message i {
            font-size: 3rem;
            margin-bottom: 15px;
            color: var(--primary);
            opacity: 0.5;
        }
        @media (max-width: 768px) {
            .ticket-table {
                display: block;
                overflow-x: auto;
            }
            .user-space-container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="user-space-container">
            <!-- Décorations d'arrière-plan -->
            <div class="corner-decoration corner-top-right"></div>
            <div class="corner-decoration corner-bottom-left"></div>
            
            <!-- En-tête de la page -->
            <div class="page-header">
                <h2 class="page-title">
                    <i class="fas fa-ticket-alt me-2"></i>Mon Espace
                </h2>
            </div>
            
            <!-- Tableau des billets -->
            <c:choose>
                <c:when test="${empty billets}">
                    <div class="no-tickets-message">
                        <i class="fas fa-search mb-3 d-block"></i>
                        <p>Vous n'avez pas encore de billets réservés.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <table class="ticket-table">
                        <thead>
                            <tr>
                                <th>Trajet</th>
                                <th>Classe</th>
                                <th>État</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="b" items="${billets}">
                                <tr>
                                    <td>
                                        <div class="route-cell">
                                            <span>${b.trajet.villeDepart}</span>
                                            <i class="fas fa-arrow-right route-arrow"></i>
                                            <span>${b.trajet.villeArrivee}</span>
                                        </div>
                                    </td>
                                    <td>${b.classe}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${b.etat == 'acheté'}">
                                                <span class="status-badge status-purchased">
                                                    <i class="fas fa-check-circle me-1"></i>${b.etat}
                                                </span>
                                            </c:when>
                                            <c:when test="${b.etat == 'utilisé'}">
                                                <span class="status-badge status-used">
                                                    <i class="fas fa-check-double me-1"></i>${b.etat}
                                                </span>
                                            </c:when>
                                            <c:when test="${b.etat == 'annulé'}">
                                                <span class="status-badge status-cancelled">
                                                    <i class="fas fa-times-circle me-1"></i>${b.etat}
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="status-badge status-pending">
                                                    <i class="fas fa-clock me-1"></i>${b.etat}
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="action-cell">
                                        <c:if test="${b.etat == 'acheté'}">
                                            <form action="AnnulerBilletServlet" method="post" style="display:inline;">
                                                <input type="hidden" name="billetId" value="${b.id}" />
                                                <button type="submit" class="btn btn-action btn-cancel">
                                                    <i class="fas fa-ban"></i>Annuler
                                                </button>
                                            </form>
                                            
                                            <form action="ModifierReservationServlet" method="get" style="display:inline;">
                                                <input type="hidden" name="billetId" value="${b.id}" />
                                                <button type="submit" class="btn btn-action btn-modify">
                                                    <i class="fas fa-edit"></i>Modifier
                                                </button>
                                            </form>
                                        </c:if>
                                        
                                        <c:if test="${b.etat == 'utilisé' || b.etat == 'acheté'}">
                                            <a href="TelechargerPDFServlet?billetId=${b.id}" class="btn btn-action btn-download">
                                                <i class="fas fa-file-pdf"></i>PDF
                                            </a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
            <!-- 🔽 Bouton de retour à l'accueil -->
<div class="text-center mt-4">
    <a href="index.jsp" class="btn btn-primary btn-action">
        <i class="fas fa-home me-2"></i>Retour à l'accueil
    </a>
</div>
            
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
