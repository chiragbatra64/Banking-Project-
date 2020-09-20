<%-- 
    Document   : creditCard
    Created on : 06-Aug-2020, 9:53:30 AM
    Author     : batra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <script src="https://kit.fontawesome.com/22cf178b07.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Hind:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <title>Apply for Credit Card</title>
        <style>
            *{
                padding: 0;
                margin: 0;
            }

            body{
                font-family: 'Hind', sans-serif;
            }

            .header{
                height: 200px;
                background: #0A0A0A;
                display: grid;
                grid-template-columns: 25% 75%;
            }

            .logo{
                height: 230px;
                display: grid;
            }

            .Icon{
                font-size: 30px;
            }

            .header-right{
                display: grid;
                color: #cccccc;
            }

            .welcome{

                margin-left: 15px;
                font-size: 25px;
                font-style: italic;
                margin-top: 15px;
            }          

            .logout{
                margin-left: 1250px;
                color: #cccccc;
            }

            .logout1{
                color: #cccccc;
            }

            .about{
                margin-top: 130px;
                margin-left: 1250px;
                color: #cccccc;
            }

            a{
                text-decoration: none;
            }

            .content{
                display: grid;
                grid-template-columns: 20% 80%;
                /*                height: 833px;*/

            }

            .content-left{
                display: grid;
                background: #0A0A0A;
                /*                height: 100%;*/
                color: #cccccc;
            }

            .functions{
                color: #cccccc;
                margin-left: 30px;
                font-size: 30px;
            }

            .functions a{
                color: #cccccc;
            }

            .fdForm{
                font-size: 25px;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <img class="logo" src="BankLogo.png"/>
            <div class="header-right">
                <%
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
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bank?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from permanentcustomers where customerid='" + custid + "'");
                    rs.next();
                    String name = rs.getString(4);
                    String accountno = rs.getString(3);
                    String aadhar = rs.getString(8);
                    Double balance = rs.getDouble(14);
                    String mobileno = rs.getString(5);
                    String address = rs.getString(12);
                %>
                <label class="welcome">Welcome, <%=name%></label>
                <p class="logout">
                    <i class="fas fa-sign-out-alt Icon"></i>
                    <a class="logout1" href="index.jsp">LOGOUT</a>
                </p>
                <p class="functions">
                    <a href="LoggedIn.jsp">Accounts</a>
                    <a style="margin-left: 30px" href="fundsTransfer.jsp">Funds Transfer</a>
                    <a style="margin-left: 30px;background: #999999;border-radius: 5px;color: #ffffff" href="cards.jsp">Cards</a>
                    <a style="margin-left: 30px" href="loans.jsp">Loans</a>
                </p>
            </div>
        </div>
        <div class="content">
            <div class="content-left">
                <label style="background: #cccccc;color: #0A0A0A;font-size: 35px;">Funds Transfer</label>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;" href="cards.jsp">Cards Summary</a>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;background: #EEF7FB;color: #0C2074" href="creditCard.jsp">Apply for Credit Card</a>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;" href="debitCard.jsp">Apply for Debit Card</a>
            </div>
            <div class="content-right">
                <h1>Credit Card</h1>
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/bank?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
                    Statement st1 = con.createStatement();
                    ResultSet rs2 = st.executeQuery("select * from applycredit where customerid='" + custid + "'");
                    if (rs2.next()) {
                %>

                <h2 style="margin-left: 15px;">You have already applied for Credit Card</h2>

                <%
                } else {
                    ResultSet rs1 = st.executeQuery("select * from creditcard where customerid='" + custid + "'");
                    if (rs1.next()) {
                %>

                <h2 style="margin-left: 15px;">You already have a credit card linked with your customer ID: <%=custid%></h2>

                <%
                } else {
                %>
                <form class="fdForm" action="creditCardServlet" method="post">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Customer ID</label>
                        <div class="col-sm-10">
                            <input type="text" readonly class="form-control-plaintext" value="<%=custid%>"/>
                        </div>
                    </div>    
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Name</label>
                        <div class="col-sm-10">
                            <input type="text" readonly class="form-control-plaintext" value="<%=name%>"/>
                        </div>
                    </div>    
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Phone/Contact</label>
                        <div class="col-sm-10">
                            <input type="text" readonly class="form-control-plaintext" value="<%=mobileno%>"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Address</label>
                        <div class="col-sm-10">
                            <input type="text" readonly class="form-control-plaintext" value="<%=address%>"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Salary</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" name="salary">
                        </div>
                        <div class="col-sm-2">
                            <label>per Month</label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-3">
                            <input type="submit" class="btn btn-primary" value="Continue"/>
                        </div>
                    </div>
                </form>
                <%
                        }
                    }
                %>


            </div>
        </div>
        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
