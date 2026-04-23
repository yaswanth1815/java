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

@WebServlet("/sellerregistrationlink")
public class SellerRegistrationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    Connection conn = null;
    String message = null;

    @Override
    public void init(ServletConfig sc) throws ServletException {
        super.init(sc);
        ServletContext scx = sc.getServletContext();
        String username = scx.getInitParameter("user");
        String password = scx.getInitParameter("password");
        String url = scx.getInitParameter("url");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            System.out.println("Error in Creating Connection or Loading Driver: " + e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String query1 = "SELECT * FROM addseller WHERE secretid=? AND secretkey=?";
        // specify all columns you want to insert
        String query2 = "INSERT INTO sellerregistration values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        String name = req.getParameter("name");
        String mobile = req.getParameter("mobile");
        String adhaar = req.getParameter("adhaar");
        String age = req.getParameter("age");
        String state = req.getParameter("state");
        String district = req.getParameter("district");
        String mandal = req.getParameter("mandal");
        String village = req.getParameter("village");
        String email = req.getParameter("email");
        String crop = req.getParameter("crop");
        String trees = req.getParameter("trees");
        String account = req.getParameter("account");
        String ifscCode = req.getParameter("ifsc");
        String secretid = req.getParameter("secretId");
        String secretKey = req.getParameter("secretkey");
        String password = req.getParameter("password");

        try {
            long mobileNumber = Long.parseLong(mobile);
            long adhaarNumber = Long.parseLong(adhaar);
            int sellerAge = Integer.parseInt(age);
            int totalTrees = Integer.parseInt(trees);
            double cropInAcres = Double.parseDouble(crop);
            long accountNumber = Long.parseLong(account);
            int secretId = Integer.parseInt(secretid);

            PreparedStatement pstmt1 = conn.prepareStatement(query1);
            pstmt1.setInt(1, secretId);
            pstmt1.setString(2, secretKey);

            ResultSet res1 = pstmt1.executeQuery();

            if (res1.next()) {
                PreparedStatement pstmt2 = conn.prepareStatement(query2);
                pstmt2.setString(1, name);
                pstmt2.setLong(2, mobileNumber);
                pstmt2.setLong(3, adhaarNumber);
                pstmt2.setInt(4, sellerAge);
                pstmt2.setString(5, state);
                pstmt2.setString(6, district);
                pstmt2.setString(7, mandal);
                pstmt2.setString(8, village);
                pstmt2.setString(9, email);
                pstmt2.setDouble(10, cropInAcres);
                pstmt2.setInt(11, totalTrees);
                pstmt2.setLong(12, accountNumber);
                pstmt2.setString(13, ifscCode);
                pstmt2.setInt(14, secretId);
                pstmt2.setString(15, password);

                int changes = pstmt2.executeUpdate();
                if (changes > 0) {
                    req.getRequestDispatcher("login.jsp").forward(req, resp);
                } else {
                    message = "Failed to Register. Please Try Again.";
                    req.setAttribute("message", message);
                    req.getRequestDispatcher("sellerregistration.jsp").forward(req, resp);
                }

                pstmt2.close();
            } else {
                message = "You are Not allowed to Register.";
                req.setAttribute("message", message);
                req.getRequestDispatcher("sellerregistration.jsp").forward(req, resp);
            }

            res1.close();
            pstmt1.close();

        } catch (Exception e) {
            System.out.println("Error in doPost:" + e);
            message = "Something went wrong at server side. Please try again later.";
            req.setAttribute("message", message);
            req.getRequestDispatcher("sellerregistration.jsp").forward(req, resp);
        }
    }
}
