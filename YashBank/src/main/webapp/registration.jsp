<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>YASHBANK - Registration</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
  <style>
    body {
      margin: 0;
      font-family: 'Poppins', sans-serif;
      background-color: #0056b3;
      display: flex;
      flex-direction: column;
      min-height: 100vh;
    }

     footer {
      background-color: #00408d;
      color: white;
      text-align: center;
      padding: 15px;
    }
  
    .main-content {
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 40px 15px;
      background-color: #0056b3;
    }

    .signup-wrapper {
      background-color: #f8f9fa;
      width: 100%;
      max-width: 1000px;
      display: flex;
      border-radius: 20px;
      box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
      overflow: hidden;
    }

    .form-section {
      flex: 1.3;
      padding: 40px;
      background-color: #ffffff;
    }

    .form-section h2 {
      font-weight: 600;
      margin-bottom: 25px;
      font-size: 1.8rem;
      color: #0056b3;
    }

    .form-section p {
      font-size: 0.9rem;
      margin-bottom: 20px;
      color: #6c757d;
    }

    .form-section a {
      color: #007bff;
      text-decoration: none;
      font-weight: 500;
    }

    .form-section .form-control,
    .form-section .form-select {
      border-radius: 30px;
      padding: 12px 20px;
      margin-bottom: 15px;
    }

    .form-section button {
      width: 100%;
      border-radius: 30px;
      padding: 12px;
      font-weight: 600;
      background-color: #0056b3;
      border: none;
      color: white;
    }

    .illustration-section {
      flex: 1;
      background-color: #e6f2ff;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      padding: 30px;
      text-align: center;
    }

    .illustration-section h3 {
      font-weight: 600;
      color: #0056b3;
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
      color: #00408d;
    }

    @media (max-width: 768px) {
      .signup-wrapper {
        flex-direction: column;
      }

      .illustration-section {
        order: -1;
      }
    }
    
  </style>
</head>
<body>
  <div class="main-content">
    <div class="signup-wrapper">
      <div class="form-section">
        <h2>Registration Form</h2>
        <p>Already have an account? <a href="login.jsp">Login here</a></p>
        <form method="post" action="registrationjava" id="form">
          <input type="text" class="form-control" placeholder="Account Holder Name" name="accountHolderName" required>
          <input type="text" class="form-control" placeholder="CIF Number" name="cifNumber" required>
          <input type="text" class="form-control" placeholder="Account Number" name="accountNumber" pattern=[0-9]{11} required>
          <input type="text" class="form-control" placeholder="IFSC Code" name="ifscCode" required>
          <input type="email" class="form-control" placeholder="Enter Your Email" name="email" required>
          <input type="tel" class="form-control" placeholder="Mobile Number" name="mobileNumber" pattern=[6-9]{1}[0-9]{9} required>
          <input type="text" class="form-control" placeholder="Aadhaar Number" name="aadhaarNumber" required pattern=[0-9]{12} >
          <input type="number" class="form-control" placeholder="Age" name="age" required min="18" max="100" required>

          <select class="form-select" name="sex" required>
            <option value="">Select Sex</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
          </select>

          <select class="form-select" name="accountType" required>
            <option value="">Select Account Type</option>
            <option value="savings">Savings</option>
            <option value="current">Current</option>
          </select>

          <input type="password" class="form-control" placeholder="Password" id="pass" name="password" required>
          <input type="password" class="form-control" placeholder="Re-enter Password" id="repass" name="reenterPassword" required>
          
          <p id="passwordMatchMessage" style="margin-top: -10px; margin-bottom: 15px; font-size: 0.85rem;"></p>

          <div class="form-check mb-3">
            <input class="form-check-input" type="checkbox" id="agree" name="agree_or_not" required>
            <label class="form-check-label" for="agree">I agree to receive updates and special offers.</label>
          </div>

          <button type="submit">Register Account</button>
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
  </div>
  <footer>
    &copy; 2025 YASHBANK. All rights reserved.
  </footer>

</body>
<script>
const form = document.getElementById('form');
const passwordField = document.getElementById('pass');
const reenterPasswordField = document.getElementById('repass');
const messageElement = document.getElementById('passwordMatchMessage');

function validatePasswords() {
    const password = passwordField.value;
    const confirmPassword = reenterPasswordField.value;

    if (password !== confirmPassword) {
        messageElement.textContent = "Passwords do not match";
        messageElement.style.color = "red";
        reenterPasswordField.setCustomValidity("Passwords do not match!");
        return false; 
    } else {
        messageElement.textContent = ""; 
        messageElement.style.color = ""; 
        reenterPasswordField.setCustomValidity(""); 
        return true; 
    }
}

form.addEventListener('submit', function(event) {
    const passwordsMatch = validatePasswords();

    if (!passwordsMatch) {
        event.preventDefault(); 
        reenterPasswordField.focus();
    }
});
	reenterPasswordField.addEventListener('input', validatePasswords);
</script>
</html>