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

@WebServlet("/withdrawServlet")
public class Withdraw extends HttpServlet {
    long bal = 0;
    String passs = null;
    PreparedStatement pstmt = null;
    PreparedStatement pstmt2 = null;
    Connection conn = null;
    String user = null;
    String url = null;
    String password = null;
    ResultSet res2 = null;

    @Override
    public void init(ServletConfig sc) throws ServletException {
        super.init(sc);
        ServletContext scx = sc.getServletContext();
        user = scx.getInitParameter("user");
        url = scx.getInitParameter("url");
        password = scx.getInitParameter("password");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession(false);
            if (session == null || session.getAttribute("accNo") == null) {
                req.setAttribute("message", "Session Closed! Please relogin.");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
                return;
            }

            long numacc = (long) session.getAttribute("accNo");
            long amou = Long.parseLong(req.getParameter("amount"));
            String passwordd = req.getParameter("password");

            conn = DriverManager.getConnection(url, user, password);

            // Check current balance and password
            String query1 = "SELECT balance, password FROM registration_details WHERE accountNumber=?";
            pstmt2 = conn.prepareStatement(query1);
            pstmt2.setLong(1, numacc);
            res2 = pstmt2.executeQuery();

            if (res2.next()) {
                bal = res2.getLong(1);
                passs = res2.getString(2);

                if (passs.equals(passwordd)) {
                    if (bal >= amou) {
                        String query2 = "UPDATE registration_details SET balance=balance-? WHERE accountNumber=?";
                        pstmt = conn.prepareStatement(query2);
                        pstmt.setLong(1, amou);
                        pstmt.setLong(2, numacc);

                        int res = pstmt.executeUpdate();
                        if (res > 0) {
                            req.setAttribute("message", "Withdraw Successful. To collect money visit any YashBank branch.");
                        } else {
                            req.setAttribute("message", "Withdraw Unsuccessful. Try again.");
                        }
                    } else {
                        req.setAttribute("message", "Insufficient Funds.");
                    }
                } else {
                    req.setAttribute("message", "Incorrect Password.");
                }
            } else {
                req.setAttribute("message", "Account not found.");
            }

            req.getRequestDispatcher("withdraw.jsp").forward(req, resp);

        } catch (Exception e) {
            System.out.println("Exception in doPost: " + e);
            req.setAttribute("message", "Something Went Wrong.");
            req.getRequestDispatcher("withdraw.jsp").forward(req, resp);
        }
    }

    @Override
    public void destroy() {
        try {
            if (pstmt != null) pstmt.close();
            if (pstmt2 != null) pstmt2.close();
            if (conn != null) conn.close();
            if (res2 != null) res2.close();
        } catch (Exception e) {
            System.out.println("Exception in destroy: " + e);
        }
    }
}
