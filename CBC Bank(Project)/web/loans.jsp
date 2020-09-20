<%-- 
    Document   : loans
    Created on : 07-Aug-2020, 10:32:46 AM
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
        <title>Loans Offer</title>
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
                /*                height: 300px;*/

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
        <%
            Cookie cookie = null;
            Cookie[] cookies = null;
            cookies = request.getCookies();
            String custid = null;
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
        %>
        <div class="header">
            <img class="logo" src="BankLogo.png"/>
            <div class="header-right">
                <label class="welcome">Welcome, <%=name%></label>
                <p class="logout">
                    <i class="fas fa-sign-out-alt Icon"></i>
                    <a class="logout1" href="index.jsp">LOGOUT</a>
                </p>
                <p class="functions">
                    <a style="" href="LoggedIn.jsp">Accounts</a>
                    <a style="margin-left: 30px" href="fundsTransfer.jsp">Funds Transfer</a>
                    <a style="margin-left: 30px" href="cards.jsp">Cards</a>
                    <a style="margin-left: 30px;background: #999999;border-radius: 5px;color: #ffffff" href="loans.jsp">Loans</a>
                </p>
            </div>
        </div>
        <div class="content">
            <div class="content-left">
                <label style="background: #cccccc;color: #0A0A0A;font-size: 35px;">Loans</label>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;background: #EEF7FB;color: #0C2074" href="loans.jsp.jsp">Open Loan Summary</a>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;" href="carLoan.jsp">Apply for Car Loan</a>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;" href="homeLoan.jsp">Apply for Home Loan</a>
            </div>
            <div class="content-right">
                <h1>Loan Summary</h1>
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/bank?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
                    Statement st1 = con.createStatement();
                    ResultSet rs1 = st1.executeQuery("select * from carloan where customerid='" + custid + "'");
                    if (rs1.next()) {
                        String carLoanNo = rs1.getString(2);
                        String carAmount = rs1.getString(3);
                        String carDate = rs1.getString(4);
                        String carPeriod = rs1.getString(5) + "years " + rs1.getString(6) + "months";
                        String carInstallment = rs1.getString(7);
                        ResultSet rs2 = st1.executeQuery("select * from homeloan where customerid='" + custid + "'");
                        if (rs2.next()) {
                            String homeLoanNo = rs2.getString(2);
                            String homeAmount = rs2.getString(3);
                            String homeDate = rs2.getString(4);
                            String homePeriod = rs2.getString(5) + "years " + rs2.getString(6) + "months";
                            String homeInstallment = rs2.getString(7);


                %>

                <table class="table table-striped tbh">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Type</th>
                            <th scope="col">Loan No.</th>
                            <th scope="col">Date of Start</th>
                            <th scope="col">Period</th>
                            <th scope="col">Total Amount</th>
                            <th scope="col">Installment</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Car Loan</td>
                            <td><%=carLoanNo%></td>
                            <td><%=carDate%></td>
                            <td><%=carPeriod%></td>
                            <td><%=carAmount%></td>
                            <td><%=carInstallment%></td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Home Loan</td>
                            <td><%=homeLoanNo%></td>
                            <td><%=homeDate%></td>
                            <td><%=homePeriod%></td>
                            <td><%=homeAmount%></td>
                            <td><%=homeInstallment%></td>
                        </tr>
                    </tbody>
                </table>

                <%
                } else {

                %>

                <table class="table table-striped tbh">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Type</th>
                            <th scope="col">Loan No.</th>
                            <th scope="col">Date of Start</th>
                            <th scope="col">Period</th>
                            <th scope="col">Total Amount</th>
                            <th scope="col">Installment</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Car Loan</td>
                            <td><%=carLoanNo%></td>
                            <td><%=carDate%></td>
                            <td><%=carPeriod%></td>
                            <td><%=carAmount%></td>
                            <td><%=carInstallment%></td>
                        </tr>
                    </tbody>
                </table>

                <%
                        }
                    }
                    ResultSet rs3 = st1.executeQuery("select * from carloan where customerid='" + custid + "'");
                    if (!rs3.next()) {
                        ResultSet rs4 = st1.executeQuery("select * from homeloan where customerid='" + custid + "'");
                        if (rs4.next()) {
                            String homeLoanNo = rs4.getString(2);
                            String homeAmount = rs4.getString(3);
                            String homeDate = rs4.getString(4);
                            String homePeriod = rs4.getString(5) + "years " + rs4.getString(6) + "months";
                            String homeInstallment = rs4.getString(7);
                %>

                <table class="table table-striped tbh">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Type</th>
                            <th scope="col">Loan No.</th>
                            <th scope="col">Date of Start</th>
                            <th scope="col">Period</th>
                            <th scope="col">Total Amount</th>
                            <th scope="col">Installment</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">2</th>
                            <td>Home Loan</td>
                            <td><%=homeLoanNo%></td>
                            <td><%=homeDate%></td>
                            <td><%=homePeriod%></td>
                            <td><%=homeAmount%></td>
                            <td><%=homeInstallment%></td>
                        </tr>
                    </tbody>
                </table>

                <%
                } else {
                %>                        

                <h2>You don't have any <b>LOANS</b> linked with your account</h2>

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
