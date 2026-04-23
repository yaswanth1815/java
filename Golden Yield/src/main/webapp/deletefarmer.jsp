<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Agent Login</title>
  <style>
    body {
      background: linear-gradient(to right, #1f4037, #99f2c8);

      font-family: Arial, sans-serif;
      height: 90vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .login-box {
      background: rgba(0, 0, 0, 0.7);
      padding: 40px 30px;
      border-radius: 15px;
      width: 350px;
      color: white;
      text-align: center;
      box-shadow: 0 8px 20px rgba(0,0,0,0.3);
    }

    .login-box h2 {
      margin-bottom: 25px;
      color: #f8f8f8;
    }

    .login-box input {
      width: 90%;
      padding: 12px;
      margin: 10px 0;
      border: none;
      border-radius: 8px;
      font-size: 16px;
    }

    .login-box input:focus {
      outline: 2px solid #6c63ff;
      background-color: #fff;
      color: black;
    }

    .login-box button {
      width: 50%;
      padding: 12px;
      margin-top: 15px;
      margin-left: 10px;
      background: #6c63ff;
      color: white;
      border: none;
      border-radius: 8px;
      font-size: 18px;
      cursor: pointer;
      transition: 0.3s;
    }

    .login-box button:hover {
      background: #574fd6;
      transform: scale(1.05);
    }
  </style>
</head>
<body>
  <div class="login-box">
    <h2>Removing Seller</h2>
    <form action="<%=request.getContextPath()%>/deletefarmerservlet" method="post">
      <input type="number" name="sellerid" placeholder="Farmer ID" required>
      <input type="password" name="password" placeholder="Password" required>
      <%
      	var message=request.getAttribute("message");
      	if(message==null){
      		message="";
      	}
      %>
      <p><%= message %></p>
      <button type="submit">Submit</button>
    </form>
  </div>
</body>
</html>
    