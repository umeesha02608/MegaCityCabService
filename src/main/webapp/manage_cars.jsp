<%@ page import="java.util.List, com.cab.dao.CarDAO, com.cab.model.Car" %>
<%
    CarDAO carDAO = new CarDAO();
    List<Car> carList = carDAO.getAllCars();
%>
<table border="1">
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
    <% for (Car car : carList) { %>
    <tr>
        <td><%= car.getId() %></td>
        <td><%= car.getModel() %></td>
        <td><%= car.getBrand() %></td>
        <td><%= car.getPlateNumber() %></td>
        <td><%= car.getStatus() %></td>
        <td><%= car.getDriverId() %></td>  
        <td><%= car.getDriverName() %></td>
        <td>
            <a href="edit_car.jsp?id=<%= car.getId() %>">Edit</a> |
            <a href="CarServlet?action=delete&id=<%= car.getId() %>">Delete</a>
        </td>
    </tr>
    <% } %>
</table>
<a href="add_cars.jsp">Add New Car</a>
