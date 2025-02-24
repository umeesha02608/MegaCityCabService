<%@ page import="com.cab.dao.UsersDAO, com.cab.model.Users" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Edit User</title>
</head>
<body>
    <h2>Edit User</h2>
    <%
        int userId = Integer.parseInt(request.getParameter("id"));
        UsersDAO usersDAO = new UsersDAO();
        Users user = usersDAO.getUserById(userId);
    %>
    <form action="update_user" method="post">
        <input type="hidden" name="id" value="<%= user.getId() %>">
        Name: <input type="text" name="name" value="<%= user.getName() %>"><br>
        Address: <input type="text" name="address" value="<%= user.getAddress() %>"><br>
        NIC: <input type="text" name="nic" value="<%= user.getNic() %>"><br>
        Username: <input type="text" name="username" value="<%= user.getUsername() %>"><br>
        Role: 
        <select name="role">
            <option value="customer" <%= user.getRole().equals("customer") ? "selected" : "" %>>Customer</option>
            <option value="driver" <%= user.getRole().equals("driver") ? "selected" : "" %>>Driver</option>
        </select><br>
        <input type="submit" value="Update">
    </form>
</body>
</html>
