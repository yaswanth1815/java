package com.goldenyield.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet("/showagentrecordsservlet")
public class ShowAgentRecordsServlet extends HttpServlet {
    Connection conn = null;

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
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String query1 = "select * from agentregistration";
        resp.setContentType("text/html");
        PrintWriter pw = resp.getWriter();

        pw.println("""
            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Agent Records</title>
                <style>
                    body {
                        margin: 0;
                        font-family: Arial, sans-serif;
                        background-color: #f0f4f8;
                        height: 100vh;
                    }
                    .table-container {
                        width: 100%;
                        height: 100vh; /* Full page height */
                        background: white;
                        padding: 20px;
                        box-sizing: border-box;
                        overflow: auto; /* Scroll inside box if data overflows */
                    }
                    table {
                        border-collapse: collapse;
                        width: 100%;
                        min-width: 800px;
                        box-shadow: 0 4px 15px rgba(0,0,0,0.2);
                        border-radius: 10px;
                        overflow: hidden;
                    }
                    th {
                        background-color: #333; /* Heading background */
                        color: white;
                        padding: 10px;
                        text-align: left;
                        font-weight: bold;
                        position: sticky; /* Keep heading visible while scrolling */
                        top: 0;
                        z-index: 2;
                    }
                    td {
                        background-color: #fafafa; /* Data background */
                        color: #333;
                        padding: 10px;
                        text-align: left;
                        font-weight: normal;
                    }
                    tr:nth-child(even) td {
                        background-color: #f2f2f2;
                    }
                    tr:hover td {
                        background-color: #d6f5d6;
                    }
                </style>
            </head>
            <body>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>Agent Name</th>
                                <th>Agent ID</th>
                                <th>Mobile</th>
                                <th>Adhaar Number</th>
                                <th>Age</th>
                                <th>State</th>
                                <th>District</th>
                                <th>Mandal</th>
                                <th>Village</th>
                            </tr>
                        </thead>
                        <tbody>
        """);

        try {
            Statement stmt = conn.createStatement();
            ResultSet result = stmt.executeQuery(query1);
            DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            DateTimeFormatter dtf2 = DateTimeFormatter.ofPattern("y");

            while (result.next()) {
                String agentName = result.getString(1);
                int agentId = result.getInt(9);
                long mobile = result.getLong(2);
                long adhaar = result.getLong(3);
                String dobString = result.getString(4);
                String state = result.getString(5);
                String district = result.getString(6);
                String mandal = result.getString(7);
                String village = result.getString(8);

                LocalDate date1 = LocalDate.parse(dobString, dtf1);
                LocalDate date2 = LocalDate.now();

                int var1 = Integer.parseInt(date1.format(dtf2));
                int var2 = Integer.parseInt(date2.format(dtf2));

                int age = var2 - var1;

                pw.println("<tr>"
                        + "<td>" + agentName + "</td>"
                        + "<td>" + agentId + "</td>"
                        + "<td>" + mobile + "</td>"
                        + "<td>" + adhaar + "</td>"
                        + "<td>" + age + "</td>"
                        + "<td>" + state + "</td>"
                        + "<td>" + district + "</td>"
                        + "<td>" + mandal + "</td>"
                        + "<td>" + village + "</td>"
                        + "</tr>");
            }

            pw.println("""
                        </tbody>
                    </table>
                </div>
            </body>
            </html>
            """);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
