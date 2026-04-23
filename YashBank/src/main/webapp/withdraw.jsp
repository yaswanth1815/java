<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YASHBANK - Withdraw</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;600;700&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap');

        :root {
            --primary-blue: #004D99;
            --light-blue: #D6E8F6;
            --accent-gold: #B8860B;
            --dark-text: #2c3e50;
            --light-text: #f8f8f8;
            --medium-grey: #6c7a89;
            --white: #ffffff;
            --off-white: #F5F5F5;
            --shadow-light: rgba(0, 0, 0, 0.08);
            --shadow-medium: rgba(0, 0, 0, 0.15);
            --shadow-strong: rgba(0, 0, 0, 0.25);
        }

        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            background-color: var(--off-white);
            color: var(--dark-text);
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            justify-content: center;
            align-items: center;
        }

        .page-title {
            color: var(--primary-blue);
            font-family: 'Open Sans', sans-serif;
            font-weight: 700;
            font-size: 2.8em;
            text-align: center;
            margin-top: 20px;
            margin-bottom: 20px;
            position: relative;
            padding-bottom: 10px;
            letter-spacing: 0.5px;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
        }

        .page-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 5px;
            background-color: var(--accent-gold);
            border-radius: 3px;
            box-shadow: 0 2px 8px rgba(184, 134, 11, 0.4);
        }

        main {
            padding: 10px 30px;
            max-width: 600px;
            width: 90%;
            margin: 30px auto;
            background-color: var(--white);
            border-radius: 15px;
            box-shadow: 0 12px 30px var(--shadow-strong);
            text-align: left;
            position: relative;
            overflow: hidden;
            animation: fadeInScale 0.8s ease-out forwards;
        }

        @keyframes fadeInScale {
            from {
                opacity: 0;
                transform: scale(0.95) translateY(20px);
            }
            to {
                opacity: 1;
                transform: scale(1) translateY(0);
            }
        }

        .form-section {
            position: relative;
            z-index: 1;
            padding:30px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 12px;
            font-weight: 700;
            color: var(--primary-blue);
            font-size: 1.1em;
        }

        .form-group input[type="number"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 10px 20px;
            border: 2px solid #e0e0e0;
            border-radius: 12px;
            font-size: 1.1em;
            box-sizing: border-box;
            transition: border-color 0.4s ease, box-shadow 0.4s ease, background-color 0.4s ease;
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.05);
        }

        .form-group input:focus {
            border-color: var(--accent-gold);
            box-shadow: 0 0 0 5px rgba(29, 204, 84, 0.2), inset 0 1px 3px rgba(0, 0, 0, 0.08);
            background-color: #fffaf0;
            outline: none;
        }

        .submit-button {
            background: linear-gradient(135deg, var(--primary-blue) 0%, #003a70 100%);
            color: var(--white);
            padding: 10px 40px;
            border: none;
            border-radius: 12px;
            font-size: 1.3em;
            font-weight: 700;
            cursor: pointer;
            transition: background 0.4s ease, transform 0.3s ease, box-shadow 0.3s ease;
            display: block;
            width: 100%;
            max-width: 300px;
            margin: 10px auto 0;
            box-shadow: 0 8px 20px rgba(0, 77, 153, 0.4);
            letter-spacing: 0.8px;
            position: relative;
            overflow: hidden;
            z-index: 1;
        }

        .submit-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.2);
            transition: left 0.4s ease;
            transform: skewX(-20deg);
        }

        .submit-button:hover::before {
            left: 100%;
        }

        .submit-button:hover {
            background: linear-gradient(135deg, #003a70 0%, var(--primary-blue) 100%);
            transform: translateY(-5px);
            box-shadow: 0 12px 25px rgba(0, 77, 153, 0.5);
        }

        @media (max-width: 768px) {
            .page-title {
                font-size: 2.2em;
            }
            .submit-button {
                font-size: 1.1em;
            }
        }
    </style>
</head>
<body>
    <h1 class="page-title">Withdraw Funds</h1>
    <main>
        <section class="container form-section">
            <form action="withdrawServlet" method="POST">
                <div class="form-group">
                    <label for="amount">Amount</label>
                    <input type="number" id="amount" name="amount" placeholder="Enter amount to withdraw" required>
                </div>
                <div class="form-group">
                    <label for="password">Your Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>
                </div>
                <%
                    String msg = (String) request.getAttribute("message");
                    if (msg == null) { msg = ""; }
                %>
                <p  text-align:center;"><%= msg %></p>
                <button type="submit" class="submit-button">Withdraw</button>
            </form>
        </section>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
