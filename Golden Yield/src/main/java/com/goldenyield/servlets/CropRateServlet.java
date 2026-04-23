package com.goldenyield.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cropratesServlet")
public class CropRateServlet extends HttpServlet {
	String message=null;
	Connection conn=null;
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
		HttpSession session2=req.getSession();
		String query="insert into cropratesandindex values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		String bglr=req.getParameter("bangalore");
		String che=req.getParameter("chennai");
		String hyd=req.getParameter("hyderabad");
		String del=req.getParameter("delhi");
		String kolk=req.getParameter("kolkata");
		String mumb=req.getParameter("mumbai");
		String kk=req.getParameter("kanyakumari");
		String pun=req.getParameter("pune");
		String lck=req.getParameter("lucknow");
		String vsg=req.getParameter("visakhapatnam");
		String slg=req.getParameter("shillong");
		String ker=req.getParameter("kerala");
		
		String index=req.getParameter("crop-index");
		int bangalore=Integer.parseInt(bglr);
		int chennai=Integer.parseInt(che);
		int hyderabad=Integer.parseInt(hyd);
		int delhi=Integer.parseInt(del);
		int kolkata=Integer.parseInt(kolk);
		int mumbai=Integer.parseInt(mumb);
		int kanyakumari=Integer.parseInt(kk);
		int pune=Integer.parseInt(pun);
		int lucknow=Integer.parseInt(lck);
		int visag=Integer.parseInt(vsg);
		int shillong=Integer.parseInt(slg);
		int kerala=Integer.parseInt(ker);
		LocalDate datee=LocalDate.now();
		Date date=java.sql.Date.valueOf(datee);
		
		try {
			PreparedStatement pstmt=conn.prepareStatement(query);
			pstmt.setDate(1, date);
			pstmt.setString(2, index);
			pstmt.setInt(3,bangalore);
			pstmt.setInt(4,chennai);
			pstmt.setInt(5,hyderabad);
			pstmt.setInt(6,delhi);
			pstmt.setInt(7,kolkata);
			pstmt.setInt(8,mumbai);
			pstmt.setInt(9,kanyakumari);
			pstmt.setInt(10,pune);
			pstmt.setInt(11,lucknow);
			pstmt.setInt(12,visag);
			pstmt.setInt(13,shillong);
			pstmt.setInt(14,kerala);
			
			int upd=pstmt.executeUpdate();
			if(upd>0) {
				message="Values Set Successfully";
				 	session2.setAttribute("cropindex", index);
	                session2.setAttribute("bangalore", bangalore);
	                session2.setAttribute("chennai", chennai);
	                session2.setAttribute("hyderabad", hyderabad);
	                session2.setAttribute("delhi", delhi);
	                session2.setAttribute("kolkata", kolkata);
	                session2.setAttribute("mumbai", mumbai);
	                session2.setAttribute("kanyakumari", kanyakumari);
	                session2.setAttribute("pune", pune);
	                session2.setAttribute("lucknow", lucknow);
	                session2.setAttribute("visag", visag);
	                session2.setAttribute("shillong", shillong);
	                session2.setAttribute("kerala", kerala);
			}
			else {
				message="Something Went Wrong! Try Again";
				
			}
			req.setAttribute("message", message);
			req.getRequestDispatcher("setcroprates.jsp").forward(req, resp);
			
		}
		catch (SQLException e) {
			req.getRequestDispatcher("setcroprates.jsp").forward(req, resp);
		}
	}
	@Override
	public void destroy() {
		try {
			if(conn!=null) {
				conn.close();
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
