<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Secure Payment</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js"></script>
    
    <style>
        body {
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('Images/payments.jpg') center/cover no-repeat;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card {
            border-radius: 16px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 550px;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.6);
        }

        .container {
            width: 100%;
            max-width: 650px;
        }

        .form-label {
            font-weight: 600;
            color: #333;
        }

        .card-header {
            background-color: #2d3e50;
            color: white;
            border-radius: 16px 16px 0 0;
            padding: 20px;
            margin-bottom: 30px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .btn {
            padding: 12px 25px;
            font-size: 18px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .btn-success {
            background-color: #28a745;
            border: none;
        }

        .btn-secondary {
            background-color: #6c757d;
            border: none;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }

        .cardDetails {
            display: none;
            background-color: #f8f9fa;
            border-radius: 10px;
            padding: 25px;
            margin-top: 20px;
            border: 1px solid #dee2e6;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
        }

        .text-danger {
            font-size: 12px;
            padding-top: 5px;
        }

        .card-header i {
            margin-right: 10px;
        }

        .mb-3 {
            margin-bottom: 25px;
        }

        .form-control {
            background-color: #f0f8ff;
        }

        .btn:focus {
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.5);
        }

        .fa {
            margin-right: 8px;
        }

        .fa-check-circle {
            color: white;
        }

        .text-center {
            margin-top: 20px;
        }
    </style>

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

        function validatePaymentForm() {
            var paymentMethod = document.getElementById("paymentMethod").value;
            var cardNumber = document.getElementById("cardNumber");
            var cvv = document.getElementById("cvv");
            
            // Reset previous errors
            document.getElementById("cardError").innerHTML = "";
            document.getElementById("cvvError").innerHTML = "";

            if (paymentMethod === "Credit Card" || paymentMethod === "Debit Card") {
                // Validate Card Number (16 digits only)
                var cardRegex = /^[0-9]{16}$/;
                if (!cardRegex.test(cardNumber.value.replace(/\s/g, ""))) {
                    document.getElementById("cardError").innerHTML = "Invalid Card Number! Must be 16 digits.";
                    return false;
                }

                // Validate CVV (3-4 digits)
                var cvvRegex = /^[0-9]{3,4}$/;
                if (!cvvRegex.test(cvv.value)) {
                    document.getElementById("cvvError").innerHTML = "Invalid CVV! Must be 3 or 4 digits.";
                    return false;
                }
            }

            return true;
        }
    </script>
</head>

<body>
    <div class="container">
        <div class="card shadow-lg p-4">
            <div class="card-header text-center">
                <h2 class="text-white"><i class="fas fa-credit-card"></i> Secure Payment</h2>
            </div>
            <%
                String orderNumber = request.getParameter("orderNumber");
                String fare = request.getParameter("fare");
            %>

            <form action="ProcessPaymentServlet" method="post" onsubmit="return validatePaymentForm()">

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-receipt"></i> Order Number:</label>
                    <input type="text" name="orderNumber" class="form-control" value="<%= orderNumber %>" readonly>
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-money-bill-wave"></i> Amount (LKR):</label>
                    <input type="text" name="amount" class="form-control" value="<%= fare %>" readonly>
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-wallet"></i> Payment Method:</label>
                    <select name="paymentMethod" id="paymentMethod" class="form-select" onchange="toggleCardDetails()">
                        <option value="Cash">Cash</option>
                        <option value="Credit Card">Credit Card</option>
                        <option value="Debit Card">Debit Card</option>
                    </select>
                </div>

                <div id="cardDetails" class="cardDetails">
                    <h5 class="text-dark"><i class="fas fa-credit-card"></i> Card Details</h5>
                    
                    <div class="mb-3">
					    <label class="form-label"><i class="fas fa-id-card"></i> Card Number:</label>
					    <input type="text" name="cardNumber" id="cardNumber" class="form-control" placeholder="1234 5678 9012 3456" required>
					    <small id="cardError" class="text-danger"></small>
					</div>
					
					<div class="row">
					    <div class="col-md-6">
					        <label class="form-label"><i class="far fa-calendar-alt"></i> Expiry Date:</label>
					        <input type="month" name="expiryDate" class="form-control" required>
					    </div>
					
					    <div class="col-md-6">
					        <label class="form-label"><i class="fas fa-lock"></i> CVV:</label>
					        <input type="password" name="cvv" id="cvv" class="form-control" placeholder="123" required>
					        <small id="cvvError" class="text-danger"></small>
					    </div>
					</div>

                </div>

                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-success">
                        <i class="fas fa-check-circle"></i> Pay Now
                    </button>
                    <a href="customer_dashboard.jsp" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i> Cancel
                    </a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
