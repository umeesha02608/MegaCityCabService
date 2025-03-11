<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Customer Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script>
        function confirmLogout() {
            return confirm("Are you sure you want to log out?");
        }
    </script>
</head>
<body>
    <div class="container mt-4">
        <h2>Customer Dashboard</h2>
        <div class="list-group">
            <a href="book_cab.jsp" class="list-group-item list-group-item-action">Book a Cab</a>
            <a href="ViewBookingsServlet" class="list-group-item list-group-item-action">View Booking Details</a>
            <a href="index.jsp" class="list-group-item list-group-item-action text-danger" onclick="return confirmLogout();">Logout</a>
        </div>
    </div>
</body>
</html>
