<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau de bord Administrateur</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary: #4e73df;
            --secondary: #858796;
            --success: #1cc88a;
            --info: #36b9cc;
            --warning: #f6c23e;
            --danger: #e74a3b;
            --light: #f8f9fc;
            --dark: #5a5c69;
        }
        body {
            background-color: var(--light);
            font-family: 'Nunito', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
        }
        .admin-sidebar {
            min-height: 100vh;
            background: linear-gradient(180deg, var(--primary) 10%, #224abe 100%);
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
            z-index: 1;
            position: fixed;
            width: 250px;
        }
        .sidebar-brand {
            height: 4.375rem;
            text-decoration: none;
            font-size: 1.2rem;
            font-weight: 800;
            padding: 1.5rem 1rem;
            text-align: center;
            letter-spacing: 0.05rem;
            color: white;
            display: block;
        }
        .sidebar-divider {
            margin: 0 1rem 1rem;
            border-top: 1px solid rgba(255, 255, 255, 0.15);
        }
        .nav-item {
            position: relative;
        }
        .nav-link {
            display: block;
            padding: 0.75rem 1rem;
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            transition: all 0.3s;
            border-radius: 0.35rem;
            margin: 0 0.5rem;
        }
        .nav-link:hover {
            color: white;
            background-color: rgba(255, 255, 255, 0.1);
        }
        .nav-link.active {
            color: white;
            background-color: rgba(255, 255, 255, 0.2);
        }
        .nav-link i {
            margin-right: 0.5rem;
            opacity: 0.75;
            width: 1.5rem;
            text-align: center;
        }
        .content-wrapper {
            margin-left: 250px;
            padding: 1.5rem;
        }
        .dashboard-header {
            margin-bottom: 1.5rem;
            background-color: white;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
            border-radius: 0.35rem;
            padding: 1.5rem;
        }
        .dashboard-title {
            color: var(--dark);
            font-weight: 700;
            margin-bottom: 0;
        }
        .card-dashboard {
            border: none;
            border-radius: 0.35rem;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
            margin-bottom: 1.5rem;
            transition: all 0.3s;
        }
        .card-dashboard:hover {
            transform: translateY(-5px);
        }
        .card-dashboard .card-body {
            padding: 1.25rem;
        }
        .card-dashboard .card-title {
            font-size: 0.9rem;
            font-weight: 700;
            text-transform: uppercase;
            margin-bottom: 1rem;
            color: var(--secondary);
        }
        .card-dashboard .card-icon {
            font-size: 2rem;
            margin-bottom: 1rem;
        }
        .card-dashboard.primary {
            border-left: 0.25rem solid var(--primary);
        }
        .card-dashboard.primary .card-icon {
            color: var(--primary);
        }
        .card-dashboard.success {
            border-left: 0.25rem solid var(--success);
        }
        .card-dashboard.success .card-icon {
            color: var(--success);
        }
        .card-dashboard.info {
            border-left: 0.25rem solid var(--info);
        }
        .card-dashboard.info .card-icon {
            color: var(--info);
        }
        .card-dashboard.warning {
            border-left: 0.25rem solid var(--warning);
        }
        .card-dashboard.warning .card-icon {
            color: var(--warning);
        }
        .card-dashboard.danger {
            border-left: 0.25rem solid var(--danger);
        }
        .card-dashboard.danger .card-icon {
            color: var(--danger);
        }
        .card-dashboard.dark {
            border-left: 0.25rem solid var(--dark);
        }
        .card-dashboard.dark .card-icon {
            color: var(--dark);
        }
        .footer {
            padding: 2rem 0;
            flex-shrink: 0;
            background-color: white;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
            margin-top: 2rem;
        }
        .footer-text {
            color: var(--secondary);
            font-size: 0.85rem;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="admin-sidebar">
        <a href="admin/dashboard" class="sidebar-brand">
            <i class="fas fa-train me-2"></i>
            ADMIN TRAIN
        </a>
        <hr class="sidebar-divider">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link active" href="admin/dashboard">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Tableau de bord</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="admin/trajets">
                    <i class="fas fa-fw fa-route"></i>
                    <span>Trajets</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="admin/gares">
                    <i class="fas fa-fw fa-building"></i>
                    <span>Gares</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="admin/voyages">
                    <i class="fas fa-fw fa-subway"></i>
                    <span>Voyages</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="DisponibiliteServlet">
                    <i class="fas fa-fw fa-chair"></i>
                    <span>Disponibilité</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="admin/utilisateurs">
                    <i class="fas fa-fw fa-users"></i>
                    <span>Utilisateurs</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="admin/paiements">
                    <i class="fas fa-fw fa-credit-card"></i>
                    <span>Paiements</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="AnnulationsServlet">
                    <i class="fas fa-fw fa-calendar-times"></i>
                    <span>Annulations</span>
                </a>
            </li>
            <li class="nav-item mt-3">
               
  <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-primary btn-action">
    <i  class="fas fa-fw fa-sign-out-alt"></i>Déconnexion
</a>

     
</div>
            </li>
        </ul>
    </div>

    <!-- Content Wrapper -->
    <div class="content-wrapper">
        <!-- Header -->
        <div class="dashboard-header">
            <h2 class="dashboard-title">Tableau de bord Administrateur</h2>
        </div>

        <!-- Dashboard Cards -->
        <div class="row">
            <div class="col-xl-3 col-md-6">
                <div class="card card-dashboard primary">
                    <div class="card-body">
                        <div class="card-icon">
                            <i class="fas fa-route"></i>
                        </div>
                        <div class="card-title">Gérer les trajets</div>
                        <a href="admin/trajets" class="btn btn-primary btn-sm">Accéder</a>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card card-dashboard success">
                    <div class="card-body">
                        <div class="card-icon">
                            <i class="fas fa-building"></i>
                        </div>
                        <div class="card-title">Gérer les gares</div>
                        <a href="admin/gares" class="btn btn-success btn-sm">Accéder</a>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card card-dashboard info">
                    <div class="card-body">
                        <div class="card-icon">
                            <i class="fas fa-subway"></i>
                        </div>
                        <div class="card-title">Gérer les voyages</div>
                        <a href="admin/voyages" class="btn btn-info btn-sm text-white">Accéder</a>
                    </div>
                </div>
            </div>
          
            <div class="col-xl-4 col-md-6">
                <div class="card card-dashboard danger">
                    <div class="card-body">
                        <div class="card-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <div class="card-title">Gérer les utilisateurs</div>
                        <a href="admin/utilisateurs" class="btn btn-danger btn-sm">Accéder</a>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 col-md-6">
                <div class="card card-dashboard dark">
                    <div class="card-body">
                        <div class="card-icon">
                            <i class="fas fa-credit-card"></i>
                        </div>
                        <div class="card-title">Gérer les paiements</div>
                        <a href="admin/paiements" class="btn btn-dark btn-sm">Accéder</a>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 col-md-6">
                <div class="card card-dashboard primary">
                    <div class="card-body">
                        <div class="card-icon">
                            <i class="fas fa-calendar-times"></i>
                        </div>
                        <div class="card-title">Gérer les annulations</div>
                        <a href="admin/remboursements" class="btn btn-primary btn-sm">Accéder</a>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Footer -->
        <footer class="footer text-center">
            <div class="container">
        
            </div>
        </footer>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
