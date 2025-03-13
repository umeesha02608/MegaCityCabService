<%@ page import="java.util.List" %>
<%@ page import="com.cab.dao.BookingDAO" %>
<%@ page import="com.cab.model.Booking" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:useBean id="bookingDAO" class="com.cab.dao.BookingDAO" />

<%
    // Ensure only the driver can access
    String role = (String) session.getAttribute("role");
    String driverName = (String) session.getAttribute("username");

    if (role == null || !role.equals("driver")) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Fetch customer details assigned to this driver
    List<Booking> customers = bookingDAO.getCustomerDetailsForDriver(driverName);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Customer Details</title>
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
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container1 {
            width: 90%;
            max-width: 1000px;
            background: white;
            padding: 20px;
            margin-top: -250px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: rgba(255, 255, 255, 0.4);
            border-radius: 10px;
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
        
        .logout-btn {
            background-color: #dc3545;
            color: white;
        }

        .logout-btn:hover {
            background-color: #c82333;
        }
        

        h2 {
            color: #ffffff;
            font-weight: bold;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background: #001A6E;
            color: white;
        }


        tbody tr:nth-child(even) {
            background-color: #f1f1f1;
        }

        tbody tr:hover {
             background: #e9f5ff;
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
</nav>

    <div class="container1">
        <h2>Customer Details</h2>

        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Telephone</th>
                    <th>Pickup Location</th>
                    <th>Drop Location</th>
                    <th>Booking Date</th>
                    <th>Booking Time</th>
                </tr>
            </thead>
            <tbody>
                <% for (Booking customer : customers) { %>
                <tr>
                    <td><%= customer.getCustomerName() %></td>
                    <td><%= customer.getAddress() %></td>
                    <td><%= customer.getTelephone() %></td>
                    <td><%= customer.getPickupLocation() %></td>
                    <td><%= customer.getDropLocation() %></td>
                    <td><%= customer.getBookingDate() %></td>
                    <td><%= customer.getBookingTime() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- Footer -->
    <footer class="footer mt-auto py-3 text-white text-center" style="background-color: #ECDFCC;">
        <div class="container">
            <p style="color: #000000; font-weight: bold;">&copy; 2025 Mega City Cab Service | All Rights Reserved</p>
        </div>
    </footer>
</body>
</html>
