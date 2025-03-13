<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.cab.dao.UsersDAO" %>
<%@ page import="com.cab.model.Users" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Corrected FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    
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
            padding-top: 40px;
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('Images/people-driving-cars-city-street.jpg') center/cover no-repeat;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

		.navbar {
		    position: fixed;
		    top: 0;
		    left: 0;
		    width: 100%;
		    background-color: #ECDFCC;
		    padding: 15px;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		    z-index: 1000; /* Ensures it's always above other elements */
		}
		

        .navbar-brand {
            font-weight: bold;
            color: #000000 !important;
        }

        .navbar-nav .nav-link {
            font-size: 16px;
        }
        
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .container1 {
            margin-top: 50px;
        }

        .header-title {
            color: #ffffff;
            font-size: 25px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        .table-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            background-color: rgba(255, 255, 255, 0.4);
        }

        table {
            border-radius: 5px;
            overflow: hidden;
        }

        .table th {
            background-color: #002147;
            color: white;
            text-align: center;
        }

        .table tbody tr:hover {
            background-color: #f1f1f1;
        }

        .btn-custom {
            background-color: #4e73df;
            color: white;
            font-weight: bold;
            border-radius: 5px;
            padding: 8px 12px;
        }

        .btn-custom:hover {
            background-color: #2e59d9;
        }

        .action-links a {
            margin-right: 10px;
            font-weight: bold;
            text-decoration: none;
        }

        .edit-link {
            color: #28a745;
        }

        .delete-link {
            color: #dc3545;
        }

        .edit-link:hover {
            text-decoration: underline;
            color: #218838;
        }

        .delete-link:hover {
            text-decoration: underline;
            color: #c82333;
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
        
        .logout-btn {
            background-color: #dc3545;
            color: white;
        }

        .logout-btn:hover {
            background-color: #c82333;
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


<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.jsp">Mega City Cab</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link text-dark" href="index.jsp#about">About</a></li>
                <li class="nav-item"><a class="nav-link text-dark" href="index.jsp#services">Services</a></li>
                <li class="nav-item"><a class="nav-link text-dark" href="contact.jsp">Contact</a></li>
                <li class="nav-item"><a class="nav-link text-dark" href="help.jsp">Help</a></li>
                <li class="nav-item"><a class="nav-link text-dark" href="login.jsp">Login</a></li>
                <li class="nav-item"><a class="btn btn-custom ms-2" href="register.jsp">Register</a></li>
                <li class="nav-item">
                    <a class="btn logout-btn ms-2" href="index.jsp" onclick="return confirmLogout();">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav><br><br>

<div class="container1">

    <div class="table-container">
    <h2 class="header-title">Manage Users</h2>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Registration ID</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>NIC</th>
                    <th>Username</th>
                    <th>Role</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Users> usersList = new UsersDAO().getAllUsers();
                    for (Users user : usersList) {
                %>
                <tr>
                    <td class="text-center"><%= user.getId() %></td>
                    <td class="text-center"><%= user.getRegistrationId() %></td>
                    <td><%= user.getName() %></td>
                    <td><%= user.getAddress() %></td>
                    <td class="text-center"><%= user.getNic() %></td>
                    <td><%= user.getUsername() %></td>
                    <td class="text-center"><%= user.getRole() %></td>
                    <td class="text-center action-links">
                        <a href="edit_user.jsp?id=<%= user.getId() %>" class="edit-link">Edit</a> |
                        <a href="delete_user?id=<%= user.getId() %>" class="delete-link"
                           onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    <br><br>
    <div class="d-flex justify-content-between mb-3">
        <a href="add_user.jsp" class="btn btn-custom">+ Add New User</a>
    </div>
</div>


 <!-- Footer -->
    <footer class="footer mt-auto py-3 text-white text-center" style="background-color: #ECDFCC;">
        <div class="container">
            <p style="color: #000000; font-weight: bold;">&copy; 2025 Mega City Cab Service | All Rights Reserved</p>
        </div>
    </footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
