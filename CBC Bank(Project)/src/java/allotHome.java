/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author batra
 */
public class allotHome extends HttpServlet {

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
            String custid = request.getParameter("custid");
            String loanno = request.getParameter("loanno");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bank?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from applyhome where customerid='" + custid + "'");
                if (rs.next()) {
                    Double amount = rs.getDouble(3);
                    int years = rs.getInt(5);
                    int months = rs.getInt(6);
                    int period = years + months;
                    Double installment = (amount + (amount * 0.525)) / period;
                    PreparedStatement ps = con.prepareStatement("insert into homeloan values(?,?,?,CURRENT_TIMESTAMP,?,?,?)");
                    ps.setString(1, custid);
                    ps.setString(2, loanno);
                    ps.setDouble(3, amount);
                    ps.setInt(4, years);
                    ps.setInt(5, months);
                    ps.setDouble(6, installment);
                    ps.executeUpdate();
                    Statement st1 = con.createStatement();
                    st1.execute("delete from applyhome where customerid='" + custid + "'");
                    RequestDispatcher rd = request.getRequestDispatcher("adminLoggedIn6.jsp");
                    rd.include(request, response);
                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("adminLoggedIn6.jsp");
                    rd.include(request, response);
                    out.println("<h1>Invalid Customer ID</h1>");
                }
            } catch (Exception e) {
                out.println("<h1>" + e + "</h1>");
            }
            out.println("<title>Servlet allotHome</title>");
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
