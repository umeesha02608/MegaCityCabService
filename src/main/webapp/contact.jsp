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

        .contact-section {
            background:linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('Images/taxibooking.jpg') center/cover no-repeat;
            padding: 80px 0;
            color: black;
            text-align: center;
            flex-grow: 1; /* Ensures content takes up available space */
        }

        .contact-container {
            background: rgba(255, 255, 255, 0.5); /* Semi-transparent white background */
            padding: 50px;
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

<nav class="navbar navbar-expand-lg fixed-top" style="background: rgba(255, 255, 255, 0.4); box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.3);">
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
            </ul>
        </div>
    </div>
</nav>


<section class="contact-section">
<br><br>
    <div class="container">

        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="contact-container">
                    <h2 class="mb-2" style="font-size: 22px">Get in Touch</h2>
                    <p class="mb-2" style="font-size: 14px">We would love to hear from you! Fill out the form below to get in touch.</p>
                    <!-- Query Form -->
               
							 <div class="container1">
			    <div class="query-form text-center">

			        <form action="SubmitQueryServlet" method="post">
			            <input type="text" class="form-control mb-2" placeholder="Your Name" name="name" required>
			            <input type="email" class="form-control mb-2" placeholder="Your Email" name="email" required>
			            <textarea class="form-control mb-2" placeholder="Your Query" name="query" rows="3" required></textarea>
			            <button type="submit" class="btn btn-custom w-100">Submit</button>
			        </form>
			    </div>
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
