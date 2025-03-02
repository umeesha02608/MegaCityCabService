<%@ page import="java.util.List" %>
<%@ page import="com.cab.dao.BookingDAO" %>
<%@ page import="com.cab.model.Booking" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="bookingDAO" class="com.cab.dao.BookingDAO" />

<%
    // Get logged-in driver name
    HttpSession sess = request.getSession(false);
    String driverName = (sess != null) ? (String) sess.getAttribute("user") : null;

    if (driverName == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Fetch bookings assigned to this driver
    List<Booking> bookings = bookingDAO.getBookingsByDriver(driverName);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Driver Bookings</title>
</head>
<body>
    <h2>Assigned Bookings</h2>
    <table border="1">
        <tr>
            <th>Order Number</th>
            <th>Pickup Location</th>
            <th>Drop Location</th>
            <th>Customer Name</th>
            <th>Booking Date</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <% for (Booking b : bookings) { %>
        <tr>
            <td><%= b.getOrderNumber() %></td>
            <td><%= b.getPickupLocation() %></td>
            <td><%= b.getDropLocation() %></td>
            <td><%= b.getCustomerName() %></td>
            <td><%= b.getBookingDate() %></td>
            <td><%= b.getStatus() %></td>
            <td>
                <% if (!b.getStatus().equals("Accepted")) { %>
                    <form action="AcceptBookingServlet" method="post">
                        <input type="hidden" name="orderNumber" value="<%= b.getOrderNumber() %>">
                        <input type="submit" value="Accept">
                    </form>
                <% } else { %>
                    Accepted
                <% } %>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>
