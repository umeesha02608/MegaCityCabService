<%@ page import="java.sql.*" %>
<%@ page import="com.cab.db.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bill Receipt</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script>
        function printBill() {
            window.print();
        }

        function downloadBill() {
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF();

            doc.setFontSize(16);
            doc.text("Mega City Cab - Bill Receipt", 20, 20);
            
            let orderNumber = document.getElementById("orderNumber").innerText;
            let pickup = document.getElementById("pickup").innerText;
            let drop = document.getElementById("drop").innerText;
            let distance = document.getElementById("distance").innerText;
            let fare = document.getElementById("fare").innerText;
            let method = document.getElementById("method").innerText;
            let date = document.getElementById("date").innerText;

            let details = `
Order Number: ${orderNumber}
Pickup Location: ${pickup}
Drop Location: ${drop}
Distance: ${distance}
Fare: ${fare}
Payment Method: ${method}
Payment Date: ${date}
            `;

            doc.setFontSize(12);
            doc.text(details, 20, 40);

            doc.save("Bill_Receipt.pdf");
        }
    </script>
</head>
<body>
    <h2>Bill Receipt</h2>

    <%
        String orderNumber = request.getParameter("orderNumber");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT p.order_number, p.amount, p.payment_method, p.payment_date, " +
                         "b.pickup_location, b.drop_location, b.distance, b.fare " +
                         "FROM payments p JOIN booking b ON p.order_number = b.order_number " +
                         "WHERE p.order_number = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, orderNumber);
            rs = ps.executeQuery();

            if (rs.next()) {
    %>

    <p><strong>Order Number:</strong> <span id="orderNumber"><%= rs.getString("order_number") %></span></p>
    <p><strong>Pickup Location:</strong> <span id="pickup"><%= rs.getString("pickup_location") %></span></p>
    <p><strong>Drop Location:</strong> <span id="drop"><%= rs.getString("drop_location") %></span></p>
    <p><strong>Distance:</strong> <span id="distance"><%= rs.getString("distance") %></span> km</p>
    <p><strong>Fare:</strong> LKR <span id="fare"><%= rs.getString("fare") %></span></p>
    <p><strong>Payment Method:</strong> <span id="method"><%= rs.getString("payment_method") %></span></p>
    <p><strong>Payment Date:</strong> <span id="date"><%= rs.getString("payment_date") %></span></p>

    <button onclick="printBill()">Print Bill</button>
    <button onclick="downloadBill()">Download Bill</button>

    <%
            } else {
                out.println("<p>No payment found for this order.</p>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<p>Error fetching bill details.</p>");
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
