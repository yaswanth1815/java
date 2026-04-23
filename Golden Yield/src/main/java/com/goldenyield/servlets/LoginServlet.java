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
import jakarta.servlet.http.HttpSession;

@WebServlet("/loginservlet")
public class LoginServlet extends HttpServlet{
	Connection conn=null;
	String query=null;
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
		String username=null;
		HttpSession session=req.getSession();
		String role=req.getParameter("role");
		String user=req.getParameter("username");
		String pwd=req.getParameter("password");
		
		if(role.equals("admin")) {
			query="select *from admins where adminid=? and password=?";
		}
		else if(role.equals("seller")) {
			query="select *from sellerregistration where sellerid=? and password=?";
		}
		else if(role.equals("transport")) {
			query="select *from vehicleregistration where vehicleid=? and password=?";
		}
		else if(role.equals("agent")) {
			query="select *from agentregistration where agentid=? and password=?";
		}
		try {
			
			PreparedStatement pstmt1=conn.prepareStatement(query);
			pstmt1.setString(1, user);
			pstmt1.setString(2, pwd);
			ResultSet result=pstmt1.executeQuery();
			if(result.next()==true) {
				if(role.equals("admin")) {
					session.setAttribute("adminid", user);
					req.getRequestDispatcher("adminhomepage.jsp").forward(req, resp);
				}
				else if(role.equals("seller")) {
					username=result.getString("sellername");
					session.setAttribute("sellerid", user);
					session.setAttribute("sellername", username);
					req.getRequestDispatcher("sellerhomepage.jsp").forward(req, resp);
				}
				else if(role.equals("transport")) {
					username=result.getString(1);
					session.setAttribute("vehicleid", user);
					session.setAttribute("drivername", username);
					req.getRequestDispatcher("vehiclehomepage.jsp").forward(req, resp);
				}
				else if(role.equals("agent")) {
					username=result.getString(1);
					session.setAttribute("agentid", user);
					session.setAttribute("agentname", username);
					req.getRequestDispatcher("agenthomepage.jsp").forward(req, resp);
				}
			}
			else {
				message="Invalid Credentials";
				req.setAttribute("message", message);
				req.getRequestDispatcher("loginform.jsp").forward(req, resp);
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void destroy() {
		if(conn!=null) {
			try {
				conn.close();
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
