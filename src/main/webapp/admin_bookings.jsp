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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Manage Bookings</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .container {
            margin-top: 50px;
        }

        .header-title {
            color: #4e73df;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        .table-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        table {
            border-radius: 5px;
            overflow: hidden;
        }

        .table th {
            background-color: #4e73df;
            color: white;
            text-align: center;
        }

        .table tbody tr:hover {
            background-color: #f1f1f1;
        }

        .btn-custom {
            background-color: #4e73df;
            color: white;
            font-weight: bold;
            border-radius: 5px;
            padding: 6px 12px;
            border: none;
        }

        .btn-custom:hover {
            background-color: #2e59d9;
        }

        .status-select {
            border: 1px solid #ced4da;
            padding: 4px;
            border-radius: 5px;
            cursor: pointer;
        }

        .action-buttons form {
            display: inline-block;
            margin-right: 5px;
        }

        .edit-btn {
            color: #28a745;
            font-weight: bold;
            text-decoration: none;
        }

        .delete-btn {
            color: #dc3545;
            font-weight: bold;
            text-decoration: none;
        }

        .edit-btn:hover {
            text-decoration: underline;
            color: #218838;
        }

        .delete-btn:hover {
            text-decoration: underline;
            color: #c82333;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="header-title">Manage Bookings</h2>

    <div class="table-container">
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Order #</th>
                    <th>Customer</th>
                    <th>Phone</th>
                    <th>Driver</th>
                    <th>Car Model</th>
                    <th>Pickup</th>
                    <th>Drop</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (Booking b : bookings) { %>
                <tr>
                    <td class="text-center"><%= b.getOrderNumber() %></td>
                    <td><%= b.getCustomerName() %></td>
                    <td><%= b.getTelephone() %></td>
                    <td><%= b.getDriverName() %></td>
                    <td><%= b.getModel() %></td>
                    <td><%= b.getPickupLocation() %></td>
                    <td><%= b.getDropLocation() %></td>
                    <td class="text-center"><%= b.getBookingDate() %></td>
                    <td class="text-center"><%= b.getBookingTime() %></td>
                    
                    <td class="text-center">
                        <form action="UpdateBookingStatusServlet" method="post" class="d-inline">
                            <input type="hidden" name="orderNumber" value="<%= b.getOrderNumber() %>">
                            <select name="status" class="status-select" 
                                <%= (b.getStatus().equals("Accepted") || b.getStatus().equals("Completed")) ? "disabled" : "" %>>
                                <option value="Pending" <%= "Pending".equals(b.getStatus()) ? "selected" : "" %>>Pending</option>
                                <option value="Accepted" <%= "Accepted".equals(b.getStatus()) ? "selected" : "" %>>Accepted</option>
                                <option value="Completed" <%= "Completed".equals(b.getStatus()) ? "selected" : "" %>>Completed</option>
                            </select>
                            <button type="submit" class="btn btn-sm btn-custom" 
                                <%= (b.getStatus().equals("Accepted") || b.getStatus().equals("Completed")) ? "disabled" : "" %>>Update</button>
                        </form>
                    </td>
                    
                    <td class="text-center action-buttons">
                        <form action="edit-booking.jsp" method="get">
                            <input type="hidden" name="orderNumber" value="<%= b.getOrderNumber() %>">
                            <button type="submit" class="btn btn-sm btn-success">Edit</button>
                        </form>
                        <form action="DeleteBookingServlet" method="post" onsubmit="return confirm('Are you sure?');">
                            <input type="hidden" name="orderNumber" value="<%= b.getOrderNumber() %>">
                            <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
