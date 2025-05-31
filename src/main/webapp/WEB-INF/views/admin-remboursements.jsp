<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Demandes de Remboursement</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary: #3f51b5;
            --secondary: #6c757d;
            --success: #4caf50;
            --danger: #f44336;
            --warning: #ff9800;
            --info: #2196f3;
            --light: #f8f9fa;
            --dark: #343a40;
        }
        body {
            background-color: #f5f5f5;
            font-family: 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            padding: 20px;
        }
        .admin-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin: 40px auto;
        }
        .page-title {
            color: var(--primary);
            font-weight: 600;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 2px solid var(--primary);
            display: flex;
            align-items: center;
        }
        .page-title i {
            margin-right: 10px;
            font-size: 1.8rem;
        }
        .table {
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
        }
        .table thead {
            background-color: var(--primary);
            color: white;
        }
        .table th {
            font-weight: 500;
            padding: 15px;
            border: none;
        }
        .table td {
            padding: 15px;
            vertical-align: middle;
            border-color: #f0f0f0;
        }
        .table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .table tr:hover {
            background-color: #f0f0f0;
        }
        .badge {
            padding: 8px 12px;
            border-radius: 30px;
            font-weight: 500;
            font-size: 0.85rem;
        }
        .badge-pending {
            background-color: var(--warning);
            color: white;
        }
        .badge-approved {
            background-color: var(--success);
            color: white;
        }
        .badge-rejected {
            background-color: var(--danger);
            color: white;
        }
        .btn {
            padding: 8px 16px;
            border-radius: 6px;
            font-weight: 500;
            transition: all 0.2s;
            border: none;
            margin-right: 5px;
        }
        .btn i {
            margin-right: 5px;
        }
        .btn-success {
            background-color: var(--success);
            color: white;
        }
        .btn-success:hover {
            background-color: #3d8b40;
            box-shadow: 0 2px 5px rgba(76, 175, 80, 0.3);
        }
        .btn-danger {
            background-color: var(--danger);
            color: white;
        }
        .btn-danger:hover {
            background-color: #d32f2f;
            box-shadow: 0 2px 5px rgba(244, 67, 54, 0.3);
        }
        .refund-id {
            font-weight: 500;
            color: var(--primary);
        }
        .refund-amount {
            font-weight: 600;
            color: var(--dark);
        }
        .refund-user {
            color: var(--info);
        }
        .refund-payment {
            color: var(--secondary);
        }
        .refund-reason {
            max-width: 250px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        .refund-reason:hover {
            white-space: normal;
            overflow: visible;
        }
        .action-form {
            display: inline-block;
        }
        @media (max-width: 992px) {
            .table-responsive {
                border-radius: 8px;
                overflow: hidden;
            }
            .refund-reason {
                max-width: 150px;
            }
        }
        .empty-message {
            text-align: center;
            padding: 30px;
            background-color: #f8f9fa;
            border-radius: 8px;
            margin-top: 20px;
            color: var(--secondary);
        }
        .empty-message i {
            font-size: 3rem;
            margin-bottom: 15px;
            color: var(--primary);
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="admin-container">
            <h2 class="page-title">
                <i class="fas fa-hand-holding-usd"></i>
                Demandes de Remboursement
            </h2>
            
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Utilisateur</th>
                            <th>Paiement</th>
                            <th>Montant</th>
                            <th>Motif</th>
                            <th>Statut</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${demandes}" var="d">
                            <tr>
                                <td class="refund-id">#${d.id}</td>
                                <td class="refund-user">
                                    <i class="fas fa-user me-1"></i> ${d.utilisateur.email}
                                </td>
                                <td class="refund-payment">
                                    <i class="fas fa-receipt me-1"></i> #${d.paiement.id}
                                </td>
                                <td class="refund-amount">
                                    <i class="fas fa-euro-sign me-1"></i> ${d.paiement.montant} €
                                </td>
                                <td class="refund-reason">
                                    <i class="fas fa-comment-alt me-1"></i> ${d.motif}
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${d.statut == 'en attente'}">
                                            <span class="badge badge-pending">
                                                <i class="fas fa-clock me-1"></i> En attente
                                            </span>
                                        </c:when>
                                        <c:when test="${d.statut == 'approuvé'}">
                                            <span class="badge badge-approved">
                                                <i class="fas fa-check me-1"></i> Approuvé
                                            </span>
                                        </c:when>
                                        <c:when test="${d.statut == 'refusé'}">
                                            <span class="badge badge-rejected">
                                                <i class="fas fa-times me-1"></i> Refusé
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-secondary">
                                                ${d.statut}
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:if test="${d.statut == 'en attente'}">
                                        <div class="d-flex flex-wrap gap-1">
                                            <form method="post" action="remboursements" class="action-form">
                                                <input type="hidden" name="id" value="${d.id}" />
                                                <input type="hidden" name="action" value="approuver" />
                                                <button type="submit" class="btn btn-success">
                                                    <i class="fas fa-check"></i> Approuver
                                                </button>
                                            </form>
                                            <form method="post" action="remboursements" class="action-form">
                                                <input type="hidden" name="id" value="${d.id}" />
                                                <input type="hidden" name="action" value="refuser" />
                                                <button type="submit" class="btn btn-danger">
                                                    <i class="fas fa-times"></i> Refuser
                                                </button>
                                            </form>
                                        </div>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            
            <c:if test="${empty demandes}">
                <div class="empty-message">
                    <i class="fas fa-inbox d-block"></i>
                    <p>Aucune demande de remboursement à traiter pour le moment.</p>
                </div>
            </c:if>
            
           <div class="text-center mt-4">
  <a href="${pageContext.request.contextPath}/adminDashboard.jsp" class="btn btn-primary btn-action">
    <i class="fas fa-home me-2"></i>Retour à l'accueil
</a>

     
</div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
