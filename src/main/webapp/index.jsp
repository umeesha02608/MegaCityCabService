<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab Service</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
            /* Navbar */
        .navbar {
            background: rgba(255, 255, 255, 0.9);
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            font-family: Verdana;
            font-size: 12px;
            color: #ffffff !important;
        }

 			 .nav-link
        {
            font-weight: bold;
            font-size: 18px;
            color: #ffffff !important;
        }
        
        .hero-section {
           background:linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.6)), url('Images/taxibooking.jpg') center/cover no-repeat;
            color: white;
            padding: 120px 20px;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 85vh;
        }
        .hero-section h1 {
            font-size: 3rem;
            font-weight: bold;
        }
        .btn-custom {
            background-color: #ffcc00;
            color: black;
            padding: 10px 20px;
            font-size: 1.2rem;
            border-radius: 8px;
            transition: 0.3s;
        }
        .btn-custom:hover {
            background-color: #ffcc00;
        }
        .section-title {
            font-weight: bold;
            text-align: center;
            margin-bottom: 40px;
            color: #002147;
        }
        .about-section {
            background-color: #ffffff;
            padding: 60px 20px;
            text-align: center;
            
        }
        .about-text {
            font-size: 1.2rem;
            color: #555;
        }
        .icon-box {
            font-size: 50px;
            color: #ffcc00;
            margin-bottom: 20px;
        }
        .services-section {
            background-color: #f1f1f1;
            padding: 60px 20px;
            text-align: center;
        }
        .service-card {
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
        }
        .service-card:hover {
            transform: scale(1.05);
        }
        
        .footer {
            background-color: #343a40;
            color: #000000;
            padding: 20px;
            text-align: center;
        }
        
       
       .logo-container {
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    height: 50px; /* Adjust height as needed */
		    
		}

		.logo {
		    height: 140px;
		    width: auto;
		    margin-right: 10px;
		    
		}
    </style>
</head>
<body>
       <!-- Updated Header (Navbar) -->
<nav class="navbar navbar-expand-lg fixed-top" style="background: rgba(255, 255, 255, 0.4); box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.3);">
    <div class="container">
        <!-- Logo Container -->
        <a class="navbar-brand d-flex align-items-center" href="index.jsp">
            <div class="logo-container">
                <img src="Images/Logo.png" alt="Mega City Cab Logo" class="logo">
                MEGA CITY CABS
                
            </div>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
           		 <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="index.jsp#about">About</a></li>
                <li class="nav-item"><a class="nav-link" href="index.jsp#services">Services</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                <li class="nav-item"><a class="nav-link" href="help.jsp">Help</a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                <li class="nav-item"><a class="btn btn-custom ms-2" href="register.jsp">Register</a></li>
            </ul>
        </div>
    </div>
</nav>

    

    <div class="hero-section">
    <h1>Reliable Rides, Anytime, Anywhere</h1>
    <p>Your trusted cab service in Colombo City. <br>
    Whether you need a quick ride to work, a comfortable trip to the airport, or a safe journey home, we have got you covered. <br>
    Book a ride, manage drivers, and streamline your travels effortlessly with our reliable and affordable service.</p>
    
    <a href="register.jsp" class="btn btn-custom">Get Started</a>
</div>


    <div id="about" class="container text-center section" style="padding: 60px 20px;  background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('Images/unnamed.jpg') no-repeat center center/cover; border-radius: 10px; margin-top: 50px;">
    <h2 class="section-title" style="color:#ffcc00; font-size: 32px; font-weight: bold;">About Mega City Cab</h2>
    <p style="font-size: 1.2rem; max-width: 800px; margin: 10px auto; color: #fff;">
        Mega City Cab is your trusted transportation partner, offering safe, reliable, and affordable cab services across Colombo. 
        Whether it is a daily commute, airport transfer, or a long-distance journey, we ensure a seamless and comfortable ride.
    </p>

    <div class="row mt-5">
        <div class="col-md-4">
            <div class="card shadow-lg border-0" style="border-radius: 10px;">
                <div class="card-body text-center">
                    <i class="fas fa-car-alt" style="font-size: 3rem; color: #002147;"></i>
                    <h4 class="mt-3" style="color: #002147; font-weight: bold;">Reliable Fleet</h4>
                    <p style="color: #555;">Our fleet consists of well-maintained, modern vehicles to ensure a smooth and comfortable ride every time.</p>
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="card shadow-lg border-0" style="border-radius: 10px;">
                <div class="card-body text-center">
                    <i class="fas fa-user-tie" style="font-size: 3rem; color: #002147;"></i>
                    <h4 class="mt-3" style="color: #002147; font-weight: bold;">Professional Drivers</h4>
                    <p style="color: #555;">Our trained and verified drivers are dedicated to providing a safe, courteous, and efficient service.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card shadow-lg border-0" style="border-radius: 10px;">
                <div class="card-body text-center">
                    <i class="fas fa-map-marked-alt" style="font-size: 3rem; color: #002147;"></i>
                    <h4 class="mt-3" style="color: #002147; font-weight: bold;">Citywide Coverage</h4>
                    <p style="color: #555;">With extensive service coverage, we are available wherever you need us, from urban centers to suburban areas.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="mt-5">
        <a href="contact.jsp" class="btn btn-custom" style="padding: 12px 24px; font-size: 1.2rem; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); background-color: #ffcc00; color: black; font-weight: bold; transition: 0.3s;">
            Contact Us
        </a>
    </div>
