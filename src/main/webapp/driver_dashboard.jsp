<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    String customerName = (String) session.getAttribute("customerName");
    if (customerName == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if not logged in
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Driver Dashboard - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
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
        

        /* Dashboard Container */
        .dashboard-container {
            
            height: 100%;
            padding: 40px 0;
            display: flex;
            justify-content: center;
            align-items: center;
            background-attachment: fixed;
        }

        .dashboard-overlay {
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent overlay for better text visibility */
            width: 100%;
            height: 100%;
            padding: 40px;
        }

        .dashboard-content {
            max-width: 700px;
            margin: auto;
            background-color: rgba(255, 255, 255, 0.4); /* White background with slight transparency */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .dashboard-card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: 0.3s ease-in-out;
            background-color: #fff;
        }

        .dashboard-card:hover {
            transform: scale(1.05);
        }

        .icon {
            font-size: 24px;
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
		
		#userDropdown {
		    color: #ffcc00 !important; /* Change to your preferred color */
		    font-weight: bold;
		}
		#userDropdown:hover {
		    color: #e6b800 !important; /* Darker shade on hover */
		}
		
    </style>
</head>
<body>

    <!-- Navbar -->
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
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"
                    style="color: #ffcc00; font-weight: bold; background-color: #333; padding: 8px 12px; border-radius: 5px;">
					    <i class="fas fa-user"></i> <%= customerName %>
					</a>

                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                        <li><a class="dropdown-item logout-btn" href="#" onclick="confirmLogout(event);"> Logout</a></li>
                    </ul>
                </li>

            </ul>
        </div>
    </div>
</nav>
<br><br><br>

    <!-- Driver Dashboard with Background Image -->
    <div class="dashboard-container">
        <div class="dashboard-overlay"><br><br><br>
            <div class="dashboard-content">
                <h2 class="text-center mb-4" style="font-size:22px; color: #ffffff">Driver Dashboard</h2>

                <div class="row g-3">
                    <!-- View Assigned Bookings -->
                    <div class="col-md-6">
                        <a href="DriverBookingsServlet" class="text-decoration-none">
                            <div class="card dashboard-card p-3 shadow-sm">
                                <h5><i class="icon fas fa-calendar-alt"></i> View Assigned Bookings</h5>
                            </div>
                        </a>
                    </div>

                    <!-- Update Ride Status -->
                    <div class="col-md-6">
                        <a href="update_ride_status.jsp" class="text-decoration-none">
                            <div class="card dashboard-card p-3 shadow-sm">
                                <h5><i class="icon fas fa-sync-alt"></i> Update Ride Status</h5>
                            </div>
                        </a>
                    </div>

                    <!-- View Customer Details -->
                    <div class="col-md-6">
                        <a href="view_customer_details.jsp" class="text-decoration-none">
                            <div class="card dashboard-card p-3 shadow-sm">
                                <h5><i class="icon fas fa-user"></i> View Customer Details</h5>
                            </div>
                        </a>
                    </div>

                    <!-- Logout -->
                    <div class="col-md-6">
                        <a href="logout.jsp" class="text-decoration-none">
                            <div class="card dashboard-card p-3 shadow-sm">
                                <h5><i class="icon fas fa-sign-out-alt"></i> Logout</h5>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

   <!-- Footer -->
    <footer class="footer mt-auto py-3 text-white text-center" style="background: rgba(255, 255, 255, 0.3);">
        <div class="container">
            <p style="color: #ffffff; font-weight: bold;">&copy; 2025 Mega City Cab Service | All Rights Reserved</p>
        </div>
    </footer>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
