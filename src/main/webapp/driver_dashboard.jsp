<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Driver Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2>Driver Dashboard</h2>
        <div class="list-group">
            <a href="DriverBookingsServlet" class="list-group-item list-group-item-action">View Assigned Bookings</a>
            <a href="update_ride_status.jsp" class="list-group-item list-group-item-action">Update Ride Status</a>
            <a href="view_customer_details.jsp" class="list-group-item list-group-item-action">View Customer Details</a>
            <a href="logout.jsp" class="list-group-item list-group-item-action text-danger">Logout</a>
        </div>
    </div>
</body>
</html>