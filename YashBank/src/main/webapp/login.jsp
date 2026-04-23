<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>YASHBANK - Sign Up</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <style>
    body {
      margin: 0;
      font-family: 'Poppins', sans-serif;
      background-color: #0056b3; /* Darker blue background */
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    /* Centering the forgot-password link better */
    .forgot-password-container {
        width: 100%; /* Take full width of its parent */
        text-align: right; /* Align link to the right */
        margin-bottom: 20px; /* Space before button */
    }
	.forgot-password {
		color: #007bff;
		text-decoration: none;
		font-weight: 500;
	}

    .signup-wrapper {
      background-color: #f8f9fa;
      width: 90%;
      max-width: 900px;
      display: flex;
      border-radius: 20px;
      box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
      overflow: hidden;
    }

    .form-section {
      flex: 1;
      padding: 40px;
      background-color: #ffffff;
      display: flex; /* Use flexbox for inner alignment */
      flex-direction: column; /* Stack children vertically */
      justify-content: center; /* Center content vertically if space allows */
    }

    .form-section h2 {
      font-weight: 600;
      margin-bottom: 10px;
      color: #333; /* Darker color for headings */
    }

    .form-section p {
      font-size: 0.9rem;
      margin-bottom: 20px;
      color: #6c757d;
    }
    .illustration-section {
      flex: 1;
      background-color: #e6f2ff; /* Lighter blue for illustration background */
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      padding: 30px;
      text-align: center;
    }

    .illustration-section h3 {
      font-weight: 600;
      color: #0056b3; /* Match primary blue */
      margin-bottom: 15px;
    }

    .illustration-section p {
      color: #333;
      margin-bottom: 20px;
      font-size: 0.95rem;
    }

    .illustration-icons i {
      font-size: 2.2rem;
      margin: 10px;
      color: #00408d; /* Slightly darker blue for icons */
    }

    .form-section .form-control {
      border-radius: 30px;
      padding: 12px 20px;
      margin-bottom: 15px; /* Added margin-bottom for better spacing */
      border: 1px solid #ced4da; /* Default Bootstrap border color */
    }

    .form-section .form-check {
      font-size: 0.9rem;
      margin-bottom: 20px;
    }

    .form-section button {
      width: 100%;
      border-radius: 30px;
      padding: 12px;
      font-weight: 600;
      background-color: #0056b3; /* Primary button color */
      border: none;
      color: white;
      transition: background-color 0.3s ease; /* Smooth hover effect */
    }

    .form-section button:hover {
      background-color: #00408d; /* Darker blue on hover */
    }

    /* Message styling */
    .mess-err{
      margin-top: -10px; 
      margin-bottom: 15px;
      font-size: 0.85rem;
      text-align: center; 
    }

    @media (max-width: 768px) {
      .signup-wrapper {
        flex-direction: column;
      }

      .illustration-section {
        order: -1; /* Puts illustration on top for mobile */
        padding: 30px 0;
      }
    }
  </style>
</head>
<body>

  <div class="signup-wrapper">
    <div class="form-section">
      <h2>Login</h2>
      <p>Don't have an account? <a href="registration.html">Register here</a></p>
      <form method="post" action="loginjava">
        <input type="number" class="form-control" name="accountnumber2" id="accountnumber2" placeholder="Enter account number" required>
        <input type="password" class="form-control" name="password2" id="password2" placeholder="Enter your password" required>

        <%
            String message = (String) request.getAttribute("message"); 
            if (message != null && !message.isEmpty()) { 
        %>
           <span class="mess-err">  <h> <%= message %> </h> </span>
        <%
            }
        %>

        <div class="forgot-password-container">
            <a href="forgotpassword.jsp" class="forgot-password">Forgot Password?</a>
        </div>

        <button type="submit">Submit</button>
      </form>
    </div>
    <div class="illustration-section">
     <h3>Welcome to YASHBANK</h3>
        <p>Your secure, trusted, and reliable financial partner.</p>
        <div class="illustration-icons">
          <i class="bi bi-bank"></i>
          <i class="bi bi-shield-lock"></i>
          <i class="bi bi-hand-thumbs-up"></i>
        </div>
    </div>
  </div>

</body>
</html>