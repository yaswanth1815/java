<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Golden Yield</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-image: url('https://images.pexels.com/photos/259280/pexels-photo-259280.jpeg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            background-repeat: no-repeat;
            color: #333;
            padding: 40px 20px;
        }

        .container {
            max-width: 1100px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 40px;
        }

        .contact-info {
            background: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.2);
        }

        .contact-info h2 {
            color: #228B22;
            margin-bottom: 20px;
        }

        .contact-info p {
            margin-bottom: 15px;
            line-height: 1.6;
            font-size: 16px;
        }

        .contact-info .details {
            margin-top: 20px;
        }

        .details p {
            margin-bottom: 10px;
            font-size: 16px;
        }

        .details p strong {
            color: #228B22;
        }

        /* Contact Form */
        .contact-form {
            background: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.2);
        }

        .contact-form h2 {
            color: #228B22;
            margin-bottom: 20px;
        }

        .contact-form input,
        .contact-form textarea {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            transition: 0.3s;
        }

        .contact-form input:focus,
        .contact-form textarea:focus {
            border-color: #228B22;
            outline: none;
        }

        .contact-form button {
            background: #228B22;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }

        .contact-form button:hover {
            background: #1a6f1a;
        }

        /* Responsive */
        @media (max-width: 900px) {
            .container {
                grid-template-columns: 1fr;
            }
        }

        /* Map Section */
        .map {
            margin-top: 50px;
            text-align: center;
        }

        .map iframe {
            width: 100%;
            height: 400px;
            border: none;
            border-radius: 20px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>

    <div class="container">
        <!-- Contact Info -->
        <div class="contact-info">
            <h2>Get in Touch</h2>
            <p>We’d love to hear from you! Whether you’re a farmer, buyer, or partner, feel free to reach out to us for any inquiries.</p>
            
            <div class="details">
                <p><strong>📍 Address:</strong> Golden Yield, Anantapur, Andhra Pradesh, India</p>
                <p><strong>📞 Phone:</strong> +91 7671898987</p>
                <p><strong>📧 Email:</strong> support@goldenyield.com</p>
                <p><strong>⏰ Working Hours:</strong> Mon - Sat: 9:00 AM - 6:00 PM</p>
            </div>
        </div>

        <!-- Contact Form -->
        <div class="contact-form">
            <h2>Send Us a Message</h2>
            <form action="#" method="post">
                <input type="text" name="name" placeholder="Your Name" required>
                <input type="email" name="email" placeholder="Your Email" required>
                <input type="text" name="subject" placeholder="Subject" required>
                <textarea name="message" rows="6" placeholder="Your Message" required></textarea>
                <button type="submit">Send Message</button>
            </form>
        </div>
    </div>

    <!-- Google Map -->
    <div class="map">
        <h2 style="color:#f7f7f7; margin-bottom:20px;">Our Location - ANANTAPURAMU</h2>
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3891.9631763795446!2d77.60051547481806!3d14.68188757732101!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bb13d0b5e65d58b%3A0x6a35c22bbf9a0f44!2sAnantapur%2C%20Andhra%20Pradesh%20515001!5e0!3m2!1sen!2sin!4v1695314000000!5m2!1sen!2sin" allowfullscreen="" loading="lazy"></iframe>
    </div>

</body>
</html>
    