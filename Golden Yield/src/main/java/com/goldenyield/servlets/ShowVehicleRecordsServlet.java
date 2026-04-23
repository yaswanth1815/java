
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

@WebServlet("/showvehiclerecordsservlet")
public class ShowVehicleRecordsServlet extends HttpServlet {
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
        String query1 = "select * from vehicleregistration";
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
                                <th>Name</th>
                                <th>vehicle ID</th>
                                <th>Licence</th>
                                <th>VehNumber</th>
                                <th>Rc</th>
                                <th>Mobile</th>
                                <th>Adhaar Number</th>
                                <th>Age</th>
                                <th>Location</th>
                            </tr>
                        </thead>
                        <tbody>
        """);

        try {
            Statement stmt = conn.createStatement();
            ResultSet result = stmt.executeQuery(query1);
            
            while (result.next()) {
                String name = result.getString(1);
                int age = result.getInt(2);
                String licence=result.getString(3);
                String vehNumber=result.getString(4);
                String rcNumber=result.getString(5);
                long mobile = result.getLong(6);
                long adhaar = result.getLong(7);
                String location=result.getString(8);
                int vehicleId=result.getInt(9);  
                
                pw.println("<tr>"
                        + "<td>" + name + "</td>"
                        + "<td>" + vehicleId + "</td>"
                        + "<td>" + licence + "</td>"
                        + "<td>" + vehNumber + "</td>"
                        + "<td>" + rcNumber + "</td>"
                        + "<td>" + mobile + "</td>"
                        + "<td>" + adhaar + "</td>"
                        +"<td>" + age + "</td>"
                        + "<td>" + location + "</td>"
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
