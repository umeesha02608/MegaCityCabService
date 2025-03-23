<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.cab.dao.BookingDAO" %>
<%@ page import="com.cab.model.Booking" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculate and Print Bills</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        html, body {
            height: 100%;
            display: flex;
            flex-direction: column;
            margin: 0;
            font-family: 'Arial', sans-serif;
            padding-top: 40px;
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('Images/people-driving-cars-city-street.jpg') center/cover no-repeat;
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
        
       .container1 {
            width: 90%;
            max-width: 1000px;
            background: white;
            padding: 30px;
            margin-top: 40px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: rgba(255, 255, 255, 0.4);
            border-radius: 10px;
            text-align: center;
        }
        
        .table th {
            background-color: #002147;
            color: white;
            text-align: center;
        }
        .bill-container {
            display: none;
            border: 2px solid #000;
            padding: 20px;
            width: 50%;
            margin: auto;
            text-align: center;
            background-color: #fff;
            
        }
        
        .btn-primary{
        	background-color:#ffcc00;
        }
        
        .btn-primary:hover{
        	background-color:#f4f4f4;
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
    <script>
        function printBill(orderNumber) {
            var printContents = document.getElementById('bill-' + orderNumber).innerHTML;
            var originalContents = document.body.innerHTML;
            document.body.innerHTML = printContents;
            window.print();
            document.body.innerHTML = originalContents;
        }
    </script>
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

    <div class="container1">
        <h2 class="text-center mb-4" style="color:#ffffff; font-size:24px; font-weight: bold">Print Bills</h2>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Order Number</th>
                    <th>Customer Name</th>
                    <th>Pickup Location</th>
                    <th>Drop Location</th>
                    <th>Distance (km)</th>
                    <th>Fare (LKR)</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    BookingDAO bookingDAO = new BookingDAO();
                    List<Booking> bookings = bookingDAO.getAllBookings();
                    for (Booking booking : bookings) {
                        double baseFare = 100;
                        double perKmRate = 50;
                        double totalFare = baseFare + (perKmRate * booking.getDistance());
                %>
                <tr>
                    <td class="text-center"><%= booking.getOrderNumber() %></td>
                    <td><%= booking.getCustomerName() %></td>
                    <td><%= booking.getPickupLocation() %></td>
                    <td><%= booking.getDropLocation() %></td>
                    <td class="text-center"><%= booking.getDistance() %></td>
                    <td class="text-center">LKR <%= String.format("%.2f", totalFare) %></td>
                    <td class="text-center">
                        <button class="btn btn-primary" onclick="printBill('<%= booking.getOrderNumber() %>')">Print Bill</button>
                    </td>
                </tr>
                <tr>
                    <td colspan="7">
                        <div id="bill-<%= booking.getOrderNumber() %>" class="bill-container">
                            <h3>Mega City Cab Service</h3>
                            <hr>
                            <p><strong>Order Number:</strong> <%= booking.getOrderNumber() %></p>
                            <p><strong>Customer Name:</strong> <%= booking.getCustomerName() %></p>
                            <p><strong>Pickup Location:</strong> <%= booking.getPickupLocation() %></p>
                            <p><strong>Drop Location:</strong> <%= booking.getDropLocation() %></p>
                            <p><strong>Distance:</strong> <%= booking.getDistance() %> km</p>
                            <p><strong>Total Fare:</strong> LKR <%= String.format("%.2f", totalFare) %></p>
                            <p><strong>Date:</strong> <%= booking.getBookingDate() %></p>
                            <hr>
                            <p>Thank you for choosing Mega City Cab Service!</p>
                        </div>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
