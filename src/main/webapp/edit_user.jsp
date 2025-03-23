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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), 
                        url('Images/people-driving-cars-city-street.jpg') center/cover no-repeat;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .card {
            background: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.3);
            width: 420px;
        }

        .card h2 {
            font-weight: 600;
            text-align: center;
            color: #002147;
        }

        .form-label {
            font-weight: bold;
            color: #333;
        }

        .form-control {
            border-radius: 8px;
            box-shadow: inset 0px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .form-select {
            border-radius: 8px;
        }

        .btn-primary {
            background-color: #002147;
            border: none;
            font-weight: bold;
            padding: 10px 20px;
            border-radius: 8px;
            transition: 0.3s;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
            border: none;
            font-weight: bold;
            padding: 10px 20px;
            border-radius: 8px;
            transition: 0.3s;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        .text-center {
            margin-top: 20px;
        }
    </style>
</head>

<body>
    <div class="card">
        <h2><i class="fas fa-user-edit"></i> Edit User</h2>
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
</body>
</html>
