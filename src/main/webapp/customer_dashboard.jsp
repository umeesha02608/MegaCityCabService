<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Customer Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2>Customer Dashboard</h2>
        <div class="list-group">
            <a href="book_cab.jsp" class="list-group-item list-group-item-action">Book a Cab</a>
            <a href="view_booking.jsp" class="list-group-item list-group-item-action">View Booking Details</a>
            <a href="view_billing_details.jsp" class="list-group-item list-group-item-action">View Billing Details</a>
            <a href="logout.jsp" class="list-group-item list-group-item-action text-danger">Logout</a>
        </div>
    </div>
</body>
</html>