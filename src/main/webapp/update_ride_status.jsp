<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.cab.dao.BookingDAO, com.cab.model.Booking" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Ride Status</title>
    
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

<script>
    window.onload = function() {
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('success')) {
            alert("Status updated successfully!");
            window.location.href = "driver_dashboard.jsp"; // Removes the query parameter
        }
    };
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
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 80vh;
            margin: 0;
        }

        .container1 {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            justify-content: center;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 500px;
            max-width: 100%;
            background-color: rgba(255, 255, 255, 0.5);
        }

        h2 {
            color: #002147;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .btn-primary {
            background-color: #002147;
       
        }

        .btn-primary:hover {
            background-color: #2e59d9;
            
        }

        label {
            font-weight: bold;
        }

        .form-control:focus {
            border-color: #4e73df;
            box-shadow: 0 0 8px rgba(72, 84, 159, 0.4);
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

        
        .logout-btn {
            background-color: #dc3545;
            color: white;
        }

        .logout-btn:hover {
            background-color: #c82333;
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
                
          
                 <li class="nav-item">
               <li class="nav-item">
				    <a class="btn logout-btn ms-2" href="#" onclick="confirmLogout(event);">Logout</a>
				</li>
            </ul>
        </div>
    </div>
</nav><br><br>
    <div class="container1">
        <h2 style="text-align:center">Update Ride Status</h2>

        <%
            HttpSession sessionObj = request.getSession();
            String driverName = (String) sessionObj.getAttribute("username");

            BookingDAO bookingDAO = new BookingDAO();
            List<Booking> driverBookings = bookingDAO.getBookingsByDriver(driverName);
        %>

        <form action="UpdateRideStatusServlet" method="post">
            <div class="mb-4">
                <label for="orderNumber" class="form-label">Select Booking:</label>
                <select name="orderNumber" class="form-control" style="width:100%; font-size:14px" required>
                    <option value="" style="font-size:14px">Select Booking </option>
                    <% for (Booking booking : driverBookings) { %>
                        <% if (!booking.getStatus().equals("Completed") && !booking.getStatus().equals("Cancelled")) { %>
                            <option value="<%= booking.getOrderNumber() %>">
                                <%= booking.getOrderNumber() %> - <%= booking.getPickupLocation() %> to <%= booking.getDropLocation() %> (Status: <%= booking.getStatus() %>)
                            </option>
                        <% } %>
                    <% } %>
                </select>
            </div>

            <div class="mb-4">
                <label for="status" class="form-label">Update Status:</label>
                <select name="status" class="form-control" style="width:100%; font-size:14px" required>
                    <option value="" style="font-size:14px">Select Status</option>
                    <option value="Ongoing">Ongoing</option>
                    <option value="Completed">Completed</option>
                    <option value="Cancelled">Cancelled</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary btn-lg w-100">Update Status</button>
        </form>
    </div>

 <!-- Footer -->
    <footer class="footer mt-auto py-3 text-white text-center" style="background: rgba(255, 255, 255, 0.3);">
        <div class="container">
            <p style="color: #ffffff; font-weight: bold;">&copy; 2025 Mega City Cab Service | All Rights Reserved</p>
        </div>
    </footer>
</body>
</html>
