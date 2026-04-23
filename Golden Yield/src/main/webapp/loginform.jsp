<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Farming Project - Login</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
  * { box-sizing: border-box; }

  /* No page scrollbars */
  html, body {
    height: 100%;
    overflow: hidden; /* disables scrollbars completely */
  }

  body {
    margin: 0;
    padding: clamp(8px, 1.8vw, 16px);
    font-family: 'Poppins', sans-serif;
    background-color: #8f9f99;

    /* Use dynamic viewport height so it fits with mobile browser UI */
    min-height: 100dvh;

    display: flex;
    justify-content: center;
    align-items: center;
  }

  .login-wrapper {
    display: flex;
    width: 100%;
    max-width: clamp(320px, 92vw, 900px);

    /* Fit fully inside screen height (no scroll) */
    max-height: calc(100dvh - (clamp(8px, 1.8vw, 16px) * 2));
    height: auto;

    border-radius: clamp(10px, 2vw, 15px);
    overflow: hidden; /* ensures nothing creates scrollbars */
    box-shadow: 0 10px 30px rgba(0,0,0,0.3);
    background: #fff;

    /* Prevent flex overflow */
    min-width: 0;
  }

  .left-panel, .right-panel { min-width: 0; }

  .left-panel {
    flex: 1;
    background: linear-gradient(135deg, rgba(11,132,87,1), rgba(15,157,88,1));
    color: #fff;

    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;

    padding: clamp(14px, 3.2vw, 34px);
    text-align: center;
    gap: clamp(6px, 1.4vw, 10px);
  }

  .left-panel h1 {
    margin: 0 0 clamp(4px, 1vw, 8px);
    font-size: clamp(16px, 2.8vw, 24px);
    font-weight: 600;
    line-height: 1.15;
  }

  .left-panel p {
    margin: 0 0 clamp(8px, 1.8vw, 16px);
    font-size: clamp(11px, 1.6vw, 13px);
    line-height: 1.35;
    max-width: 34ch;
  }

  .right-panel {
    flex: 1.2;
    padding: clamp(14px, 3.5vw, 38px);
    display: flex;
    flex-direction: column;
    justify-content: center;
    background: #fff;

    /* Must not scroll inside either */
    overflow: hidden;
  }

  .right-panel h2 {
    color: #0b8457;
    margin: 0 0 clamp(6px, 1.2vw, 10px);
    font-weight: 600;
    font-size: clamp(16px, 2.2vw, 22px);
    line-height: 1.2;
  }

  .right-panel p {
    margin: 0 0 clamp(10px, 2vw, 16px);
    color: #555;
    font-size: clamp(11px, 1.6vw, 13px);
    line-height: 1.35;
  }

  .radio-group {
    display: flex;
    flex-wrap: wrap;
    gap: 10px 12px;
    margin-bottom: clamp(8px, 1.8vw, 14px);
  }

  .radio-group label {
    font-size: clamp(11px, 1.6vw, 13px);
    color: #333;
    white-space: normal;
  }

  input[type="radio"] { margin-right: 5px; }

  input[type="text"], input[type="password"] {
    width: 100%;
    padding: clamp(9px, 1.8vw, 11px) clamp(12px, 2.2vw, 14px);
    margin-bottom: clamp(8px, 1.6vw, 12px);
    border-radius: 999px;
    border: 1px solid #ccc;
    background-color: #f4f4f4;
    font-size: clamp(11px, 1.6vw, 13px);
    transition: 0.3s ease;
  }

  input[type="text"]:focus, input[type="password"]:focus {
    border-color: #0b8457;
    background-color: #fff;
    outline: none;
  }

  .forgot-password {
    text-align: right;
    font-size: clamp(10px, 1.4vw, 12px);
    margin-bottom: clamp(6px, 1.4vw, 10px);
  }

  .forgot-password a {
    color: #0b8457;
    text-decoration: none;
  }
  .forgot-password a:hover { text-decoration: underline; }

  .message-display {
    color: red;
    font-size: clamp(10px, 1.4vw, 12px);
    margin: clamp(6px, 1.2vw, 10px) 0;
    text-align: center;
  }

  .login-btn {
    width: 100%;
    background-color: #0b8457;
    color: white;
    padding: clamp(9px, 1.8vw, 11px);
    border: none;
    border-radius: 999px;
    font-size: clamp(11px, 1.6vw, 13px);
    font-weight: 700;
    cursor: pointer;
    transition: 0.3s ease;
  }
  .login-btn:hover { background-color: #096c43; }

  .register-link {
    margin-top: clamp(8px, 1.6vw, 14px);
    text-align: center;
    font-size: clamp(10px, 1.4vw, 12px);
  }

  .register-link a {
    color: #0b8457;
    text-decoration: none;
    font-weight: 700;
  }
  .register-link a:hover { text-decoration: underline; }

  .sign-btn {
    background: linear-gradient(135deg, #00695c, #26a69a);
    border: none;
    border-radius: 999px;
    padding: clamp(8px, 1.6vw, 10px) clamp(14px, 2.8vw, 22px);
    cursor: pointer;
    transition: all 0.3s ease;
  }

  .sign-btn a {
    color: white;
    font-size: clamp(11px, 1.6vw, 13px);
    font-weight: 700;
    text-decoration: none;
    text-transform: uppercase;
    letter-spacing: 1px;
    display: block;
  }

  .sign-btn:hover {
    background: linear-gradient(135deg, #26a69a, #00695c);
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
    transform: translateY(-2px);
  }
  .sign-btn:hover a { color: black; }
  .sign-btn:active { transform: translateY(0); box-shadow: none; }

  /* Stack earlier to avoid mid-width overflow */
  @media (max-width: 900px) {
    .login-wrapper { flex-direction: column; }
  }

  /* Short height screens: hide extra text so it fits without scrolling */
  @media (max-height: 620px) {
    .left-panel p { display: none; }
    .right-panel p { display: none; }
  }

  @media (max-height: 520px) {
    .register-link { display: none; }
  }
</style>
</head>

<body>

<div class="login-wrapper">
  <div class="left-panel">
    <h1>Welcome Back!</h1>
    <p>To stay connected with us please login with your personal info</p>
    <button class="sign-btn"><a href="#" onclick="openRegistrationForm()">SIGN IN</a></button>
  </div>

  <div class="right-panel">
    <h2>Welcome</h2>
    <p>Login to your account to continue</p>

    <form action="<%=request.getContextPath()%>/loginservlet" method="POST">
      <div class="radio-group">
        <label><input type="radio" name="role" value="admin" required> Admin</label>
        <label><input type="radio" name="role" value="seller"> Seller</label>
        <label><input type="radio" name="role" value="transport"> Transport</label>
        <label><input type="radio" name="role" value="agent"> Agent</label>
      </div>

      <input type="text" name="username" placeholder="Email or Username" required>
      <input type="password" name="password" placeholder="Password" required>

      <div class="forgot-password">
        <a href="#" onclick="forgotpasswordpage()">Forgot your password?</a>
      </div>

      <%
        String message = (String) request.getAttribute("message");
        if (message == null) message = "";
      %>

      <%
        String msg = (String) session.getAttribute("message");
        if (msg != null) {
          out.println("<p style='color:red; font-weight:bold; margin:6px 0; text-align:center;'>" + msg + "</p>");
          session.removeAttribute("message");
        }
      %>

      <p class="message-display"><%= message %></p>

      <button type="submit" class="login-btn">LOG IN</button>

      <div class="register-link">
        Don't have an account? <a href="#" onclick="openRegistrationForm()">Sign up</a>
      </div>
    </form>
  </div>
</div>

<script>
function openRegistrationForm(){
  let role = document.querySelector('input[name="role"]:checked');
  if (!role) {
    alert("First Select Role to PROCEED!");
    return;
  }
  switch(role.value){
    case "agent": window.location.href='agentregistration.jsp'; break;
    case "seller": window.location.href='sellerregistration.jsp'; break;
    case "transport": window.location.href='vehicleregistration.jsp'; break;
  }
}

function forgotpasswordpage(){
  let mainvalue = document.querySelector('input[name="role"]:checked');
  if(!mainvalue){
    alert("First Select Role to PROCEED!");
    return;
  }
  switch(mainvalue.value){
    case "agent": window.location.href='agentforgotpage.jsp'; break;
    case "seller": window.location.href='sellerforgotpage.jsp'; break;
    case "transport": window.location.href='vehicleforgotpage.jsp'; break;
    case "admin": alert("Please contact admin support directly."); break;
  }
}
</script>

</body>
</html>
