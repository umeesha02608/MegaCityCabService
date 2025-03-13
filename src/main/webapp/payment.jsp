<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Secure Payment</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js"></script>
    
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
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow-lg p-4">
            <h2 class="text-center text-primary"><i class="fas fa-credit-card"></i> Payment</h2>
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

                <div id="cardDetails" class="border rounded p-3 bg-light" style="display: none;">
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
                    <a href="index.jsp" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i> Cancel
                    </a>
                </div>
            </form>
        </div>
    </div>
    
    <script>
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
    
</body>
</html>
