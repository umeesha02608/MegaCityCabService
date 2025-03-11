<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mega City Cab Service</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .navbar {
            background-color: #002147;
            padding: 15px;
        }
        .navbar-brand {
            font-weight: bold;
            color: #ffffff !important;
        }
        
        .login-container {
            width: 100%;
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            background: white;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .login-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .btn-custom {
            background-color: #002147;
            color: white;
            width: 100%;
        }
        .btn-custom:hover {
            background-color: #001530;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #002147; box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);">
    <div class="container">
        <a class="navbar-brand" href="#">Mega City Cab</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                <li class="nav-item"><a class="nav-link" href="#services">Services</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                <li class="nav-item"><a class="nav-link" href="help.jsp">Help</a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                <li class="nav-item"><a class="btn btn-custom ms-2" href="register.jsp">Register</a></li>
            </ul>
        </div>
    </div>
</nav>

    <div class="login-container">
    <h2 class="login-header">Login</h2>
    <% if (request.getParameter("error") != null) { %>
        <div class="alert alert-danger" role="alert"><%= request.getParameter("error") %></div>
    <% } %>
    <% if (request.getParameter("message") != null) { %>
        <div class="alert alert-success" role="alert"><%= request.getParameter("message") %></div>
    <% } %>
    
    <form action="LoginServlet" method="post">
        <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text" name="username" class="form-control" required>
        </div>
        
        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" required>
        </div>
        
        <button type="submit" class="btn btn-custom">Login</button>
    </form>
    
    <p class="mt-3 text-center">New user? <a href="register.jsp">Register here</a></p>
</div>
</body>
</html>