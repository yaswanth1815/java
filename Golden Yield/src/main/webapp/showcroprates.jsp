<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Crop Rates in Different Locations</title>
<style>
body {
	font-family: 'Lora', serif;
	margin: 0;
	padding: 40px;
	background: linear-gradient(to bottom, #f5f6f0 0%, #e8f5e9 100%);
	color: #263238;
}

h1 {
	text-align: center;
	font-size: 2.4em;
	margin-bottom: 10px;
	font-weight: 700;
	color: #2e7d32;
	text-transform: uppercase;
	letter-spacing: 1px;
}

.crop-index {
	text-align: center;
	font-size: 1.3em;
	color: #388e3c;
	margin-bottom: 30px;
	font-weight: 500;
	font-style: italic;
}

.rates-container {
	max-width: 1200px;
	margin: 0 auto;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 20px;
}

.rate-card {
	background: #ffffff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	text-align: center;
	transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.rate-card:hover {
	transform: translateY(-3px);
	box-shadow: 0 6px 14px rgba(0, 0, 0, 0.15);
}

.rate-card h3 {
	margin: 0 0 10px;
	font-size: 1.1em;
	color: #2e7d32;
	font-weight: 600;
}

.rate-card p {
	margin: 0;
	font-size: 1em;
	color: #37474f;
	font-weight: 500;
}

@media ( max-width : 1024px) {
	.rates-container {
		grid-template-columns: repeat(2, 1fr);
	}
}

@media ( max-width : 600px) {
	.rates-container {
		grid-template-columns: 1fr;
	}
	h1 {
		font-size: 2em;
	}
	.rate-card {
		padding: 15px;
	}
}
</style>
<link
	href="https://fonts.googleapis.com/css2?family=Lora:wght@500;600;700&display=swap"
	rel="stylesheet">
</head>
<body>
	<%
	String index=(String)session.getAttribute("cropindex");
	Integer bglr = (Integer) session.getAttribute("bangalore");
	Integer che = (Integer) session.getAttribute("chennai");
	Integer hyd = (Integer) session.getAttribute("hyderabad");
	Integer del = (Integer) session.getAttribute("delhi");
	Integer kolk = (Integer) session.getAttribute("kolkata");
	Integer mum = (Integer) session.getAttribute("mumbai");
	Integer kk = (Integer) session.getAttribute("kanyakumari");
	Integer pune = (Integer) session.getAttribute("pune");
	Integer lck = (Integer) session.getAttribute("lucknow");
	Integer vsg = (Integer) session.getAttribute("visag");
	Integer slg = (Integer) session.getAttribute("shillong");
	Integer ker = (Integer) session.getAttribute("kerala");
	%>
	<h1>Crop Rates in Different Locations</h1>
	<div class="crop-index">Crop Index: SweetLime<%=index%></div>
	<div class="rates-container">
		<div class="rate-card">
			<h3>Bangalore</h3>
			<p>
				₹<%=bglr%>/ton
			</p>
		</div>
		<div class="rate-card">
			<h3>Chennai</h3>
			<p>
				₹<%=che%>/ton
			</p>
		</div>
		<div class="rate-card">
			<h3>Hyderabad</h3>
			<p>
				₹<%=hyd%>/ton
			</p>
		</div>
		<div class="rate-card">
			<h3>Delhi</h3>
			<p>
				₹<%=del%>/ton
			</p>
		</div>
		<div class="rate-card">
			<h3>Kolkata</h3>
			<p>
				₹<%=kolk%>/ton
			</p>
		</div>
		<div class="rate-card">
			<h3>Mumbai</h3>
			<p>
				₹<%=mum%>/ton
			</p>
		</div>
		<div class="rate-card">
			<h3>Kanyakumari</h3>
			<p>
				₹<%=kk%>/ton
			</p>
		</div>
		<div class="rate-card">
			<h3>Pune</h3>
			<p>
				₹<%=pune%>/ton
			</p>
		</div>
		<div class="rate-card">
			<h3>Lucknow</h3>
			<p>
				₹<%=lck%>/ton
			</p>
		</div>
		<div class="rate-card">
			<h3>Visakhapatnam</h3>
			<p>
				₹<%=vsg%>/ton
			</p>
		</div>
		<div class="rate-card">
			<h3>Shillong</h3>
			<p>
				₹<%=slg%>/ton
			</p>
		</div>
		<div class="rate-card">
			<h3>Kerala</h3>
			<p>
				₹<%=ker%>/ton
			</p>
		</div>
	</div>
</body>
</html>