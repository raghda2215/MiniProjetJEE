<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Gares</title>
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
            margin-bottom: 30px;
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
        .stations-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-bottom: 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            border-radius: 8px;
            overflow: hidden;
        }
        .stations-table th {
            background-color: var(--primary);
            color: white;
            padding: 15px;
            text-align: left;
            font-weight: 500;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 1px;
        }
        .stations-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #e0e0e0;
            vertical-align: middle;
        }
        .stations-table tr:last-child td {
            border-bottom: none;
        }
        .stations-table tr:nth-child(even) {
            background-color: rgba(0, 0, 0, 0.02);
        }
        .stations-table tr:hover {
            background-color: rgba(63, 81, 181, 0.05);
        }
        .action-cell {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }
        .btn-action {
            padding: 6px 12px;
            border-radius: 4px;
            font-size: 0.85rem;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s;
            text-decoration: none;
            border: none;
            cursor: pointer;
        }
        .btn-action i {
            margin-right: 5px;
        }
        .btn-delete {
            background-color: var(--danger);
            color: white;
        }
        .btn-delete:hover {
            background-color: #d32f2f;
            box-shadow: 0 2px 5px rgba(244, 67, 54, 0.3);
        }
        .btn-edit {
            background-color: var(--info);
            color: white;
        }
        .btn-edit:hover {
            background-color: #1976d2;
            box-shadow: 0 2px 5px rgba(33, 150, 243, 0.3);
        }
        .add-form-container {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 25px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }
        .form-title {
            color: var(--dark);
            font-weight: 600;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }
        .form-title i {
            margin-right: 10px;
            color: var(--primary);
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
            padding: 10px 15px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            font-size: 1rem;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }
        .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 0.2rem rgba(63, 81, 181, 0.25);
            outline: 0;
        }
        .btn-submit {
            background-color: var(--primary);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
            display: inline-flex;
            align-items: center;
        }
        .btn-submit:hover {
            background-color: #303f9f;
            box-shadow: 0 2px 5px rgba(63, 81, 181, 0.3);
        }
        .btn-submit i {
            margin-right: 8px;
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
        @media (max-width: 768px) {
            .stations-table {
                display: block;
                overflow-x: auto;
            }
            .action-cell {
                flex-direction: column;
                gap: 5px;
            }
            .admin-container {
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
                Liste des gares
            </h2>
            
            <c:choose>
                <c:when test="${empty gares}">
                    <div class="empty-message">
                        <i class="fas fa-search d-block mb-3"></i>
                        <p>Aucune gare n'a été trouvée dans le système.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <table class="stations-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nom</th>
                                <th>Ville</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="gare" items="${gares}">
                                <tr>
                                    <td>${gare.id}</td>
                                    <td><strong>${gare.nom}</strong></td>
                                    <td>${gare.ville}</td>
                                    <td class="action-cell">
                                        <form method="post" action="gares" style="display:inline;">
                                            <input type="hidden" name="id" value="${gare.id}" />
                                            <input type="hidden" name="action" value="supprimer" />
                                            <button type="submit" class="btn-action btn-delete">
                                                <i class="fas fa-trash-alt"></i> Supprimer
                                            </button>
                                        </form>
                                        <a href="gares?action=modifier&id=${gare.id}" class="btn-action btn-edit">
                                            <i class="fas fa-edit"></i> Modifier
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
            
            <div class="add-form-container">
                <h3 class="form-title">
                    <i class="fas fa-plus-circle"></i>
                    Ajouter une gare
                </h3>
                <form method="post" action="gares">
                    <input type="hidden" name="action" value="ajouter" />
                    <div class="form-group">
                        <label for="nom" class="form-label">Nom de la gare</label>
                        <input type="text" id="nom" name="nom" class="form-control" required />
                    </div>
                    <div class="form-group">
                        <label for="ville" class="form-label">Ville</label>
                        <input type="text" id="ville" name="ville" class="form-control" required />
                    </div>
                    <button type="submit" class="btn-submit">
                        <i class="fas fa-save"></i> Ajouter
                    </button>
                </form>
            </div>
            <!-- 🔽 Bouton de retour à l'accueil -->
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