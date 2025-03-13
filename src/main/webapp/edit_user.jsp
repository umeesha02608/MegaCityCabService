<%@ page import="com.cab.dao.UsersDAO, com.cab.model.Users" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    int userId = Integer.parseInt(request.getParameter("id"));
    UsersDAO usersDAO = new UsersDAO();
    Users user = usersDAO.getUserById(userId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit User</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js"></script>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow-lg p-4">
            <h2 class="text-center text-primary">👤 Edit User</h2>
            <form action="update_user" method="post">
                <input type="hidden" name="id" value="<%= user.getId() %>">
                
                <div class="mb-3">
                    <label class="form-label">Name</label>
                    <input type="text" name="name" value="<%= user.getName() %>" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Address</label>
                    <input type="text" name="address" value="<%= user.getAddress() %>" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">NIC</label>
                    <input type="text" name="nic" value="<%= user.getNic() %>" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Username</label>
                    <input type="text" name="username" value="<%= user.getUsername() %>" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Role</label>
                    <select name="role" class="form-select">
                        <option value="customer" <%= user.getRole().equals("customer") ? "selected" : "" %>>Customer</option>
                        <option value="driver" <%= user.getRole().equals("driver") ? "selected" : "" %>>Driver</option>
                    </select>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Update User
                    </button>
                    <a href="manage_users.jsp" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i> Back
                    </a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
