<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Agent Dashboard</title>

<style>
/* ================= BASE ================= */
body {
  margin: 0;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  height: 100vh;
  display: flex;
  flex-direction: column;
  background: #f4f6f8;
  overflow: hidden;
}

/* ================= NAVBAR ================= */
.navbar {
  background-color: #2c3e50;
  padding: 14px 20px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  position: relative;
}

.navbar-left {
  display: flex;
  align-items: center;
  gap: 30px;     /* CHANGED: gap between GoldenYield text and 3 buttons */
  flex: 1;
}

.left-text {
  font-size: 30px;
  font-weight: bold;
  color: white;
  white-space: nowrap;
}

.nav-buttons {
  display: flex;
  gap: 12px;
  margin-left: 0;   /* CHANGED: was auto; now stays beside GoldenYield */
}

.nav-buttons button {
  background: linear-gradient(135deg, #00695c, #00897b);
  color: white;
  border: none;
  padding: 8px 16px;
  border-radius: 8px;
  cursor: pointer;
  font-weight: 600;
}

.right-section {
  display: flex;
  align-items: center;
  gap: 10px;
  color: white;
}

#ops-text{
  color: white;
  font-weight: bold;
  white-space: nowrap;
  margin-left: 20px; /* gap between Farmers button and 'Welcome...' */
}

#login-time-label{
  display: inline;
  white-space: nowrap;
}

#login-time-value{
  display: inline;
  white-space: nowrap;
}

.logout-btn {
  background-color: #e74c3c;
  border: none;
  padding: 6px 14px;
  color: white;
  border-radius: 5px;
  cursor: pointer;
}

/* ================= MOBILE MENU ================= */
.mobile-toggle {
  display: none;
  font-size: 26px;
  cursor: pointer;
  color: white;
}

.mobile-actions-toggle{
  display: none;
  font-size: 26px;
  cursor: pointer;
  color: white;
}

.mobile-menu {
  display: none;
  position: absolute;
  top: 60px;
  left: 15px;   /* left side */
  right: auto;  /* left side */
  width: 270px;
  max-height: 80vh;
  overflow-y: auto;
  background: white;
  border-radius: 8px;
  box-shadow: 0 6px 18px rgba(0,0,0,0.25);
  z-index: 1000;
}

/* CHANGED: force actions dropdown also to left side */
#actionsMenu{
  left: 15px;
  right: auto;
}

.mobile-menu strong {
  display: block;
  padding: 10px;
  background: #ecf0f1;
  color: #2c3e50;
  font-size: 14px;
}

.mobile-menu button {
  width: 100%;
  padding: 6px 10px;
  border: none;
  background: white;
  text-align: left;
  cursor: pointer;
  font-weight: 600;
}

.mobile-menu button:hover {
  background: #f2f2f2;
}

/* ================= MAIN ================= */
.main-area,
.main-area1 {
  flex-grow: 1;
  display: none;
}

.main-area1 {
  display: flex;
}

.sidebar {
  width: 250px;
  background-color: #2c3e50;
  color: white;
  padding: 10px;
  overflow-y: auto;
}

.sidebar button {
  width: 100%;
  margin: 6px 0;
  padding: 10px;
  border: none;
  border-radius: 6px;
  background-color: #34495e;
  color: white;
  cursor: pointer;
}

.sidebar button:hover {
  background-color: #1abc9c;
}

.content {
  flex-grow: 1;
}

iframe {
  width: 100%;
  height: 100%;
  border: none;
}

/* ================= FOOTER ================= */
.footer {
  background-color: #2c3e50;
  color: white;
  text-align: center;
  padding: 10px;
}

/* ================= WIDTH RULES ================= */
@media (max-width: 1230px) {
  #ops-text {
    display: none;
  }
}

@media (max-width: 600px) {
  #login-time-label{
    display: none;
  }
}

/* ================= MOBILE ================= */
@media (max-width: 768px) {
  .nav-buttons,
  .sidebar {
    display: none;
  }

  .mobile-toggle {
    display: block;
  }

  .mobile-actions-toggle {
    display: block;
  }
}
</style>
</head>

<body>

