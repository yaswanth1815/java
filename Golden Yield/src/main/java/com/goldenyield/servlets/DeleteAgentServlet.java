package com.goldenyield.servlets;

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

@WebServlet("/deleteagentservlet")

public class DeleteAgentServlet extends HttpServlet{
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
		HttpSession session=req.getSession(false);
		if(session==null || session.getAttribute("adminid")==null) {
			message="Session Closed! Please Login Again";
			HttpSession newsession=req.getSession(true);
			newsession.setAttribute("message",message);
			resp.getWriter().println("<script>");
			resp.getWriter().println("window.top.location.href='loginform.jsp';");
			resp.getWriter().println("</script>");
			return;
		}
		String query1="select *from admins where adminid=? and password=?";
		String query2="delete from addagent where agentsecretid=?";
		String query3="delete from agentregistration where agentid=?";
		String agentid=req.getParameter("agentid");
		String password=req.getParameter("password");
		String adminid=(String) session.getAttribute("adminid"); 
		
		int agentId=Integer.parseInt(agentid);
		int adminId=Integer.parseInt(adminid);
		try {
			conn.setAutoCommit(false);
			PreparedStatement pstmt1=conn.prepareStatement(query1);
			PreparedStatement pstmt2=conn.prepareStatement(query2);
			PreparedStatement pstmt3=conn.prepareStatement(query3);
			pstmt1.setInt(1,adminId);
			pstmt1.setString(2, password);
			
			ResultSet result=pstmt1.executeQuery();
			if(result.next()) {
				
				pstmt2.setInt(1, agentId);
				pstmt3.setInt(1, agentId);
				
				int update1=pstmt2.executeUpdate();
				int update2=pstmt3.executeUpdate();
				if(update1>0 && update2>0) {
					conn.commit();
					message="Deleted Successfully!";
					req.setAttribute("message",message);
					req.getRequestDispatcher("deleteagent.jsp").forward(req,resp);
				}
				else {
					message="Something Went Wrong";
					req.setAttribute("message",message);
					req.getRequestDispatcher("deleteagent.jsp").forward(req,resp);
				}
			}
			else {
				message="Your Password Not Matched!";
				req.setAttribute("message",message);
				req.getRequestDispatcher("deleteagent.jsp").forward(req,resp);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
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
