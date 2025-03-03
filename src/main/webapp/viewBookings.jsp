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
            <th>Actions</th> <!-- New Column -->
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
            <td><%= b.getStatus() %></td>
            <td>
                <% if (!b.getStatus().equals("Completed") && !b.getStatus().equals("Cancelled")) { %>
                    <form action="EditBookingServlet" method="post" style="display:inline;">
                        <input type="hidden" name="orderNumber" value="<%= b.getOrderNumber() %>">
                        <button type="submit">Edit</button>
                    </form>
                    <form action="CancelBookingServlet" method="post" style="display:inline;">
                        <input type="hidden" name="orderNumber" value="<%= b.getOrderNumber() %>">
                        <button type="submit" onclick="return confirm('Are you sure you want to cancel this booking?');">
                            Cancel
                        </button>
                    </form>
                <% } else { %>
                    <span>Not Editable</span>
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
