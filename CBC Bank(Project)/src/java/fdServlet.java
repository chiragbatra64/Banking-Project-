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
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;

/**
 *
 * @author batra
 */
public class fdServlet extends HttpServlet {

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
            String amount = request.getParameter("depositAmount");
            String months = request.getParameter("months");
            String days = request.getParameter("days");
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
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bank?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from permanentcustomers where customerid='" + custid + "'");
                rs.next();
                Double balance = rs.getDouble(14);
                Double amount1 = Double.parseDouble(amount);
                if (balance >= amount1) {
                    double balance1 = balance-amount1;
                    PreparedStatement ps;
                    ps = con.prepareStatement("insert into fds values(?,?,?,?,CURRENT_TIMESTAMP)");
                    ps.setString(1, custid);
                    ps.setString(2, amount);
                    ps.setString(3, months);
                    ps.setString(4, days);
                    ps.executeUpdate();
                    st.execute("update permanentcustomers set balance='" + balance1 + "' where customerid='" + custid + "'");
                    RequestDispatcher rd = request.getRequestDispatcher("fd1.jsp");
                    rd.forward(request, response);
                }else{
                    RequestDispatcher rd1= request.getRequestDispatcher("fd2.jsp");
                    rd1.forward(request, response);
                }

            } catch (Exception e) {
                out.println("<h1>" + e + "</h1>");
            }
            out.println("<title>Servlet fdServlet</title>");
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
