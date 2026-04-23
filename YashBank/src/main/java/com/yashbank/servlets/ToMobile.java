package com.yashbank.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Savepoint;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/tomobilejava")
public class ToMobile extends HttpServlet{
	Savepoint s1;
	long saccNo = 0;
	String url=null;
	String user=null;
	String password=null;
	PreparedStatement pstmt1=null;
	PreparedStatement pstmt2=null;
	PreparedStatement pstmt3=null;
	PreparedStatement pstmt4=null;
	PreparedStatement pstmt5=null;
	ResultSet res1=null;
	ResultSet res2=null;
	ResultSet res3=null;
	Connection conn=null;
	
	@Override
	public void init(ServletConfig sc) throws ServletException {
		super.init(sc);
		ServletContext scx=sc.getServletContext();
		url=scx.getInitParameter("url");
		user=scx.getInitParameter("user");
		password=scx.getInitParameter("password");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(url,user,password);
			conn.setAutoCommit(false);
		} 
		catch (Exception e) {
			System.out.println("Error while Loading or Connecting"+e);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		String rmobilee=req.getParameter("mobileNumber");
		long rmobile=Long.parseLong(rmobilee.trim());
		String amountt=req.getParameter("amount");
		long amount=Long.parseLong(amountt);
		String spassword=req.getParameter("password");
		HttpSession session=req.getSession(false);
		String query1="select *from registration_details where accountNumber=? and password=?";
		String query2="Select *from registration_details where accountNumber=? and balance>?";
		String query3="select *from registration_details where mobileNumber=?";
		String query4="update registration_details set balance=balance-? where accountNumber=?";
		String query5="update registration_details set balance=balance-? where mobileNumber=?";
		try {
			if(session==null || session.getAttribute("accNo")==null) {
				req.setAttribute("message", "Session Closed! Please try Relogin");
				req.getRequestDispatcher("login.jsp").forward(req, resp);
				return;
			}
			else {
			saccNo=(Long) session.getAttribute("accNo");
			}
		}
		catch(Exception e) {
			System.out.println("Something Went Wrong while using Session");
		}
		
		try {
			pstmt1=conn.prepareStatement(query1);
			pstmt1.setLong(1, saccNo);
			pstmt1.setString(2, spassword);
			res1=pstmt1.executeQuery();
			if(res1.next()) {
				pstmt2=conn.prepareStatement(query2);
				pstmt2.setLong(1,saccNo);
				pstmt2.setLong(2, amount);
				res2=pstmt2.executeQuery();
				if(res2.next()) {
					pstmt3=conn.prepareStatement(query3);
					pstmt3.setLong(1,rmobile);
					res3=pstmt3.executeQuery();
					if(res3.next()) {
						pstmt4=conn.prepareStatement(query4);
						pstmt5=conn.prepareStatement(query5);
						pstmt4.setLong(1,amount);
						pstmt4.setLong(2, saccNo);
						pstmt5.setLong(1,amount);
						pstmt5.setLong(2, rmobile);
						int num1=pstmt4.executeUpdate();
						int num2=pstmt5.executeUpdate();
						if(num1>0 && num2>0) {
							conn.commit();
							req.setAttribute("message", "Operation Succcess");
							req.getRequestDispatcher("tomobile.jsp").forward(req, resp);
						}
						else {

							conn.rollback(s1);
							req.setAttribute("message", "Operation Unsuccess");
							req.getRequestDispatcher("tomobile.jsp").forward(req, resp);
						}
					}
				}
				else {
					req.setAttribute("message", "Insufficient Balance");
					req.getRequestDispatcher("tomobile.jsp").forward(req, resp);
				}
			}
			else {
				req.setAttribute("message", "Password is incorrect");
				req.getRequestDispatcher("tomobile.jsp").forward(req, resp);
			}
		}
		catch(Exception e) {
			req.setAttribute("message", "Something Went Wrong");
			req.getRequestDispatcher("tomobile.jsp").forward(req, resp);
		}
	}
	@Override
	public void destroy() {
		try {
			if(conn!=null) {
				conn.close();
			}
			if(pstmt1!=null) {
				pstmt1.close();
			}
			if(pstmt2!=null) {
				pstmt2.close();
			}
			if(pstmt3!=null) {
				pstmt3.close();
			}
			if(pstmt4!=null) {
				pstmt4.close();
			}
			if(pstmt5!=null) {
				pstmt5.close();
			}
			if(res2!=null) {
				res2.close();
			}
			if(res1!=null) {
				res1.close();
			}
			if(res3!=null) {
				res3.close();
			}
		} 
		catch (Exception e) {
			
		}
	}
}
