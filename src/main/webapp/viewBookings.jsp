<%@ page import="java.util.List" %>
<%@ page import="com.cab.model.Booking" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Bookings</title>
    
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

        .container1 {
            width: 90%;
            max-width: 1000px;
            background: white;
            padding: 20px;
            margin-top: 20px;
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

        tr:nth-child(even) {
            background: #f9f9f9;
        }

        tr:hover {
            background: #e9f5ff;
        }

        .btn {
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-pay {
            background: #28a745;
            color: white;
        }

        .btn-pay:hover {
            background: #218838;
        }

        .btn-na {
            background: #6c757d;
            color: white;
            cursor: default;
        }

        @media (max-width: 768px) {
            table {
                font-size: 14px;
            }

            th, td {
                padding: 8px;
            }
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
    <h2>My Bookings</h2>
    <table>
        <tr>
            <th>Order No.</th>
            <th>Car Model</th>
            <th>Driver Name</th>
            <th>Pickup</th>
            <th>Drop</th>
            <th>Distance (km)</th>
            <th>Fare (LKR)</th>
            <th>Date</th>
            <th>Time</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        <%
            List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
            if (bookings != null && !bookings.isEmpty()) {
                for (Booking b : bookings) {
        %>
        <tr>
            <td><%= b.getOrderNumber() %></td>
            <td><%= b.getModel() %></td>
            <td><%= b.getDriverName() %></td>
            <td><%= b.getPickupLocation() %></td>
            <td><%= b.getDropLocation() %></td>
            <td><%= b.getDistance() %></td>
            <td><%= b.getFare() %></td>
            <td><%= b.getBookingDate() %></td>
            <td><%= b.getBookingTime() %></td>
            <td><%= b.getStatus() != null ? b.getStatus() : "Pending" %></td>
            <td>
                <% if ("Completed".equals(b.getStatus())) { %>
                    <form action="payment.jsp" method="get">
                        <input type="hidden" name="orderNumber" value="<%= b.getOrderNumber() %>">
                        <input type="hidden" name="fare" value="<%= b.getFare() %>">
                        <button type="submit" class="btn btn-pay">Make Payment</button>
                    </form>
                <% } else { %>
                    <button class="btn btn-na" disabled>N/A</button>
                <% } %>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="11">No bookings found.</td>
        </tr>
        <% } %>
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
