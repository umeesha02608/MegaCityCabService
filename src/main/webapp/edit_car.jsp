<%@ page import="com.cab.dao.CarDAO, com.cab.model.Car" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    CarDAO carDAO = new CarDAO();
    Car car = carDAO.getCarById(id);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Car</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js"></script>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow-lg p-4">
            <h2 class="text-center text-primary"> Edit Car Details</h2>
            <form action="CarServlet" method="post">
                <input type="hidden" name="action" value="edit">
                <input type="hidden" name="id" value="<%= car.getId() %>">
                
                <div class="mb-3">
                    <label class="form-label">Model</label>
                    <input type="text" name="model" value="<%= car.getModel() %>" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Brand</label>
                    <input type="text" name="brand" value="<%= car.getBrand() %>" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Plate Number</label>
                    <input type="text" name="plateNumber" value="<%= car.getPlateNumber() %>" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Status</label>
                    <select name="status" class="form-select" required>
                        <option value="Available" <%= car.getStatus().equals("Available") ? "selected" : "" %>>Available</option>
                        <option value="Unavailable" <%= car.getStatus().equals("Unavailable") ? "selected" : "" %>>Unavailable</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label">Driver ID</label>
                    <input type="text" name="driverId" value="<%= car.getDriverId() %>" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Driver Name</label>
                    <input type="text" name="driverName" value="<%= car.getDriverName() %>" class="form-control" readonly>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Update Car
                    </button>
                    <a href="manage_cars.jsp" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i> Back
                    </a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