<!-- ================= NAVBAR ================= -->
<div class="navbar">

  <div class="navbar-left">
    <span class="mobile-toggle" onclick="toggleMobileMenu()">☰</span>
    <span class="mobile-actions-toggle" onclick="toggleActionsMenu()">⋮</span>
    <span class="left-text">GoldenYield</span>

    <div class="nav-buttons">
      <button id="frame-agent">Agents</button>
      <button id="frame-transport">Transport</button>
      <button id="frame-farmers">Farmers</button>
    </div>
  </div>

  <div class="right-section">
    <span id="ops-text">Welcome — Operations at Your Fingertips</span>

    <span id="login-time-label">Login Time:</span>
    <span id="login-time-value"></span>

    <button class="logout-btn" onclick="location.href='loginform.jsp'">Logout</button>
  </div>

  <!-- ================= MOBILE MENU 1: MAIN SECTIONS ONLY ================= -->
  <div class="mobile-menu" id="mobileMenu">
    <strong>Main Sections</strong>
    <button onclick="frameAgent();">Agents</button>
    <button onclick="frameTransport();">Transport</button>
    <button onclick="frameFarmer();">Farmers</button>
  </div>

  <!-- ================= MOBILE MENU 2: ACTIONS (ONLY FOR SELECTED SECTION) ================= -->
  <div class="mobile-menu" id="actionsMenu">

    <div id="actions-agent">
      <strong>Agents</strong>
      <button onclick="frameAgent(); loadPage('addagent.jsp','agentFrame');">Add Agent</button>
      <button onclick="frameAgent(); loadPage('deleteagent.jsp','agentFrame');">Delete Agent</button>
      <button onclick="frameAgent(); loadPage('showagentrecordsservlet','agentFrame');">Show All Agents</button>
      <button onclick="frameAgent(); loadPage('acquireagents.jsp','agentFrame');">Need for Agents</button>
      <button onclick="frameAgent(); loadPage('settledagenttransactions.jsp','agentFrame');">Settled Transactions</button>
      <button onclick="frameAgent(); loadPage('ongoingagenttransactions.jsp','agentFrame');">Ongoing Transactions</button>
      <button onclick="frameAgent(); loadPage('pendingagnettransactions.jsp','agentFrame');">Pending Transactions</button>
      <button onclick="frameAgent(); loadPage('sendagentnotifications.jsp','agentFrame');">Send Notifications</button>
    </div>

    <div id="actions-transport">
      <strong>Transport</strong>
      <button onclick="frameTransport(); loadPage('addvehicle.jsp','transportFrame');">Add Vehicle</button>
      <button onclick="frameTransport(); loadPage('deletevehicle.jsp','transportFrame');">Delete Vehicle</button>
      <button onclick="frameTransport(); loadPage('showvehiclerecordsservlet','transportFrame');">Show All Vehicles</button>
      <button onclick="frameTransport(); loadPage('acquireagents.jsp','transportFrame');">Transaction Requests</button>
      <button onclick="frameTransport(); loadPage('settledagenttransactions.jsp','transportFrame');">Settled Transactions</button>
      <button onclick="frameTransport(); loadPage('ongoingagenttransactions.jsp','transportFrame');">Ongoing Transactions</button>
      <button onclick="frameTransport(); loadPage('pendingagnettransactions.jsp','transportFrame');">Failed Transactions</button>
      <button onclick="frameTransport(); loadPage('sendagentnotifications.jsp','transportFrame');">Send Notifications</button>
    </div>

    <div id="actions-farmer">
      <strong>Farmers</strong>
      <button onclick="frameFarmer(); loadPage('addseller.jsp','farmerFrame');">Add Farmer</button>
      <button onclick="frameFarmer(); loadPage('deletefarmer.jsp','farmerFrame');">Delete Farmer</button>
      <button onclick="frameFarmer(); loadPage('showfarmerrecordsservlet','farmerFrame');">Show All Farmers</button>
      <button onclick="frameFarmer(); loadPage('settledagenttransactions.jsp','farmerFrame');">Settled Transactions</button>
      <button onclick="frameFarmer(); loadPage('ongoingagenttransactions.jsp','farmerFrame');">Ongoing Transactions</button>
      <button onclick="frameFarmer(); loadPage('pendingagnettransactions.jsp','farmerFrame');">Pending Transactions</button>
      <button onclick="frameFarmer(); loadPage('sendagentnotifications.jsp','farmerFrame');">Send Notifications</button>
      <button onclick="frameFarmer(); loadPage('setcroprates.jsp','farmerFrame');">Set Values</button>
    </div>

  </div>

</div>

<!-- ================= AGENT ================= -->
<div class="main-area1" id="agent-buttons">
  <div class="sidebar">
    <button onclick="loadPage('addagent.jsp','agentFrame')">Add Agent</button>
    <button onclick="loadPage('deleteagent.jsp','agentFrame')">Delete Agent</button>
    <button onclick="loadPage('showagentrecordsservlet','agentFrame')">Show All Agents</button>
    <button onclick="loadPage('acquireagents.jsp','agentFrame')">Need for Agents</button>
    <button onclick="loadPage('settledagenttransactions.jsp','agentFrame')">Settled Transactions</button>
    <button onclick="loadPage('ongoingagenttransactions.jsp','agentFrame')">Ongoing Transactions</button>
    <button onclick="loadPage('pendingagnettransactions.jsp','agentFrame')">Pending Transactions</button>
    <button onclick="loadPage('sendagentnotifications.jsp','agentFrame')">Send Notifications</button>
  </div>
  <div class="content"><iframe id="agentFrame"></iframe></div>
