<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier Réservation - Billets de Train</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        .modification-container {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 35px;
            width: 100%;
            max-width: 500px;
        }
        .modification-title {
            color: #3a4a6d;
            margin-bottom: 25px;
            font-weight: 600;
            text-align: center;
        }
        .form-label {
            font-weight: 500;
            color: #4e5d78;
            margin-bottom: 8px;
        }
        .form-control {
            border-radius: 8px;
            padding: 12px 15px;
            border: 1px solid #d1d9e6;
            margin-bottom: 20px;
        }
        .form-control:focus {
            border-color: #4e73df;
            box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.25);
        }
        .btn-validate {
            background-color: #1cc88a;
            border-color: #1cc88a;
            color: white;
            padding: 12px 30px;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s;
        }
        .btn-validate:hover {
            background-color: #169e6e;
            transform: translateY(-2px);
        }
        .btn-cancel {
            background-color: #e74a3b;
            border-color: #e74a3b;
            color: white;
            padding: 12px 30px;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s;
            margin-right: 10px;
        }
        .btn-cancel:hover {
            background-color: #c23b2e;
        }
        .icon-container {
            text-align: center;
            margin-bottom: 25px;
        }
        .edit-icon {
            font-size: 48px;
            color: #4e73df;
        }
        .input-group {
            position: relative;
            margin-bottom: 20px;
        }
        .input-icon {
            position: absolute;
            left: 15px;
            top: 14px;
            color: #6c757d;
        }
        .icon-input {
            padding-left: 45px;
        }
        .ticket-info {
            background-color: #f8f9fc;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 25px;
            border-left: 4px solid #4e73df;
        }
    </style>
</head>
<body>
    <div class="modification-container">
        <div class="icon-container">
            <i class="fas fa-ticket-alt edit-icon"></i>
        </div>
        <h2 class="modification-title">Modifier Réservation</h2>
        
        <div class="ticket-info">
            <p class="mb-0"><strong>Billet ID:</strong> ${billet.id}</p>
        </div>
        
        <form action="ValiderModificationServlet" method="post">
            <input type="hidden" name="billetId" value="${billet.id}" />
            
            <div class="mb-3">
                <label for="classe" class="form-label">Classe</label>
                <div class="input-group">
                    <i class="fas fa-train input-icon"></i>
                    <select class="form-control icon-input" id="classe" name="classe">
                        <option value="ECONOMIQUE" ${billet.classe == 'ECONOMIQUE' ? 'selected' : ''}>Économique</option>
                        <option value="AFFAIRE" ${billet.classe == 'AFFAIRE' ? 'selected' : ''}>Affaire</option>
                        <option value="PREMIERE" ${billet.classe == 'PREMIERE' ? 'selected' : ''}>Première</option>
                    </select>
                </div>
            </div>
            
            <div class="mb-4">
                <label for="preferences" class="form-label">Préférences</label>
                <div class="input-group">
                    <i class="fas fa-list-ul input-icon"></i>
                    <input type="text" class="form-control icon-input" id="preferences" name="preferences" value="${billet.preferences}" placeholder="Fenêtre, Couloir, etc.">
                </div>
            </div>
            
            <div class="d-flex justify-content-center">
                <a href="javascript:history.back()" class="btn btn-cancel">
                    <i class="fas fa-times me-2"></i>Annuler
                </a>
                <button type="submit" class="btn btn-validate">
                    <i class="fas fa-check me-2"></i>Valider
                </button>
            </div>
        </form>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
