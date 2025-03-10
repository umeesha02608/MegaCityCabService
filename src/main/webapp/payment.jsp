<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Payment</title>
    <script>
        function toggleCardDetails() {
            var paymentMethod = document.getElementById("paymentMethod").value;
            var cardDetails = document.getElementById("cardDetails");

            if (paymentMethod === "Credit Card" || paymentMethod === "Debit Card") {
                cardDetails.style.display = "block";
            } else {
                cardDetails.style.display = "none";
            }
        }
    </script>
</head>
<body>
    <h2>Payment Page</h2>

    <%
        String orderNumber = request.getParameter("orderNumber");
        String fare = request.getParameter("fare");
    %>

    <form action="ProcessPaymentServlet" method="post">
        <label>Order Number:</label>
        <input type="text" name="orderNumber" value="<%= orderNumber %>" readonly><br>

        <label>Amount (LKR):</label>
        <input type="text" name="amount" value="<%= fare %>" readonly><br>

        <label>Payment Method:</label>
        <select name="paymentMethod" id="paymentMethod" onchange="toggleCardDetails()">
            <option value="Cash">Cash</option>
            <option value="Credit Card">Credit Card</option>
            <option value="Debit Card">Debit Card</option>
        </select><br>

        <div id="cardDetails" style="display: none;">
            <label>Card Number:</label>
            <input type="text" name="cardNumber" required><br>

            <label>Expiry Date:</label>
            <input type="text" name="expiryDate" required><br>

            <label>CVV:</label>
            <input type="text" name="cvv" required><br>
        </div>

        <button type="submit">Pay Now</button>
    </form>
</body>
</html>
