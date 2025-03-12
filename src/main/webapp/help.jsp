<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Help - Mega City Cab Service</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    
    <style>
        html, body {
            height: 100%;
            display: flex;
            flex-direction: column;
            margin: 0;
        }

        .navbar {
            background-color: #ECDFCC;
            padding: 15px;
        }

        .navbar-brand {
            font-weight: bold;
            color: #000000 !important;
        }

        .btn-custom {
            background-color: #ffcc00;
            color: #000;
            padding: 10px 20px;
            border-radius: 8px;
            align-items:center;
            font-weight: bold;
        }

        .btn-custom:hover {
            background-color: #e6b800;
        }

       .help-section {
		    display: flex;
		    flex-direction: column;
		    /*background:linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('Images/help-support.jpg') center/cover no-repeat;
		    align-items: center; /* Center contents */
		}

        .help-section h2 {
            font-size: 32px;
            color: #343a40;
            text-align: center;
            margin-bottom: 30px;
        }

        .accordion-item {
            border-radius: 8px;
            margin-bottom: 15px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
           
        }

        .accordion-button {
            font-weight: bold;
            color: #007bff;
            padding: 15px;
            border-radius: 8px;
        }

        .accordion-button:not(.collapsed) {
            background-color: #f1f1f1;
            color: #0056b3;
        }

        .accordion-body {
            font-size: 16px;
            color: #555;
            padding: 15px;
            width:80%;
        }

        .query-form {
		    background-color: rgba(255, 255, 255, 0.4); /* Semi-transparent white */
		    width: 50%; /* Adjust width for better centering */
		    max-width: 500px;
		    padding: 30px;
		    border-radius: 10px;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		}
		
        .form-label {
            font-weight: bold;
        }

        .footer {
            background-color: #ECDFCC;
            text-align: center;
            padding: 10px 0;
            font-size: 14px;
        }
        
      .container1 {
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    width: 100%;
		    padding: 30px;
		    border-radius: 10px;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		    background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('Images/help-support.jpg') center/cover no-repeat;
		}
       
       /* Background for FAQ and Query Form */
		.faq-container, .query-form {
		    background: linear-gradient(rgba(255, 255, 255, 0.6), rgba(255, 255, 255, 0.6)), url('Images/help-support.jpg') center/cover no-repeat;
		    padding: 20px;
		    border-radius: 10px;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		}
		
		.accordion {
		    background: linear-gradient(rgba(255, 255, 255, 0.7), rgba(255, 255, 255, 0.7)), url('Images/help-support.jpg') center/cover no-repeat;
		    padding: 15px;
		    border-radius: 10px;
		}
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg fixed-top" style="background-color: #ECDFCC; box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">Mega City Cab</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="index.jsp#about">About</a></li>
                    <li class="nav-item"><a class="nav-link" href="index.jsp#services">Services</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                    <li class="nav-item"><a class="nav-link" href="help.jsp">Help</a></li>
                    <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                    <li class="nav-item" style="background-color: #ECDFCC;"><a class="btn btn-custom ms-2" href="register.jsp">Register</a></li>
                </ul>
            </div>
        </div>
    </nav><br><br><br><br><br>

<!-- Help Section -->
<section class="help-section">
    <div class="container text-center py-4">
        <h2 class="text-black mb-4" style="font-size: 24px">Help & Support</h2>

        <div class="row justify-content-center">
            <div class="col-md-8">
                <!-- FAQ Accordion -->
                <div class="accordion shadow" id="faqAccordion">
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#faq1">
                                How do I book a cab?
                            </button>
                        </h2>
                        <div id="faq1" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                You can book a cab by logging into your account and selecting the "Book a Cab" option.
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2">
                                How can I track my booking?
                            </button>
                        </h2>
                        <div id="faq2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                After booking, track it in your dashboard under "My Bookings."
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq3">
                                How do I contact support?
                            </button>
                        </h2>
                        <div id="faq3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                Email us at <strong>support@megacitycab.com</strong> or call <strong>+94 77 123 4567</strong>.
                            </div>
                        </div>
                    </div>
                </div><br><br>

                <!-- Query Form -->
               
							 <div class="container1">
			    <div class="query-form text-center">
			        <h4 class="text-dark mb-3">Submit a Query</h4>
			        <form action="SubmitQueryServlet" method="post">
			            <input type="text" class="form-control mb-2" placeholder="Your Name" name="name" required>
			            <input type="email" class="form-control mb-2" placeholder="Your Email" name="email" required>
			            <textarea class="form-control mb-2" placeholder="Your Query" name="query" rows="3" required></textarea>
			            <button type="submit" class="btn btn-custom w-100">Submit</button>
			        </form>
			    </div>
			</div>

		     </div>
	  </div></div>
</section>


    <!-- Footer -->
    <footer class="footer mt-auto py-3 text-white text-center" style="background-color: #ECDFCC;">
        <div class="container">
            <p style="color: #000000; font-weight: bold;">&copy; 2025 Mega City Cab Service | All Rights Reserved</p>
        </div>
    </footer>

    <!-- JS Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
