<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.cab.dao.CarDAO, com.cab.model.Car" %>
<%
    CarDAO carDAO = new CarDAO();
    List<Car> carList = carDAO.getAllCars();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Cars</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Corrected FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
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

        .container1 {
            margin-top: 60px;
        }
        .header-title {
            color: #ffffff;
            font-size: 25px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }
        .table-container {
            background-color: rgba(255, 255, 255, 0.4);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .table th {
            background-color: #002147;
            color: white;
            text-align: center;
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
        <div class="table-container">
            <h2 class="header-title">Manage Cars</h2>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Model</th>
                        <th>Brand</th>
                        <th>Plate Number</th>
                        <th>Status</th>
                        <th>Driver ID</th>
                        <th>Driver Name</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Car car : carList) { %>
                    <tr>
                        <td class="text-center"><%= car.getId() %></td>
                        <td><%= car.getModel() %></td>
                        <td><%= car.getBrand() %></td>
                        <td class="text-center"><%= car.getPlateNumber() %></td>
                        <td class="text-center"><%= car.getStatus() %></td>
                        <td class="text-center"><%= car.getDriverId() %></td>
                        <td><%= car.getDriverName() %></td>
                        <td class="text-center action-links">
                            <a href="edit_car.jsp?id=<%= car.getId() %>" class="edit-link">Edit</a> |
                            <a href="CarServlet?id=<%= car.getId() %>" class="delete-link"
   								onclick="return confirm('Are you sure you want to delete this car?');">Delete</a>

                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <br>
        <div class="d-flex justify-content-between mb-3">
        <a href="add_cars.jsp" class="btn btn-custom">+ Add New Car</a>
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
