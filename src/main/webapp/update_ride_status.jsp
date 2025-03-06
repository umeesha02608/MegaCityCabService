<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.cab.dao.BookingDAO, com.cab.model.Booking" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Update Ride Status</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2>Update Ride Status</h2>
        
        <%
            HttpSession sessionObj = request.getSession();
            String driverName = (String) sessionObj.getAttribute("username");

            BookingDAO bookingDAO = new BookingDAO();
            List<Booking> driverBookings = bookingDAO.getBookingsByDriver(driverName);
        %>

        <form action="UpdateRideStatusServlet" method="post">
            <div class="mb-3">
                <label for="orderNumber" class="form-label">Select Booking:</label>
                <select name="orderNumber" class="form-control" required>
                    <option value="">-- Select Booking --</option>
                    <% for (Booking booking : driverBookings) { %>
                        <% if (!booking.getStatus().equals("Completed") && !booking.getStatus().equals("Cancelled")) { %>
                            <option value="<%= booking.getOrderNumber() %>">
                                <%= booking.getOrderNumber() %> - <%= booking.getPickupLocation() %> to <%= booking.getDropLocation() %> (Status: <%= booking.getStatus() %>)
                            </option>
                        <% } %>
                    <% } %>
                </select>
            </div>

            <div class="mb-3">
                <label for="status" class="form-label">Update Status:</label>
                <select name="status" class="form-control" required>
                    <option value="">-- Select Status --</option>
                    <option value="Ongoing">Ongoing</option>
                    <option value="Completed">Completed</option>
                    <option value="Cancelled">Cancelled</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Update Status</button>
        </form>
    </div>
</body>
</html>
