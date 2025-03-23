<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    session.invalidate();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="5;url=index.jsp">
    <title>Logged Out - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('Images/taxibooking.jpg') center/cover no-repeat;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
            font-family: 'Arial', sans-serif;
        }
        .logout-container {
            background: rgba(255, 255, 255, 0.5);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }
        h2 {
            font-size: 28px;
            font-weight: bold;
        }
        p {
            font-size: 18px;
            margin-top: 10px;
        }
        .loader {
            margin-top: 15px;
            width: 50px;
            height: 50px;
            border: 4px solid white;
            border-top: 4px solid transparent;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            display: inline-block;
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
    <script>
        setTimeout(function () {
            window.location.href = "index.jsp";
        }, 3000);
    </script>
</head>
<body>
    <div class="logout-container">
        <h2>Thank You for Choosing Mega City Cab!</h2>
        <p>You have successfully logged out.</p>
        <p>Redirecting you to the homepage...</p>
        <div class="loader"></div>
    </div>
</body>
</html>
