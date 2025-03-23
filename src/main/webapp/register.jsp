<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Mega City Cab Service</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <style>
        html, body {
            height: 100%;
            display: flex;
            flex-direction: column;
            margin: 0;
            background:linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('Images/taxibooking.jpg') center/cover no-repeat;
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

        .outer-container {
		    width: 80%;
		    height: 100vh; /* Full viewport height */
		    display: flex;
		    justify-content: center; /* Horizontally center */
		    align-items: center; /* Vertically center */
		    /*background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('Images/street-night-with-traffic.jpg') no-repeat center center;*/
		    background-size: cover;
		    margin: 0 auto; /* Centers it horizontally in case of large screens */
		}

        .register-container {
            width: 100%; 
            max-width: 400px;
            padding: 30px;
            background: rgba(255, 255, 255, 0.5); /* Semi-transparent white */
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
        }

        .register-header {
            text-align: center;
            margin-bottom: 15px;
            color: #002147;
            font-weight: bold;
        }

       .btn-custom1 {
            background-color: #002147;
            color: white;
            width: 100%;
            font-weight: bold;
        }

        .btn-custom1:hover {
            background-color: #000000 ;
            
            color: #ffffff;
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
            background-color: #ffdb4d;
        }

       /* Footer */
        .footer {
            
            text-align: center;
            padding: 15px;
            font-size: 14px;
            font-weight: bold;
            color: #ffffff;
        }
        
         .error-message {
            background-color: #f8d7da;
            color: #721c24;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 8px;
            border: 1px solid #f5c6cb;
            font-weight: bold;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
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
                <!-- <li class="nav-item"><a class="btn btn-custom ms-2" href="register.jsp">Register</a></li> -->
            </ul>
        </div>
    </div>
</nav><br><br><br>

    
      
 
   
    <div class="outer-container">
    <!-- Content Wrapper (Login Form) -->
    <div class="register-container">
        <h2 class="register-header">Register</h2>
        <% if (request.getParameter("error") != null) { %>
            <div class="alert alert-danger" role="alert"><%= request.getParameter("error") %></div>
        <% } %>
        <% if (request.getParameter("message") != null) { %>
            <div class="alert alert-success" role="alert"><%= request.getParameter("message") %></div>
        <% } %>
        
    <!-- Registration Form -->
    <form action="RegisterServlet" method="post">
        <div class="mb-2"><input type="text" name="name" class="form-control" placeholder="Full Name" required></div>
        <div class="mb-2"><input type="text" name="address" class="form-control" placeholder="Address" required></div>
         <div class="mb-2"><input type="text" name="nic" class="form-control" placeholder="NIC" required></div>
         <div class="mb-2"><input type="text" name="username" class="form-control" placeholder="Username" required></div>
        <div class="mb-2"><input type="password" name="password" class="form-control" placeholder="Password" required></div>
       <div class="mb-2"> <input type="password" name="confirmPassword" class="form-control" placeholder="Confirm Password" required></div>
        
       <div class="mb-2"> <select name="role" class="form-control" required>
            <option value="customer">Customer</option>
            <option value="driver">Driver</option>
        </select></div>
        
        <button type="submit" class="btn-custom1">Register</button>
    </form>

    <p class="mt-3 text-center" >Already have an account? <a href="login.jsp" style="color: #ffcc00; font-weight: bold;">Login here</a></p>
</div>
</div>

<footer class="footer mt-auto py-3 text-white text-center" style="background: rgba(255, 255, 255, 0.3);">
        <div class="container">
            <p style="color: #ffffff; font-weight: bold;">&copy; 2025 Mega City Cab Service | All Rights Reserved</p>
        </div>
    </footer>


 <script>
function validateForm() {
    let password = document.getElementById("password").value;
    let confirmPassword = document.getElementById("confirmPassword").value;
    let nic = document.getElementById("nic").value;
    let passwordError = document.getElementById("passwordError");
    let nicError = document.getElementById("nicError");

    passwordError.innerHTML = "";
    nicError.innerHTML = "";

    // Validate Confirm Password
    if (password !== confirmPassword) {
        passwordError.innerHTML = "Passwords do not match!";
        return false;
    }

    // Validate NIC format (Sri Lankan NIC Format: Old - 9 digits + 'V' or 'X', New - 12 digits)
    let nicPattern = /^(?:\d{9}[VX]|\d{12})$/;
    if (!nicPattern.test(nic)) {
        nicError.innerHTML = "Invalid NIC format! Enter a valid NIC.";
        return false;
    }

    return true;
}
</script>

<script>
    // Auto-hide alert messages after 5 seconds
    setTimeout(() => {
        let alerts = document.querySelectorAll('.alert');
        alerts.forEach(alert => {
            let fadeEffect = setInterval(() => {
                if (!alert.style.opacity) {
                    alert.style.opacity = 1;
                }
                if (alert.style.opacity > 0) {
                    alert.style.opacity -= 0.05;
                } else {
                    clearInterval(fadeEffect);
                    alert.remove();
                }
            }, 50);
        });
    }, 5000);
</script>


</body>
</html>
    
   
