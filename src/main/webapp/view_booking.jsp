<%@ page import="java.util.List" %>
<%@ page import="com.cab.model.Booking" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Bookings</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .container {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Booking Details</h2>
        <table>
            <tr>
                <th>Order Number</th>
                <th>Customer Name</th>
                <th>Address</th>
                <th>Telephone</th>
                <th>Destination</th>
                <th>Booking Date</th>
                <th>Booking Time</th>
            </tr>
            <%
                List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
                if (bookings != null && !bookings.isEmpty()) {
                    for (Booking b : bookings) {
            %>
                <tr>
                    <td><%= b.getOrderNumber() %></td>
                    <td><%= b.getCustomerName() %></td>
                    <td><%= b.getAddress() %></td>
                    <td><%= b.getTelephone() %></td>
                    <td><%= b.getDestination() %></td>
                    <td><%= b.getBookingDate() %></td>
                    <td><%= b.getBookingTime() %></td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="7">No bookings available.</td>
                </tr>
            <%
                }
            %>
        </table>
        <br>
        <a href="book_cab.jsp">Back to Booking</a>
    </div>
</body>
</html>

