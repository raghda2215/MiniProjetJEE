<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Paiements</title>
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
        .filter-container {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
            border: 1px solid #e0e0e0;
        }
        .filter-title {
            font-size: 1.1rem;
            font-weight: 500;
            margin-bottom: 15px;
            color: var(--primary);
            display: flex;
            align-items: center;
        }
        .filter-title i {
            margin-right: 8px;
        }
        .form-control {
            border-radius: 6px;
            padding: 10px 15px;
            border: 1px solid #ced4da;
            transition: all 0.2s;
        }
        .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 0.2rem rgba(63, 81, 181, 0.25);
        }
        .form-select {
            border-radius: 6px;
            padding: 10px 15px;
            border: 1px solid #ced4da;
            transition: all 0.2s;
        }
        .form-select:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 0.2rem rgba(63, 81, 181, 0.25);
        }
        .btn {
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: 500;
            transition: all 0.2s;
            border: none;
        }
        .btn i {
            margin-right: 8px;
        }
        .btn-primary {
            background-color: var(--primary);
            color: white;
        }
        .btn-primary:hover {
            background-color: #303f9f;
            box-shadow: 0 2px 5px rgba(63, 81, 181, 0.3);
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
        .btn-warning {
            background-color: var(--warning);
            color: white;
        }
        .btn-warning:hover {
            background-color: #e68900;
            box-shadow: 0 2px 5px rgba(255, 152, 0, 0.3);
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
        .badge-success {
            background-color: var(--success);
            color: white;
        }
        .badge-warning {
            background-color: var(--warning);
            color: white;
        }
        .badge-danger {
            background-color: var(--danger);
            color: white;
        }
        .action-form {
            display: inline-block;
            margin-right: 5px;
        }
        .action-input {
            width: 100px;
            display: inline-block;
            margin-right: 5px;
        }
        .action-btn {
            padding: 5px 10px;
            font-size: 0.85rem;
        }
        .payment-id {
            font-weight: 500;
            color: var(--primary);
        }
        .payment-amount {
            font-weight: 600;
            color: var(--dark);
        }
        .payment-date {
            color: var(--secondary);
        }
        .payment-user {
            color: var(--info);
        }
        .payment-reservation {
            font-weight: 500;
        }
        @media (max-width: 992px) {
            .table-responsive {
                border-radius: 8px;
                overflow: hidden;
            }
            .action-form {
                margin-bottom: 5px;
            }
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="admin-container">
            <h2 class="page-title">
                <i class="fas fa-money-bill-wave"></i>
                Gestion des Paiements
            </h2>
            
            <!-- Formulaire de filtrage -->
            <div class="filter-container">
                <div class="filter-title">
                    <i class="fas fa-filter"></i>
                    Filtrer les paiements
                </div>
                <form method="get" action="admin/paiements" class="row g-3 align-items-end">
                    <div class="col-md-5">
                        <label for="email" class="form-label">Email utilisateur</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                            <input type="text" name="email" id="email" value="${param.email}" class="form-control" placeholder="Rechercher par email..."/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label for="statut" class="form-label">Statut</label>
                        <select name="statut" id="statut" class="form-select">
                            <option value="">-- Tous les statuts --</option>
                            <option value="payé" ${param.statut == 'payé' ? 'selected' : ''}>Payé</option>
                            <option value="vérifié" ${param.statut == 'vérifié' ? 'selected' : ''}>Vérifié</option>
                            <option value="annulé" ${param.statut == 'annulé' ? 'selected' : ''}>Annulé</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <button type="submit" class="btn btn-primary w-100">
                            <i class="fas fa-search"></i> Filtrer
                        </button>
                    </div>
                </form>
            </div>

            <!-- Tableau des paiements -->
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Utilisateur</th>
                            <th>Date</th>
                            <th>Montant</th>
                            <th>Statut</th>
                            <th>Réservation</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${paiements}" var="p">
                            <tr>
                                <td class="payment-id">#${p.id}</td>
                                <td class="payment-user">
                                    <i class="fas fa-user me-1"></i> ${p.utilisateur.email}
                                </td>
                                <td class="payment-date">
                                    <i class="far fa-calendar-alt me-1"></i> ${p.datePaiement}
                                </td>
                                <td class="payment-amount">
                                    <i class="fas fa-euro-sign me-1"></i> ${p.montant} €
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${p.statut == 'payé'}">
                                            <span class="badge badge-warning">
                                                <i class="fas fa-clock me-1"></i> Payé
                                            </span>
                                        </c:when>
                                        <c:when test="${p.statut == 'vérifié'}">
                                            <span class="badge badge-success">
                                                <i class="fas fa-check me-1"></i> Vérifié
                                            </span>
                                        </c:when>
                                        <c:when test="${p.statut == 'annulé'}">
                                            <span class="badge badge-danger">
                                                <i class="fas fa-times me-1"></i> Annulé
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-secondary">
                                                ${p.statut}
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="payment-reservation">
                                    <i class="fas fa-ticket-alt me-1"></i> #${p.reservation.id}
                                </td>
                                <td>
                                    <div class="d-flex flex-wrap gap-1">
                                        <form method="post" action="paiements" class="action-form">
                                            <input type="hidden" name="action" value="verifier"/>
                                            <input type="hidden" name="id" value="${p.id}"/>
                                            <button type="submit" class="btn btn-success action-btn">
                                                <i class="fas fa-check"></i> Vérifier
                                            </button>
                                        </form>
                                        <form method="post" action="paiements" class="action-form">
                                            <input type="hidden" name="action" value="annuler"/>
                                            <input type="hidden" name="id" value="${p.id}"/>
                                            <button type="submit" class="btn btn-danger action-btn">
                                                <i class="fas fa-ban"></i> Annuler
                                            </button>
                                        </form>
                                        <form method="post" action="paiements" class="action-form d-flex">
                                            <input type="hidden" name="action" value="modifierMontant"/>
                                            <input type="hidden" name="id" value="${p.id}"/>
                                            <input type="number" step="0.01" name="montant" placeholder="Montant" required class="form-control action-input"/>
                                            <button type="submit" class="btn btn-warning action-btn">
                                                <i class="fas fa-edit"></i> Modifier
                                            </button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            
            <c:if test="${empty paiements}">
                <div class="alert alert-info mt-4 text-center">
                    <i class="fas fa-info-circle me-2"></i>
                    Aucun paiement ne correspond aux critères de recherche.
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



