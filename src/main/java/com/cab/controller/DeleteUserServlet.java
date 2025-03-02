package com.cab.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.cab.dao.UsersDAO;

@WebServlet("/delete_user")
public class DeleteUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            UsersDAO usersDAO = new UsersDAO();

            boolean isDeleted = usersDAO.deleteUser(id);
            if (isDeleted) {
                response.sendRedirect("manage_users.jsp?success=User deleted successfully");
            } else {
                response.sendRedirect("manage_users.jsp?error=User not found or deletion failed");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("manage_users.jsp?error=Invalid user ID");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manage_users.jsp?error=An error occurred while deleting the user");
        }
    }
}