</div>

<!-- ================= TRANSPORT ================= -->
<div class="main-area" id="transport-buttons">
  <div class="sidebar">
    <button onclick="loadPage('addvehicle.jsp','transportFrame')">Add Vehicle</button>
    <button onclick="loadPage('deletevehicle.jsp','transportFrame')">Delete Vehicle</button>
    <button onclick="loadPage('showvehiclerecordsservlet','transportFrame')">Show All Vehicles</button>
    <button onclick="loadPage('acquireagents.jsp','transportFrame')">Transaction Requests</button>
    <button onclick="loadPage('settledagenttransactions.jsp','transportFrame')">Settled Transactions</button>
    <button onclick="loadPage('ongoingagenttransactions.jsp','transportFrame')">Ongoing Transactions</button>
    <button onclick="loadPage('pendingagnettransactions.jsp','transportFrame')">Failed Transactions</button>
    <button onclick="loadPage('sendagentnotifications.jsp','transportFrame')">Send Notifications</button>
  </div>
  <div class="content"><iframe id="transportFrame"></iframe></div>
</div>

<!-- ================= FARMER ================= -->
<div class="main-area" id="farmer-buttons">
  <div class="sidebar">
    <button onclick="loadPage('addseller.jsp','farmerFrame')">Add Farmer</button>
    <button onclick="loadPage('deletefarmer.jsp','farmerFrame')">Delete Farmer</button>
    <button onclick="loadPage('showfarmerrecordsservlet','farmerFrame')">Show All Farmers</button>
    <button onclick="loadPage('settledagenttransactions.jsp','farmerFrame')">Settled Transactions</button>
    <button onclick="loadPage('ongoingagenttransactions.jsp','farmerFrame')">Ongoing Transactions</button>
    <button onclick="loadPage('pendingagnettransactions.jsp','farmerFrame')">Pending Transactions</button>
    <button onclick="loadPage('sendagentnotifications.jsp','farmerFrame')">Send Notifications</button>
    <button onclick="loadPage('setcroprates.jsp','farmerFrame')">Set Values</button>
  </div>
  <div class="content"><iframe id="farmerFrame"></iframe></div>
</div>

<div class="footer">© 2025 GoldenYield</div>

<script>
let currentSection = "agent";

function closeall(){
  document.getElementById("agent-buttons").style.display="none";
  document.getElementById("transport-buttons").style.display="none";
  document.getElementById("farmer-buttons").style.display="none";
}

function showActionsFor(section){
  document.getElementById("actions-agent").style.display = "none";
  document.getElementById("actions-transport").style.display = "none";
  document.getElementById("actions-farmer").style.display = "none";
  document.getElementById("actions-" + section).style.display = "block";
}

function frameAgent(){
  closeall();
  currentSection = "agent";
  document.getElementById("agent-buttons").style.display="flex";
  closeMobileMenus();
}

function frameTransport(){
  closeall();
  currentSection = "transport";
  document.getElementById("transport-buttons").style.display="flex";
  closeMobileMenus();
}

function frameFarmer(){
  closeall();
  currentSection = "farmer";
  document.getElementById("farmer-buttons").style.display="flex";
  closeMobileMenus();
}

document.getElementById("frame-agent").onclick = frameAgent;
document.getElementById("frame-transport").onclick = frameTransport;
document.getElementById("frame-farmers").onclick = frameFarmer;

function loadPage(url, frameId){
  document.getElementById(frameId).src = url;
}

function toggleMobileMenu(){
  const menu = document.getElementById("mobileMenu");
  const actions = document.getElementById("actionsMenu");
  actions.style.display = "none";
  menu.style.display = (menu.style.display === "block") ? "none" : "block";
}

function toggleActionsMenu(){
  const menu = document.getElementById("actionsMenu");
  const main = document.getElementById("mobileMenu");
  main.style.display = "none";
  showActionsFor(currentSection);
  menu.style.display = (menu.style.display === "block") ? "none" : "block";
}

function closeMobileMenus(){
  document.getElementById("mobileMenu").style.display = "none";
  document.getElementById("actionsMenu").style.display = "none";
}

function attachAutoClose(menuId){
  const menu = document.getElementById(menuId);
  menu.querySelectorAll("button").forEach(btn => {
    btn.addEventListener("click", closeMobileMenus);
  });
}

attachAutoClose("mobileMenu");
attachAutoClose("actionsMenu");

document.getElementById("login-time-value").textContent =
  new Date().toLocaleTimeString();
</script>

</body>
</html>
