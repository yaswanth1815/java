<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Forgot Password - YASHBANK</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
  <style>
    body {
      background: #f2f2f2;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .forgot-container {
      max-width: 500px;
      margin: 25px auto;
      background: white;
      border-radius: 15px;
      padding: 15px;
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
    }

    .form-label {
      font-weight: 600;
    }

    .form-control:focus {
      box-shadow: 0 0 0 0.2rem rgba(13, 110, 253, 0.25);
    }

    .btn-submit {
      background-color: #007bff;
      color: white;
      font-weight: 600;
    }

    .btn-submit:hover {
      background-color: #0056b3;
    }

    h2 {
      text-align: center;
      margin-bottom: 25px;
      color: #333;
    }
  </style>
</head>
<body>

  <div class="forgot-container">
    <h2>Forgot Password</h2>
    <form id="forgotpassword" action="forgotpassword" method="post">
      <div class="mb-3">
        <label for="cif" class="form-label">CIF Number</label>
        <input type="text" class="form-control" id="cif" name="cif" required>
      </div>
      <div class="mb-3">
        <label for="account" class="form-label">Account Number</label>
        <input type="text" class="form-control" id="account" name="accountNumber" required>
      </div>
      <div class="mb-3">
        <label for="aadhaar" class="form-label">Aadhaar Number</label>
        <input type="text" class="form-control" id="aadhaar" name="aadhaar" required>
      </div>

      <div class="mb-3">
        <label for="phone" class="form-label">Phone Number</label>
        <input type="tel" class="form-control" id="phone" name="phone" required>
      </div>

     <div class="mb-3">
  <label for="newPassword" class="form-label">Enter New Password</label>
  <div style="position: relative;">
    <input type="password" class="form-control" id="newPassword" name="newPassword" required>
    <button type="button" onclick="togglePassword()" 
            style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); background: none; border: none;">
      👁️
    </button>
  </div>
</div>

      <div class="mb-3">
        <label for="confirmPassword" class="form-label">Confirm New Password</label>
        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
        <button type="button" onclick="togglePassword()" 
            style="position: absolute; right: 550px; top: 60%; transform: translateY(-80%); background: none; border: none;">
      👁️
    </button>
      </div>
      <p id="passrepass"></p>
		<%
			String messag=(String)request.getAttribute("message");
        	if(messag==null){
        		messag="";
        	}
		%>
		<p><%= messag %></p>
      <div class="d-grid">
        <button type="submit" class="btn btn-submit">Reset Password</button>
      </div>
    </form>
  </div>
<script>
  const form = document.getElementById('forgotpassword');
  const password = document.getElementById('newPassword');
  const repass = document.getElementById('confirmPassword');
  const message = document.getElementById('passrepass');

  function togglePassword() {
    const passwordInput = document.getElementById("newPassword");
    const passwordInput2 = document.getElementById("confirmPassword");

    const type = passwordInput.type === "password" ? "text" : "password";
    passwordInput.type = type;
    passwordInput2.type = type;
  }

  function validatepassrepass() {
    const pass = password.value;
    const confirm = repass.value;

    if (pass !== confirm) {
      message.textContent = 'Passwords Not Matched';
      message.style.color = 'red';
      repass.setCustomValidity("Passwords Must Be Same");
      return false;
    } else {
      message.textContent = '';
      repass.setCustomValidity('');
      return true;
    }
  }

  form.addEventListener('submit', function(event) {
    if (!validatepassrepass()) {
      event.preventDefault();
      repass.focus();
    }
  });

  repass.addEventListener('input', validatepassrepass);
</script>

</body>
</html>
    