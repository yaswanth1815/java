<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YourBank - Secure Banking Solutions</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-DN+527F3Tj1z7M5x67sE9R/V842p8L2lQh71D5iF+vV3K7V5e+J8p9t3b+2F" crossorigin="anonymous">
    
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;600;700&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap');

        /* Color Palette */
        :root {
            --primary-blue: #004D99; /* Deep, professional blue */
            --light-blue: #D6E8F6;   /* Very light, subtle blue for background/accents */
            --accent-gold: #B8860B;  /* Professional, subtle gold/bronze accent */
            --dark-text: #2c3e50;    /* Dark charcoal for main text */
            --light-text: #f8f8f8;   /* Off-white for light backgrounds */
            --medium-grey: #6c7a89;  /* Medium grey for secondary text */
            --white: #ffffff;
            --off-white: #F5F5F5;
            --shadow-light: rgba(0, 0, 0, 0.05);
            --shadow-medium: rgba(0, 0, 0, 0.1);
        }

        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            background-color: var(--off-white);
            color: var(--dark-text);
        }
        
        .main-header {
            background-color: var(--white);
            box-shadow: 0 2px 4px var(--shadow-light);
            padding: 0px 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .bank-name {
            font-family: 'Open Sans', sans-serif;
            font-size: 1.8em;
            font-weight: 1000;
            color: var(--primary-blue);
            letter-spacing: -0.5px;
        }

        .bank-logo {
            max-height: 70px;
            width: auto; /* Ensures aspect ratio is maintained */
            border-radius: 8px;
            transition: transform 0.3s ease-in-out;
        }

        .bank-logo:hover {
            transform: scale(1.05);
        }

        .custom-navbar {
            background-color: var(--primary-blue);
            box-shadow: 0 2px 5px var(--shadow-medium);
            margin-bottom: 30px;
            padding: 10px 0;
            border-bottom: 2px solid #003a70; /* Slightly darker primary */
        }

        .custom-navbar .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .custom-navbar .navbar-brand { 
            color: var(--light-text);
            font-weight: 600;
            font-size: 1.3em;
            text-decoration: none;
            transition: color 0.3s ease;
            margin-left: 0;
            text-align: left;
        }

        .custom-navbar .navbar-brand:hover { 
            color: var(--light-blue);
        }

        .custom-navbar .navbar-toggler { 
            padding: 0.25rem 0.75rem;
            font-size: 1.25rem;
            line-height: 1;
            background-color: transparent;
            border: 1px solid rgba(255, 255, 255, 0.5);
            border-radius: 0.25rem;
            cursor: pointer;
            display: none; /* Hidden by default, shown on mobile */
        }

        .custom-navbar .navbar-toggler-icon { 
            display: inline-block;
            width: 1.5em;
            height: 1.5em;
            vertical-align: middle;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3e%3cpath stroke='rgba%28255, 255, 255, 0.8%29' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: center;
            background-size: 100%;
        }

        .custom-navbar .navbar-collapse { 
            flex-grow: 1;
            display: flex; 
            justify-content: flex-end; 
        }

        .custom-navbar .navbar-nav { 
            display: flex; 
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .custom-navbar .nav-item {
            margin-left: 20px;
            position: relative;
        }

        .custom-navbar .nav-link {
            color: var(--light-text);
            padding: 10px 0;
            font-weight: 500;
            text-decoration: none;
            display: block;
            transition: color 0.3s ease, border-bottom 0.3s ease;
            border-bottom: 3px solid transparent;
        }

        .custom-navbar .nav-link:hover,
        .custom-navbar .nav-link.active {
            color: var(--white);
            border-bottom: 3px solid var(--accent-gold); /* Accent color for active/hover */
        }

        .custom-navbar .nav-link.active {
            font-weight: 600;
        }

        /* Dropdown styles (kept for reference, though not used for new links) */
        .custom-navbar .dropdown-toggle::after {
            display: inline-block;
            margin-left: 0.255em;
            vertical-align: 0.255em;
            content: "";
            border-top: 0.3em solid;
            border-right: 0.3em solid transparent;
            border-bottom: 0;
            border-left: 0.3em solid transparent;
        }

        .custom-navbar .dropdown-menu {
            position: absolute;
            top: 100%;
            left: 0;
            z-index: 1000;
            display: none;
            min-width: 10rem;
            padding: 0;
            margin: 0.125rem 0 0;
            font-size: 1rem;
            color: var(--light-text);
            background-color: var(--primary-blue);
            border: none;
            border-radius: 8px;
            box-shadow: 0 4px 10px var(--shadow-medium);
            list-style: none;
            background-clip: padding-box;
            overflow: hidden;
        }

        .custom-navbar .dropdown-menu.show {
            display: block;
        }

        .custom-navbar .dropdown-item {
            display: block;
            width: 100%;
            padding: 0.5rem 1rem;
            clear: both;
            font-weight: 400;
            color: var(--light-text);
            text-align: inherit;
            text-decoration: none;
            white-space: nowrap;
            background-color: transparent;
            border: 0;
            transition: background-color 0.3s ease, color 0.3s ease;
            box-sizing: border-box;
        }

        .custom-navbar .dropdown-item:hover,
        .custom-navbar .dropdown-item:focus {
            background-color: #003a70;
            color: var(--white);
        }

        /* Main content styling */
        main {
            padding: 11.5px 20px; /* Increased padding for better spacing */
            max-width: 1200px;
            margin: 0 auto;
            background-color: var(--off-white);
            border-radius: 8px;
            box-shadow: 0 0 15px var(--shadow-light);
            text-align: center;
        }

        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); /* Responsive grid */
            gap: 25px;
            padding: 30px 0;
            justify-content: center;
        }

        .service-card {
            background-color: var(--white);
            border-radius: 12px;
            box-shadow: 0 4px 15px var(--shadow-medium);
            padding: 25px;
            text-align: center;
            text-decoration: none;
            color: var(--dark-text);
            transition: transform 0.3s ease, box-shadow 0.3s ease, background-color 0.3s ease;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 180px; /* Ensure cards have a consistent height */
        }

        .service-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
            background-color: var(--light-blue); /* Subtle background change on hover */
        }

        .service-card i {
            font-size: 3.5em; /* Larger icons */
            color: var(--primary-blue);
            margin-bottom: 15px;
            transition: color 0.3s ease;
        }

        .service-card:hover i {
            color: var(--accent-gold); /* Icon color change on hover */
        }

        .service-card h3 {
            font-size: 1.4em;
            font-weight: 600;
            margin-bottom: 0;
            color: var(--dark-text);
        }

        /* Mobile specific styles */
        @media (max-width: 991.98px) {
            .custom-navbar .navbar-toggler {
                display: block;
            }

            .custom-navbar .navbar-collapse {
                display: none;
                flex-direction: column;
                width: 100%;
                margin-top: 10px;
                padding-bottom: 10px;
                background-color: var(--primary-blue);
                border-radius: 0 0 8px 8px;
            }
            
            .custom-navbar .navbar-collapse.show {
                display: flex;
            }

            .custom-navbar .navbar-nav {
                flex-direction: column;
                width: 100%;
            }

            .custom-navbar .nav-item {
                margin-left: 0;
                width: 100%;
                text-align: center;
            }

            .custom-navbar .nav-link {
                padding: 12px 15px;
                border-bottom: none;
            }

            .custom-navbar .nav-link:hover,
            .custom-navbar .nav-link.active {
                background-color: #003a70;
            }

            .custom-navbar .dropdown-menu {
                position: static;
                float: none;
                width: 100%;
                margin-top: 0;
                border-radius: 0;
                background-color: #003a70;
                box-shadow: none;
            }

            .custom-navbar .dropdown-item {
                padding-left: 30px;
            }

            .services-grid {
                grid-template-columns: 1fr; /* Stack cards vertically on smaller screens */
                padding: 20px 0;
            }

            .service-card {
                padding: 20px;
            }

            .service-card i {
                font-size: 3em;
            }

            .service-card h3 {
                font-size: 1.2em;
            }
        }
        /* Search Bar Styling */
       .search-bar {
                display: flex;
                align-items: center;
                background-color: var(--primary-blue);
                padding: 4px 10px;
                gap: 8px;
                border-radius: 8px;
                box-shadow: 0 0 8px var(--shadow-light);
                transition: box-shadow 0.3s ease, transform 0.2s ease;
            }

            .search-bar:hover {
                box-shadow: 0 0 12px var(--shadow-medium);
                transform: translateY(-1px);
            }

            .search-input {
                border: 1px solid var(--primary-blue);
                border-radius: 6px;
                padding: 6px 12px;
                font-size: 0.95rem;
                color: var(--dark-text);
                width: 200px;
                transition: border 0.3s ease, box-shadow 0.3s ease;
            }

            .search-input:focus {
                outline: none;
                border-color: var(--accent-gold);
                box-shadow: 0 0 6px var(--accent-gold);
                background-color: var(--light-blue);
            }

            .search-btn {
                background-color: var(--accent-gold);
                border: none;
                color: var(--white);
                font-weight: 600;
                padding: 6px 16px;
                border-radius: 6px;
                font-size: 0.95rem;
                cursor: pointer;
                transition: background-color 0.3s ease, box-shadow 0.3s ease;
            }

            .search-btn:hover {
                background-color: #a87409;
                box-shadow: 0 0 8px var(--shadow-medium);
            }

            /* Optional: Hide search bar on mobile */
            @media (max-width: 991.98px) {
                .search-bar {
                    display: none;
                }
            }

        
        /* Footer */
        .site-footer {
            background-color: #003a70; /* Darker blue for footer */
            color: var(--light-text);
            padding: 40px 20px;
            text-align: center;
            font-size: 0.9em;
            margin-top: 50px;
        }

        .footer-links {
            list-style: none;
            padding: 0;
            margin: 0 0 20px 0;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px 30px;
        }

        .footer-links li a {
            color: var(--light-text);
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-links li a:hover {
            color: var(--accent-gold); /* Accent color for footer links */
        }

        .social-icons a {
            color: var(--light-text);
            font-size: 1.8em;
            margin: 0 15px;
            transition: color 0.3s ease;
        }

        .social-icons a:hover {
            color: var(--accent-gold); /* Accent color for social icons */
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>

    <header class="main-header">
        <h1 class="bank-name">
            YASHBANK
            
            <%
        	String name=(String) request.getAttribute("name");
        	String gender=(String) request.getAttribute("gender");
        	
        %>
        <h1 class="bank-name">Welcome <%= gender+" "+name %></h>
        </h1>
             
<img class="bank-logo" height="70px" width="110px" src="data:image/jpeg;base64,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" alt="YASHBANK Logo">
    
    </header>
  
    <nav class="custom-navbar">
        <div class="nav-container">
            <span class="navbar-brand">Banking at your fingertips, dreams within reach</span> 
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
              
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <form class="search-bar" role="search">
  <input type="search" placeholder="Search..." aria-label="Search" class="search-input">
  <button type="submit" class="search-btn">Search</button>
</form>

                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Notifications</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <main>
        <section class="container my-5">
            <div class="services-grid">
                <a href="#" class="service-card">
                    <i class="fas fa-hand-holding-usd"></i>
                    <h3>Request Money</h3>
                </a>
                <a href="tomobile.jsp" class="service-card">
                    <i class="fas fa-mobile-alt"></i>
                    <h3>Send via Mobile</h3>
                </a>
                <a href="banktransfer.jsp" class="service-card">
                    <i class="fas fa-exchange-alt"></i>
                    <h3>Bank Transfer</h3>
                </a>
                <a href="checkbalance.jsp" class="service-card">
                    <i class="fas fa-wallet"></i>
                    <h3>Check Balance</h3>
				</a>
				<a href="#" class="service-card">
   				 <i class="fas fa-file-signature"></i> <!-- for "Apply For Loan" -->
				    <h3>Apply For Loan</h3>
				</a>
				
				<a href="#" class="service-card">
				    <i class="fas fa-search-dollar"></i> <!-- for "Check Loan" -->
				    <h3>Check Or Pay Loan</h3>
				</a>
				
				<a href="withdraw.jsp" class="service-card">
				    <i class="fas fa-credit-card"></i> <!-- for "Pay Loan" -->
				    <h3>WithDraw</h3>
				</a>
				
				<a href="deposit.jsp" class="service-card">
				    <i class="fas fa-piggy-bank"></i> <!-- for "Deposit" -->
				    <h3>Deposit</h3>
				</a>
			</div>
        </section>
    </main>
   

      <footer class="site-footer">
        <ul class="footer-links">
            <li><a href="privacypolicy.html">Privacy Policy</a></li>
            <li><a href="termsandconditions.html">Terms and Conditions</a></li>
            <li><a href="security.html">Security</a></li>
            <li><a href="sitemap.html">Sitemap</a></li>
            <li><a href="security.html">FAQs</a></li>
        </ul>
        <div class="social-icons">
            <a href="https://www.facebook.com/profile.php?id=61577944252639" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
            <a href="http://www.twitter.com" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
            <a href="http://www.linkedin.com" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
            <a href="http://www.instagram.com" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
        </div>
        <p>&copy; 2025 YASHBANK. All rights reserved.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
  
</body>
</html>