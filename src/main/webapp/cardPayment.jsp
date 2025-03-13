
    <%
        String orderNumber = (String) request.getAttribute("orderNumber");
        String amount = (String) request.getAttribute("amount");
        String paymentMethod = (String) request.getAttribute("paymentMethod");

        // Simulate card processing (In real applications, integrate with a payment gateway)
        Thread.sleep(2000); // Simulate processing delay
    %>

    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Processing Payment</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 100%;
            max-width: 500px;
        }

        h2 {
            color: #4CAF50;
            font-size: 2rem;
            margin-bottom: 20px;
        }

        p {
            color: #333;
            font-size: 1.1rem;
            margin-bottom: 20px;
        }

        .btn {
            background-color: #002147;
            color: white;
            padding: 12px 25px;
            font-size: 1.1rem;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #0055b3;
        }

        .loading-spinner {
            border: 4px solid #f3f3f3;
            border-top: 4px solid #3498db;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            margin-top: 20px;
            animation: spin 2s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Processing Payment...</h2>

    <div class="loading-spinner"></div>

    <p>Payment of LKR <%= amount %> via <%= paymentMethod %> is being processed...</p>

    <p>Thank you for your patience!</p>

    <a href="bill.jsp?orderNumber=<%= orderNumber %>" class="btn">Download Your Bill</a>
</div>

</body>
</html>
    