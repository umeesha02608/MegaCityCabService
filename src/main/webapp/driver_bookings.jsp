<%@ page import="java.util.List" %>
<%@ page import="com.cab.dao.BookingDAO" %>
<%@ page import="com.cab.model.Booking" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="bookingDAO" class="com.cab.dao.BookingDAO" />

<%
    // Get logged-in driver name
    HttpSession sess = request.getSession(false);
    String driverName = (sess != null) ? (String) sess.getAttribute("user") : null;

    if (driverName == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Fetch bookings assigned to this driver
    List<Booking> bookings = bookingDAO.getBookingsByDriver(driverName);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Bookings</title>
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
            background-color: #dc3545;
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
        
        .action-btn {
            background-color: #27ae60;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
        }

        .action-btn:hover {
            background-color: #2ecc71;
        }

        .status-pending {
            color: #f39c12;
            font-weight: bold;
        }

        .status-accepted {
            color: #2ecc71;
            font-weight: bold;
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
               
                 <li class="nav-item">
				    <a class="btn logout-btn ms-2" href="#" onclick="confirmLogout(event);">Logout</a>
				</li>
            </ul>
        </div>
    </div>
</nav>
<br><br><br><br>


    <div class="container1">
        <h2>Assigned Bookings</h2>
        <table>
            <thead>
                <tr>
                    <th>Order Number</th>
                    <th>Pickup Location</th>
                    <th>Drop Location</th>
                    <th>Customer Name</th>
                    <th>Booking Date</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% for (Booking b : bookings) { %>
                <tr>
                    <td><%= b.getOrderNumber() %></td>
                    <td><%= b.getPickupLocation() %></td>
                    <td><%= b.getDropLocation() %></td>
                    <td><%= b.getCustomerName() %></td>
                    <td><%= b.getBookingDate() %></td>
                    <td class="<%= (b.getStatus() == null || !b.getStatus().equals("Accepted")) ? "status-pending" : "status-accepted" %>">
                        <%= (b.getStatus() == null || !b.getStatus().equals("Accepted")) ? "Pending" : "Accepted" %>
                    </td>
                    <td>
                        <% if (b.getStatus() == null || !b.getStatus().equals("Accepted")) { %>
                        <form action="AcceptBookingServlet" method="post">
                            <input type="hidden" name="orderNumber" value="<%= b.getOrderNumber() %>">
                            <button type="submit" class="action-btn">Accept</button>
                        </form>
                        <% } %>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
  <!-- Footer -->
    <footer class="footer mt-auto py-3 text-white text-center" style="background: rgba(255, 255, 255, 0.3);">
        <div class="container">
            <p style="color: #ffffff; font-weight: bold;">&copy; 2025 Mega City Cab Service | All Rights Reserved</p>
        </div>
    </footer>
</body>
</html>
