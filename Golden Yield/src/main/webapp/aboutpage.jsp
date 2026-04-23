<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Golden Yield</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

       body {
    background-image: url('https://images.pexels.com/photos/259280/pexels-photo-259280.jpeg');
    background-repeat: no-repeat;
    background-position: center center;
    background-attachment: fixed;
    background-size: cover;
    color: #333;
    padding: 40px 20px;
}


        /* About Section */
        .about {
            background: rgb(225, 234, 239);
            margin: 40px auto;
            max-width: 1000px;
            padding: 50px 40px;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            text-align: center;
            transition: 0.3s;
        }

        .about:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 30px rgba(0,0,0,0.15);
        }

        .about h2 {
            color: #228B22;
            margin-bottom: 20px;
            font-size: 28px;
        }

        .about p {
            margin-bottom: 30px;
            line-height: 1.8;
            font-size: 18px;
            color: #444;
        }

        /* Why Choose Us Section */
        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
            padding: 20px;
            max-width: 1000px;
            margin: 0 auto 50px auto;
        }

        .feature-card {
            background: rgb(225, 234, 239);
            padding: 40px 20px;
            border-radius: 20px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.1);
            transition: 0.3s;
        }

        .feature-card:hover {
            transform: translateY(-10px) scale(1.03);
            box-shadow: 0 10px 28px rgba(0,0,0,0.15);
        }

        .feature-card img {
            width: 90px;
            margin-bottom: 20px;
            transition: transform 0.3s;
        }

        .feature-card:hover img {
            transform: scale(1.1);
        }

        .feature-card h3 {
            margin-bottom: 12px;
            color: #228B22;
            font-size: 22px;
        }

        .feature-card p {
            font-size: 16px;
            color: #555;
            line-height: 1.6;
        }

        /* Responsive spacing */
        @media (max-width: 768px) {
            .about {
                padding: 30px 20px;
            }

            .about h2 {
                font-size: 24px;
            }

            .about p {
                font-size: 16px;
            }

            .feature-card h3 {
                font-size: 20px;
            }

            .feature-card p {
                font-size: 15px;
            }
        }
    </style>
</head>
<body>

    <!-- About Section -->
    <section class="about">
        <h2>Who We Are</h2>
        <p>Golden Yield is an online marketplace that bridges the gap between local farmers and buyers. 
           We empower farmers to sell their crops directly to consumers and businesses, ensuring fair pricing and fresh produce.</p>

        <h2>Our Mission</h2>
        <p>To create a sustainable and profitable platform for farmers while providing fresh, organic, 
           and affordable crops to every household.</p>

        <h2>Our Vision</h2>
        <p>To revolutionize agriculture trade by connecting every farmer to a digital market, 
           ensuring transparency and growth for the agricultural community.</p>
    </section>

    <!-- Why Choose Us Section -->
    <section class="features">
        <div class="feature-card">
            <img src="https://cdn-icons-png.flaticon.com/512/3135/3135706.png" alt="Transparent Market">
            <h3>Fair Pricing</h3>
            <p>We ensure farmers get the right price without middlemen.</p>
        </div>
        <div class="feature-card">
            <img src="https://cdn-icons-png.flaticon.com/512/3190/3190836.png" alt="Fresh Produce">
            <h3>Fresh Produce</h3>
            <p>Our platform connects buyers with fresh, farm-to-table crops.</p>
        </div>
        <div class="feature-card">
            <img src="https://cdn-icons-png.flaticon.com/512/1046/1046857.png" alt="Sustainability">
            <h3>Sustainable Future</h3>
            <p>We promote local farming and eco-friendly agricultural practices.</p>
        </div>
    </section>

</body>
</html>

    