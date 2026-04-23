<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Golden Yield | Crop Marketplace</title>

<style>
/* RESET */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Segoe UI", system-ui, sans-serif;
}

/* BACKGROUND */
body {
    background: url("https://t4.ftcdn.net/jpg/01/95/46/95/240_F_195469577_vQPdA2xEBmQuS7T6NCiGiicSCItwLNd6.jpg")
        no-repeat center center fixed;
    background-size: cover;
    color: white;
}

/* DARK OVERLAY */
body::before {
    content: "";
    position: fixed;
    inset: 0;
    background: rgba(0,0,0,0.6);
    z-index: -1;
}

/* NAVBAR */
.navbar {
    position: fixed;
    top: 0;
    width: 100%;
    background: rgba(34, 139, 34, 0.95);
    padding: 14px 40px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    z-index: 1000;
}

/* LOGO */
.logo {
    font-size: 24px;
    font-weight: 700;
}

/* DESKTOP MENU */
.nav-links {
    list-style: none;
    display: flex;
    gap: 24px;
}

.nav-links a {
    text-decoration: none;
    color: white;
    font-weight: 500;
}

.nav-links a:hover {
    color: #ffeb3b;
}

/* MENU CONTAINER */
.menu-container {
    position: relative;
}

/* HAMBURGER */
.menu-toggle {
    display: none;
    font-size: 30px;
    cursor: pointer;
}

/* MOBILE MENU */
@media (max-width: 768px) {
    .nav-links {
        display: none;
        position: absolute;
        top: 45px;
        right: 0;
        background: rgba(34, 139, 34, 0.97);
        flex-direction: column;
        padding: 12px 18px;
        border-radius: 8px;
        width: max-content;
        box-shadow: 0 6px 14px rgba(0,0,0,0.35);
    }

    .nav-links li {
        padding: 8px 0;
        white-space: nowrap;
    }

    .nav-links.active {
        display: flex;
    }

    .menu-toggle {
        display: block;
    }
}

/* HERO */
.hero {
    min-height: 85vh;
    padding-top: 120px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    text-align: center;
    padding-inline: 20px;
}

.hero h1 {
    font-size: clamp(32px, 5vw, 56px);
    font-weight: 700;
}

.hero p {
    font-size: clamp(16px, 2.5vw, 22px);
    margin-top: 14px;
    max-width: 720px;
    line-height: 1.6;
}

.hero button {
    margin-top: 28px;
    padding: 14px 34px;
    font-size: 16px;
    font-weight: 600;
    border: none;
    border-radius: 6px;
    background: #ffd700;
    cursor: pointer;
}

.hero button:hover {
    background: #ffeb3b;
}

/* FEATURES */
.features {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
    gap: 30px;
    padding: 60px 40px;
}

.feature-card {
    background: rgba(255,255,255,0.9);
    color: #222;
    padding: 28px 22px;
    border-radius: 14px;
    text-align: center;
    transition: transform 0.3s;
}

.feature-card:hover {
    transform: translateY(-6px);
}

.feature-card h3 {
    color: #228B22;
    margin-bottom: 10px;
}

/* FOOTER */
footer {
    background: rgba(34, 139, 34, 0.95);
    text-align: center;
    padding: 20px;
    font-size: 14px;
}
</style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar">
    <div class="logo">Golden Yield</div>

    <div class="menu-container">
        <div class="menu-toggle" onclick="toggleMenu()">☰</div>
        <ul class="nav-links" id="navLinks">
            <li><a href="#">Home</a></li>
            <li><a href="aboutpage.jsp">About</a></li>
            <li><a href="contactuspage.jsp">Contact</a></li>
            <li><a href="agentregistration.jsp">Apply</a></li>
            <li><a href="loginform.jsp">Login</a></li>
        </ul>
    </div>
</nav>

<!-- HERO -->
<section class="hero">
    <h1>Welcome to Golden Yield</h1>
    <p>Contact Us to Begin Registration</p>
    <pre>From our fields to your home — fresh, fair, and farmer-direct
     agricultural trade.</pre>
    <button>Start Selling</button>
</section>

<!-- FEATURES -->
<section class="features">
    <div class="feature-card">
        <h3>Sell Your Crops</h3>
        <p>Farmers list harvests and reach buyers directly.</p>
    </div>
    <div class="feature-card">
        <h3>Buy Fresh Produce</h3>
        <p>Consumers get quality crops without middlemen.</p>
    </div>
    <div class="feature-card">
        <h3>Market Updates</h3>
        <p>Live crop prices and demand insights.</p>
    </div>
</section>

<!-- FOOTER -->
<footer>
    &copy; 2025 Golden Yield. All rights reserved.
</footer>

<script>
function toggleMenu() {
    document.getElementById("navLinks").classList.toggle("active");
}
</script>

</body>
</html>
