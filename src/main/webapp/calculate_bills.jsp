<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.cab.dao.BookingDAO" %>
<%@ page import="com.cab.model.Booking" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calculate and Print Bills</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script>
        function printBill(OrderNumber) {
            var printContents = document.getElementByOrderNumber('bill-' + OrderNumber).innerHTML;
            var originalContents = document.body.innerHTML;
            document.body.innerHTML = printContents;
            window.print();
            document.body.innerHTML = originalContents;
        }
    </script>
</head>
<body>
    <div class="container mt-4">
        <h2>Calculate and Print Bills</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Order Number</th>
                    <th>Customer Name</th>
                    <th>Pickup Location</th>
                    <th>Drop Location</th>
                    <th>Distance (km)</th>
                    <th>Fare (LKR)</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    BookingDAO bookingDAO = new BookingDAO();
                    List<Booking> bookings = bookingDAO.getAllBookings();
                    for (Booking booking : bookings) {
                        double baseFare = 100;
                        double perKmRate = 50;
                        double totalFare = baseFare + (perKmRate * booking.getDistance());
                %>
                <tr>
                    <td><%= booking.getOrderNumber() %></td>
                    <td><%= booking.getCustomerName() %></td>
                    <td><%= booking.getPickupLocation() %></td>
                    <td><%= booking.getDropLocation() %></td>
                    <td><%= booking.getDistance() %></td>
                    <td><%= String.format("%.2f", totalFare) %></td>
                    <td>
					    <a href="print_bill.jsp?orderNumber=<%= booking.getOrderNumber() %>" class="btn btn-primary">Print Bill</a>
					</td>
					                </tr>
                <tr id="bill-<%= booking.getOrderNumber() %>" style="display:none;">
                    <td colspan="7">
                        <div style="border:1px solid #000; padding:20px; width:50%; margin:auto; text-align:center;">
                            <h3>Mega City Cab Service</h3>
                            <p><strong>Order Number:</strong> <%= booking.getOrderNumber() %></p>
                            <p><strong>Customer Name:</strong> <%= booking.getCustomerName() %></p>
                            <p><strong>Pickup Location:</strong> <%= booking.getPickupLocation() %></p>
                            <p><strong>Drop Location:</strong> <%= booking.getDropLocation() %></p>
                            <p><strong>Distance:</strong> <%= booking.getDistance() %> km</p>
                            <p><strong>Total Fare:</strong> LKR <%= String.format("%.2f", totalFare) %></p>
                            <p><strong>Date:</strong> <%= booking.getBookingDate() %></p>
                            <p><strong>Thank you for choosing Mega City Cab Service!</strong></p>
                        </div>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
