<%@ page import="java.util.List" %>
<%@ page import="com.cab.dao.BookingDAO" %>
<%@ page import="com.cab.model.Booking" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:useBean id="bookingDAO" class="com.cab.dao.BookingDAO" />

<%
    // Ensure only the driver can access
    String role = (String) session.getAttribute("role");
    String driverName = (String) session.getAttribute("username");

    if (role == null || !role.equals("driver")) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Fetch customer details assigned to this driver
    List<Booking> customers = bookingDAO.getCustomerDetailsForDriver(driverName);
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Customer Details</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2>Customer Details</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Telephone</th>
                    <th>Pickup Location</th>
                    <th>Drop Location</th>
                    <th>Booking Date</th>
                    <th>Booking Time</th>
                </tr>
            </thead>
            <tbody>
                <% for (Booking customer : customers) { %>
                <tr>
                    <td><%= customer.getCustomerName() %></td>
                    <td><%= customer.getAddress() %></td>
                    <td><%= customer.getTelephone() %></td>
                    <td><%= customer.getPickupLocation() %></td>
                    <td><%= customer.getDropLocation() %></td>
                    <td><%= customer.getBookingDate() %></td>
                    <td><%= customer.getBookingTime() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>

