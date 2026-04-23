<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Agent Registration</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Montserrat', sans-serif;
            background: linear-gradient(145deg, #f0f4f8, #d9e2ec);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            overflow: hidden;
            position: relative;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200"%3E%3Cpath fill="%239cc5a1" d="M100,20 A80,80 0 0,1 180,100 A80,80 0 0,1 100,180 A80,80 0 0,1 20,100 A80,80 0 0,1 100,20 M100,50 A50,50 0 0,0 50,100 A50,50 0 0,0 100,150 A50,50 0 0,0 150,100 A50,50 0 0,0 100,50"%3E%3C/path%3E%3C/svg%3E');
            opacity: 0.05;
            z-index: -1;
        }

        .container {
            display: flex;
            background-color: #ffffff;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 95%;
            max-width: 1100px;
            height: 85vh;
            position: relative;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .container:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
        }

        /* Left Welcome Section */
        .welcome-section {
            background: linear-gradient(135deg, #00695c, #00897b);
            color: white;
            padding: 50px;
            width: 40%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            position: relative;
        }

        .welcome-section h2 {
            font-size: 32px;
            margin-bottom: 20px;
            text-transform: uppercase;
            letter-spacing: 1.5px;
        }

        .welcome-section p {
            font-size: 16px;
            line-height: 1.5;
            margin-bottom: 30px;
        }

        .welcome-section button {
            background: linear-gradient(90deg, #00695c, #00897b);
            color: white;
            padding: 12px 28px;
            border: none;
            border-radius: 30px;
            font-weight: 600;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .welcome-section button:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
        }

        .login-section {
            margin-top: 20px;
        }

        .login-section p {
            color: #ffffff;
            font-size: 15px;
            margin-bottom: 15px;
        }

        /* Right Form Section */
        .form-section {
            padding: 50px;
            width: 60%;
            overflow-y: auto;
            background: #ffffff;
        }

        h2 {
            text-align: center;
            color: #00695c;
            font-size: 30px;
            font-weight: 700;
            margin-bottom: 30px;
            letter-spacing: 1px;
        }

        label {
            font-weight: 600;
            display: block;
            margin-bottom: 8px;
            color: #333333;
            font-size: 14px;
        }

        input[type="text"],
        input[type="number"],
        input[type="tel"],
        input[type="date"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #cccccc;
            border-radius: 8px;
            font-size: 14px;
            background-color: #f9f9f9;
            transition: all 0.3s ease;
        }

        input:focus {
            border-color: #00897b;
            box-shadow: 0 0 8px rgba(0, 137, 123, 0.3);
            background-color: #ffffff;
        }

        button[type="submit"] {
            width: 60%;
            background: linear-gradient(135deg, #00695c, #00897b);
            color: white;
            padding: 14px;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            display: block;
            margin: 30px auto;
            transition: all 0.3s ease;
        }

        button[type="submit"]:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
        }

        .message-display {
            color: #d32f2f;
            font-size: 14px;
            text-align: center;
            margin-top: 10px;
        }

        /* Scrollbar Styling */
        .form-section::-webkit-scrollbar {
            width: 8px;
        }

        .form-section::-webkit-scrollbar-thumb {
            background: linear-gradient(135deg, #00695c, #00897b);
            border-radius: 8px;
        }

        .form-section::-webkit-scrollbar-track {
            background: #f0f4f8;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                height: auto;
                width: 90%;
            }

            .welcome-section, .form-section {
                width: 100%;
                padding: 30px;
            }

            .welcome-section {
                border-radius: 20px 20px 0 0;
            }

            .form-section {
                border-radius: 0 0 20px 20px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="welcome-section">
        <h2>Welcome Agent!</h2>
        <p>Join our platform and start connecting in just 30 seconds!</p>
        <button onclick="window.location.href='loginform.jsp'">Login</button>
        <div class="login-section">
            <p>Already have an account?</p>
        </div>
    </div>

    <div class="form-section">
        <h2>Agent Registration</h2>
        <form id="agentregistration" action="<%=request.getContextPath()%>/agentregistrationservlet" method="POST">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="mobile">Mobile:</label>
            <input type="tel" id="mobile" name="mobile" pattern="[0-9]{10}" required>

            <label for="adhaar">Aadhaar Number:</label>
            <input type="number" id="adhaar" name="adhaar" required>

            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="dob" required>

            <label for="state">State:</label>
            <input type="text" id="state" name="state" required>

            <label for="district">District:</label>
            <input type="text" id="district" name="district" required>

            <label for="mandal">Mandal:</label>
            <input type="text" id="mandal" name="mandal" required>

            <label for="village">Village:</label>
            <input type="text" id="village" name="village" required>

            <label for="secretid">Secret ID:</label>
            <input type="number" id="secretid" name="secretid" required>

            <label for="secretKey">Secret Key:</label>
            <input type="text" id="secretKey" name="secretkey" required>

            <label for="account">Bank Account Number:</label>
            <input type="number" id="account" name="account" required>

            <label for="ifsc">IFSC Code:</label>
            <input type="text" id="ifsc" name="ifsc" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <label for="repassword">Re-enter Password:</label>
            <input type="password" id="repassword" name="repassword" required>

            <div id="message" class="message-display"></div>

            <button type="submit">Register Now</button>
        </form>
    </div>
</div>

<script>
    var form = document.getElementById("agentregistration");
    var password = document.getElementById("password");
    var repass = document.getElementById("repassword");
    var message = document.getElementById("message");

    repass.addEventListener("input", function() {
        if (password.value != repass.value) {
            message.textContent = "Passwords Not Matched";
            message.style.color = "#d32f2f";
        } else {
            message.textContent = "";
        }
    });

    form.addEventListener("submit", function(e) {
        if (password.value != repass.value) {
            e.preventDefault();
            alert("Passwords Not Matched");
            repass.focus();
        }
    });
</script>
</body>
</html>