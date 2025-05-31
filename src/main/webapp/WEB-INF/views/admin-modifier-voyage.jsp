<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier un Voyage</title>
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
        .edit-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            max-width: 700px;
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
        .form-group {
            margin-bottom: 20px;
        }
        .form-label {
            font-weight: 500;
            margin-bottom: 8px;
            display: block;
            color: var(--dark);
        }
        .form-control {
            width: 100%;
            padding: 12px 15px;
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
        .btn-container {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }
        .btn {
            padding: 12px 20px;
            border-radius: 6px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border: none;
            text-decoration: none;
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
        .btn-secondary {
            background-color: var(--secondary);
            color: white;
        }
        .btn-secondary:hover {
            background-color: #5a6268;
            box-shadow: 0 2px 5px rgba(108, 117, 125, 0.3);
        }
        .form-header {
            margin-bottom: 30px;
        }
        .voyage-id {
            font-size: 0.9rem;
            color: var(--secondary);
            margin-top: 5px;
        }
        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 10px;
        }
        .form-col {
            flex: 1;
            min-width: 200px;
        }
        @media (max-width: 768px) {
            .edit-container {
                padding: 20px;
                margin: 20px auto;
            }
            .btn-container {
                flex-direction: column;
            }
            .form-row {
                flex-direction: column;
                gap: 0;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="edit-container">
            <h2 class="page-title">
                <i class="fas fa-edit"></i>
                Modification du voyage
            </h2>
            
            <div class="form-header">
                <div class="voyage-id">ID du voyage: ${voyage.id}</div>
            </div>
            
            <form method="post" action="voyages">
                <input type="hidden" name="action" value="modifier"/>
                <input type="hidden" name="id" value="${voyage.id}"/>
                
                <div class="form-group">
                    <label for="trajetId" class="form-label">Trajet</label>
                    <select id="trajetId" name="trajetId" class="form-control" required>
                        <c:forEach var="t" items="${listeTrajets}">
                            <option value="${t.id}" ${t.id == voyage.trajet.id ? 'selected' : ''}>
                                ${t.villeDepart} <i class="fas fa-arrow-right"></i> ${t.villeArrivee}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                
                <div class="form-row">
                    <div class="form-col">
                        <div class="form-group">
                            <label for="date" class="form-label">Date</label>
                            <input type="date" id="date" name="date" value="${voyage.date}" class="form-control" required/>
                        </div>
                    </div>
                    <div class="form-col">
                        <div class="form-group">
                            <label for="heureDepart" class="form-label">Heure de départ</label>
                            <input type="time" id="heureDepart" name="heureDepart" value="${voyage.heureDepart}" class="form-control" required/>
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="placesDisponibles" class="form-label">Nombre de places disponibles</label>
                    <input type="number" id="placesDisponibles" name="placesDisponibles" value="${voyage.placesDisponibles}" min="1" class="form-control" required/>
                </div>
                
                <div class="btn-container">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Enregistrer les modifications
                    </button>
                    <a href="voyages" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i> Retour
                    </a>
                </div>
            </form>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>