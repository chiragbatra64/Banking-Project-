/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author batra
 */
public class allotCard extends HttpServlet {

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
            String cardno = request.getParameter("cardno");
            int oin = 1234;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bank?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from applycredit where customerid='" + custid + "'");
                if (rs.next()) {
                    String name = rs.getString(2);
                    String phone = rs.getString(4);
                    String address = rs.getString(5);
                    Double Salary = rs.getDouble(3);
                    String custid1 = rs.getString(1);
                    PreparedStatement ps = con.prepareStatement("insert into creditcard values (?,?,?,?,?)");
                    ps.setString(1, custid);
                    ps.setString(2, name);
                    ps.setString(3, cardno);
                    ps.setString(4, phone);
                    ps.setInt(5, oin);
                    ps.executeUpdate();
                    st.execute("delete from applycredit where customerid='" + custid + "'");
                    RequestDispatcher rd= request.getRequestDispatcher("adminLoggedIn3.jsp");
                    rd.include(request, response); 
                }else{
                    RequestDispatcher rd = request.getRequestDispatcher("adminLoggedIn3.jsp");
                    rd.include(request, response);
                    out.println("<h1> Invalid Customer ID</h1>");
                }
            }catch(Exception e){
                out.println("<h1>" + e + "</h1>");
            }
            out.println("<title>Servlet allotCard</title>");
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
