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
            <th>Telephone</th>
            <th>Driver</th>
            <th>Car Model</th>
            <th>Pickup</th>
            <th>Drop</th>
            <th>Booking Date</th>
            <th>Booking Time</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        <% for (Booking b : bookings) { %>
        <tr>
            <td><%= b.getOrderNumber() %></td>
            <td><%= b.getCustomerName() %></td>
            <td><%= b.getTelephone() %></td>
            <td><%= b.getDriverName() %></td>
            <td><%= b.getModel() %></td>
            <td><%= b.getPickupLocation() %></td>
            <td><%= b.getDropLocation() %></td>
            <td><%= b.getBookingDate() %></td>
            <td><%= b.getBookingTime() %></td>
            
            <td>
                <% 
                    String status = (b.getStatus() != null) ? b.getStatus() : "Pending"; 
                    boolean disableAdminUpdate = status.equals("Accepted") || status.equals("Completed"); 
                %>
                <form action="UpdateBookingStatusServlet" method="post" style="display:inline;">
                    <input type="hidden" name="orderNumber" value="<%= b.getOrderNumber() %>">
                    <select name="status" <%= disableAdminUpdate ? "disabled" : "" %>>
                        <option value="Pending" <%= "Pending".equals(status) ? "selected" : "" %>>Pending</option>
                        <option value="Accepted" <%= "Accepted".equals(status) ? "selected" : "" %>>Accepted</option>
                        <option value="Completed" <%= "Completed".equals(status) ? "selected" : "" %>>Completed</option>
                    </select>
                    <input type="submit" value="Update" <%= disableAdminUpdate ? "disabled" : "" %>>
                </form>
            </td>
            <td>
                <!-- Delete Booking -->
                <form action="DeleteBookingServlet" method="post" style="display:inline;">
                    <input type="hidden" name="orderNumber" value="<%= b.getOrderNumber() %>">
                    <input type="submit" value="Delete" onclick="return confirm('Are you sure?');">
                </form>
                
                <!-- Edit Booking -->
                <form action="edit-booking.jsp" method="get" style="display:inline;">
                    <input type="hidden" name="orderNumber" value="<%= b.getOrderNumber() %>">
                    <input type="submit" value="Edit">
                </form>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>
