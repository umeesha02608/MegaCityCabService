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
        #map {
            width: 100%;
            height: 400px;
            margin-top: 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .container {
            width: 50%;
            margin: auto;
            text-align: center;
        }
    </style>
    
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
</head>
<body>
    <h2>Edit Booking - Order #<%= booking.getOrderNumber() %></h2>
    <form action="UpdateBookingServlet" method="post">
        <input type="hidden" name="orderNumber" value="<%= booking.getOrderNumber() %>">

        <label>Customer Name:</label>
        <input type="text" name="customerName" value="<%= booking.getCustomerName() %>" readonly><br>
        
        <label>Telephone:</label>
        <input type="text" name="telephone" value="<%= booking.getTelephone() %>" required><br>
        
        <label> Car Model:</label>
        <input type="text" name="model" value="<%= booking.getModel() %>" readonly><br> 
            
        <label>Driver Name:</label>
        <input type="text" name="driverName" value="<%= booking.getDriverName() %>" readonly><br>

        <label>Pickup Location:</label>
        <input type="text" id="pickupLocation" name="pickupLocation" required><br>

        <label>Drop Location:</label>
        <input type="text" id="dropLocation" name="dropLocation" required><br>
        
        <label for="distance">Distance (km):</label>
        <input type="text" id="distance" name="distance" required readonly><br>
            
        <button type="button" onclick="calculateFare()">Calculate Fare</button><br>

        <label>Total Fare (LKR):</label>
        <input type="text" id="fare" name="fare" readonly><br>
            
        <label for="bookingDate">Booking Date:</label>
        <input type="date" id="bookingDate" name="bookingDate" value="<%= booking.getBookingDate() %>" readonly>

        <label for="bookingTime">Booking Time:</label>
        <input type="time" id="bookingTime" name="bookingTime" value="<%= booking.getBookingTime() %>" readonly>

        <input type="submit" value="Update Booking">
    </form>

    <br>
    <a href="admin_bookings.jsp">Back to Bookings</a>
    
    <div id="map"></div>
    
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
