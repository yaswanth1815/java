package com.goldenyield.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/sellcropservlet")
public class SellCropServlet extends HttpServlet {
	
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
			e.printStackTrace();
		}
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {

		HttpSession session=req.getSession(false);
		if(session==null || session.getAttribute("sellerid")==null) {
			message="Sessin Closed! Please Login Again";
			req.setAttribute("message",message);
			req.getRequestDispatcher("loginform.jsp").forward(req, resp);
		}
		
		int sellerid=(int)session.getAttribute("sellerid");
		String password=req.getParameter("password");
		String description=req.getParameter("description");
		String lload=req.getParameter("quantity");
		double load=Double.parseDouble(lload);
		LocalDate datt=LocalDate.now();
		Date datee=java.sql.Date.valueOf(datt);
		
		String query1="select *from sellerregistration where sellerid=? and password=?";
		String query2="insert into cropsellrequests (sellerid,expqtyfarmer,description,district,mandal,village,daterequested) "
				+ "values(?,?,?,?,?,?,?)";
		
		try {
			conn.setAutoCommit(false);
			PreparedStatement pstmt1=conn.prepareStatement(query1);
			pstmt1.setInt(1,sellerid);
			pstmt1.setString(2,password);
			ResultSet result=pstmt1.executeQuery();
			if(result.next()) {
				PreparedStatement pstmt2=conn.prepareStatement(query2);
				String district=result.getString("district");
				String mandal=result.getString("mandal");
				String village=result.getString("village");
				String status="Requested";
				
				pstmt2.setInt(1, sellerid);
				pstmt2.setDouble(2, load);
				pstmt2.setString(3, description);
				pstmt2.setString(4, district);
				pstmt2.setString(5, mandal);
				pstmt2.setDate(6, datee);
				
				int upd=pstmt2.executeUpdate();
				if(upd>0) {
					message="Requested Successfully!";
					req.setAttribute("message",message);
					req.getRequestedSessionId("");
				}

			}
			else {
				
			}
			
			
			
		}
		catch (Exception e) {
			
		}
	}
}
