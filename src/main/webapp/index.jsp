<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Réservation de Billets de Train</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            padding-top: 50px;
        }
        .search-container {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 30px;
        }
        .search-title {
            color: #3a4a6d;
            margin-bottom: 25px;
            font-weight: 600;
        }
        .btn-search {
            background-color: #4e73df;
            border-color: #4e73df;
            padding: 10px 25px;
            font-weight: 500;
            transition: all 0.3s;
        }
        .btn-search:hover {
            background-color: #3a5ccc;
            transform: translateY(-2px);
        }
        .admin-btn {
            background-color: #36b9cc;
            border-color: #36b9cc;
            color: white;
            padding: 8px 20px;
            border-radius: 8px;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
            margin-right: 10px;
        }
        .admin-btn:hover {
            background-color: #2a9aaa;
            color: white;
        }
        .form-label {
            font-weight: 500;
            color: #4e5d78;
        }
        .form-control {
            border-radius: 8px;
            padding: 10px 15px;
            border: 1px solid #d1d9e6;
        }
        .form-control:focus {
            border-color: #4e73df;
            box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.25);
        }
        .icon-container {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }
        .train-icon {
            font-size: 48px;
            color: #4e73df;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="search-container">
                    <div class="icon-container">
                        <i class="fas fa-train train-icon"></i>
                    </div>
                    <h2 class="search-title text-center">Réservation de Billets de Train</h2>
                    
                    <form action="TrajetServlet" method="post">
                        <div class="mb-3">
                            <label for="depart" class="form-label">
                                <i class="fas fa-map-marker-alt me-2"></i>Ville de départ
                            </label>
                            <input type="text" class="form-control" id="depart" name="depart" placeholder="Entrez la ville de départ" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="arrivee" class="form-label">
                                <i class="fas fa-map-marker me-2"></i>Ville d'arrivée
                            </label>
                            <input type="text" class="form-control" id="arrivee" name="arrivee" placeholder="Entrez la ville d'arrivée" required>
                        </div>
                        
                        <div class="mb-4">
                            <label for="date" class="form-label">
                                <i class="far fa-calendar-alt me-2"></i>Date du voyage
                            </label>
                            <input type="date" class="form-control" id="date" name="date" required>
                        </div>
                        
                        <div class="d-grid">
                            <button type="submit" class="btn btn-search btn-lg">
                                <i class="fas fa-search me-2"></i>Rechercher
                            </button>
                        </div>
                    </form>
                </div>
                
                <div class="text-center">
                    <a href="EspaceUtilisateurServlet" class="admin-btn">
                        <i class="fas fa-user me-2"></i>Espace Utilisateur
                    </a>
                    
                  
                        <a href="AdminDashboardServlet" class="admin-btn" style="background-color: #1cc88a;">
                            <i class="fas fa-user-shield me-2"></i>Espace Administrateur
                        </a>
                  
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
    