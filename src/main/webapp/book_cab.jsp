<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.cab.dao.CarDAO" %>
<%@ page import="com.cab.model.Car" %>

<% if (request.getAttribute("successMessage") != null) { %>
    <script>
        alert("<%= request.getAttribute("successMessage") %>");
    </script>
<% } %>

<!DOCTYPE html>
<html>
<head>
    <title>Book a Cab</title>
    
    
    <!-- Leaflet.js (For Map) -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    
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

       
		.container1 {
		    width: 100%;
		    max-width: 500px;
		    margin: 20px auto;
		    background-color: rgba(255, 255, 255, 0.4);
		    padding: 20px;
		    border-radius: 10px;
		    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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

		
		h2 {
		    color: #333;
		    margin-bottom: 20px;
		    font-size: 24px;
		}
		
		form {
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		}
		
		label {
		    width: 100%;
		    text-align: left;
		    font-weight: bold;
		    margin: 10px 0 5px;
		    color: #555;
		}
		
		input, select {
		    width: 90%;
		    padding: 10px;
		    margin-bottom: 10px;
		    border: 1px solid #ddd;
		    border-radius: 5px;
		    font-size: 16px;
		}
		
		button {
		    background-color: #002147;
		    color: #fff;
		    border: none;
		    padding: 12px 15px;
		    margin-top: 10px;
		    width: 100%;
		    font-size: 16px;
		    cursor: pointer;
		    border-radius: 5px;
		    transition: 0.3s ease;
		}
		
		button:hover {
		    background-color: #0056b3;
		}
		
		.error {
		    color: red;
		    font-size: 14px;
		    margin-top: 10px;
		}
		
		.logout-btn {
            background-color: #dc3545;
            color: white;
        }

        .logout-btn:hover {
            background-color: #c82333;
        }
		
		#map {
		    width: 90%;
		    height: 300px;
		    margin: 20px auto;
		    border-radius: 10px;
		    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
		}
		
		table {
		    width: 100%;
		    border-collapse: collapse;
		    margin-top: 20px;
		    background: #fff;
		    border-radius: 8px;
		    overflow: hidden;
		}
		
		th, td {
		    border: 1px solid #ddd;
		    padding: 12px;
		    text-align: left;
		}
		
		th {
		    background-color: #007bff;
		    color: white;
		}
		
		a button {
		    background-color: #002147;
		    margin-top: 15px;
		}
		
		a button:hover {
		    background-color: #0056b3;
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
        function updateDriver() {
            var carDropdown = document.getElementById("Model");
            var driverNameField = document.getElementById("driverName");
            var selectedOption = carDropdown.options[carDropdown.selectedIndex];
            driverNameField.value = selectedOption.getAttribute("data-driver");
        }
        
        function calculateFare() {
            let distance = parseFloat(document.getElementById("distance").value);
            if (isNaN(distance) || distance <= 0) {
                alert("Please select valid locations on the map to calculate fare.");
                return;
            }
            let baseFare = 100;
            let perKmRate = 50;
            let totalFare = baseFare + (perKmRate * distance);
            document.getElementById("fare").value = totalFare.toFixed(2);
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
                
                 <li class="nav-item">
				    <a class="btn logout-btn ms-2" href="#" onclick="confirmLogout(event);">Logout</a>
				</li>
            </ul>
        </div>
    </div>
</nav>
<div class="container1">
    <h2 style = "text-align: center; color: #002147; font-weight: bold">Book a Cab</h2>
    <form action="BookCabServlet" method="post">
        <input type="text" id="customerName" name="customerName" 
               placeholder="Customer Name" value="<%= session.getAttribute("customerName") %>" readonly>

        <input type="text" id="address" name="address" 
               placeholder="Address" value="<%= session.getAttribute("address") %>" readonly>

        <input type="text" id="telephone" name="telephone" 
               placeholder="Telephone" required>

        <select id="Model" name="Model" onchange="updateDriver()" required>
            <option value="">-- Select a Car --</option>
            <%
                List<Car> cars = new CarDAO().getAllCars();
                for (Car car : cars) {
            %>
                <option value="<%= car.getModel() %>" data-driver="<%= car.getDriverName() %>">
                    <%= car.getModel() %> - <%= car.getPlateNumber() %>
                </option>
            <%
                }
            %>
        </select>

        <input type="text" id="driverName" name="driverName" placeholder="Assigned Driver" readonly>

        <!-- Map for Pickup & Drop Locations -->
        <div id="map"></div>

        <input type="text" id="pickupLocation" name="pickupLocation" placeholder="Pickup Location" required>

        <input type="text" id="dropLocation" name="dropLocation" placeholder="Drop Location" required>

        <input type="text" id="distance" name="distance" placeholder="Distance (km)" readonly>
        
        <button type="button" onclick="calculateFare()">Calculate Fare</button><br>

        <input type="text" id="fare" name="fare" placeholder="Total Fare (LKR)" readonly>
        
        <input type="date" id="bookingDate" name="bookingDate" required>

        <input type="time" id="bookingTime" name="bookingTime" required>
        
        <input type="text" name="status" value="Pending" readonly>

        <button type="submit">Book Now</button>
        
        <a href="customer_dashboard.jsp">
    <button type="button" class="btn btn-secondary mt-2">Back</button>
</a>
    </form>

    <% if (request.getAttribute("error") != null) { %>
        <p class="error"><%= request.getAttribute("error") %></p>
    <% } %>

    <a href="ViewBookingsServlet"><button>View All Bookings</button></a>
</div>
    
    
    <script>
        // Initialize Map (Using OpenStreetMap)
        var map = L.map('map').setView([6.9271, 79.8612], 12); // Default: Colombo, Sri Lanka

        // Load OpenStreetMap Tiles
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; OpenStreetMap contributors'
        }).addTo(map);

        var pickupMarker, dropMarker;
        var locations = [];

        // Click to Select Pickup & Drop Locations
        map.on('click', function(e) {
            var lat = e.latlng.lat.toFixed(6);
            var lng = e.latlng.lng.toFixed(6);
            var location = lat + ", " + lng;

            if (locations.length < 2) {
                locations.push([lat, lng]);

                if (locations.length === 1) {
                    document.getElementById("pickupLocation").value = location;
                    if (pickupMarker) map.removeLayer(pickupMarker);
                    pickupMarker = L.marker([lat, lng], { draggable: true }).addTo(map)
                        .bindPopup("Pickup Location").openPopup();

                    // Allow Dragging of Pickup Marker
                    pickupMarker.on("dragend", function(event) {
                        var newPos = event.target.getLatLng();
                        document.getElementById("pickupLocation").value = newPos.lat.toFixed(6) + ", " + newPos.lng.toFixed(6);
                        locations[0] = [newPos.lat, newPos.lng];
                        updateDistance();
                    });

                } else {
                    document.getElementById("dropLocation").value = location;
                    if (dropMarker) map.removeLayer(dropMarker);
                    dropMarker = L.marker([lat, lng], { draggable: true }).addTo(map)
                        .bindPopup("Drop Location").openPopup();

                    // Allow Dragging of Drop Marker
                    dropMarker.on("dragend", function(event) {
                        var newPos = event.target.getLatLng();
                        document.getElementById("dropLocation").value = newPos.lat.toFixed(6) + ", " + newPos.lng.toFixed(6);
                        locations[1] = [newPos.lat, newPos.lng];
                        updateDistance();
                    });

                    updateDistance(); // Calculate distance after drop selection
                }
            } else {
                // Reset Selection if Clicking Again
                locations = [];
                document.getElementById("pickupLocation").value = "";
                document.getElementById("dropLocation").value = "";
                document.getElementById("distance").value = "";
                if (pickupMarker) map.removeLayer(pickupMarker);
                if (dropMarker) map.removeLayer(dropMarker);
            }
        });

        function updateDistance() {
            if (locations.length === 2) {
                var lat1 = locations[0][0];
                var lng1 = locations[0][1];
                var lat2 = locations[1][0];
                var lng2 = locations[1][1];

                // Calculate Distance using Haversine Formula
                var R = 6371; // Radius of Earth in km
                var dLat = (lat2 - lat1) * Math.PI / 180;
                var dLon = (lng2 - lng1) * Math.PI / 180;
                var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                        Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) *
                        Math.sin(dLon / 2) * Math.sin(dLon / 2);
                var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
                var distance = R * c;
                document.getElementById("distance").value = distance.toFixed(2);
            }
        }
    </script>
    
    <!-- Footer -->
    <footer class="footer mt-auto py-3 text-white text-center" style="background: rgba(255, 255, 255, 0.3);">
        <div class="container">
            <p style="color: #ffffff; font-weight: bold;">&copy; 2025 Mega City Cab Service | All Rights Reserved</p>
        </div>
    </footer>
</body>
</html>
