<%@ page import="java.util.List, com.cab.dao.CarDAO, com.cab.model.Car" %>
<%
    CarDAO carDAO = new CarDAO();
    List<Car> carList = carDAO.getAllCars();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Manage Cars</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js"></script>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow-lg p-4">
            <h2 class="text-center text-primary">Manage Cars</h2>

            <div class="text-end mb-3">
                <a href="add_cars.jsp" class="btn btn-success"><i class="fas fa-plus"></i> Add New Car</a>
            </div>

            <table class="table table-striped table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Model</th>
                        <th>Brand</th>
                        <th>Plate Number</th>
                        <th>Status</th>
                        <th>Driver ID</th>
                        <th>Driver Name</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Car car : carList) { %>
                    <tr>
                        <td><%= car.getId() %></td>
                        <td><%= car.getModel() %></td>
                        <td><%= car.getBrand() %></td>
                        <td><%= car.getPlateNumber() %></td>
                        <td>
                            <% if ("Available".equalsIgnoreCase(car.getStatus())) { %>
                                <span class="badge bg-success">Available</span>
                            <% } else { %>
                                <span class="badge bg-danger">Unavailable</span>
                            <% } %>
                        </td>
                        <td><%= car.getDriverId() %></td>  
                        <td><%= car.getDriverName() %></td>
                        <td>
                            <a href="edit_car.jsp?id=<%= car.getId() %>" class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Edit</a>
                            <a href="CarServlet?action=delete&id=<%= car.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this car?');">
                                <i class="fas fa-trash"></i> Delete
                            </a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
