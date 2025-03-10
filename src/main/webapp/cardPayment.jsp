<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Processing Payment</title>
</head>
<body>
    <h2>Processing Payment...</h2>

    <%
        String orderNumber = (String) request.getAttribute("orderNumber");
        String amount = (String) request.getAttribute("amount");
        String paymentMethod = (String) request.getAttribute("paymentMethod");

        // Simulate card processing (In real applications, integrate with a payment gateway)
        Thread.sleep(2000); // Simulate processing delay
    %>

    <p>Payment of LKR <%= amount %> via <%= paymentMethod %> was successful!</p>

    <a href="bill.jsp?orderNumber=<%= orderNumber %>">Download Your Bill</a>
</body>
</html>
