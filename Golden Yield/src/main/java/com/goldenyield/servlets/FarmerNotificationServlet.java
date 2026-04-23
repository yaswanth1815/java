package com.goldenyield.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class FarmerNotificationServlet extends HttpServlet{
	Connection conn=null;
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
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}public FarmerNotificationServlet() {
		// TODO Auto-generated constructor stub
	}
}