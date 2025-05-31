<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Options de voyage</title>
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
        .options-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin: 40px auto;
            max-width: 800px;
        }
        .page-title {
            color: var(--primary);
            font-weight: 600;
            margin-bottom: 25px;
            text-align: center;
        }
        .journey-info {
            background-color: var(--light);
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
            border-left: 5px solid var(--primary);
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .journey-info p {
            margin: 0;
            font-size: 1.2rem;
            font-weight: 500;
            color: var(--dark);
        }
        .journey-icon {
            margin: 0 15px;
            color: var(--primary);
        }
        .form-section {
            margin-bottom: 30px;
        }
        .section-title {
            font-size: 1.1rem;
            font-weight: 500;
            margin-bottom: 15px;
            color: var(--primary);
            display: flex;
            align-items: center;
        }
        .section-title i {
            margin-right: 10px;
        }
        .form-select {
            border-radius: 6px;
            padding: 12px 15px;
            border: 1px solid #ced4da;
            transition: all 0.2s;
            margin-bottom: 20px;
        }
        .form-select:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 0.2rem rgba(63, 81, 181, 0.25);
        }
        .preferences-container {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 20px;
        }
        .preference-item {
            flex: 1;
            min-width: 200px;
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 15px;
            border: 1px solid #e0e0e0;
            transition: all 0.2s;
        }
        .preference-item:hover {
            border-color: var(--primary);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .form-check-input {
            width: 20px;
            height: 20px;
            margin-right: 10px;
            cursor: pointer;
        }
        .form-check-input:checked {
            background-color: var(--primary);
            border-color: var(--primary);
        }
        .form-check-label {
            font-weight: 500;
            cursor: pointer;
            display: flex;
            align-items: center;
        }
        .form-check-label i {
            margin-right: 10px;
            font-size: 1.2rem;
            color: var(--primary);
        }
        .btn-confirm {
            background-color: var(--primary);
            color: white;
            padding: 12px 25px;
            border-radius: 6px;
            font-weight: 500;
            font-size: 1.1rem;
            transition: all 0.2s;
            border: none;
            width: 100%;
        }
        .btn-confirm:hover {
            background-color: #303f9f;
            box-shadow: 0 4px 8px rgba(63, 81, 181, 0.3);
            transform: translateY(-2px);
        }
        .btn-confirm i {
            margin-right: 10px;
        }
        @media (max-width: 768px) {
            .preferences-container {
                flex-direction: column;
            }
            .preference-item {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="options-container">
            <h2 class="page-title">Sélection des options pour votre voyage</h2>
            
            <div class="journey-info">
                <i class="fas fa-map-marker-alt journey-icon"></i>
                <p>${trajet.villeDepart}</p>
                <i class="fas fa-arrow-right journey-icon"></i>
                <p>${trajet.villeArrivee}</p>
                <i class="fas fa-calendar-alt journey-icon"></i>
                <p>${trajet.date}</p>
            </div>
            
            <form action="ConfirmationServlet" method="post">
                <input type="hidden" name="trajetId" value="${trajet.id}" />
                
                <div class="form-section">
                    <div class="section-title">
                        <i class="fas fa-ticket-alt"></i>
                        Classe de voyage
                    </div>
                    <select name="classe" class="form-select">
                        <option value="1ère">1ère classe - Confort premium</option>
                        <option value="2ème">2ème classe - Confort standard</option>
                        <option value="Économique">Économique - Tarif réduit</option>
                    </select>
                </div>
                
                <div class="form-section">
                    <div class="section-title">
                        <i class="fas fa-sliders-h"></i>
                        Préférences de voyage
                    </div>
                    <div class="preferences-container">
                        <div class="preference-item">
                            <label class="form-check-label">
                                <input class="form-check-input" type="checkbox" name="preferences" value="Fenêtre" />
                                <i class="fas fa-window-maximize"></i>
                                Côté fenêtre
                            </label>
                        </div>
                        <div class="preference-item">
                            <label class="form-check-label">
                                <input class="form-check-input" type="checkbox" name="preferences" value="Famille" />
                                <i class="fas fa-users"></i>
                                Espace famille
                            </label>
                        </div>
                        <div class="preference-item">
                            <label class="form-check-label">
                                <input class="form-check-input" type="checkbox" name="preferences" value="Non-fumeur" checked />
                                <i class="fas fa-smoking-ban"></i>
                                Wagon non-fumeur
                            </label>
                        </div>
                    </div>
                </div>
                
                <button type="submit" class="btn-confirm">
                    <i class="fas fa-check-circle"></i>
                    Confirmer la réservation
                </button>
            </form>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>