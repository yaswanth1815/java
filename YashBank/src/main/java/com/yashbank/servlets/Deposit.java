package com.yashbank.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/depositjava")
public class Deposit extends HttpServlet{
	String user=null;
	String password=null;
	String url=null;
	Connection conn=null;
	@Override
	public void init(ServletConfig sc) throws ServletException {
		super.init(sc);
		ServletContext scx=sc.getServletContext();
		user=scx.getInitParameter("user");
		password=scx.getInitParameter("password");
		url=scx.getInitParameter("url");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("Error while Loading Driver");
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		PreparedStatement pstmt=null;
		String query="update registration_details set balance=balance+? where accountNumber=?";
		try {
			if (session == null || session.getAttribute("accNo") == null) {
		        req.setAttribute("message", "You are not logged in or your session has expired. Please log in again.");
		        req.getRequestDispatcher("login.jsp").forward(req, resp); 
		        return;
		    }
			conn=DriverManager.getConnection(url,user,password);
			pstmt=conn.prepareStatement(query);
			String amt=req.getParameter("amount");
			long amount=Long.parseLong(amt);
			long accNO=(long) session.getAttribute("accNo");
			pstmt.setLong(2, accNO);
			pstmt.setLong(1, amount);
			int res=pstmt.executeUpdate();
			if(res>0) {
				String msg="Deposit Successsful";
				req.setAttribute("message",msg);
				req.getRequestDispatcher("deposit.jsp").forward(req,resp);
			}
			else {
				req.setAttribute("message","Something went wrong");
				req.getRequestDispatcher("deposit.jsp").forward(req,resp);
			}
		} 
		catch (Exception e) {
			System.out.println("Error in DoPost");
			e.printStackTrace();
		}
		finally {
			try {
				if(pstmt!=null) {
					pstmt.close();
			}
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	@Override
	public void destroy() {
		try {
			if(conn!=null) {
				conn.close();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

