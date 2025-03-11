<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .contact-section {
            background: url('Images/contact-bg.jpg') center/cover no-repeat;
            padding: 80px 0;
            color: black;
            text-align: center;
        }
        .contact-form {
            background: rgba(0, 0, 0, 0.7);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }
        .form-control {
            border-radius: 5px;
        }
        .btn-custom {
            background-color: #ffcc00;
            color: #000;
            padding: 12px 20px;
            border-radius: 8px;
            font-weight: bold;
        }
        .btn-custom:hover {
            background-color: #e6b800;
        }
    </style>
</head>
<body>

<section class="contact-section">
    <div class="container">
        <h2 class="mb-4">Get in Touch</h2>
        <p class="mb-4">We would love to hear from you! Fill out the form below to get in touch.</p>

        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="contact-form">
                    <form id="contact-form" action="" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control" name="name" id="name" placeholder="Your Name" required>
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" name="message" id="message" rows="5" placeholder="Your Message" required></textarea>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-custom btn-block">Send Message</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
