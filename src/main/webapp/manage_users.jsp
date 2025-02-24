<%@ page import="java.util.List, com.cab.dao.UsersDAO, com.cab.model.Users" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Manage Users</title>
    <link rel="stylesheet" href="styles.css"> <!-- Include your CSS file -->
</head>
<body>
    <h2>Manage Users</h2>
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
            UsersDAO usersDAO = new UsersDAO();
            List<Users> usersList = usersDAO.getAllUsers();
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
                <a href="edit_user.jsp?id=<%= user.getId() %>">Edit</a> | 
                <a href="delete_user?id=<%= user.getId() %>" onclick="return confirm('Are you sure?');">Delete</a>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>
