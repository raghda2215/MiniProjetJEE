<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Trajets</title>
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
            max-width: 1200px;
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
        .form-container {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 25px;
            margin-bottom: 30px;
            border: 1px solid #e0e0e0;
        }
        .form-title {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 20px;
            color: var(--primary);
            display: flex;
            align-items: center;
        }
        .form-title i {
            margin-right: 8px;
        }
        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 15px;
        }
        .form-group {
            flex: 1;
            min-width: 200px;
        }
        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--dark);
        }
        .form-control {
            width: 100%;
            padding: 10px 15px;
            border: 1px solid #ced4da;
            border-radius: 6px;
            font-size: 1rem;
            transition: all 0.2s;
        }
        .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 0.2rem rgba(63, 81, 181, 0.25);
            outline: 0;
        }
        .btn {
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
            border: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
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
        .btn-danger {
            background-color: var(--danger);
            color: white;
        }
        .btn-danger:hover {
            background-color: #d32f2f;
            box-shadow: 0 2px 5px rgba(244, 67, 54, 0.3);
        }
        .btn-info {
            background-color: var(--info);
            color: white;
        }
        .btn-info:hover {
            background-color: #0b7dda;
            box-shadow: 0 2px 5px rgba(33, 150, 243, 0.3);
        }
        .btn-success {
            background-color: var(--success);
            color: white;
        }
        .btn-success:hover {
            background-color: #388e3c;
            box-shadow: 0 2px 5px rgba(76, 175, 80, 0.3);
        }
        .trajets-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-bottom: 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            border-radius: 8px;
            overflow: hidden;
        }
        .trajets-table th {
            background-color: var(--primary);
            color: white;
            padding: 15px;
            text-align: left;
            font-weight: 500;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 1px;
        }
        .trajets-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #e0e0e0;
            vertical-align: middle;
        }
        .trajets-table tr:last-child td {
            border-bottom: none;
        }
        .trajets-table tr:nth-child(even) {
            background-color: rgba(0, 0, 0, 0.02);
        }
        .trajets-table tr:hover {
            background-color: rgba(63, 81, 181, 0.05);
        }
        .price {
            font-weight: 600;
            color: var(--primary);
        }
        .places {
            font-weight: 600;
        }
        .action-buttons {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
        }
        .action-buttons form {
            margin: 0;
        }
        .action-buttons button {
            padding: 6px 12px;
            font-size: 0.85rem;
        }
        .update-places {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-top: 8px;
        }
        .update-places input {
            width: 70px;
            padding: 6px;
            border: 1px solid #ced4da;
            border-radius: 4px;
        }
        .update-places button {
            padding: 6px 10px;
            font-size: 0.85rem;
        }
        .route-info {
            display: flex;
            align-items: center;
        }
        .route-info i {
            margin: 0 8px;
            color: var(--primary);
        }
        .empty-message {
            text-align: center;
            padding: 30px;
            background-color: #f8f9fa;
            border-radius: 8px;
            color: var(--secondary);
            font-size: 1.1rem;
        }
        .empty-message i {
            font-size: 3rem;
            margin-bottom: 15px;
            color: var(--primary);
            opacity: 0.5;
        }
        @media (max-width: 992px) {
            .form-row {
                flex-direction: column;
                gap: 10px;
            }
            .trajets-table {
                display: block;
                overflow-x: auto;
            }
            .action-buttons {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="admin-container">
            <h2 class="page-title">
                <i class="fas fa-route"></i>
                Gestion des Trajets
            </h2>
            
            <div class="form-container">
                <h3 class="form-title">
                    <i class="fas fa-plus-circle"></i>
                    Ajouter un nouveau trajet
                </h3>
                
                <form method="post" action="trajets">
                    <input type="hidden" name="action" value="ajouter"/>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label" for="depart">Ville de départ</label>
                            <input type="text" id="depart" name="depart" class="form-control" required placeholder="Ex: Paris" />
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label" for="destination">Ville de destination</label>
                            <input type="text" id="destination" name="destination" class="form-control" required placeholder="Ex: Lyon" />
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label" for="date">Date</label>
                            <input type="date" id="date" name="date" class="form-control" required />
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label" for="heureDepart">Heure de départ</label>
                            <input type="time" id="heureDepart" name="heureDepart" class="form-control" required />
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label" for="heureArrivee">Heure d'arrivée</label>
                            <input type="time" id="heureArrivee" name="heureArrivee" class="form-control" required />
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label" for="prix">Prix (Dt)</label>
                            <input type="number" id="prix" step="0.01" min="0" name="prix" class="form-control" required placeholder="Ex: 25.50" />
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label" for="placesDisponibles">Places disponibles</label>
                            <input type="number" id="placesDisponibles" min="1" name="placesDisponibles" class="form-control" required placeholder="Ex: 50" />
                        </div>
                    </div>
                    
                    <div class="mt-4">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-plus"></i> Ajouter Trajet
                        </button>
                    </div>
                </form>
            </div>
            
            <c:choose>
                <c:when test="${empty trajets}">
                    <div class="empty-message">
                        <i class="fas fa-map-marked-alt d-block mb-3"></i>
                        <p>Aucun trajet n'a été trouvé dans le système.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <table class="trajets-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Trajet</th>
                                <th>Date</th>
                                <th>Horaires</th>
                                <th>Prix</th>
                                <th>Places</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="trajet" items="${trajets}">
                                <tr>
                                    <td>${trajet.id}</td>
                                    <td>
                                        <div class="route-info">
                                            <span>${trajet.villeDepart}</span>
                                            <i class="fas fa-arrow-right"></i>
                                            <span>${trajet.villeArrivee}</span>
                                        </div>
                                    </td>
                                    <td>${trajet.date}</td>
                                    <td>
                                        <div><i class="fas fa-plane-departure text-primary me-1"></i> ${trajet.heureDepart}</div>
                                        <div><i class="fas fa-plane-arrival text-success me-1"></i> ${trajet.heureArrivee}</div>
                                    </td>
                                    <td><span class="price">${trajet.prix} Dt</span></td>
                                    <td><span class="places">${trajet.placesDisponibles}</span></td>
                                    <td>
                                        <div class="action-buttons">
                                            <form method="get" action="trajets">
                                                <input type="hidden" name="action" value="modifier"/>
                                                <input type="hidden" name="id" value="${trajet.id}"/>
                                                <button type="submit" class="btn btn-info">
                                                    <i class="fas fa-edit"></i> Modifier
                                                </button>
                                            </form>
                                            
                                            <form method="post" action="trajets" onsubmit="return confirm('Êtes-vous sûr de vouloir supprimer ce trajet ?');">
                                                <input type="hidden" name="action" value="supprimer"/>
                                                <input type="hidden" name="id" value="${trajet.id}"/>
                                                <button type="submit" class="btn btn-danger">
                                                    <i class="fas fa-trash-alt"></i> Supprimer
                                                </button>
                                            </form>
                                        </div>
                                        
                                        <div class="update-places">
                                            <form method="post" action="trajets" class="d-flex align-items-center">
                                                <input type="hidden" name="action" value="majPlaces">
                                                <input type="hidden" name="id" value="${trajet.id}">
                                                <input type="number" name="placesDisponibles" value="${trajet.placesDisponibles}" min="0" class="form-control form-control-sm">
                                                <button type="submit" class="btn btn-success">
                                                    <i class="fas fa-sync-alt"></i> Mettre à jour
                                                </button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
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


