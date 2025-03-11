<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mega City Cab Service</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    
    <% 
    String error = request.getParameter("error");
    String message = (String) session.getAttribute("message");
    if (message != null) {
        session.removeAttribute("message"); // Remove after displaying
    }
    %>

    <style>
       html, body {
		    height: 100%;
		    display: flex;
		    flex-direction: column;
		    margin: 0;
		}

        .content-wrapper {
            flex: 1; /* Pushes footer down */
            display: flex;
            flex-direction: column;
            justify-content: center; /* Center the login box */
            align-items: center;
        }

        
        .navbar {
            background-color: #ECDFCC;
            padding: 15px;
        }

        .navbar-brand {
            font-weight: bold;
            color: #000000 !important;
        }

        /* New Larger Container */
        .outer-container {
		    width: 80%;
		    height: 100vh; /* Full viewport height */
		    display: flex;
		    justify-content: center; /* Horizontally center */
		    align-items: center; /* Vertically center */
		    background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('Images/street-night-with-traffic.jpg') no-repeat center center;
		    background-size: cover;
		    margin: 0 auto; /* Centers it horizontally in case of large screens */
		}

        .login-container {
            width: 80%; 
             max-width: 400px;
            padding: 30px;
            background: rgba(255, 255, 255, 0.5); /* Semi-transparent white */
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
        }

        .login-header {
            text-align: center;
            margin-bottom: 20px;
            color: #002147;
            font-weight: bold;
        }

        .btn-custom1 {
            background-color: #002147;
            color: white;
            width: 100%;
            font-weight: bold;
        }

        .btn-custom1:hover {
            background-color: #000000 ;
            
            color: #ffffff;
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
            background-color: #ffdb4d;
        }

        /* Footer Styling */
        .footer {
            background-color: #ECDFCC;
            color: white;
            text-align: center;
            padding: 15px 0;
        }

    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg fixed-top" style="background-color: #ECDFCC; box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);">
    <div class="container">
        <a class="navbar-brand" href="#">Mega City Cab</a>
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

<!-- Outer Container (with background image) -->
<div class="outer-container">
    <!-- Content Wrapper (Login Form) -->
    <div class="login-container">
        <h2 class="login-header">Login</h2>
        <% if (request.getParameter("error") != null) { %>
            <div class="alert alert-danger" role="alert"><%= request.getParameter("error") %></div>
        <% } %>
        <% if (request.getParameter("message") != null) { %>
            <div class="alert alert-success" role="alert"><%= request.getParameter("message") %></div>
        <% } %>
        
        <form action="LoginServlet" method="post">
            <div class="mb-2">
                <label class="form-label" style="color: #000000;">Username</label>
                <input type="text" name="username" class="form-control" required>
            </div>
            
            <div class="mb-3">
                <label class="form-label" style="color: #000000;">Password</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            
            <button type="submit" class="btn btn-custom1">Login</button>
        </form>
        
        <p class="mt-3 text-center" >New user? <a href="register.jsp" style="color: #ffcc00; font-weight: bold;" >Register here</a></p>
    </div>
</div>

<!-- Footer -->
<footer class="footer mt-auto py-3 text-white text-center" style="background-color: #ECDFCC;">
    <div class="container">
        <p style="color: #000000; font-weight: bold;">&copy; 2025 Mega City Cab Service | All Rights Reserved</p>
    </div>
</footer>

</body>
</html>
