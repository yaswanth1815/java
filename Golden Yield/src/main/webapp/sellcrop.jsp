<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sell Now - GoldenYield</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background:linear-gradient(135deg, #2c2c2c, #3a3a3a, #4b4b4b); /* Beige background for earthy feel */
            color: #2b2b2b;
            padding: 10px;
            min-height: 90vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .sell-container {
            max-width: 800px;
            width: 100%;
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            justify-content: center;
        }
        .form-card, .info-card {
            background: #fff;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
            flex: 1;
            min-width: 300px;
            transition: transform 0.3s ease;
        }
        .form-card:hover, .info-card:hover {
            transform: translateY(-3px);
        }
        .form-card h2, .info-card h2 {
            font-size: 24px;
            color: #3a5a40; /* Olive green */
            margin-bottom: 15px;
            font-weight: 700;
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-size: 14px;
            color: #58725a;
            margin-bottom: 6px;
            font-weight: 500;
        }
        input[type="number"],
        textarea,
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #c4c4b0;
            border-radius: 5px;
            font-size: 14px;
            color: #2b2b2b;
            background: #f9f9f2;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }
        input[type="number"]:focus,
        textarea:focus,
        input[type="password"]:focus {
            border-color: #3a5a40;
            outline: none;
        }
        textarea {
            resize: vertical;
            min-height: 80px;
        }
        .error {
            color: #a71d31; /* Deep red for errors */
            font-size: 12px;
            margin-top: 4px;
            display: none;
        }
        .submit-btn {
            background-color: #3a5a40;
            border: none;
            color: white;
            padding: 12px;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            width: 100%;
            font-weight: 500;
            transition: background-color 0.3s ease;
        }
        .submit-btn:hover {
            background-color: #2e4a33;
        }
        .info-card p {
            font-size: 14px;
            color: #58725a;
            line-height: 1.6;
            margin-bottom: 10px;
        }
        .info-card i {
            color: #3a5a40;
            margin-right: 8px;
        }
        .back-link {
            text-align: center;
            margin-top: 15px;
        }
        .back-link a {
            color: #3a5a40;
            text-decoration: none;
            font-size: 13px;
            font-weight: 500;
        }
        .back-link a:hover {
            text-decoration: underline;
        }
        @media (max-width: 768px) {
            .sell-container {
                flex-direction: column;
                align-items: center;
            }
            .form-card, .info-card {
                min-width: 100%;
            }
        }
        @media (max-width: 600px) {
            .form-card, .info-card {
                padding: 15px;
            }
            h2 {
                font-size: 20px;
            }
            input[type="number"],
            textarea,
            input[type="password"],
            .submit-btn {
                font-size: 13px;
            }
        }
    </style>
</head>
<body>
    <div class="sell-container">
        <!-- Form Card -->
        <div class="form-card">
            <h2>Sell Your Crops</h2>
            <form id="sellForm" action="sellcropservlet" method="post">
                <div class="form-group">
                    <label for="quantity">Expected Quantity (tons)</label>
                    <input type="number" id="quantity" name="quantity" min="0" step="0.01" required>
                    <div id="quantityError" class="error">Please enter a valid quantity (greater than 0).</div>
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" rows="4" required></textarea>
                    <div id="descriptionError" class="error">Please enter a description.</div>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                    <div id="passwordError" class="error">Please enter your password.</div>
                </div>
                <button type="submit" class="submit-btn">Submit Sale</button>
            </form>
            <div class="back-link">
                <a href="">Back to Dashboard</a>
            </div>
        </div>
        <!-- Info Card -->
        <div class="info-card">
            <h2>Selling Tips</h2>
            <p><i class="fas fa-leaf"></i> Provide accurate quantity estimates to attract buyers.</p>
            <p><i class="fas fa-info-circle"></i> Include details like crop type, quality, and harvest date in the description.</p>
            <p><i class="fas fa-lock"></i> Ensure your password is secure to protect your account.</p>
        </div>
    </div>
</body>
</html>