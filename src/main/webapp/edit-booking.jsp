<%@ page import="com.cab.dao.BookingDAO" %>
<%@ page import="com.cab.model.Booking" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="bookingDAO" class="com.cab.dao.BookingDAO" />
<%@ page import="com.cab.dao.CarDAO" %>
<%@ page import="com.cab.model.Car" %>
<%@ page import="java.sql.*, java.util.*" %>

<%
    // Ensure only admin can access
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("admin")) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Fetch booking details
    String orderNumber = request.getParameter("orderNumber");
    Booking booking = bookingDAO.getBookingByOrderNumber(orderNumber);

    if (booking == null) {
        response.sendRedirect("admin_bookings.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Booking</title>
    
    <!-- ✅ Leaflet.js (For Map) -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <style>
        /* Overall page styling */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), 
                        url('Images/people-driving-cars-city-street.jpg') center/cover no-repeat;
            background-size: cover;
            color: #333;
            margin: 0;
            padding: 0;
        }

         h2 {
            text-align: center;
            color: #ffffff;
            margin-top: 20px;
            font-weight: bold;
        }

        .container {
            width: 40%;
            margin: 20px auto;
            background-color: rgba(255, 255, 255, 0.7);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        label {
            font-size: 16px;
            margin-top: 10px;
            display: block;
            text-align: left;
        }

        input[type="text"], input[type="date"], input[type="time"], input[type="submit"], input[type="button"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }

        input[type="text"]:focus, input[type="date"]:focus, input[type="time"]:focus {
            border-color: #4CAF50;
            outline: none;
        }

        button {
            padding: 10px 20px;
            background-color: #002147;
            color: #ffcc00;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #002140;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
        }

        a:hover {
            color: #45a049;
        }

        /* Map container styling */
        #map {
            width: 100%;
            height: 400px;
            margin-top: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        .form-section {
            text-align: left;
            margin-bottom: 15px;
        }
        
        .form-section1 {
            text-align: left;
            margin-bottom: 15px;
        }
        
        /* Style for the submit button */
        .update-button-container {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<script>
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
    
    
    <h2>Edit Booking - Order #<%= booking.getOrderNumber() %></h2>
    
    <div class="container">
        <form action="UpdateBookingServlet" method="post">
            <input type="hidden" name="orderNumber" value="<%= booking.getOrderNumber() %>">

            <div class="form-section">
                <label>Customer Name:</label>
                <input type="text" name="customerName" value="<%= booking.getCustomerName() %>" readonly>
            </div>

            <div class="form-section">
                <label>Telephone:</label>
                <input type="text" name="telephone" value="<%= booking.getTelephone() %>" required>
            </div>

            <div class="form-section">
                <label>Car Model:</label>
                <input type="text" name="model" value="<%= booking.getModel() %>" readonly>
            </div>

            <div class="form-section">
                <label>Driver Name:</label>
                <input type="text" name="driverName" value="<%= booking.getDriverName() %>" readonly>
            </div>

            <div id="map"></div>

            <div class="form-section">
                <label>Pickup Location:</label>
                <input type="text" id="pickupLocation" name="pickupLocation" required>
            </div>

            <div class="form-section">
                <label>Drop Location:</label>
                <input type="text" id="dropLocation" name="dropLocation" required>
            </div>

            <div class="form-section">
                <label for="distance">Distance (km):</label>
                <input type="text" id="distance" name="distance" required readonly>
            </div>
                
            <button type="button" onclick="calculateFare()">Calculate Fare</button>

            <div class="form-section">
                <label>Total Fare (LKR):</label>
                <input type="text" id="fare" name="fare" readonly>
            </div>

            <div class="form-section">
                <label for="bookingDate">Booking Date:</label>
                <input type="date" id="bookingDate" name="bookingDate" value="<%= booking.getBookingDate() %>" readonly>
            </div>

            <div class="form-section">
                <label for="bookingTime">Booking Time:</label>
                <input type="time" id="bookingTime" name="bookingTime" value="<%= booking.getBookingTime() %>" readonly>
            </div>

            <!-- Submit Button -->
            <div class="update-button-container">
                <input type="submit"  style = "background-color:  #002147; color: white;" value="Update Booking">
            </div>
        </form>

        <a href="admin_bookings.jsp" style = "color:  #002140">Back to Bookings</a>
    </div>

    <script>
        // ✅ Initialize Map (Using OpenStreetMap)
        var map = L.map('map').setView([6.9271, 79.8612], 12); // Default: Colombo, Sri Lanka

        // ✅ Load OpenStreetMap Tiles
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; OpenStreetMap contributors'
        }).addTo(map);

        var pickupMarker, dropMarker;
        var locations = [];

        // ✅ Click to Select Pickup & Drop Locations
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

                    // ✅ Allow Dragging of Pickup Marker
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

                    // ✅ Allow Dragging of Drop Marker
                    dropMarker.on("dragend", function(event) {
                        var newPos = event.target.getLatLng();
                        document.getElementById("dropLocation").value = newPos.lat.toFixed(6) + ", " + newPos.lng.toFixed(6);
                        locations[1] = [newPos.lat, newPos.lng];
                        updateDistance();
                    });

                    updateDistance(); // ✅ Calculate distance after drop selection
                }
            } else {
                // ✅ Reset Selection if Clicking Again
                locations = [];
                document.getElementById("pickupLocation").value = "";
                document.getElementById("dropLocation").value = "";
                document.getElementById("distance").value = "";
                if (pickupMarker) map.removeLayer(pickupMarker);
                if (dropMarker) map.removeLayer(dropMarker);
            }
        });

        // ✅ Function to Calculate Distance (Haversine Formula)
        function updateDistance() {
            if (locations.length === 2) {
                var distance = getDistance(locations[0], locations[1]);
                document.getElementById("distance").value = distance.toFixed(2);
            }
        }

        function getDistance(p1, p2) {
            var R = 6371; // Radius of Earth in km
            var dLat = (p2[0] - p1[0]) * Math.PI / 180;
            var dLon = (p2[1] - p1[1]) * Math.PI / 180;
            var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
                    Math.cos(p1[0] * Math.PI / 180) * Math.cos(p2[0] * Math.PI / 180) *
                    Math.sin(dLon/2) * Math.sin(dLon/2);
            var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
            return R * c; // Distance in km
        }
    </script>
    
</body>
</html>
