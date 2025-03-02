<%@ page import="java.util.List" %>
<%@ page import="com.cab.model.Booking" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<html>
<head>
    <title>Driver Assigned Bookings</title>
    <style>
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid black; padding: 10px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h2>My Assigned Bookings</h2>
    <table>
        <tr>
            <th>Order Number</th>
            <th>Customer Name</th>
            <th>Pickup Location</th>
            <th>Drop Location</th>
            <th>Booking Date</th>
            <th>Booking Time</th>
            <th>Status</th>
        </tr>
        <%
            List<Booking> driverBookings = (List<Booking>) request.getAttribute("driverBookings");
            if (driverBookings != null && !driverBookings.isEmpty()) {
                for (Booking booking : driverBookings) {
        %>
        <tr>
            <td><%= booking.getOrderNumber() %></td>
            <td><%= booking.getCustomerName() %></td>
            <td><%= booking.getPickupLocation() %></td>
            <td><%= booking.getDropLocation() %></td>
            <td><%= booking.getBookingDate() %></td>
            <td><%= booking.getBookingTime() %></td>
            <td><%= booking.getStatus() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="7">No bookings assigned to you.</td>
        </tr>
        <% } %>
    </table>
    
    <a href="DriverBookingsServlet">View My Assigned Bookings</a>
    
</body>
</html>
