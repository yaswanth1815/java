\<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enter Crop Index and Rates</title>
    <style>
        body {
            font-family: 'Poppins', Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(to bottom, #f1f8e9 0%, #dcedc8 100%);
            color: #37474f;
        }
        .main-container {
            width: 90%;
            max-width: 1100px;
            padding: 20px;
            border-radius: 12px;
            /* Transparent, no box background, uses body bg */
        }
        h1 {
            text-align: center;
            color: #2e7d32;
            font-size: 2em;
            margin-bottom: 20px;
            font-weight: 600;
        }
        h2 {
            color: #388e3c;
            font-size: 1.8em;
            margin: 15px 0;
            text-align: center;
            font-weight: 500;
        }
        .form-group {
            padding: 10px;
            border-radius: 6px;
            /* Transparent too */
        }
        label {
            display: block;
            font-weight: 500;
            margin-bottom: 4px;
            font-size: 0.9em;
        }
        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #8bc34a;
            border-radius: 5px;
            font-size: 0.9em;
        }
        .location-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 12px;
        }
        button {
            display: block;
            width: 200px;
            margin: 25px auto 0 auto;
            padding: 12px;
            background: #4caf50;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 1.1em;
            font-weight: 500;
            cursor: pointer;
        }
        button:hover {
            background: #388e3c;
        }
        @media (max-width: 992px) {
            .location-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        @media (max-width: 576px) {
            .location-grid {
                grid-template-columns: 1fr;
            }
        }
 
  		.message-boxx {
	    font-size: 28px;      
	    color: #ffffff;     
	    text-align: center;   
 	    font-weight: bold;     
		}
  		
    </style>
</head>
<body>
    <div class="main-container">
        <h1>Enter Crop Index and Rates</h1>
        <form action="<%=request.getContextPath()%>/cropratesServlet" method="post">
            <div class="form-group">
                <label for="crop-index">Crop Index</label>
                <input type="text" id="crop-index" name="crop-index" placeholder="Enter crop index (e.g., +1.5,-0.5)" required>
            </div>
            <h2><b>Crop Rates per Ton (in INR)</b></h2>
            <div class="location-grid">
                <div class="form-group">
                    <label for="bangalore">Bangalore</label>
                    <input type="number" id="bangalore" name="bangalore" placeholder="Enter rate" min="0" step="50" required>
                </div>
                <div class="form-group">
                    <label for="chennai">Chennai</label>
                    <input type="number" id="chennai" name="chennai" placeholder="Enter rate" min="0" step="50" required>
                </div>
                <div class="form-group">
                    <label for="hyderabad">Hyderabad</label>
                    <input type="number" id="hyderabad" name="hyderabad" placeholder="Enter rate" min="0"  step="50"required>
                </div>
                <div class="form-group">
                    <label for="delhi">Delhi</label>
                    <input type="number" id="delhi" name="delhi" placeholder="Enter rate" step="50" min="0" required>
                </div>
                <div class="form-group">
                    <label for="kolkata">Kolkata</label>
                    <input type="number" id="kolkata" name="kolkata" placeholder="Enter rate" step="50" required>
                </div>
                <div class="form-group">
                    <label for="mumbai">Mumbai</label>
                    <input type="number" id="mumbai" name="mumbai" placeholder="Enter rate" min="0" step="50" required>
                </div>
                <div class="form-group">
                    <label for="kanyakumari">Kanyakumari</label>
                    <input type="number" id="kanyakumari" name="kanyakumari" placeholder="Enter rate" min="0" step="50" required>
                </div>
                <div class="form-group">
                    <label for="pune">Pune</label>
                    <input type="number" id="pune" name="pune" placeholder="Enter rate" min="0" step="50" required>
                </div>
                <div class="form-group">
                    <label for="lucknow">Lucknow</label>
                    <input type="number" id="lucknow" name="lucknow" placeholder="Enter rate" min="0" step="50"required>
                </div>
                <div class="form-group">
                    <label for="visakhapatnam">Visakhapatnam</label>
                    <input type="number" id="visakhapatnam" name="visakhapatnam" placeholder="Enter rate" min="0" step="50" required>
                </div>
                <div class="form-group">
                    <label for="shillong">Shillong</label>
                    <input type="number" id="shillong" name="shillong" placeholder="Enter rate" min="0" step="50" required>
                </div>
                <div class="form-group">
                    <label for="kerala">Kerala</label>
                    <input type="number" id="kerala" name="kerala" placeholder="Enter rate" min="0" step="50" required>
                </div>
            </div>
            <%
            	String message=(String)request.getAttribute("message");
                if(message==null){
                	message="";
                }
            %>
            <p class="message-box"><%= message %></p>
            <button type="submit">Submit Rates</button>
        </form>
    </div>
</body>
</html>
