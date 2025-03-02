<%@ page import="com.cab.dao.CarDAO, com.cab.model.Car" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    CarDAO carDAO = new CarDAO();
    Car car = carDAO.getCarById(id);
%>

<form action="CarServlet" method="post">
    <input type="hidden" name="action" value="edit">
    <input type="hidden" name="id" value="<%= car.getId() %>">
    
    Model: <input type="text" name="model" value="<%= car.getModel() %>"><br>
    Brand: <input type="text" name="brand" value="<%= car.getBrand() %>"><br>
    Plate Number: <input type="text" name="plateNumber" value="<%= car.getPlateNumber() %>"><br>
    Status: <input type="text" name="status" value="<%= car.getStatus() %>"><br>
    Driver ID: <input type="text" name="driverId" value="<%= car.getDriverId() %>"><br>
    Driver Name: <input type="text" name="driverName" value="<%= car.getDriverName() %>"><br>
    
    <input type="submit" value="Update Car">
</form>
