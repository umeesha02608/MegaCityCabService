<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register - MegaCity Cab Service</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; margin: 50px; }
        .container { width: 300px; margin: auto; padding: 20px; border: 1px solid #ccc; border-radius: 5px; }
        .error { color: red; }
    </style>
</head>
<body>
    <h2>Register</h2>
    <% if (request.getParameter("error") != null) { %>
        <p class="error"><%= request.getParameter("error") %></p>
    <% } %>

    <form action="RegisterServlet" method="post">
        <!-- Registration ID is now auto-generated, so it is not required in the form -->
        <label>Name:</label><br>
        <input type="text" name="name" required><br><br>

        <label>Address:</label><br>
        <input type="text" name="address" required><br><br>

        <label>NIC:</label><br>
        <input type="text" name="nic" required><br><br>

        <label>Username:</label><br>
        <input type="text" name="username" required><br><br>

        <label>Password:</label><br>
        <input type="password" name="password" required><br><br>

        <label>Confirm Password:</label><br>
        <input type="password" name="confirmPassword" required><br><br>

        <label>Role:</label><br>
        <select name="role">
            <option value="customer">Customer</option>
            <option value="driver">Driver</option>
        </select><br><br>

        <input type="submit" value="Register">
    </form>
    <p>Already have an account? <a href="login.jsp">Login here</a></p>
</body>
</html>
