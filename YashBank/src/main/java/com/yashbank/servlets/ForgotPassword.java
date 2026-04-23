package com.yashbank.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/forgotpassword")
public class ForgotPassword extends HttpServlet{
	String pass2=null;
	String user2=null;
	String url2=null;
	@Override
	public void init(ServletConfig sc) throws ServletException {
		super.init(sc);
		ServletContext scx2=sc.getServletContext();
		url2=scx2.getInitParameter("url");
		user2=scx2.getInitParameter("user");
		pass2=scx2.getInitParameter("password");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		if(session==null || session.getAttribute("accNo")==null) {
			req.setAttribute("message", "You are not logged in or your session has expired. Please log in again.");
	        req.getRequestDispatcher("login.jsp").forward(req, resp); 
	        return;
		}
		long accno=(long) session.getAttribute("accNo");
		Connection conn=null;
		PreparedStatement pstmt1=null;
		PreparedStatement pstmt2=null;
		ResultSet res=null;
		String query1="select *from registration_details where cifNumber=? and mobileNumber=? and adhaarNumber=? and accountNumber=?";
		String query2="update registration_details set password=? where accountNumber=?";
		String cifnoo=req.getParameter("cif");
		long cifno=Long.parseLong(cifnoo);
		String adhaarnoo=req.getParameter("aadhaar");
		long adhaarno=Long.parseLong(adhaarnoo);
		String phonenoo=req.getParameter("phone");
		long phoneno=Long.parseLong(phonenoo);
		String passwordd=req.getParameter("newPassword");
		
		
		try {
			conn=DriverManager.getConnection(url2,user2,pass2);
			pstmt1=conn.prepareStatement(query1);
			pstmt1.setLong(1, cifno);
			pstmt1.setLong(2, phoneno);
			pstmt1.setLong(3,adhaarno);
			pstmt1.setLong(4,accno);
			res=pstmt1.executeQuery();
			if(res.next()) {
				pstmt2=conn.prepareStatement(query2);
				pstmt2.setString(1, passwordd);
				pstmt2.setLong(2, accno);
				int num1=pstmt2.executeUpdate();
				if(num1>0) {
					req.setAttribute("message","Password Changed Successfully");
					req.getRequestDispatcher("login.jsp").forward(req, resp);
				}
				else {
					req.setAttribute("message","Something Went Wrong");
					req.getRequestDispatcher("forgotpassword.jsp").forward(req, resp);
				}
			}
			else {
				req.setAttribute("message","Invalid Details PleaseCheck");
				req.getRequestDispatcher("forgotpassword.jsp").forward(req, resp);
			}
			
		} 
		catch (Exception e) {
			System.out.println("Error in getPost method");
			e.printStackTrace();
		}
		finally {
			try {
				if(pstmt1!=null) {
					pstmt1.close();	
				}
				if(pstmt2!=null) {
					pstmt2.close();
				}
				if(conn!=null) {
					conn.close();
				}
				if(res!=null) {
					res.close();
				}
			} 
			catch (Exception e2) {
				System.out.println("Error in Finally block");
			}
		}
	}
	
}