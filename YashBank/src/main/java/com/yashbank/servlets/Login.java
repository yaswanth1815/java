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

@WebServlet("/loginjava")
public class Login extends HttpServlet{
	
	String url2=null;
	String user2=null;
	String pass2=null;
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet res=null;
	String accno=null;
	String password=null;
	@Override
	public void init(ServletConfig sc2) throws ServletException {
		super.init(sc2);
		ServletContext scx2=sc2.getServletContext();
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
		
		String query="select * from registration_details where accountNumber=? and password=?";
		accno=req.getParameter("accountnumber2");
		password=req.getParameter("password2");
		try {
			
			long accNo2=Long.parseLong(accno);
			HttpSession session=req.getSession();
			session.setAttribute("accNo", accNo2);
			conn=DriverManager.getConnection(url2,user2,pass2);
			pstmt=conn.prepareStatement(query);
			pstmt.setLong(1, accNo2);
			pstmt.setString(2,password);
			res=pstmt.executeQuery();
			if(res.next()==true) {
				String name=res.getString(1);
				String gender=res.getString(9);
				req.setAttribute("name",name);
				if(gender.equals("Male")) {
					req.setAttribute("gender","Mr");
				}
				else {
					req.setAttribute("gender","Ms");
				}
				
				req.getRequestDispatcher("userpage.jsp").forward(req,resp);
	
			}
			else {
				req.setAttribute("message","invalid credentials");
				req.getRequestDispatcher("login.jsp").forward(req,resp);
			}
		} 
		catch (Exception e) {
			req.setAttribute("message","Something Went Wrong");
			req.getRequestDispatcher("login.jsp").forward(req,resp);
			e.printStackTrace();
		}
	}
	@Override
	public void destroy() {
		
		try {
			if(conn!=null) {
				conn.close();
			}
			if(res!=null) {
				conn.close();
			}
			if(pstmt!=null) {
				pstmt.close();
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
