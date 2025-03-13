<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.cab.dao.BookingDAO" %>
<%@ page import="com.cab.model.Booking" %>
<%@ page import="com.cab.db.DBConnection" %>

<%
    String orderNumber = request.getParameter("orderNumber");
    Booking booking = null;

    if (orderNumber != null && !orderNumber.isEmpty()) {
        Connection conn = DBConnection.getConnection();
        BookingDAO bookingDAO = new BookingDAO();
        booking = bookingDAO.getBookingByOrderNumber(orderNumber);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Print Bill - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .bill-container {
            max-width: 500px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .bill-header {
            font-size: 22px;
            font-weight: bold;
            color: #007bff;
            margin-bottom: 15px;
        }
        .bill-details p {
            font-size: 16px;
            margin: 5px 0;
        }
    </style>
    <script>
        function downloadPDF() {
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF();

            doc.setFontSize(18);
            doc.text("Mega City Cab Service", 65, 20);

            doc.setFontSize(12);
            doc.text("Order Number: <%= booking.getOrderNumber() %>", 20, 40);
            doc.text("Customer Name: <%= booking.getCustomerName() %>", 20, 50);
            doc.text("Pickup Location: <%= booking.getPickupLocation() %>", 20, 60);
            doc.text("Drop Location: <%= booking.getDropLocation() %>", 20, 70);
            doc.text("Distance: <%= booking.getDistance() %> km", 20, 80);
            doc.text("Total Fare: LKR <%= String.format("%.2f", booking.getFare()) %>", 20, 90);
            doc.text("Date: <%= booking.getBookingDate() %>", 20, 100);
            doc.text("Thank you for choosing Mega City Cab Service!", 20, 120);

            doc.save("Cab_Bill_<%= booking.getOrderNumber() %>.pdf");
        }
    </script>
</head>
<body>
    <div class="container mt-5">
        <% if (booking != null) { %>
            <div class="bill-container">
                <div class="bill-header">Mega City Cab Service</div>
                <div class="bill-details">
                    <p><strong>Order Number:</strong> <%= booking.getOrderNumber() %></p>
                    <p><strong>Customer Name:</strong> <%= booking.getCustomerName() %></p>
                    <p><strong>Pickup Location:</strong> <%= booking.getPickupLocation() %></p>
                    <p><strong>Drop Location:</strong> <%= booking.getDropLocation() %></p>
                    <p><strong>Distance:</strong> <%= booking.getDistance() %> km</p>
                    <p><strong>Total Fare:</strong> LKR <%= String.format("%.2f", booking.getFare()) %></p>
                    <p><strong>Date:</strong> <%= booking.getBookingDate() %></p>
                    <p><strong>Thank you for choosing Mega City Cab Service!</strong></p>
                </div>
                <button class="btn btn-primary mt-3" onclick="downloadPDF()">Download PDF</button>
            </div>
        <% } else { %>
            <div class="alert alert-danger text-center">No booking found for this order number.</div>
        <% } %>
    </div>
</body>
</html>

