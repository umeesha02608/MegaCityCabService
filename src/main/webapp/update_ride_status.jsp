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
            color: #ffffff;
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
            background-color: #ECDFCC;
            text-align: center;
            padding: 10px 0;
            font-size: 14px;
            position: absolute;
            bottom: 0;
            width: 100%;
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
    <footer class="footer mt-auto py-3 text-white text-center" style="background-color: #ECDFCC;">
        <div class="container">
            <p style="color: #000000; font-weight: bold;">&copy; 2025 Mega City Cab Service | All Rights Reserved</p>
        </div>
    </footer>  
</body>
</html>
