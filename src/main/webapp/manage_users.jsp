<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.cab.dao.UsersDAO" %>
<%@ page import="com.cab.model.Users" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Users</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h2>Manage Users</h2>
    
    <a href="add_user.jsp" class="btn btn-primary">Add New User</a>
    
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Registration ID</th>
            <th>Name</th>
            <th>Address</th>
            <th>NIC</th>
            <th>Username</th>
            <th>Role</th>
            <th>Actions</th>
        </tr>
        
        <%
            List<Users> usersList = new UsersDAO().getAllUsers();
            for (Users user : usersList) {
        %>
        <tr>
            <td><%= user.getId() %></td>
            <td><%= user.getRegistrationId() %></td>
            <td><%= user.getName() %></td>
            <td><%= user.getAddress() %></td>
            <td><%= user.getNic() %></td>
            <td><%= user.getUsername() %></td>
            <td><%= user.getRole() %></td>
            <td>
                <a href="EditUserServlet?id=<%= user.getId() %>">Edit</a> |
                <a href="DeleteUserServlet?id=<%= user.getId() %>" onclick="return confirm('Are you sure?');">Delete</a>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>
