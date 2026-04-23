<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deposit Funds</title>
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

        .deposit-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        .deposit-container h2 {
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

        .input-group input[type="number"] {
            width: calc(100% - 20px);
            padding: 12px 10px;
            border: 1px solid #cccccc;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        .input-group input[type="number"]:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.2);
        }

        .submit-button {
            width: 100%;
            padding: 15px;
            background-color: #28a745; /* Green for deposit */
            color: #ffffff;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="deposit-container">
        <h2>Deposit Funds</h2>
        <form action="depositjava" method="POST">
            <div class="input-group">
                <label for="amount">Amount</label>
                <input type="number" id="amount" name="amount" placeholder="Enter amount to deposit" min="0.01" step="0.01" required>
            </div>

            <%
            	String msg=(String) request.getAttribute("message");
                if(msg==null){
                	msg="";
                }
            %>
            <p><%= msg %></p>

            <button type="submit" class="submit-button">Deposit</button>
        </form>
    </div>
</body>
</html>