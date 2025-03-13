<%@ page import="java.sql.*" %>
<%@ page import="com.cab.db.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bill Receipt</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

    <script>
        function printBill() {
            window.print();
        }

        function downloadBill() {
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF();

            doc.setFontSize(16);
            doc.text("🚖 Mega City Cab - Bill Receipt", 20, 20);
            
            let orderNumber = document.getElementById("orderNumber").innerText;
            let pickup = document.getElementById("pickup").innerText;
            let drop = document.getElementById("drop").innerText;
            let distance = document.getElementById("distance").innerText;
            let fare = document.getElementById("fare").innerText;
            let method = document.getElementById("method").innerText;
            let date = document.getElementById("date").innerText;

            let details = `
Order Number: ${orderNumber}
Pickup: ${pickup}
Drop: ${drop}
Distance: ${distance} km
Fare: LKR ${fare}
Payment Method: ${method}
Date: ${date}
            `;

            doc.setFontSize(12);
            doc.text(details, 20, 40);
            doc.save("Bill_Receipt.pdf");
        }
    </script>

    <style>
        body {
            background: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            text-align: center;
        }

        .title {
            font-size: 22px;
            font-weight: bold;
            color: #002147;
            margin-bottom: 15px;
        }

        .receipt-container {
            background: #ffffff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .receipt-header {
            font-size: 20px;
            font-weight: bold;
            color: #007bff;
            margin-bottom: 10px;
        }

        .receipt-content p {
            margin: 8px 0;
            font-size: 15px;
            font-weight: 500;
        }

        .icon {
            color: #007bff;
            margin-right: 8px;
        }

        .btn-container {
            display: flex;
            justify-content: center;
            gap: 12px;
            margin-top: 20px;
        }

        .btn {
            font-size: 14px;
            padding: 10px 16px;
            border-radius: 8px;
            transition: 0.3s;
        }

        .btn:hover {
            opacity: 0.8;
        }

        .btn-primary {
            background: #ffcc00;
            border: none;
        }

        .btn-success {
            background: #002147;
            border: none;
            color: white;
        }

        .btn-secondary {
            background: #6c757d;
            border: none;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1 class="title">🚖 Thank You for Choosing Mega City Cab Service! <br> Print Your Bill Here</h1><br><br>

        <div class="receipt-container">
            <h2 class="receipt-header"><i class="fas fa-receipt"></i> Bill Receipt</h2>

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

            <div class="receipt-content">
                <p><strong><i class="fas fa-hashtag icon"></i> Order:</strong> <span id="orderNumber"><%= rs.getString("order_number") %></span></p>
                <p><strong><i class="fas fa-map-marker-alt icon"></i> Pickup:</strong> <span id="pickup"><%= rs.getString("pickup_location") %></span></p>
                <p><strong><i class="fas fa-map-pin icon"></i> Drop:</strong> <span id="drop"><%= rs.getString("drop_location") %></span></p>
                <p><strong><i class="fas fa-road icon"></i> Distance:</strong> <span id="distance"><%= rs.getString("distance") %></span> km</p>
                <p><strong><i class="fas fa-money-bill-wave icon"></i> Fare:</strong> LKR <span id="fare"><%= rs.getString("fare") %></span></p>
                <p><strong><i class="fas fa-wallet icon"></i> Payment:</strong> <span id="method"><%= rs.getString("payment_method") %></span></p>
                <p><strong><i class="far fa-calendar-alt icon"></i> Date:</strong> <span id="date"><%= rs.getString("payment_date") %></span></p>
            </div>

            <div class="btn-container">
                <button class="btn btn-primary" onclick="printBill()">
                    <i class="fas fa-print"></i> Print
                </button>
                <button class="btn btn-success" onclick="downloadBill()">
                    <i class="fas fa-download"></i> Download
                </button>
                <a href="index.jsp" class="btn btn-secondary">
                    <i class="fas fa-arrow-left"></i> Back
                </a>
            </div>

            <%
                    } else {
                        out.println("<p class='text-danger text-center mt-3'>No payment found for this order.</p>");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("<p class='text-danger text-center mt-3'>Error fetching bill details.</p>");
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

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
