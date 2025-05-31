<%@ page contentType="text/html;charset=UTF-8" %>
<%
    com.trainapp.model.Utilisateur utilisateur = (com.trainapp.model.Utilisateur) session.getAttribute("utilisateur");
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Paiement - Réservation de Train</title>
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
        .payment-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin: 40px auto;
            max-width: 600px;
        }
        .page-title {
            color: var(--primary);
            font-weight: 600;
            margin-bottom: 25px;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .page-title i {
            margin-right: 15px;
            font-size: 2rem;
        }
        .welcome-message {
            background-color: var(--light);
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
            border-left: 5px solid var(--primary);
            font-size: 1.1rem;
        }
        .welcome-message strong {
            color: var(--primary);
            font-weight: 600;
        }
        .payment-summary {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
        }
        .summary-title {
            font-size: 1.2rem;
            font-weight: 500;
            margin-bottom: 15px;
            color: var(--dark);
            display: flex;
            align-items: center;
        }
        .summary-title i {
            margin-right: 10px;
            color: var(--primary);
        }
        .summary-item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #e0e0e0;
        }
        .summary-item:last-child {
            border-bottom: none;
        }
        .summary-label {
            color: var(--secondary);
        }
        .summary-value {
            font-weight: 500;
        }
        .total-row {
            font-weight: 700;
            font-size: 1.1rem;
            margin-top: 10px;
            padding-top: 10px;
            border-top: 2px solid #e0e0e0;
        }
        .payment-methods {
            margin-bottom: 30px;
        }
        .payment-method-title {
            font-size: 1.1rem;
            font-weight: 500;
            margin-bottom: 15px;
            color: var(--primary);
            display: flex;
            align-items: center;
        }
        .payment-method-title i {
            margin-right: 10px;
        }
        .payment-cards {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }
        .payment-card {
            width: 60px;
            height: 40px;
            background-color: #f8f9fa;
            border-radius: 6px;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #e0e0e0;
        }
        .payment-card img {
            max-width: 80%;
            max-height: 80%;
        }
        .btn-pay {
            background-color: var(--primary);
            color: white;
            padding: 15px 25px;
            border-radius: 6px;
            font-weight: 500;
            font-size: 1.1rem;
            transition: all 0.2s;
            border: none;
            width: 100%;
            margin-top: 20px;
        }
        .btn-pay:hover {
            background-color: #303f9f;
            box-shadow: 0 4px 8px rgba(63, 81, 181, 0.3);
            transform: translateY(-2px);
        }
        .btn-pay i {
            margin-right: 10px;
        }
        .secure-badge {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 20px;
            color: var(--secondary);
            font-size: 0.9rem;
        }
        .secure-badge i {
            margin-right: 8px;
            color: var(--success);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="payment-container">
            <h2 class="page-title">
                <i class="fas fa-credit-card"></i>
                Paiement
            </h2>
            
            <div class="welcome-message">
                <p>Bonjour, <strong><%= utilisateur.getNom() %></strong>. Veuillez confirmer les détails de votre achat avant de procéder au paiement.</p>
            </div>
            
            <div class="payment-summary">
                <div class="summary-title">
                    <i class="fas fa-receipt"></i>
                    Récapitulatif de votre commande
                </div>
                <div class="summary-item">
                    <span class="summary-label">Trajet</span>
                    <span class="summary-value">Paris - Lyon</span>
                </div>
                <div class="summary-item">
                    <span class="summary-label">Date</span>
                    <span class="summary-value">15 Juin 2023</span>
                </div>
                <div class="summary-item">
                    <span class="summary-label">Classe</span>
                    <span class="summary-value">1ère classe</span>
                </div>
                <div class="summary-item">
                    <span class="summary-label">Passager(s)</span>
                    <span class="summary-value">1</span>
                </div>
                <div class="summary-item total-row">
                    <span class="summary-label">Total</span>
                    <span class="summary-value">75,00 €</span>
                </div>
            </div>
            
            <div class="payment-methods">
                <div class="payment-method-title">
                    <i class="fas fa-wallet"></i>
                    Méthodes de paiement acceptées
                </div>
                <div class="payment-cards">
                    <div class="payment-card">
                        <i class="fab fa-cc-visa fa-2x" style="color: #1a1f71;"></i>
                    </div>
                    <div class="payment-card">
                        <i class="fab fa-cc-mastercard fa-2x" style="color: #eb001b;"></i>
                    </div>
                    <div class="payment-card">
                        <i class="fab fa-cc-amex fa-2x" style="color: #006fcf;"></i>
                    </div>
                    <div class="payment-card">
                        <i class="fab fa-cc-paypal fa-2x" style="color: #003087;"></i>
                    </div>
                </div>
            </div>
            
            <form action="PaiementServlet" method="post">
                <button type="submit" class="btn-pay">
                    <i class="fas fa-lock"></i>
                    Payer et Finaliser (75,00 €)
                </button>
            </form>
            
            <div class="secure-badge">
                <i class="fas fa-shield-alt"></i>
                Paiement sécurisé - Vos données sont protégées
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>