</div>



<div id="services" class="services-section" style="background-color: black; padding: 80px 20px; border-radius: 15px; margin-top: 50px;">
    <h2 class="section-title" style="color: #ffcc00; text-align: center; margin-bottom: 40px;">Our Services</h2>
    <div class="container">
        <div class="row g-4">
            <div class="col-md-4">
                <div class="service-card" style="overflow: hidden; border-radius: 10px; box-shadow: 0 4px 10px rgba(255, 255, 255, 0.1); background-color: #222; transition: transform 0.3s;">
                    <img src="Images/screenshot_2019-05-06_at_16.15.17.png" alt="Customer Booking" style="width: 100%; height: 200px; object-fit: cover; border-radius: 10px 10px 0 0;">
                    <div style="padding: 20px; text-align: center; color: white;">
                        <i class="fas fa-car icon-box" style="font-size: 40px; color: #ffcc00;"></i>
                        <h5>Customer Booking</h5>
                        <p>Easily book a cab with our seamless online booking system.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-card" style="overflow: hidden; border-radius: 10px; box-shadow: 0 4px 10px rgba(255, 255, 255, 0.1); background-color: #222; transition: transform 0.3s;">
                    <img src="Images/driver_management.jpg" alt="Driver Management" style="width: 100%; height: 200px; object-fit: cover; border-radius: 10px 10px 0 0;">
                    <div style="padding: 20px; text-align: center; color: white;">
                        <i class="fas fa-users icon-box" style="font-size: 40px; color: #ffcc00;"></i>
                        <h5>Driver Management</h5>
                        <p>Manage and track drivers with real-time monitoring.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-card" style="overflow: hidden; border-radius: 10px; box-shadow: 0 4px 10px rgba(255, 255, 255, 0.1); background-color: #222; transition: transform 0.3s;">
                    <img src="Images/payments.jpg" alt="Billing & Payments" style="width: 100%; height: 200px; object-fit: cover; border-radius: 10px 10px 0 0;">
                    <div style="padding: 20px; text-align: center; color: white;">
                        <i class="fas fa-credit-card icon-box" style="font-size: 40px; color: #ffcc00;"></i>
                        <h5>Billing & Payments</h5>
                        <p>Generate bills and make secure online payments for your rides.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    
   <div id="help" class="container text-center section" style="padding: 40px 20px; background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url('Images/anxiety-induced-by-traffic.jpg') no-repeat center center/cover; color: white; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); border-radius: 10px; margin-top: 50px;">
    <h2 class="section-title" style="color: #F8E559; font-size: 2.5rem;">Need Help?</h2>
    <p style="font-size: 1.2rem; max-width: 700px; margin: 10px auto; color: #ffffff;">
        Facing any issues? Find answers to common questions or reach out to our support team.
    </p>
    <a href="help.jsp" class="btn btn-custom" style="padding: 12px 24px; font-size: 1.2rem; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); background-color: #ffcc00; color: black; font-weight: bold; transition: 0.3s;">
        Visit Help Center
    </a>
</div>
<br>

   <!-- Updated Footer -->
<footer class="footer mt-auto py-3 text-white text-center" style="background: rgba(200, 200, 200, 1.7);">
    <div class="container">
        <p class="mb-0"  style="color: #000000; font-weight: bold;">&copy; 2025 Mega City Cab Service | All Rights Reserved</p>
        
    </div>
</footer>
<!-- Help Section -->
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
