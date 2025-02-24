<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2>Admin Dashboard</h2>
        <div class="list-group">
            <a href="manage_users.jsp" class="list-group-item list-group-item-action">Manage Users</a>
            <a href="manage_bookings.jsp" class="list-group-item list-group-item-action">Manage Customer Bookings</a>
            <a href="calculate_bills.jsp" class="list-group-item list-group-item-action">Calculate and Print Bills</a>
            <a href="manage_cars.jsp" class="list-group-item list-group-item-action">Manage Cars</a>
            <a href="help.jsp" class="list-group-item list-group-item-action">Help</a>
            <a href="logout.jsp" class="list-group-item list-group-item-action text-danger">Logout</a>
        </div>
    </div>
</body>
</html>
