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
 
@WebServlet("/banktransferjava")

public class BankTransfer extends HttpServlet{
	PreparedStatement pstmt1=null;
	PreparedStatement pstmt2=null;
	PreparedStatement pstmt3=null;
	PreparedStatement pstmt4=null;
	PreparedStatement pstmt5=null;
	ResultSet res1=null;
	ResultSet res2=null;
	ResultSet res3=null;
	Savepoint s1;
	String url2=null;
	String user2=null;
	String pass2=null;
	Connection conn=null;
	RequestDispatcher rd3=null;
		@Override
		public void init(ServletConfig sc) throws ServletException {
			super.init(sc);
			ServletContext scx3=sc.getServletContext();
			url2=scx3.getInitParameter("url");
			user2=scx3.getInitParameter("user");
			pass2=scx3.getInitParameter("password");
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn=DriverManager.getConnection(url2,user2,pass2);
				conn.setAutoCommit(false);
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
		}
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
				throws ServletException, IOException {
			HttpSession session=req.getSession(false);
			String query1="select *from registration_details where accountNumber=? and password=? ";
			String query2="select *from registration_details where accountNumber=? and balance>=?";
			String query3="select *from registration_details where accountNumber=? and ifscCode=?";
			String query4="update registration_details set balance=balance-? where accountNumber=?";
			String query5="update registration_details set balance=balance+? where accountNumber=? and ifscCode=?";
			String mracc=null;
			String mrifsc=null;
			String mspassword=null;
			String amount=null;

			
				try {
					mracc=req.getParameter("aCcountNumber");
					mrifsc=req.getParameter("iFscCode");
					mspassword=req.getParameter("pAssword");
					amount=req.getParameter("aMount");
					
					long mraacc=Long.parseLong(mracc);
					long amounT=Long.parseLong(amount);
					 if (session == null || session.getAttribute("accNo") == null) {
					        req.setAttribute("message", "You are not logged in or your session has expired. Please log in again.");
					        req.getRequestDispatcher("login.jsp").forward(req, resp); 
					        return;
					    }
					 
					    long msaacc=(Long)session.getAttribute("accNo");
					pstmt1=conn.prepareStatement(query1);
					pstmt1.setLong(1, msaacc);
					pstmt1.setString(2, mspassword);
					res1=pstmt1.executeQuery();
					if(res1.next()) {
						pstmt2=conn.prepareStatement(query2);
						pstmt2.setLong(1, msaacc);
						pstmt2.setLong(2, amounT);
						res2=pstmt2.executeQuery();
						if(res2.next()) {
							pstmt3=conn.prepareStatement(query3);
							pstmt3.setLong(1, mraacc);
							pstmt3.setString(2, mrifsc);
							res3=pstmt3.executeQuery();
							if(res3.next()) {
								pstmt4=conn.prepareStatement(query4);
								pstmt5=conn.prepareStatement(query5);
								pstmt4.setLong(1, amounT);
								pstmt4.setLong(2, msaacc);
								
								pstmt5.setLong(1, amounT);
								pstmt5.setLong(2,mraacc);
								pstmt5.setString(3, mrifsc);
								
								int num1=pstmt4.executeUpdate();
								int num2=pstmt5.executeUpdate();
								if(num1>0 && num2>0) {
									conn.commit();
									req.setAttribute("message", "Operation successful");
									req.getRequestDispatcher("banktransfer.jsp").forward(req, resp);
								}
								else {
									conn.rollback(s1);
									req.setAttribute("message", "Operation Unsuccessful");
									req.getRequestDispatcher("banktransfer.jsp").forward(req, resp);
								}
							}
							else {
								req.setAttribute("message", "Reciever Details Not Found");
								req.getRequestDispatcher("banktransfer.jsp").forward(req, resp);
							}
						}
						else {
							req.setAttribute("message", "Insufficient Balance");
							req.getRequestDispatcher("banktransfer.jsp").forward(req, resp);
						}
						
					}
					else {
						req.setAttribute("message", "Password Incorrect");
						req.getRequestDispatcher("banktransfer.jsp").forward(req, resp);
					}
				}
			
				catch (Exception e){
					e.printStackTrace();
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
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
		}
	}