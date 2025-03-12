<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Contact - Mega City Cab Service</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    
    <style>
        html, body {
            height: 100%;
            display: flex;
            flex-direction: column;
            margin: 0;
        }

        .navbar {
            background-color: #ECDFCC;
            padding: 15px;
        }

        .navbar-brand {
            font-weight: bold;
            color: #000000 !important;
        }

        .contact-section {
            background:linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('Images/taxibooking.jpg') center/cover no-repeat;
            padding: 80px 0;
            color: black;
            text-align: center;
            flex-grow: 1; /* Ensures content takes up available space */
        }

        .contact-container {
            background: rgba(255, 255, 255, 0.5); /* Semi-transparent white background */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            max-width: 500px; /* Reduced width for a smaller form */
            margin: 0 auto;
        }

        .contact-form {
            background: rgba(0, 0, 0, 0.7);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        .form-control {
            border-radius: 5px;
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

       
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg fixed-top" style="background-color: #ECDFCC; box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);">
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
                <li class="nav-item" style="background-color: #ECDFCC;"><a class="btn btn-custom ms-2" href="register.jsp">Register</a></li>
            </ul>
        </div>
    </div>
</nav><br><br>

<section class="contact-section">
    <div class="container">

        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="contact-container">
                    <h2 class="mb-2" style="font-size: 22px">Get in Touch</h2>
                    <p class="mb-2" style="font-size: 14px">We would love to hear from you! Fill out the form below to get in touch.</p>
                    <div class="contact-form">
                        <form id="contact-form" action="" method="post">
                            <div class="mb-3">
                                <input type="text" class="form-control" name="name" id="name" placeholder="Your Name" required>
                            </div>
                            <div class="mb-3">
                                <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
                            </div>
                            <div class="mb-3">
                                <textarea class="form-control" name="message" id="message" rows="4" placeholder="Your Message" required></textarea>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-custom btn-block">Send Message</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>



<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
