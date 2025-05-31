<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion - Réservation de Billets de Train</title>
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
        .login-container {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 35px;
            width: 100%;
            max-width: 450px;
        }
        .login-title {
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
        .btn-login {
            background-color: #4e73df;
            border-color: #4e73df;
            color: white;
            padding: 12px 0;
            border-radius: 8px;
            font-weight: 500;
            width: 100%;
            transition: all 0.3s;
        }
        .btn-login:hover {
            background-color: #3a5ccc;
            transform: translateY(-2px);
        }
        .register-link {
            text-align: center;
            margin-top: 25px;
            color: #6c757d;
        }
        .register-link a {
            color: #4e73df;
            text-decoration: none;
            font-weight: 500;
        }
        .register-link a:hover {
            text-decoration: underline;
        }
        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            border-left: 4px solid #f5c6cb;
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
        .logo-container {
            text-align: center;
            margin-bottom: 25px;
        }
        .train-logo {
            font-size: 48px;
            color: #4e73df;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="logo-container">
            <i class="fas fa-train train-logo"></i>
        </div>
        <h2 class="login-title">Connexion</h2>
        
        <c:if test="${not empty erreur}">
            <div class="error-message">
                <i class="fas fa-exclamation-circle me-2"></i>${erreur}
            </div>
        </c:if>
        
        <form action="RegisterServlet" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <div class="input-group">
                    <i class="fas fa-envelope input-icon"></i>
                    <input type="email" class="form-control icon-input" id="email" name="email" placeholder="Entrez votre email" required>
                </div>
            </div>
            
            <div class="mb-4">
                <label for="motDePasse" class="form-label">Mot de passe</label>
                <div class="input-group">
                    <i class="fas fa-lock input-icon"></i>
                    <input type="password" class="form-control icon-input" id="motDePasse" name="motDePasse" placeholder="Entrez votre mot de passe" required>
                </div>
            </div>
            
            <button type="submit" class="btn btn-login">
                <i class="fas fa-sign-in-alt me-2"></i>Se connecter
            </button>
        </form>
        
        <div class="register-link">
            <p>Déjà un compte ? <a href="login.jsp">Connectez-vous ici</a></p>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

