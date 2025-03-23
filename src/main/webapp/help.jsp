<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help - Mega City Cab Service</title>

    <!-- Bootstrap & Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <style>
        /* Background */
        body {
            background:linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('Images/taxibooking.jpg') center/cover no-repeat;
            background-size: cover;
            background-attachment: fixed;
            margin: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
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


        .btn-custom {
            background: #ffd700;
            color: #000;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: bold;
            transition: 0.3s ease;
        }

        .btn-custom:hover {
            background: #ffcc00;
        }

        /* Help Section */
        .help-section {
            flex-grow: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 50px 20px;
        }

        .help-container {
            background: rgba(255, 255, 255, 0.4);
            padding: 40px;
            border-radius: 12px;
            max-width: 800px;
            width: 100%;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        }

        .help-title {
            text-align: center;
            color: #000000;
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 30px;
        }

        /* FAQ Accordion */
        .accordion-item {
            border-radius: 8px;
            margin-bottom: 10px;
            background-color: rgba(255, 255, 255, 0.95);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .accordion-button {
            font-weight: bold;
            font-size: 18px;
            color: #0056b3;
            transition: all 0.3s ease;
        }

        .accordion-button:not(.collapsed) {
            background-color: #ffd700;
            color: #000;
        }

        .accordion-body {
            font-size: 16px;
            color: #333;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 15px;
        }

        /* Footer */
        .footer {
            background: rgba(255, 255, 255, 0.9);
            text-align: center;
            padding: 15px;
            font-size: 14px;
            font-weight: bold;
            color: #ffffff;
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

    <!-- Navbar -->
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
    </nav><br><br><br>

    <!-- Help Section -->
    <section class="help-section">
        <div class="help-container">
            <h2 class="help-title">Help & Support</h2>

            <div class="accordion" id="faqAccordion">
                
                <!-- FAQ 1 -->
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#faq1">
                            🚕 How do I book a cab?
                        </button>
                    </h2>
                    <div id="faq1" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            You can book a cab by logging into your account and selecting the "Book a Cab" option.
                        </div>
                    </div>
                </div>

                <!-- FAQ 2 -->
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2">
                            📍 How can I track my booking?
                        </button>
                    </h2>
                    <div id="faq2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            After booking, track it in your dashboard under "My Bookings."
                        </div>
                    </div>
                </div>

                <!-- FAQ 3 -->
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq3">
                            📞 How do I contact support?
                        </button>
                    </h2>
                    <div id="faq3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            Email us at <strong>support@megacitycab.com</strong> or call <strong>+94 77 123 4567</strong>.
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer" style="background: rgba(255, 255, 255, 0.4); ">
        <div class="container">
            <p>&copy; 2025 Mega City Cab Service | All Rights Reserved</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
