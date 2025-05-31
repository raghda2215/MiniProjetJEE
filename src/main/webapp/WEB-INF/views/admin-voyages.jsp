<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Voyages - Administration</title>
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
            max-width: 1200px;
        }
        .page-title {
            color: var(--primary);
            font-weight: 600;
            margin-bottom: 25px;
            display: flex;
            align-items: center;
        }
        .page-title i {
            margin-right: 15px;
            font-size: 1.8rem;
        }
        .section-title {
            color: var(--dark);
            font-weight: 500;
            margin: 30px 0 20px 0;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--light);
            display: flex;
            align-items: center;
        }
        .section-title i {
            margin-right: 10px;
            color: var(--primary);
        }
        .table-responsive {
            margin-bottom: 30px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
        }
        .table {
            margin-bottom: 0;
        }
        .table thead {
            background-color: var(--primary);
            color: white;
        }
        .table th {
            font-weight: 500;
            padding: 12px 15px;
            border: none;
        }
        .table td {
            padding: 12px 15px;
            vertical-align: middle;
            border-color: #e0e0e0;
        }
        .table tbody tr:hover {
            background-color: rgba(63, 81, 181, 0.05);
        }
        .badge {
            padding: 6px 10px;
            font-weight: 500;
            border-radius: 4px;
        }
        .badge-success {
            background-color: #e8f5e9;
            color: var(--success);
        }
        .badge-warning {
            background-color: #fff3e0;
            color: var(--warning);
        }
        .badge-danger {
            background-color: #ffebee;
            color: var(--danger);
        }
        .btn-action {
            padding: 6px 12px;
            border-radius: 4px;
            font-weight: 500;
            font-size: 0.9rem;
            margin-right: 5px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s;
            text-decoration: none;
        }
        .btn-action i {
            margin-right: 5px;
        }
        .btn-edit {
            background-color: #e3f2fd;
            color: var(--info);
            border: 1px solid #bbdefb;
        }
        .btn-edit:hover {
            background-color: #bbdefb;
            color: #0d47a1;
        }
        .btn-delete {
            background-color: #ffebee;
            color: var(--danger);
            border: 1px solid #ffcdd2;
        }
        .btn-delete:hover {
            background-color: #ffcdd2;
            color: #b71c1c;
        }
        .form-container {
            background-color: var(--light);
            border-radius: 8px;
            padding: 25px;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-label {
            font-weight: 500;
            margin-bottom: 8px;
            color: var(--dark);
        }
        .form-control {
            padding: 10px 15px;
            border-radius: 6px;
            border: 1px solid #ced4da;
            transition: all 0.2s;
        }
        .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 0.2rem rgba(63, 81, 181, 0.25);
        }
        .btn-submit {
            background-color: var(--primary);
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: 500;
            transition: all 0.2s;
            border: none;
        }
        .btn-submit:hover {
            background-color: #303f9f;
            box-shadow: 0 4px 8px rgba(63, 81, 181, 0.3);
        }
        .btn-submit i {
            margin-right: 8px;
        }
        .route-badge {
            display: inline-flex;
            align-items: center;
            background-color: #e8eaf6;
            color: var(--primary);
            padding: 6px 12px;
            border-radius: 20px;
            font-weight: 500;
        }
        .route-badge i {
            margin: 0 8px;
        }
        @media (max-width: 768px) {
            .table-responsive {
                overflow-x: auto;
            }
            .form-container {
                padding: 15px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="admin-container">
            <h2 class="page-title">
                <i class="fas fa-train"></i>
                Gestion des Voyages
            </h2>
           
            <h3 class="section-title">
                <i class="fas fa-list"></i>
                Liste des voyages
            </h3>
           
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Trajet</th>
                            <th>Date</th>
                            <th>Heure Départ</th>
                            <th>Places</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${voyages}" var="v">
                            <tr>
                                <td>${v.id}</td>
                                <td>
                                    <span class="route-badge">
                                        ${v.trajet.villeDepart}
                                        <i class="fas fa-arrow-right"></i>
                                        ${v.trajet.villeArrivee}
                                    </span>
                                </td>
                                <td>${v.date}</td>
                                <td>${v.heureDepart}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${v.placesDisponibles > 20}">
                                            <span class="badge badge-success">
                                                <i class="fas fa-check-circle"></i>
                                                ${v.placesDisponibles} places
                                            </span>
                                        </c:when>
                                        <c:when test="${v.placesDisponibles > 5}">
                                            <span class="badge badge-warning">
                                                <i class="fas fa-exclamation-circle"></i>
                                                ${v.placesDisponibles} places
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-danger">
                                                <i class="fas fa-exclamation-triangle"></i>
                                                ${v.placesDisponibles} places
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <a href="voyages?action=modifier&id=${v.id}" class="btn-action btn-edit">
                                        <i class="fas fa-edit"></i>
                                        Modifier
                                    </a>
                                    <form action="voyages" method="post" style="display:inline;">
                                        <input type="hidden" name="action" value="supprimer">
                                        <input type="hidden" name="id" value="${v.id}">
                                        <button type="submit" class="btn-action btn-delete" onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce voyage?')">
                                            <i class="fas fa-trash-alt"></i>
                                            Supprimer
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
           
            <h3 class="section-title">
                <i class="fas fa-plus-circle"></i>
                Ajouter un voyage
            </h3>
           
            <div class="form-container">
                <form action="voyages" method="post">
                    <input type="hidden" name="action" value="ajouter">
                   
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="date" class="form-label">Date du voyage</label>
                                <input type="date" id="date" name="date" class="form-control" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="heureDepart" class="form-label">Heure de départ</label>
                                <input type="time" id="heureDepart" name="heureDepart" class="form-control" required>
                            </div>
                        </div>
                    </div>
                   
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="placesDisponibles" class="form-label">Places disponibles</label>
                                <input type="number" id="placesDisponibles" name="placesDisponibles" class="form-control" min="1" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="trajetId" class="form-label">Trajet</label>
                                <select id="trajetId" name="trajetId" class="form-control" required>
                                    <option value="">Sélectionnez un trajet</option>
                                    <c:forEach items="${trajets}" var="t">
                                        <option value="${t.id}">${t.villeDepart} → ${t.villeArrivee}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                   
                    <div class="text-end">
                        <button type="submit" class="btn-submit">
                            <i class="fas fa-plus"></i>
                            Ajouter le voyage
                        </button>
                    </div>
                </form>
            </div>
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
