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
import java.security.MessageDigest;

/**
 *
 * @author batra
 */
public class signupServlet extends HttpServlet {

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
            int sno = 0;
//            int sno=1;
//            long customerid=500000;
//            long accountno=500000000;
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String pan = request.getParameter("pan");
            String aadhar = request.getParameter("aadhar");
            String fathername = request.getParameter("fathername");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            String address = request.getParameter("address");
            String pass1 = request.getParameter("password1");
            String pass2 = request.getParameter("password2");
            if (pass1.equals(pass2)) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bank?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
                    Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
                    out.println("<h1>Statement Created</h1>");
                    ResultSet rs = st.executeQuery("select count(*) from customers");
                    out.println("<h1>Result Set Created</h1>");
                    rs.next();
                    out.println("<h1>Result Set Next</h1>");
                    sno = rs.getInt(1) + 1;
                    PreparedStatement ps = con.prepareStatement("insert into customers values(?,?,?,?,?,?,?,?,?,?,?)");
                    ps.setInt(1, sno);
                    ps.setString(2, name);
                    ps.setString(3, phone);
                    ps.setString(4, email);
                    ps.setString(5, pan);
                    ps.setString(6, aadhar);
                    ps.setString(7, fathername);
                    ps.setString(8, gender);
                    ps.setString(9, dob);
                    ps.setString(10, address);
                    ps.setString(11, pass1);
                    ps.executeUpdate();
                    request.setAttribute("name", name);
                    request.setAttribute("phone", phone);
                    request.setAttribute("email", email);
                    request.setAttribute("pan", pan);
                    request.setAttribute("aadhar", aadhar);
                    request.setAttribute("fathername", fathername);
                    request.setAttribute("gender", gender);
                    request.setAttribute("dob", dob);
                    request.setAttribute("address", address);

                    RequestDispatcher rd = request.getRequestDispatcher("SignedUp.jsp");
                    rd.forward(request, response);

                } catch (Exception e) {
                    out.println("<h1>" + e + "</h1>");
                }
            }else{
                RequestDispatcher rd= request.getRequestDispatcher("signUp.jsp");
                rd.include(request, response);
                out.println("<h1> Both passwords do not match</h1>");
            }
            out.println("<title>Servlet signupServlet</title>");
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
