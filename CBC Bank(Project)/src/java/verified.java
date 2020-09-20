/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.dbcp.dbcp2.SQLExceptionList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author batra
 */
public class verified extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            String snoo = request.getParameter("sno");
            int sno = 0;
            long customerid = 0;
            long accountno = 0;
            String balance=request.getParameter("amount");
            Double balance1 = Double.parseDouble(balance);
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bank?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
                Statement st = con.createStatement();
                ResultSet rs1 = st.executeQuery("select count(*) from permanentCustomers");
                rs1.next();
                sno = rs1.getInt(1) + 1;
                ResultSet rs2 = st.executeQuery("Select * from permanentCustomers");
                while (rs2.next()) {
                    customerid = rs2.getLong(2) + 1;
                    accountno = rs2.getLong(3) + 1;
                }
                ResultSet rs = st.executeQuery("select * from customers where sno='" + snoo + "'");
                rs.next();
                String name = rs.getString(2);
                String phone = rs.getString(3);
                String email = rs.getString(4);
                String pan = rs.getString(5);
                String aadhar = rs.getString(6);
                String fathername = rs.getString(7);
                String gender = rs.getString(8);
                String dob = rs.getString(9);
                String address = rs.getString(10);
                String pass = rs.getString(11);
                PreparedStatement ps = con.prepareStatement("insert into permanentCustomers values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                ps.setInt(1, sno);
                ps.setLong(2, customerid);
                ps.setLong(3, accountno);
                ps.setString(4, name);
                ps.setString(5, phone);
                ps.setString(6, email);
                ps.setString(7, pan);
                ps.setString(8, aadhar);
                ps.setString(9, fathername);
                ps.setString(10, gender);
                ps.setString(11, dob);
                ps.setString(12, address);
                ps.setString(13, pass);
                ps.setDouble(14, balance1);
                ps.executeUpdate();
                
                st.execute("delete from customers where sno='" + snoo + "'");
                RequestDispatcher rd2= request.getRequestDispatcher("adminLoggedIn2.jsp");
                rd2.forward(request, response);
                
            } catch (SQLException | ClassNotFoundException e) {
                out.println("<h1>" + e + "</h1>");
            }
            out.println("<title>Servlet verified</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
