<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YASHBANK - Bank Transfer</title>
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
            justify-content: center; /* Center content vertically if space allows */
            align-items: center; /* Center content horizontally */
        }
        
        .page-title {
            color: var(--primary-blue);
            font-family: 'Open Sans', sans-serif;
            font-weight: 700;
            font-size: 2.8em; /* Made title even larger for prominence */
            text-align: center;
            margin-top: 20px; /* Adjusted top margin */
            margin-bottom: 20px; /* Adjusted bottom margin */
            position: relative;
            padding-bottom: 10px; /* More space for the underline */
            letter-spacing: 0.5px; /* Slightly wider letter spacing */
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1); /* Subtle text shadow */
        }

        .page-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px; /* Longer underline */
            height: 5px; /* Thicker underline */
            background-color: var(--accent-gold);
            border-radius: 3px;
            box-shadow: 0 2px 8px rgba(184, 134, 11, 0.4); /* Shadow for underline */
        }

        main {
            flex-grow: 0; /* No longer need to grow, fixed height for form */
            padding: 10px 30px; /* Increased padding */
            max-width: 600px; /* Slightly narrower form for better focus */
            width: 90%; /* Responsive width */
            margin: 30px auto; /* Centering with added margin */
            background-color: var(--white);
            border-radius: 15px; /* Even more rounded corners */
            box-shadow: 0 12px 30px var(--shadow-strong); /* Stronger, more attractive shadow */
            text-align: left;
            position: relative;
            overflow: hidden;
            animation: fadeInScale 0.8s ease-out forwards; /* Entry animation */
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

        main::before {
            background-image: radial-gradient(circle, var(--light-blue) 2%, transparent 2%),
                              radial-gradient(circle, var(--light-blue) 2%, transparent 2%);
            background-size: 40px 40px; /* Larger pattern */
            background-position: 0 0, 20px 20px;
            opacity: 0.15; /* Slightly more visible pattern */
        }
        
        .form-section {
            position: relative;
            z-index: 1;
        }

        .form-group {
            margin-bottom: 10px; /* More space between groups */
        }

        .form-group label {
            display: block;
            margin-bottom: 12px; /* More space for labels */
            font-weight: 700; /* Even bolder labels */
            color: var(--primary-blue);
            font-size: 1.1em; /* Larger label font */
        }

        .form-group input[type="text"],
        .form-group input[type="password"],
        .form-group input[type="number"] {
            width: 100%;
            padding: 10px 20px; /* Even larger inputs */
            border: 2px solid #e0e0e0; /* Slightly thicker, lighter border */
            border-radius: 12px; /* Very rounded */
            font-size: 1.1em; /* Larger input font */
            box-sizing: border-box;
            transition: border-color 0.4s ease, box-shadow 0.4s ease, background-color 0.4s ease;
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.05); /* Subtle inset shadow */
        }

        .form-group input[type="text"]:focus,
        .form-group input[type="password"]:focus,
        .form-group input[type="number"]:focus {
            border-color: var(--accent-gold); /* Accent color border on focus */
            box-shadow: 0 0 0 5px rgba(29, 204, 84, 0.2), inset 0 1px 3px rgba(0, 0, 0, 0.08); /* Gold shadow on focus */
            background-color: #fffaf0; /* Very light gold background on focus */
            outline: none;
        }

        .submit-button {
            background: linear-gradient(135deg, var(--primary-blue) 0%, #003a70 100%);
            color: var(--white);
            padding: 18px 40px; /* Even larger button */
            border: none;
            border-radius: 12px; /* Very rounded */
            font-size: 1.3em; /* Larger button font */
            font-weight: 700;
            cursor: pointer;
            transition: background 0.4s ease, transform 0.3s ease, box-shadow 0.3s ease;
            display: block;
            width: 100%; /* Make button full width */
            max-width: 300px; /* Limit max width for centering */
            margin: 10px auto 0; /* Increased top margin */
            box-shadow: 0 8px 20px rgba(0, 77, 153, 0.4); /* Stronger button shadow */
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
            transform: translateY(-5px); /* More pronounced lift */
            box-shadow: 0 12px 25px rgba(0, 77, 153, 0.5); /* Even stronger shadow on hover */
        }

        @media (max-width: 768px) {
            .page-title {
                font-size: 2.2em;
                margin-top: 30px;
                margin-bottom: 25px;
            }
            .page-title::after {
                width: 70px;
                height: 4px;
            }
            main {
                padding: 30px 20px;
                width: 95%;
                margin: 20px auto;
            }
            .form-group {
                margin-bottom: 20px;
            }
            .form-group label {
                font-size: 1em;
            }
            .form-group input {
                padding: 12px 15px;
                font-size: 1em;
            }
            .submit-button {
                padding: 14px 30px;
                font-size: 1.1em;
                max-width: 250px;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <h1 class="page-title">Bank Transfer</h1>
    <main>
        <section class="container form-section">
            <form action="banktransferjava" method="POST">
                <div class="form-group">
                    <label for="accountNumber">Account Number</label>
                    <input type="text" id="accountNumber" name="aCcountNumber" placeholder="Enter recipient's account number" required>
                </div>
                <div class="form-group">
                    <label for="ifscCode">IFSC Code</label>
                    <input type="text" id="ifscCode" name="iFscCode" placeholder="Enter recipient's IFSC code" required>
                </div>
                <div class="form-group">
                    <label for="amount">Amount</label>
                    <input type="number" id="amount" name="aMount" placeholder="Enter Amount to transfer" required>
                </div>
                  <div class="form-group" style="position: relative;">
                  <label for="password">Your Password</label>
 				 </div>
                <%
                	String messag=(String) request.getAttribute("message");
                    if(messag==null){
                    	messag="";
                    }
                %>
                <p><%= messag %></p>
                <button type="submit" class="submit-button">Transfer Funds</button>
            </form>
        </section>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
   
</body>
</html>
    