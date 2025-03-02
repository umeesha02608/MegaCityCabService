<%@ page import="java.util.List" %>
<%@ page import="com.cab.model.Booking" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Bookings</title>
</head>
<body>
    <h2>Your Bookings</h2>
    <table border="1">
        <tr>
            <th>Order Number</th>
            <th>Pickup Location</th>
            <th>Drop Location</th>
            <th>Distance (km)</th>
            <th>Fare (LKR)</th>
            <th>Booking Date</th>
            <th>Booking Time</th>
            <th>Status</th>
        </tr>
        <%
            List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
            if (bookings != null && !bookings.isEmpty()) {
                for (Booking b : bookings) {
        %>
        <tr>
            <td><%= b.getOrderNumber() %></td>
            <td><%= b.getPickupLocation() %></td>
            <td><%= b.getDropLocation() %></td>
            <td><%= b.getDistance() %></td>
            <td><%= b.getFare() %></td>
            <td><%= b.getBookingDate() %></td>
            <td><%= b.getBookingTime() %></td>
            <td><%= b.getStatus() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="8">No bookings found.</td>
        </tr>
        <% } %>
    </table>
</body>
</html>
