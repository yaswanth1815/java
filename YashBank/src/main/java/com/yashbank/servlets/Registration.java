package com.yashbank.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/registrationjava")
public class Registration extends HttpServlet {

    private String url1, user1, password1;
    Connection conn=null;
    PreparedStatement pstmt=null;
    @Override
    public void init(ServletConfig sc) throws ServletException {
        super.init(sc);
        ServletContext scx = sc.getServletContext();
        url1 = scx.getInitParameter("url");
        user1 = scx.getInitParameter("user");
        password1 = scx.getInitParameter("password");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } 
        catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String insertSQL = "INSERT INTO registration_details VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
        	conn = DriverManager.getConnection(url1, user1, password1);
            pstmt = conn.prepareStatement(insertSQL);

            // fetch form data
            String name = req.getParameter("accountHolderName");
            String csif = req.getParameter("cifNumber");
            String acno = req.getParameter("accountNumber");
            String ifsc = req.getParameter("ifscCode");
            String email = req.getParameter("email");
            String mobileN = req.getParameter("mobileNumber");
            String adhaarN = req.getParameter("aadhaarNumber");
            String agee = req.getParameter("age");
            String sex = req.getParameter("sex");
            String accountType = req.getParameter("accountType");
            String password = req.getParameter("password");

            // safe parsing with defaults
            long cif = Long.parseLong(csif);
            long aNo = Long.parseLong(acno);
            long mobile = Long.parseLong(mobileN);
            long adhaar = Long.parseLong(adhaarN);
            int age =Integer.parseInt(agee);
            Long bal=0l;
            // set parameters
            pstmt.setString(1, name);
            pstmt.setLong(2, cif);
            pstmt.setLong(3, aNo);
            pstmt.setString(4, ifsc);
            pstmt.setString(5, email);
            pstmt.setLong(6, mobile);
            pstmt.setLong(7, adhaar);
            pstmt.setInt(8, age);
            pstmt.setString(9, sex);
            pstmt.setString(10, accountType);
            pstmt.setString(11, password);
            pstmt.setLong(12, bal);

            int num = pstmt.executeUpdate();
            
            if(num>0) {
            	req.setAttribute("message", "Details Added Successfully Now you can Login");
            	RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
                rd.forward(req, resp);

            }
            else{
            	RequestDispatcher rd = req.getRequestDispatcher("registration_failed.html");
                rd.forward(req, resp);

            }
           
        } 
        catch (Exception e) {
        	RequestDispatcher rd = req.getRequestDispatcher("registration_failed.html");
            rd.forward(req, resp);
        }
    }
    @Override
	public void destroy() {
		
		try {
			if(conn!=null) {
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
