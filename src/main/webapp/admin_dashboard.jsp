<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Admin Dashboard - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Corrected FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <script src="https://kit.fontawesome.com/a076d05399.js" r="anonymous"></script>
    <script>
        function confirmLogout() {
            return confirm("Are you sure you want to log out?");
        }
    </script>

    <style>
        html, body {
            height: 100%;
            display: flex;
            flex-direction: column;
            margin: 0;
            font-family: 'Arial', sans-serif;
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('Images/admindashboard.jpg') center/cover no-repeat;
        }

             .navbar {
            background: rgba(255, 255, 255, 0.9);
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            font-weight: bold;
            font-size: 24px;
            color: #ffffff !important;
        }

 			 .nav-link
        {
            font-weight: bold;
            font-size: 18px;
            color: #ffffff !important;
        }

        
        /* Button */
        .btn-custom {
            background-color: #ffcc00;
            color: #000;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: bold;
        }

        .btn-custom:hover {
            background-color: #e6b800;
        }

        /* Dashboard Container */
        .dashboard-container {
            height: 100%;
            padding: 40px 0;
            display: flex;
            justify-content: center;
            align-items: center;
            background-attachment: fixed;
        }

        .dashboard-overlay {
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent overlay for better text visibility */
            width: 100%;
            height: 100%;
            padding: 40px;
        }

        .dashboard-content {
            max-width: 800px;
            margin: auto;
            background-color: rgba(255, 255, 255, 0.4); /* White background with slight transparency */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .dashboard-card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: 0.3s ease-in-out;
            background-color: #fff;
        }

        .dashboard-card:hover {
            transform: scale(1.05);
        }

        .icon {
            font-size: 24px;
            margin-right: 10px;
        }

        .logout-btn {
            background-color: #dc3545;
            color: white;
        }

        .logout-btn:hover {
            background-color: #c82333;
        }

        .footer {
            
            text-align: center;
            padding: 10px 0;
            font-size: 14px;
            position: absolute;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>

<body>

    <nav class="navbar navbar-expand-lg fixed-top" style="background: rgba(255, 255, 255, 0.3); box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.3);">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Mega City Cab</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="index.jsp#about">About</a></li>
                <li class="nav-item"><a class="nav-link" href="index.jsp#services">Services</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                <li class="nav-item"><a class="nav-link" href="help.jsp">Help</a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                <li class="nav-item"><a class="btn btn-custom ms-2" href="register.jsp">Register</a></li>
                <li class="nav-item">
                    <a class="btn logout-btn ms-2" href="index.jsp" onclick="return confirmLogout();">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<br><br><br>

    <!-- Admin Dashboard with Background Image -->
    <div class="dashboard-container">
        <div class="dashboard-overlay">
            <div class="dashboard-content">
                <h2 class="text-center mb-4" style="font-size:22px; color: #ffffff">Admin Dashboard</h2>

                <div class="row g-3">
                    <!-- Add User -->
                    <div class="col-md-6">
                        <a href="add_user.jsp" class="text-decoration-none">
                            <div class="card dashboard-card p-3 shadow-sm">
                                <h5><i class="icon fas fa-user-plus"></i> Add a User</h5>
                            </div>
                        </a>
                    </div>

                    <!-- Manage Users -->
                    <div class="col-md-6">
                        <a href="manage_users.jsp" class="text-decoration-none">
                            <div class="card dashboard-card p-3 shadow-sm">
                                <h5><i class="icon fas fa-users"></i> Manage Users</h5>
                            </div>
                        </a>
                    </div>

                    <!-- Manage Bookings -->
                    <div class="col-md-6">
                        <a href="admin_bookings.jsp" class="text-decoration-none">
                            <div class="card dashboard-card p-3 shadow-sm">
                                <h5><i class="icon fas fa-calendar-alt"></i> Manage Customer Bookings</h5>
                            </div>
                        </a>
                    </div>

                    <!-- Calculate Bills -->
                    <div class="col-md-6">
                        <a href="calculate_bills.jsp" class="text-decoration-none">
                            <div class="card dashboard-card p-3 shadow-sm">
                                <h5><i class="icon fas fa-receipt"></i> Calculate & Print Bills</h5>
                            </div>
                        </a>
                    </div>

                    <!-- Add Cars -->
                    <div class="col-md-6">
                        <a href="add_cars.jsp" class="text-decoration-none">
                            <div class="card dashboard-card p-3 shadow-sm">
                                <h5><i class="icon fas fa-car"></i> Add Cars</h5>
                            </div>
                        </a>
                    </div>

                    <!-- Manage Cars -->
                    <div class="col-md-6">
                        <a href="manage_cars.jsp" class="text-decoration-none">
                            <div class="card dashboard-card p-3 shadow-sm">
                                <h5><i class="icon fas fa-car-side"></i> Manage Cars</h5>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

   <!-- Footer -->
    <footer class="footer mt-auto py-3 text-white text-center" style="background: rgba(255, 255, 255, 0.3);">
        <div class="container">
            <p style="color: #ffffff; font-weight: bold;">&copy; 2025 Mega City Cab Service | All Rights Reserved</p>
        </div>
    </footer>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
