<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String orderNumber = (String) request.getAttribute("orderNumber");
    String amount = (String) request.getAttribute("amount");
    String paymentMethod = (String) request.getAttribute("paymentMethod");

    // Simulate card processing (In real applications, integrate with a payment gateway)
    Thread.sleep(2000); // Simulate processing delay
%>

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
            background: linear-gradient(135deg, #f4f7fc, #e8eff1);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 100%;
            max-width: 480px;
        }

        h2 {
            color: #28a745;
            font-size: 2.2rem;
            margin-bottom: 25px;
            font-weight: 600;
        }

        p {
            color: #555;
            font-size: 1.1rem;
            margin-bottom: 20px;
            line-height: 1.5;
        }

        .btn {
            padding: 14px 30px;
            font-size: 1.1rem;
            border-radius: 30px;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
        }

        .btn-primary {
            background-color: #002147;
            color: white;
        }

        .btn-primary:hover {
            background-color: #0055b3;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
            margin-left: 10px;
        }

        .btn-danger:hover {
            background-color: #c82333;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .loading-spinner {
            border: 6px solid #f3f3f3;
            border-top: 6px solid #3498db;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            margin-top: 30px;
            animation: spin 2s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .footer-text {
            margin-top: 30px;
            font-size: 0.9rem;
            color: #888;
        }
    </style>
</head>
<body>

<div class="container">
    <h2><i class="fas fa-credit-card"></i> Processing Payment...</h2>

    <div class="loading-spinner"></div>

    <p>We are processing your payment of <strong>LKR <%= amount %></strong> via <strong><%= paymentMethod %></strong>.</p>

    <p>Please wait while we confirm your transaction. Thank you for your patience!</p>

    <a href="print_bill.jsp?orderNumber=<%= orderNumber %>" class="btn btn-primary">Download Your Bill</a>
    <a href="payment.jsp" class="btn btn-danger">Cancel</a>

    <div class="footer-text">
        <p>If you encounter any issues, please contact our support team.</p>
    </div>
</div>

</body>
</html>
