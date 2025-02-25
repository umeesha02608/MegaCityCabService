<%@ page import="com.cab.dao.UsersDAO, com.cab.model.Users, java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    UsersDAO usersDAO = new UsersDAO();
    List<Users> drivers = usersDAO.getAllDrivers();  // Fetch drivers from users table
%>

<h2>Add New Car</h2>
<form action="CarServlet" method="post">
    <input type="hidden" name="action" value="add">

    Model: <input type="text" name="model" required><br>
    Brand: <input type="text" name="brand" required><br>
    Plate Number: <input type="text" name="plateNumber" required><br>

    Assigned Driver:
    <select name="driverId" required>
        <option value="">Select a Driver</option>
        <% for (Users driver : drivers) { %>
            <option value="<%= driver.getId() %>">
                <%= driver.getName() %> (ID: <%= driver.getId() %>)
            </option>
        <% } %>
    </select><br>

    <button type="submit">Add Car</button>
    <a href="manage_cars.jsp"><button type="button">View Cars</button></a>
</form>
