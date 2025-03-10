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
            <th>Car Model</th>
            <th>Driver Name</th>
            <th>Pickup Location</th>
            <th>Drop Location</th>
            <th>Distance (km)</th>
            <th>Fare (LKR)</th>
            <th>Date</th>
            <th>Time</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        <%
            List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
            if (bookings != null && !bookings.isEmpty()) {
                for (Booking b : bookings) {
        %>
        <tr>
            <td><%= b.getOrderNumber() %></td>
            <td><%= b.getModel() %></td>
            <td><%= b.getDriverName() %></td>
            <td><%= b.getPickupLocation() %></td>
            <td><%= b.getDropLocation() %></td>
            <td><%= b.getDistance() %></td>
            <td><%= b.getFare() %></td>
            <td><%= b.getBookingDate() %></td>
            <td><%= b.getBookingTime() %></td>
            <td><%= b.getStatus() != null ? b.getStatus() : "Pending" %></td>
            <td>
                <% if ("Completed".equals(b.getStatus())) { %>
                    <form action="payment.jsp" method="get">
                        <input type="hidden" name="orderNumber" value="<%= b.getOrderNumber() %>">
                        <input type="hidden" name="fare" value="<%= b.getFare() %>">
                        <button type="submit">Make Payment</button>
                    </form>
                <% } else { %>
                    <span>N/A</span>
                <% } %>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="11">No bookings found.</td>
        </tr>
        <% } %>
    </table>
</body>
</html>
