<%@ page import="com.cab.dao.UsersDAO, com.cab.model.Users, java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    UsersDAO usersDAO = new UsersDAO();
    List<Users> drivers = usersDAO.getAllDrivers();  // Fetch drivers from users table
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add New Car</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow-lg p-4">
            <h2 class="text-center text-primary">Add New Car</h2>
            <form action="CarServlet" method="post">
                <input type="hidden" name="action" value="add">

                <div class="mb-3">
                    <label class="form-label">Model:</label>
                    <input type="text" name="model" class="form-control" required placeholder="Enter car model">
                </div>

                <div class="mb-3">
                    <label class="form-label">Brand:</label>
                    <input type="text" name="brand" class="form-control" required placeholder="Enter car brand">
                </div>

                <div class="mb-3">
                    <label class="form-label">Plate Number:</label>
                    <input type="text" name="plateNumber" class="form-control" required placeholder="Enter plate number">
                </div>

                <div class="mb-3">
                    <label class="form-label">Assigned Driver:</label>
                    <select name="driverId" class="form-select" required>
                        <option value="">Select a Driver</option>
                        <% for (Users driver : drivers) { %>
                            <option value="<%= driver.getId() %>">
                                <%= driver.getName() %> (ID: <%= driver.getId() %>)
                            </option>
                        <% } %>
                    </select>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-success me-2">🚗 Add Car</button>
                    <a href="manage_cars.jsp" class="btn btn-outline-primary">📋 View Cars</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
