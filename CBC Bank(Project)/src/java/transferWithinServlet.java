/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author batra
 */
public class transferWithinServlet extends HttpServlet {

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
            Cookie cookie = null;
            Cookie[] cookies = null;
            String custid = null;
            cookies = request.getCookies();
            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {
                    cookie = cookies[i];
                    if (cookie.getName().equals("custid")) {
                        custid = cookie.getValue();
                    }
                }
            }
            String toAccount = request.getParameter("toAccount");
            String amount = request.getParameter("amount");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bank?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from permanentcustomers where customerid='" + custid + "'");
                rs.next();
                String name = rs.getString(4);
                String accountno = rs.getString(3);
                String aadhar = rs.getString(8);
                Double balance = rs.getDouble(14);
                Double amount1 = Double.parseDouble(amount);
                Double balance1 = balance - amount1;
                ResultSet rs1 = st.executeQuery("select * from permanentcustomers where accountno ='" + toAccount + "'");
                if (rs1.next()) {
                    Double recipient = rs1.getDouble(14);
                    Double balance2 = recipient + amount1;
                    if (balance >= amount1) {
                        PreparedStatement ps = con.prepareStatement("update permanentcustomers set balance=? where customerid=?");
                        ps.setString(2, custid);
                        ps.setDouble(1, balance1);
                        ps.executeUpdate();
                        PreparedStatement ps1 = con.prepareStatement("update permanentcustomers set balance=? where accountno=?");
                        ps1.setDouble(1, balance2);
                        ps1.setString(2, toAccount);
                        ps1.executeUpdate();
                        RequestDispatcher rd = request.getRequestDispatcher("fundsTransfer.jsp");
                        rd.include(request, response);
                        out.println("<h1> Successfully Transfered </h1>");
                    } else {
                        RequestDispatcher rd = request.getRequestDispatcher("fundsTransfer.jsp");
                        rd.include(request, response);
                        out.println("<h1> Insufficient Funds </h1>");
                    }
                }else{
                    RequestDispatcher rd = request.getRequestDispatcher("fundsTransfer.jsp");
                        rd.include(request, response);
                        out.println("<h1> Account Number Invalid </h1>");
                }

            } catch (Exception e) {
                out.println("<h1>" + e + "</h1>");
            }
            out.println("<title>Servlet transferWithinServlet</title>");
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
