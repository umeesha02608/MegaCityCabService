<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Payment Error - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), 
                        url('Images/payment_error.jpg') center/cover no-repeat;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .error-card {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            animation: fadeIn 0.8s ease-in-out;
        }
        .error-icon {
            font-size: 50px;
            color: red;
            margin-bottom: 10px;
        }
        .btn-custom {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            margin-top: 10px;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="error-card">
        <div class="error-icon">❌</div>
        <h2 class="text-danger">Payment Failed!</h2>
        <p>There was an issue processing your payment. Please try again.</p>
        <a href="payment.jsp" class="btn btn-warning btn-custom">🔄 Try Again</a>
        <a href="customer_dashboard.jsp" class="btn btn-secondary btn-custom">🏠 Return to Dashboard</a>
    </div>
</body>
</html>
