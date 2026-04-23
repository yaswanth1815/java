<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>YASHBANK - Mobile Transfer</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />

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
    }

    body {
      font-family: 'Roboto', sans-serif;
      margin: 0;
      background-color: var(--off-white);
      color: var(--dark-text);
      display: flex;
      flex-direction: column;
      min-height: 100vh;
    }

    .page-title {
      color: var(--primary-blue);
      font-family: 'Open Sans', sans-serif;
      font-weight: 700;
      font-size: 2.5em;
      text-align: center;
      margin-top: 50px;
      margin-bottom: 30px;
      position: relative;
      padding-bottom: 15px;
    }

    .page-title::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 50%;
      transform: translateX(-50%);
      width: 80px;
      height: 4px;
      background-color: var(--accent-gold);
      border-radius: 2px;
    }

    main {
      padding: 40px 40px;
      max-width: 1200px;
      margin: 40px auto;
      background-color: var(--white);
      border-radius: 20px;
      box-shadow: 0 8px 25px var(--shadow-medium);
      text-align: left;
      position: relative;
      overflow: hidden;
    }

    main::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background-image: radial-gradient(circle, var(--light-blue) 1%, transparent 1%),
                        radial-gradient(circle, var(--light-blue) 1%, transparent 1%);
      background-size: 30px 30px;
      background-position: 0 0, 15px 15px;
      opacity: 0.1;
      z-index: 0;
    }

    .form-section {
      position: relative;
      z-index: 1;
    }

    .form-group {
      margin-bottom: 25px;
    }

    .form-group label {
      display: block;
      margin-bottom: 10px;
      font-weight: 600;
      color: var(--primary-blue);
    }

    .form-group input[type="text"],
    .form-group input[type="number"],
    .form-group input[type="password"] {
      width: 100%;
      padding: 14px 18px;
      border: 1px solid #d0d0d0;
      border-radius: 10px;
      font-size: 1.05em;
      box-sizing: border-box;
      transition: border-color 0.3s ease, box-shadow 0.3s ease, background-color 0.3s ease;
    }

    .form-group input:focus {
      border-color: var(--primary-blue);
      box-shadow: 0 0 0 4px rgba(0, 77, 153, 0.25);
      background-color: var(--light-blue);
      outline: none;
    }

    .submit-button {
      background: linear-gradient(135deg, var(--primary-blue) 0%, #003a70 100%);
      color: var(--white);
      padding: 15px 35px;
      border: none;
      border-radius: 10px;
      font-size: 1.2em;
      font-weight: 700;
      cursor: pointer;
      transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
      display: block;
      margin: 40px auto 0;
      box-shadow: 0 5px 15px rgba(0, 77, 153, 0.3);
    }

    .submit-button:hover {
      background: linear-gradient(135deg, #003a70 0%, var(--primary-blue) 100%);
      transform: translateY(-3px);
      box-shadow: 0 8px 20px rgba(0, 77, 153, 0.4);
    }

    @media (max-width: 991.98px) {
      .page-title {
        font-size: 2em;
        margin-top: 30px;
        margin-bottom: 20px;
      }

      main {
        padding: 30px 20px;
        margin: 20px;
      }

      .submit-button {
        padding: 12px 25px;
        font-size: 1.1em;
      }
    }
  </style>
</head>
<body>
  <h1 class="page-title">Mobile Transfer</h1>
  <main>
    <section class="container form-section">
      <form action="tomobilejava" method="POST">
        <div class="row">
          <div class="form-group col-md-6">
            <label for="mobileNumber">Mobile Number</label>
            <input type="text" id="mobileNumber" name="mobileNumber" placeholder="Enter recipient's mobile" required />
          </div>
          <div class="form-group col-md-6">
            <label for="amount">Amount</label>
            <input type="number" id="amount" name="amount" placeholder="Enter amount to transfer" required />
          </div>
        </div>
        <div class="form-group mt-4">
          <label for="password">Your Password</label>
          <input type="password" id="password" name="password" placeholder="Enter your password" required />
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
    