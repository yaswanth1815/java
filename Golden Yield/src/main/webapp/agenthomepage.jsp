<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GoldenYield Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* Reset & base */
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background: #f4f7fa;
            display: flex;
            min-height: 100vh;
            color: #333;
        }

        /* Sidebar (desktop) */
        .sidebar {
            width: 250px;
            background-color: #1e293b;
            color: white;
            padding: 20px;
            display: flex;
            flex-direction: column;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
        }
        .sidebar-header {
            font-size: 40px;
            font-weight: 700;
            color: #22c55e;
            margin-bottom: 30px;
            text-align: center;
        }
        .sidebar-menu {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .sidebar-menu li {
            margin-bottom: 10px;
        }
        .sidebar-menu a {
            display: flex;
            align-items: center;
            padding: 12px 15px;
            color: #cbd5e1;
            text-decoration: none;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        .sidebar-menu a:hover {
            background-color: #334155;
            color: white;
            transform: translateX(5px);
        }
        .sidebar-menu i {
            margin-right: 15px;
            font-size: 18px;
            width: 20px;
            text-align: center;
        }

        /* Main */
        .main {
            flex: 1;
            display: flex;
            flex-direction: column;
            min-width: 0;
        }

        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color:  #1e293b;
            padding: 15px 30px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            position: relative;
        }

        .topbar-left{
            display: flex;
            align-items: center;
            gap: 12px;
            min-width: 0;
        }

        .topbar-welcome {
            margin-top: 10px;
            font-size: 30px;
            font-weight: 500;
            color: #f2f7f4;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .topbar-right {
            display: flex;
            align-items: center;
            gap: 15px;
            flex-shrink: 0;
        }

        .login-time {
            font-size: 14px;
            color: #dee4eb;
            white-space: nowrap;
        }

        .btn {
            background-color: #22c55e;
            border: none;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s ease;
            white-space: nowrap;
        }
        .btn:hover {
            background-color: #16a34a;
            box-shadow: 0 2px 8px rgba(34,197,94,0.3);
        }

        /* Content */
        .content {
            padding: 40px 30px;
            flex: 1;
        }
        .content h2 {
            font-size: 32px;
            margin-bottom: 15px;
            color: #1e293b;
        }
        .content p {
            font-size: 18px;
            margin-bottom: 40px;
            color: #64748b;
        }
        .quick-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }
        .stat-card {
            background: white;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
        }
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        }
        .stat-card h3 {
            font-size: 16px;
            color: #64748b;
            margin-bottom: 10px;
        }
        .stat-card .value {
            font-size: 28px;
            font-weight: 700;
            color: #22c55e;
        }

        /* Footer */
        footer {
            background-color: #1e293b;
            color: #cbd5e1;
            text-align: center;
            padding: 15px 0;
            font-size: 14px;
            box-shadow: 0 -2px 5px rgba(0,0,0,0.05);
        }
        footer p {
            margin: 5px 0;
        }

        /* Mobile icons + panels */
        .icon-btn{
            display: none;
            background: transparent;
            border: 0;
            color: #f2f7f4;
            font-size: 22px;
            cursor: pointer;
            padding: 6px 8px;
            border-radius: 8px;
            line-height: 1;
        }
        .icon-btn:hover{ background: rgba(255,255,255,0.08); }

        .mobile-panel{
            display: none;
            position: fixed;
            top: 70px;
            z-index: 2000;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.25);
        }
        .mobile-panel.open{ display: block; }

        #mobileSideMenu{
            left: 10px;
            width: 260px;
            max-height: calc(100vh - 90px);
            overflow-y: auto;
            background: #1e293b;
        }
        #mobileActionsMenu{
            right: 10px;
            width: 220px;
            background: #1e293b;
        }

        .mobile-panel button{
            display: flex;
            align-items: center;
            width: 100%;
            gap: 12px;
            padding: 12px 14px;
            border: 0;
            background: transparent;
            color: #cbd5e1;
            cursor: pointer;
            font-size: 14px;
            text-align: left;
        }
        .mobile-panel button:hover{
            background: #334155;
            color: #fff;
        }
        .mobile-panel i{
            width: 20px;
            text-align: center;
        }

        /* Single breakpoint: <= 520px */
        @media (max-width: 920px){
            body{ flex-direction: column; }

            .sidebar{ display: none; }               /* left buttons → left menu */
            .topbar-right .btn{ display: none; }     /* right buttons → right menu */

            #sideToggle, #actionsToggle{ display: inline-flex; }

            .topbar-welcome{ font-size: 18px; margin-top: 0; }
        }

        @media (min-width: 521px){
            .mobile-panel{ display: none !important; }
        }
    </style>
</head>
<body>
<% String name=(String)session.getAttribute("agentname"); %>

