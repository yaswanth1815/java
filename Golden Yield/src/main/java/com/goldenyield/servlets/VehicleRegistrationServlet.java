package com.goldenyield.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/vehicleregistrationservlet")

public class VehicleRegistrationServlet extends HttpServlet{
	Connection conn=null;
	String message=null;
	@Override
	public void init(ServletConfig sc) throws ServletException {
		super.init(sc);
		ServletContext scx=sc.getServletContext();
		String username=scx.getInitParameter("user");
		String password=scx.getInitParameter("password");
		String url=scx.getInitParameter("url");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(url,username,password);
		} 
		catch (Exception e) {
			System.out.println("Error in Creating Connection"+e);
		}
		
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String query1="select *from addvehicle where vehiclesecretid=? and secretkey=?";
		String query2="insert into vehicleregistration values(?,?,?,?,?,?,?,?,?,?)";
		
		String driverName=req.getParameter("drivername");
		String age=req.getParameter("age");
		String licence=req.getParameter("licence");
		String vehicleNumber=req.getParameter("vehicle");
		String rcNumber=req.getParameter("rcnumber");
		String mobile=req.getParameter("mobile");
		String adhaar=req.getParameter("adhaar");
		String location=req.getParameter("location");
		String secretid=req.getParameter("secretid");
		String secretKey=req.getParameter("secretkey");
		String password=req.getParameter("password");
		
		int driverAge=Integer.parseInt(age);
		long mobileNumber=Long.parseLong(mobile);
		long adhaarNumber=Long.parseLong(adhaar);
		int vehicleId=Integer.parseInt(secretid);
		

		try {
			PreparedStatement pstmt1=conn.prepareStatement(query1);
			PreparedStatement pstmt2=conn.prepareStatement(query2);
			
			pstmt1.setInt(1, vehicleId);
			pstmt1.setString(2, secretKey);
			
			ResultSet result=pstmt1.executeQuery();
			if(result.next()) {
				pstmt2.setString(1,driverName);
				pstmt2.setInt(2, driverAge);
				pstmt2.setString(3,licence);
				pstmt2.setString(4,vehicleNumber);
				pstmt2.setString(5,rcNumber);
				pstmt2.setLong(6, mobileNumber);
				pstmt2.setLong(7, adhaarNumber);
				pstmt2.setString(8,location);
				pstmt2.setInt(9,vehicleId);
				pstmt2.setString(10,password);
				
				int update=pstmt2.executeUpdate();
				if(update>0) {
					 req.setAttribute("message", "Registration Successful");
	                 req.getRequestDispatcher("loginform.jsp").forward(req, resp);
	             }
				else {
					req.setAttribute("message", "Registration Unsuccessful");
                    req.getRequestDispatcher("vehicleregistration.jsp").forward(req, resp);
				}
				
			}
			else {
				req.setAttribute("message", "You are Not Allowed to Register");
                req.getRequestDispatcher("sellerregistration.jsp").forward(req, resp);
				
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}