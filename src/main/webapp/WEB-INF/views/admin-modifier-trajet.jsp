<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier un Trajet</title>
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
            max-width: 800px;
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
        .form-group {
            margin-bottom: 20px;
        }
        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
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
        .btn {
            padding: 12px 24px;
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
        .btn-secondary {
            background-color: var(--secondary);
            color: white;
        }
        .btn-secondary:hover {
            background-color: #5a6268;
            box-shadow: 0 2px 5px rgba(108, 117, 125, 0.3);
        }
        .action-buttons {
            display: flex;
            gap: 15px;
            margin-top: 10px;
        }
        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 10px;
        }
        .form-col {
            flex: 1;
            min-width: 250px;
        }
        .field-icon {
            font-size: 1.2rem;
            color: var(--primary);
            margin-right: 8px;
        }
        .form-hint {
            display: block;
            font-size: 0.8rem;
            color: var(--secondary);
            margin-top: 5px;
        }
        @media (max-width: 768px) {
            .admin-container {
                padding: 20px;
            }
            .form-row {
                flex-direction: column;
                gap: 0;
            }
            .action-buttons {
                flex-direction: column;
                gap: 10px;
            }
            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="admin-container">
            <h2 class="page-title">
                <i class="fas fa-route"></i>
                Modifier un Trajet
            </h2>
            
            <div class="form-container">
                <form method="post" action="trajets">
                    <input type="hidden" name="action" value="modifier" />
                    <input type="hidden" name="id" value="${trajet.id}" />
                    
                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label class="form-label" for="depart">
                                    <i class="fas fa-map-marker-alt field-icon"></i>Gare de départ
                                </label>
                                <input type="text" id="depart" name="depart" value="${trajet.villeDepart}" class="form-control" required placeholder="Ville de départ" />
                            </div>
                        </div>
                        
                        <div class="form-col">
                            <div class="form-group">
                                <label class="form-label" for="destination">
                                    <i class="fas fa-map-pin field-icon"></i>Gare d'arrivée
                                </label>
                                <input type="text" id="destination" name="destination" value="${trajet.villeArrivee}" class="form-control" required placeholder="Ville d'arrivée" />
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label class="form-label" for="date">
                                    <i class="far fa-calendar-alt field-icon"></i>Date du trajet
                                </label>
                                <input type="date" id="date" name="date" value="${trajet.date}" class="form-control" required />
                                <span class="form-hint">Format: AAAA-MM-JJ</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label class="form-label" for="heureDepart">
                                    <i class="far fa-clock field-icon"></i>Heure de départ
                                </label>
                                <input type="time" id="heureDepart" name="heureDepart" value="${trajet.heureDepart}" class="form-control" required />
                                <span class="form-hint">Format: HH:MM</span>
                            </div>
                        </div>
                        
                        <div class="form-col">
                            <div class="form-group">
                                <label class="form-label" for="heureArrivee">
                                    <i class="far fa-clock field-icon"></i>Heure d'arrivée
                                </label>
                                <input type="time" id="heureArrivee" name="heureArrivee" value="${trajet.heureArrivee}" class="form-control" required />
                                <span class="form-hint">Format: HH:MM</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label class="form-label" for="prix">
                                    <i class="fas fa-euro-sign field-icon"></i>Prix du billet
                                </label>
                                <input type="number" id="prix" name="prix" value="${trajet.prix}" step="0.01" min="0" class="form-control" required placeholder="0.00" />
                            </div>
                        </div>
                        
                        <div class="form-col">
                            <div class="form-group">
                                <label class="form-label" for="placesDisponibles">
                                    <i class="fas fa-chair field-icon"></i>Places disponibles
                                </label>
                                <input type="number" id="placesDisponibles" name="placesDisponibles" value="${trajet.placesDisponibles}" min="0" class="form-control" required placeholder="0" />
                            </div>
                        </div>
                    </div>
                    
                    <div class="action-buttons">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i> Enregistrer les modifications
                        </button>
                        <a href="trajets" class="btn btn-secondary">
                            <i class="fas fa-arrow-left"></i> Retour à la liste
                        </a>
                    </div>
                </form>
            </div>
            
            <div class="text-center text-muted mt-4">
                <small>ID du trajet: ${trajet.id}</small>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