<!-- Sidebar (desktop) -->
<div class="sidebar">
    <div class="sidebar-header">GoldenYield</div>
    <ul class="sidebar-menu">
        <li><a href="#"><i class="fas fa-shopping-cart"></i>Sell Now</a></li>
        <li><a href="#"><i class="fas fa-exchange-alt"></i>Current Transactions</a></li>
        <li><a href="#"><i class="fas fa-chart-bar"></i>Analytics & Insights</a></li>
        <li><a href="#"><i class="fas fa-seedling"></i>Crop Rates</a></li>
        <li><a href="#"><i class="fas fa-money-bill-wave"></i>Your Earnings</a></li>
        <li><a href="#"><i class="fas fa-history"></i>History</a></li>
        <li><a href="#"><i class="fas fa-lightbulb"></i>Tips & Guides</a></li>
        <li><a href="#"><i class="fas fa-bullhorn"></i>Announcements</a></li>
        <li><a href="#"><i class="fas fa-receipt"></i>Payment History</a></li>
    </ul>
</div>

<!-- Main -->
<div class="main">
    <!-- Topbar -->
    <div class="topbar">
        <div class="topbar-left">
            <!-- mobile left icon -->
            <button class="icon-btn" id="sideToggle" type="button" onclick="toggleSideMenu()">☰</button>
            <div class="topbar-welcome">Welcome to Dashboard, <%=name %></div>
        </div>
        <div class="topbar-right">
            <div class="login-time" id="login-time">Login Time: --:--:--</div>
            <!-- desktop buttons -->
            <button class="btn" type="button">My Profile</button>
            <button class="btn" type="button">Raise a Ticket</button>
            <button class="btn" type="button">Logout</button>
            <!-- mobile right icon -->
            <button class="icon-btn" id="actionsToggle" type="button" onclick="toggleActionsMenu()">⋮</button>
        </div>
    </div>

    <!-- Mobile LEFT menu (sidebar items) -->
    <div class="mobile-panel" id="mobileSideMenu">
        <button type="button"><i class="fas fa-shopping-cart"></i>Sell Now</button>
        <button type="button"><i class="fas fa-exchange-alt"></i>Current Transactions</button>
        <button type="button"><i class="fas fa-chart-bar"></i>Analytics & Insights</button>
        <button type="button"><i class="fas fa-seedling"></i>Crop Rates</button>
        <button type="button"><i class="fas fa-money-bill-wave"></i>Your Earnings</button>
        <button type="button"><i class="fas fa-history"></i>History</button>
        <button type="button"><i class="fas fa-lightbulb"></i>Tips & Guides</button>
        <button type="button"><i class="fas fa-bullhorn"></i>Announcements</button>
        <button type="button"><i class="fas fa-receipt"></i>Payment History</button>
    </div>

    <!-- Mobile RIGHT menu (actions) -->
    <div class="mobile-panel" id="mobileActionsMenu">
        <button type="button"><i class="fas fa-user"></i>My Profile</button>
        <button type="button"><i class="fas fa-ticket"></i>Raise a Ticket</button>
        <button type="button"><i class="fas fa-right-from-bracket"></i>Logout</button>
    </div>

    <!-- Content -->
    <div class="content">
        <h2>Hello <%=name %> 👋</h2>
        <p>Manage your sales, track transactions, view earnings, and explore analytics from a single place.</p>

        <!-- Quick Stats -->
        <div class="quick-stats">
            <div class="stat-card">
                <h3>Total Earnings</h3>
                <div class="value">$12,450</div>
            </div>
            <div class="stat-card">
                <h3>Active Transactions</h3>
                <div class="value">8</div>
            </div>
            <div class="stat-card">
                <h3>Crop Rate Index</h3>
                <div class="value">+2.5%</div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>@goldenyield.in</p>
        <p>&copy; 2025 GoldenYield. All Rights Reserved.</p>
    </footer>
</div>

<script>
    // login time
    const now = new Date();
    document.getElementById('login-time').textContent =
      "Login Time: " + now.toLocaleTimeString();

    const sideMenu = document.getElementById("mobileSideMenu");
    const actionsMenu = document.getElementById("mobileActionsMenu");
    const sideToggle = document.getElementById("sideToggle");
    const actionsToggle = document.getElementById("actionsToggle");

    function closeMenus(){
      sideMenu.classList.remove("open");
      actionsMenu.classList.remove("open");
    }

    function toggleSideMenu(){
      actionsMenu.classList.remove("open");
      sideMenu.classList.toggle("open");
    }

    function toggleActionsMenu(){
      sideMenu.classList.remove("open");
      actionsMenu.classList.toggle("open");
    }

    document.addEventListener("click", (e) => {
      const clickedInside =
        sideMenu.contains(e.target) ||
        actionsMenu.contains(e.target) ||
        sideToggle.contains(e.target) ||
        actionsToggle.contains(e.target);

      if (!clickedInside) closeMenus();
    });

    window.addEventListener("resize", () => {
      if (window.innerWidth > 520) closeMenus();
    });
</script>

</body>
</html>
