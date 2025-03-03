<%@ page import="java.util.List" %>
<%@ page import="com.cab.dao.BookingDAO" %>
<%@ page import="com.cab.model.Booking" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="bookingDAO" class="com.cab.dao.BookingDAO" />

<%
    // Ensure only admin can access
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("admin")) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Fetch all bookings
    List<Booking> bookings = bookingDAO.getAllBookings();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin - Manage Bookings</title>
</head>
<body>
    <h2>All Bookings</h2>
    <table border="1">
        <tr>
            <th>Order Number</th>
            <th>Customer</th>
            <th>Pickup</th>
            <th>Drop</th>
            <th>Driver</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        <% for (Booking b : bookings) { %>
        <tr>
            <td><%= b.getOrderNumber() %></td>
            <td><%= b.getCustomerName() %></td>
            <td><%= b.getPickupLocation() %></td>
            <td><%= b.getDropLocation() %></td>
            <td><%= b.getDriverName() %></td>
            <td><%= b.getStatus() %></td>
            <td>
                
                <form action="DeleteBookingServlet" method="post" style="display:inline;">
                    <input type="hidden" name="orderNumber" value="<%= b.getOrderNumber() %>">
                    <input type="submit" value="Delete" onclick="return confirm('Are you sure?');">
                </form>
                
                <form action="UpdateBookingStatusServlet" method="post" style="display:inline;">
                    <input type="hidden" name="orderNumber" value="<%= b.getOrderNumber() %>">
                    <select name="status">
                        <option value="Pending" <%= b.getStatus().equals("Pending") ? "selected" : "" %>>Pending</option>
                        <option value="Accepted" <%= b.getStatus().equals("Accepted") ? "selected" : "" %>>Accepted</option>
                        <option value="Completed" <%= b.getStatus().equals("Completed") ? "selected" : "" %>>Completed</option>
                    </select>
                    <input type="submit" value="Update">
                </form>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>
