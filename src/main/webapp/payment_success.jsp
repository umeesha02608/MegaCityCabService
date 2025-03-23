<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Successful</title>
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
            max-width: 500px;
        }

        .success-icon {
            font-size: 60px;
            color: #28a745;
            margin-bottom: 15px;
        }

        h2 {
            color: #28a745;
            font-size: 2.2rem;
            margin-bottom: 15px;
            font-weight: 600;
        }

        p {
            color: #555;
            font-size: 1.2rem;
            margin-bottom: 20px;
        }

        .btn {
            background-color: #002147;
            color: white;
            padding: 12px 25px;
            font-size: 1.1rem;
            border-radius: 30px;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s ease;
            border: none;
        }

        .btn:hover {
            background-color: #0055b3;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .footer-text {
            margin-top: 25px;
            font-size: 0.9rem;
            color: #888;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="success-icon">✔</div>
    <h2>Payment Successful!</h2>
    <p>Your payment has been processed successfully. Thank you for your transaction.</p>

    <a href="customer_dashboard.jsp" class="btn">Return to Dashboard</a>

    <div class="footer-text">
        <p>If you need any assistance, please contact our support team.</p>
    </div>
</div>

</body>
</html>
