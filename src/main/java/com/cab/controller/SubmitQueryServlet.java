package com.cab.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.cab.dao.QueryDAO;
import com.cab.model.Query;

@WebServlet("/SubmitQueryServlet")
public class SubmitQueryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("query");

        // Validate inputs
        if (name == null || email == null || message == null || name.isEmpty() || email.isEmpty() || message.isEmpty()) {
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("help.jsp").forward(request, response);
            return;
        }

        // Create a Query object
        Query query = new Query(name, email, "General Inquiry", message);

        // Store the query using DAO
        QueryDAO queryDAO = new QueryDAO();
        boolean success = queryDAO.insertQuery(query);

        if (success) {
            request.setAttribute("success", "Your query has been submitted successfully.");
        } else {
            request.setAttribute("error", "There was an error submitting your query. Please try again.");
        }

        // Forward back to help.jsp
        request.getRequestDispatcher("help.jsp").forward(request, response);
    }
}