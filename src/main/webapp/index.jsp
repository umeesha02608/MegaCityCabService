<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab Service</title>

    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background-color: #001f40;
        }
        .navbar-brand {
            font-weight: bold;
            color: #ffffff !important;
        }
        .hero-section {
		    background: url('Images/unnamed.jpg') no-repeat center top 30%;
		    background-size: cover;
		    color: white;
		    padding: 100px;
		    text-align: center;
		    margin-top: 50px; 
		    min-height: 60vh;
		    display: flex;
		    align-items: center;
		    justify-content: center;
		}

        .hero-overlay {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 80px;
            border-radius: 10px;
            max-width: 600px;
        }
        .section-title {
            font-weight: bold;
            margin-bottom: 20px;
        }
        .section {
            padding: 60px 0;
        }
        .card {
            transition: transform 0.3s ease-in-out;
            border: none;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .footer {
            background-color: #343a40;
            color: white;
            padding: 20px;
            text-align: center;
        }
    </style>
</head>
<body>

    
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Mega City Cab</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                    <li class="nav-item"><a class="nav-link" href="#services">Services</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                    <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                    <li class="nav-item"><a class="nav-link btn btn-warning " href="register.jsp">Register</a></li>
                </ul>
            </div>
        </div>
    </nav>

   
    <div class="hero-section">
        <div class="container hero-overlay">
            <h1>Welcome to Mega City Cab Service</h1>
            <p>Your trusted cab service in Colombo City. Book a ride, manage drivers, and streamline your travels effortlessly.</p>
            <a href="register.jsp" class="btn btn-warning btn-lg">Get Started</a>
        </div>
    </div>

    
    <div id="about" class="container text-center section">
        <h2 class="section-title">About Us</h2>
        <p>Mega City Cab is the most reliable taxi service in Colombo City, offering efficient booking, easy ride management, and secure payments.</p>
    </div>

    
    <div id="services" class="container section">
        <h2 class="section-title text-center">Our Services</h2>
        <div class="row g-4">
            
            <div class="col-md-4">
                <div class="card text-center p-3">
                    <h5 class="card-title">Customer Booking</h5>
                    <p class="card-text">Easily book a cab with our seamless online booking system.</p>
                </div>
            </div>

            <!-- Driver Management -->
            <div class="col-md-4">
                <div class="card text-center p-3">
                    <h5 class="card-title">Driver Management</h5>
                    <p class="card-text">Manage and track drivers with real-time monitoring.</p>
                </div>
            </div>

            
            <div class="col-md-4">
                <div class="card text-center p-3">
                    <h5 class="card-title">Billing & Payments</h5>
                    <p class="card-text">Generate bills and make secure online payments for your rides.</p>
                </div>
            </div>
        </div>
    </div>

    
    <div id="contact" class="container text-center section">
        <h2 class="section-title">Contact Us</h2>
        <p>Have questions? Reach out to us.</p>
        <p><strong>Email:</strong> support@megacitycab.com | <strong>Phone:</strong> +94 77 123 4567</p>
    </div>

    
    <div class="footer">
        <p>&copy; 2025 Mega City Cab Service | All Rights Reserved</p>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>