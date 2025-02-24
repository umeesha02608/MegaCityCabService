<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.cab.dao.UsersDAO" %>
<%@ page import="com.cab.model.Users" %>
<%@ page import="java.io.IOException" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add New User</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h2>Add New User</h2>
    <form action="AddUserServlet" method="post">
        <label>Registration ID:</label>
        <input type="text" name="registration_id" required><br>

        <label>Name:</label>
        <input type="text" name="name" required><br>

        <label>Address:</label>
        <input type="text" name="address" required><br>

        <label>NIC:</label>
        <input type="text" name="nic" required><br>

        <label>Username:</label>
        <input type="text" name="username" required><br>

        <label>Password:</label>
        <input type="password" name="password" required><br>

        <label>Role:</label>
        <select name="role">
            <option value="customer">Customer</option>
            <option value="driver">Driver</option>
        </select><br>

        <button type="submit">Add User</button>
        <a href="manage_users.jsp" class="btn btn-secondary">View Users</a>
    </form>
</body>
</html>
