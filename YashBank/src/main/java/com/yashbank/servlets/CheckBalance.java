package com.yashbank.servlets;

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
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkbalancejava")
public class CheckBalance extends HttpServlet{
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
		ResultSet res=null;
		String query="select balance from registration_details where accountNumber=? and password=?";
		try {
			conn=DriverManager.getConnection(url,user,password);
			pstmt=conn.prepareStatement(query);
			String pass2=req.getParameter("password");
			long accNO=(long) session.getAttribute("accNo");
			pstmt.setLong(1, accNO);
			pstmt.setString(2, pass2);
			res=pstmt.executeQuery();
			if(res.next()) {
				long balance=res.getLong(1);
				String msg="Availabe balance: Rs."+balance;
				req.setAttribute("message",msg);
				req.getRequestDispatcher("checkbalance.jsp").forward(req,resp);
			}
			else {
				req.setAttribute("message","Password Incorrect");
				req.getRequestDispatcher("checkbalance.jsp").forward(req,resp);
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
				if(res!=null) {
					res.close();
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