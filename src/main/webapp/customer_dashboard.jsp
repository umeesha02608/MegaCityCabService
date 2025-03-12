<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Customer Dashboard - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet"> <!-- Add Font Awesome CDN -->
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
        }

        /* Navbar */
        .navbar {
            background-color: #ECDFCC;
            padding: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            font-weight: bold;
            color: #000000 !important;
        }

        .navbar-nav .nav-link {
            font-size: 16px;
        }
        
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

        .logout-btn {
            background-color: #dc3545;
            color: white;
        }

        .logout-btn:hover {
            background-color: #dc3545;
        }

        /* Dashboard Container */
        .dashboard-container {
            background-image: url('Images/admindashboard.jpg'); /* Add your background image URL here */
            background-size: cover;
            background-position: center;
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
            max-width: 700px;
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
            color: #333; /* Ensure the icons are visible */
        }

        .footer {
            background-color: #ECDFCC;
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

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg fixed-top">
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
    </nav><br><br><br>

    <!-- Customer Dashboard with Background Image -->
    <div class="dashboard-container">
        <div class="dashboard-overlay"><br><br><br>
            <div class="dashboard-content">
                <h2 class="text-center mb-4" style="font-size:22px; color: #ffffff">Customer Dashboard</h2>

                <div class="row g-3">
                    <!-- Book a Cab -->
                    <div class="col-md-6">
                        <a href="book_cab.jsp" class="text-decoration-none">
                            <div class="card dashboard-card p-3 shadow-sm">
                                <h5><i class="icon fas fa-car"></i> Book a Cab</h5>
                            </div>
                        </a>
                    </div>

                    <!-- View Booking Details -->
                    <div class="col-md-6">
                        <a href="ViewBookingsServlet" class="text-decoration-none">
                            <div class="card dashboard-card p-3 shadow-sm">
                                <h5><i class="icon fas fa-list"></i> View Booking Details</h5>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer mt-auto py-3 text-white text-center" style="background-color: #ECDFCC;">
        <div class="container">
            <p style="color: #000000; font-weight: bold;">&copy; 2025 Mega City Cab Service | All Rights Reserved</p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
