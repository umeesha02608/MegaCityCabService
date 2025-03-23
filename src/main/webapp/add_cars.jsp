<%@ page import="com.cab.dao.UsersDAO, com.cab.model.Users, java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    UsersDAO usersDAO = new UsersDAO();
    List<Users> drivers = usersDAO.getAllDrivers();  // Fetch drivers from users table
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add New Car</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Corrected FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    
    <script>
    function confirmLogout(event) {
        event.preventDefault(); // Prevent the default link action
        if (confirm("Are you sure you want to log out?")) {
            window.location.href = "logout.jsp"; // Redirect to logout.jsp
        }
    }
</script>
    
  <style>
    html, body {
            height: 100%;
            display: flex;
            flex-direction: column;
            margin: 0;
            font-family: 'Arial', sans-serif;
            padding-top: 30px;
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('Images/people-driving-cars-city-street.jpg') center/cover no-repeat;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

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
        
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        
          .logo-container {
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    height: 50px; /* Adjust height as needed */
		    
		}
		
		.card{
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            max-width: 100%;
            margin-top:1px;
            background-color: rgba(255, 255, 255, 0.4);
        }
        
       .container1 {
            margin-top: 70px;
        }

		.logo {
		    height: 140px;
		    width: auto;
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
        
        .btn-success {
            background-color: #002147;
            color:#ffffff;
        }
        
        .btn-outline-primary {
            background-color: #002147;
            color:#ffffff;
        }
        
        
        .btn-success:hover {
            background-color: #1C325B;
            color:#ffffff;
        }
        
        .btn-outline-primary:hover {
            background-color: #1C325B;
            color:#ffffff;
        }
  </style>
</head>
<body class="bg-light">

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
          
                 <li class="nav-item">
                <li class="nav-item">
				    <a class="btn logout-btn ms-2" href="#" onclick="confirmLogout(event);">Logout</a>
				</li>
            </ul>
        </div>
    </div>
</nav><br><br>
    <div class="container1">
        <div class="card">
            <h2 class="text-center" style="color: #002147; font-size: 28px; font-weight: bold; margin-bottom: 20px">Add New Car</h2>
            <form action="CarServlet" method="post">
                <input type="hidden" name="action" value="add">

                <div class="mb-3">
                    <input type="text" name="model" class="form-control" required placeholder="Enter car model">
                </div>

                <div class="mb-3">
                    <input type="text" name="brand" class="form-control" required placeholder="Enter car brand">
                </div>

                <div class="mb-3">
                    <input type="text" name="plateNumber" class="form-control" required placeholder="Enter plate number">
                </div>

            <div class="mb-3 pb-4">
			    <select name="driverId" class="form-select" required>
			        <option value="">Select a Driver</option>
			        <% for (Users driver : drivers) { %>
			            <option value="<%= driver.getId() %>">
			                <%= driver.getName() %> (ID: <%= driver.getId() %>)
			            </option>
			        <% } %>
			    </select>
			</div>


                <div class="text-center">
				    <button type="submit" class="btn btn-success me-2">
				        <i class="fas fa-car"></i> Add Car
				    </button>
				    <a href="manage_cars.jsp" class="btn btn-outline-primary">
				        <i class="fas fa-list"></i> View Cars
				    </a>
				</div>

            </form>
        </div>
    </div>
    
    <!-- Footer -->
    <footer class="footer mt-auto py-3 text-white text-center" style="background: rgba(255, 255, 255, 0.3);">
        <div class="container">
            <p style="color: #ffffff; font-weight: bold;">&copy; 2025 Mega City Cab Service | All Rights Reserved</p>
        </div>
    </footer>
</body>
</html>
