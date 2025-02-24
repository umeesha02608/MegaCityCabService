<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Book a Cab</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h2>Book a Cab</h2>
        <form action="BookCabServlet" method="post">
            <label for="customerName">Customer Name:</label>
            <input type="text" id="customerName" name="customerName" required>

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>

            <label for="telephone">Telephone:</label>
            <input type="text" id="telephone" name="telephone" required>

            <label for="destination">Destination:</label>
            <input type="text" id="destination" name="destination" required>

            <button type="submit">Book Now</button>
        </form>
<a href="ViewBookingsServlet"><button>View All Bookings</button></a>

        <% if (request.getAttribute("message") != null) { %>
            <p class="success"><%= request.getAttribute("message") %></p>
            <p>Booking Date: <%= request.getAttribute("bookingDate") %></p>
            <p>Booking Time: <%= request.getAttribute("bookingTime") %></p>
        <% } %>

        <% if (request.getAttribute("error") != null) { %>
            <p class="error"><%= request.getAttribute("error") %></p>
        <% } %>
    </div>
</body>
</html>   

