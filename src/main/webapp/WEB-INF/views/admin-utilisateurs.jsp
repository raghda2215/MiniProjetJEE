<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Utilisateurs</title>
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
            max-width: 1000px;
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
        .users-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-bottom: 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            border-radius: 8px;
            overflow: hidden;
        }
        .users-table th {
            background-color: var(--primary);
            color: white;
            padding: 15px;
            text-align: left;
            font-weight: 500;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 1px;
        }
        .users-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #e0e0e0;
            vertical-align: middle;
        }
        .users-table tr:last-child td {
            border-bottom: none;
        }
        .users-table tr:nth-child(even) {
            background-color: rgba(0, 0, 0, 0.02);
        }
        .users-table tr:hover {
            background-color: rgba(63, 81, 181, 0.05);
        }
        .status-badge {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 20px;
            font-weight: 500;
            font-size: 0.85rem;
            text-align: center;
        }
        .status-active {
            background-color: rgba(76, 175, 80, 0.1);
            color: var(--success);
            border: 1px solid rgba(76, 175, 80, 0.2);
        }
        .status-blocked {
            background-color: rgba(244, 67, 54, 0.1);
            color: var(--danger);
            border: 1px solid rgba(244, 67, 54, 0.2);
        }
        .btn-action {
            padding: 8px 16px;
            border-radius: 6px;
            font-weight: 500;
            font-size: 0.9rem;
            cursor: pointer;
            transition: all 0.2s;
            border: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        .btn-action i {
            margin-right: 6px;
        }
        .btn-block {
            background-color: var(--danger);
            color: white;
        }
        .btn-block:hover {
            background-color: #d32f2f;
            box-shadow: 0 2px 5px rgba(244, 67, 54, 0.3);
        }
        .btn-unblock {
            background-color: var(--success);
            color: white;
        }
        .btn-unblock:hover {
            background-color: #388e3c;
            box-shadow: 0 2px 5px rgba(76, 175, 80, 0.3);
        }
        .user-email {
            display: flex;
            align-items: center;
        }
        .user-email i {
            margin-right: 8px;
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
        @media (max-width: 768px) {
            .users-table {
                display: block;
                overflow-x: auto;
            }
            .admin-container {
                padding: 15px;
                margin: 20px auto;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="admin-container">
            <h2 class="page-title">
                <i class="fas fa-users"></i>
                Liste des utilisateurs
            </h2>
            
            <c:choose>
                <c:when test="${empty utilisateurs}">
                    <div class="empty-message">
                        <i class="fas fa-user-slash d-block mb-3"></i>
                        <p>Aucun utilisateur n'a été trouvé dans le système.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <table class="users-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Email</th>
                                <th>Statut</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="u" items="${utilisateurs}">
                                <tr>
                                    <td>${u.id}</td>
                                    <td>
                                        <div class="user-email">
                                            <i class="fas fa-envelope"></i>
                                            ${u.email}
                                        </div>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${u.bloque}">
                                                <span class="status-badge status-blocked">
                                                    <i class="fas fa-ban"></i> Bloqué
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="status-badge status-active">
                                                    <i class="fas fa-check-circle"></i> Actif
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <form method="post" action="utilisateurs">
                                            <input type="hidden" name="id" value="${u.id}">
                                            <input type="hidden" name="bloque" value="${!u.bloque}">
                                            <c:choose>
                                                <c:when test="${u.bloque}">
                                                    <button type="submit" class="btn-action btn-unblock">
                                                        <i class="fas fa-unlock"></i> Débloquer
                                                    </button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button type="submit" class="btn-action btn-block">
                                                        <i class="fas fa-lock"></i> Bloquer
                                                    </button>
                                                </c:otherwise>
                                            </c:choose>
                                        </form>
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
