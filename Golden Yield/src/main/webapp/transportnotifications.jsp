<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Send Notification</title>
    <style>
        body {
            background-color: #f3f4f6;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            font-family: 'Inter', Arial, sans-serif;
            margin: 0;
        }
        .container {
            background-color: white;
            padding: 2.5rem;
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 450px;
        }
        h1 {
            font-size: 1.75rem;
            font-weight: 600;
            text-align: center;
            margin-bottom: 2rem;
            color: #1f2937;
        }
        .form-group {
            margin-bottom: 1.5rem;
        }
        label {
            display: block;
            font-size: 0.9rem;
            font-weight: 500;
            color: #374151;
            margin-bottom: 0.5rem;
        }
        input[type="text"],
        textarea,
        input[type="password"] {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 1rem;
            color: #1f2937;
            box-sizing: border-box;
            transition: border-color 0.2s, box-shadow 0.2s;
        }
        input[type="text"]:focus,
        textarea:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.2);
        }
        textarea {
            resize: vertical;
            min-height: 100px;
        }
        button {
            padding: 0.75rem;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: 500;
            background-color: #3b82f6;
            color: white;
            width: 100%;
            transition: background-color 0.2s;
        }
        button:hover {
            background-color: #2563eb;
        }
        .form-group small {
            display: block;
            font-size: 0.8rem;
            color: #6b7280;
            margin-top: 0.25rem;
        }
        @media (max-width: 480px) {
            .container {
                padding: 1.5rem;
                max-width: 90%;
            }
            h1 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Send Notification</h1>
        <form id="notificationFormvehicle">
            <div class="form-group">
                <label for="vehicleIds">Vehicle IDs to Include</label>
                <input type="text" id="includevehicleIds" name="includevehicleids" placeholder="e.g., All (or) 123,456,789" >
            </div>
            <div class="form-group">
                <label for="excludeAgentIds">Agent IDs to Exclude</label>
                <input type="text" id="excludevehicleIds" name="excludevehicleIds" placeholder="e.g.,None (or) 987,654,321" >   
            </div>
            <div class="form-group">
                <label for="message">Message</label>
                <textarea id="message" name="message" placeholder="Enter your message" required></textarea>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter password" required>
            </div>
            <button type="submit">Send Notification</button>
        </form>
    </div>
</body>
</html>