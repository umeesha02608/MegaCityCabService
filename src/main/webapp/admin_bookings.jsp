<%@ page import="java.util.List" %>
<%@ page import="com.cab.dao.BookingDAO" %>
<%@ page import="com.cab.model.Booking" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="bookingDAO" class="com.cab.dao.BookingDAO" />

<%
    // Ensure only admin can access
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("admin")) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Fetch all bookings
    List<Booking> bookings = bookingDAO.getAllBookings();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Manage Bookings</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Corrected FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <script src="https://kit.fontawesome.com/a076d05399.js" r="anonymous"></script>
    
    <style>
       
        
        html, body {
            height: 100%;
            display: flex;
            flex-direction: column;
            margin: 0;
            font-family: 'Arial', sans-serif;
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('Images/admindashboard.jpg') center/cover no-repeat;
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

        .container1{
            margin-top: 60px;
        }

        .header-title {
            color: #4e73df;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

       .table-container {
		    
		    padding: 30px; /* Reduced padding */
		    border-radius: 10px;
		    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
		    max-width: 85%; /* Reduced width */
		    margin: auto; /* Center align */
		    background: rgba(255, 255, 255, 0.5); /* Semi-transparent white */
		}

        .table {
		    font-size: 14px; /* Smaller text */
		}
		
		.table th, .table td {
		    padding: 6px; /* Reduce padding */
		}

        .table th {
            background-color: #002147;
            color: white;
            text-align: center;
		    font-size: 14px;
		}
            
        }

        .table tbody tr:hover {
            background-color: #f1f1f1;
        }

        .btn-custom {
            background-color: #4e73df;
            color: white;
            font-weight: bold;
            border-radius: 5px;
            padding: 6px 12px;
            border: none;
        }

        .btn-custom:hover {
            background-color: #2e59d9;
        }

        .status-select {
            border: 1px solid #ced4da;
            padding: 4px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 12px; /* Smaller dropdown */
        }

		.btn-sm {
		    font-size: 12px;
		    padding: 3px 8px;
		}
        .action-buttons form {
            display: inline-block;
            margin-right: 5px;
        }

        .edit-btn {
            color: #28a745;
            font-weight: bold;
            text-decoration: none;
        }

        .delete-btn {
            color: #dc3545;
            font-weight: bold;
            text-decoration: none;
        }

        .edit-btn:hover {
            text-decoration: underline;
            color: #218838;
        }

        .delete-btn:hover {
            text-decoration: underline;+
            color: #c82333;
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
                    <a class="btn logout-btn ms-2" href="index.jsp" onclick="return confirmLogout();">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<br><br><br>

<div class="container1">
    

    <div class="table-container">
    <h2 class="header-title" style="color: #fff">Manage Bookings</h2>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Order #</th>
                    <th>Customer</th>
                    <th>Phone</th>
                    <th>Driver</th>
                    <th>Car Model</th>
                    <th>Pickup</th>
                    <th>Drop</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (Booking b : bookings) { %>
                <tr>
                    <td class="text-center"><%= b.getOrderNumber() %></td>
                    <td><%= b.getCustomerName() %></td>
                    <td><%= b.getTelephone() %></td>
                    <td><%= b.getDriverName() %></td>
                    <td><%= b.getModel() %></td>
                    <td><%= b.getPickupLocation() %></td>
                    <td><%= b.getDropLocation() %></td>
                    <td class="text-center"><%= b.getBookingDate() %></td>
                    <td class="text-center"><%= b.getBookingTime() %></td>
                    
                    <td class="text-center">
                        <form action="UpdateBookingStatusServlet" method="post" class="d-inline">
                            <input type="hidden" name="orderNumber" value="<%= b.getOrderNumber() %>">
                           <select name="status" class="status-select" 
   							 <%= ("Accepted".equals(b.getStatus()) || "Completed".equals(b.getStatus())) ? "disabled" : "" %>>
                                <option value="Pending" <%= "Pending".equals(b.getStatus()) ? "selected" : "" %>>Pending</option>
                                <option value="Accepted" <%= "Accepted".equals(b.getStatus()) ? "selected" : "" %>>Accepted</option>
                                <option value="Completed" <%= "Completed".equals(b.getStatus()) ? "selected" : "" %>>Completed</option>
                            </select>
                            <button type="submit" class="btn btn-sm btn-custom" 
                                <%= (b.getStatus().equals("Accepted") || b.getStatus().equals("Completed")) ? "disabled" : "" %>>Update</button>
                        </form>
                    </td>
                    
                    <td class="text-center action-buttons">
                        <form action="edit-booking.jsp" method="get">
                            <input type="hidden" name="orderNumber" value="<%= b.getOrderNumber() %>">
                            <button type="submit" class="btn btn-sm btn-success">Edit</button>
                        </form>
                        <form action="DeleteBookingServlet" method="post" onsubmit="return confirm('Are you sure you want to delete?');">
                            <input type="hidden" name="orderNumber" value="<%= b.getOrderNumber() %>">
                            <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

<!-- Footer -->
    <footer class="footer mt-auto py-3 text-white text-center" style="background: rgba(255, 255, 255, 0.3);">
        <div class="container">
            <p style="color: #ffffff; font-weight: bold;">&copy; 2025 Mega City Cab Service | All Rights Reserved</p>
        </div>
    </footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>