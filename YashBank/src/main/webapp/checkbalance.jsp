<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Secure Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        .login-container h2 {
            margin-bottom: 30px;
            color: #333333;
            font-size: 28px;
        }

        .input-group {
            margin-bottom: 25px;
            text-align: left;
        }

        .input-group label {
            display: block;
            margin-bottom: 8px;
            color: #555555;
            font-size: 16px;
            font-weight: bold;
        }

        .input-group input[type="password"] {
            width: calc(100% - 20px);
            padding: 12px 10px;
            border: 1px solid #cccccc;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        .input-group input[type="password"]:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.2);
        }

        .submit-button {
            width: 100%;
            padding: 15px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-button:hover {
            background-color: #0056b3;
        }

        .forgot-password {
            margin-top: 20px;
            font-size: 14px;
        }

        .forgot-password a {
            color: #007bff;
            text-decoration: none;
        }

        .forgot-password a:hover {
            text-decoration: underline;
        }
    </style>

</head>
<body>
    <div class="login-container">
        <h2>Bank Balance</h2>
        <form action="checkbalancejava" method="POST">
            <div class="input-group" >
                <label for="password">Password</label>
                <input type="password" id="passworrd" name="password" placeholder="Enter your password" required>
                
    </button>
                
            </div>
            
           <% 
           	String msg=(String) request.getAttribute("message");
            if(msg==null){
            	msg="";
            }
           %>
           <p><%= msg %></p>
            <button type="submit" class="submit-button">Check</button>
            <div class="forgot-password">
                <a href="forgotpassword.jsp">Forgot Password?</a>
            </div>
        </form>
    </div>
    
</body>
   
</html>