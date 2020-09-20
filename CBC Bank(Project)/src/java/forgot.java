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

/**
 *
 * @author batra
 */
public class forgot extends HttpServlet {

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
            String custid = request.getParameter("customerid");
            String pass1 = request.getParameter("password1");
            String pass2 = request.getParameter("password2");
            String cardno = request.getParameter("debitcardno");
            String cardpin = request.getParameter("debitcardpin");
            String debitcardno;
            String debitcardpin;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bank?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from debitcard where customerid='" + custid + "'");
                if (rs.next()) {
                    debitcardno = rs.getString(2);
                    debitcardpin = rs.getString(6);
                    if (pass1.equals(pass2)) {
                        if (debitcardno.equals(cardno) && debitcardpin.equals(cardpin)) {
                            st.execute("update permanentcustomers set password='" + pass1 + "' where customerid='" + custid + "'");
                            RequestDispatcher rd = request.getRequestDispatcher("passwordChanged.jsp");
                            rd.forward(request, response);
                        } else {
                            RequestDispatcher rd1 = request.getRequestDispatcher("forgot.jsp");
                            rd1.include(request, response);
                            out.println("<h1>Invalid Details</h1>");
                        }
                    } else {
                        RequestDispatcher rd2 = request.getRequestDispatcher("forgot.jsp");
                        rd2.include(request, response);
                        out.println("<h1>Both passwords do not match");
                    }
                } else {
                    RequestDispatcher req = request.getRequestDispatcher("forgot.jsp");
                    req.include(request, response);
                    out.println("<h1>Invalid Customer ID</h1>");
                }

            } catch (Exception e) {
                out.println("<h1>Not Succesful</h1>");
                out.println("<h1>" + e + "</h1>");
            }

            out.println("<title>Servlet forgot</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1></h1>");
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
