<%-- 
    Document   : adminLoggedIn5
    Created on : 07-Aug-2020, 12:20:39 PM
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
        <title>Car Loan Applicants</title>
        <style>
            *{
                margin: 0;
                padding: 0;
            }

            body{
                font-family: 'Hind', sans-serif;
            }

            .header{
                height: 180px;
                background: #0A0A0A;
                display: grid;
                grid-template-columns: 30% 70%;
            }

            .logo{
                height: 180px;
            }

            .Icon{
                font-size: 30px;
            }

            .about{
                margin-top: 130px;
                margin-left: 1250px;
                color: #cccccc;
            }

            a{
                text-decoration: none;
            }

            .menu{
                background: #EEF7FB;
                height: 50px;
            }

            .menu a{
                color: #0C2074;
                text-decoration: none;
                font-size: 30px;
            }
            .tab{
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <img class="logo" src="BankLogo.png"/>
            <p class="about">
                <i class="fas fa-sign-out-alt Icon"></i>
                <a style="color: #cccccc" href="admin.jsp">LOGOUT</a>
            </p>
        </div>
        <div class="menu">
            <a style="margin-left: 40px;" href="adminLoggedIn.jsp">Customers</a>
            <a style="margin-left: 30px;" href="adminLoggedIn7.jsp">Deposit</a>
            <a style="margin-left: 30px;" href="adminLoggedIn8.jsp">Withdraw</a>
            <a style="margin-left: 30px;" href="adminLoggedIn2.jsp">New Customers</a>
            <a style="margin-left: 30px;" href="adminLoggedIn3.jsp">Credit Card Applicants</a>
            <a style="margin-left: 30px;" href="adminLoggedIn4.jsp">Debit Card Applicants</a>
            <a style="margin-left: 30px;background: #0C2074;color: #EEF7FB" href="adminLoggedIn5.jsp">Car Loan Applicants</a>
            <a style="margin-left: 30px;" href="adminLoggedIn6.jsp">Home Loan Applicants</a>
        </div>
        <div class="tab">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Customer ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Phone</th>
                        <th scope="col">Amount Needed</th>
                        <th scope="col">Period</th>
                        <th scope="col">Salary</th>
                    </tr>
                </thead>
                <%
                    int i = 1;
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bank?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from applycar");
                    while (rs.next()) {
                        String name = rs.getString(2);
                        Double amount= rs.getDouble(3);
                        String period = rs.getString(5)+ "years " + rs.getString(6) + "months";
                        String mobile = rs.getString(7);
                        Double salary = rs.getDouble(4);
                        String custid = rs.getString(1);
                %>

                <tbody>
                    <tr>
                        <th scope="row"><%=i%></th>
                        <td><%=custid%></td>
                        <td><%=name%></td>
                        <td><%=mobile%></td>
                        <td><%=amount%></td>
                        <td><%=period%></td>
                        <td><%=salary%></td>
                    </tr>
                </tbody>    
                <%
                        i++;
                    }
                %>
            </table>    
        </div>
        <form style="margin-bottom: 20px;" action="allotCar" method="post">
            <label style="font-size: 18px; margin-left: 10px;">Enter the customer ID of the account whose application is to be accepted </label>
            <input style="margin-left: 20px;" type="text" name="custid"/><br>
            <label style="font-size: 18px; margin-left: 10px;">Enter Loan Number to be allotted</label>
            <input style="margin-left: 20px;" type="text" name="loanno"/><br>
            <input style="margin-left: 20px" type="submit" value="Submit"/>
        </form>
        <h1 style="margin-left: 50px;">OR</h1>
        <form style="margin-top: 20px;" action="notAllotCar" method="post">
            <label style="font-size: 18px; margin-left: 10px;">Enter the customer ID of the application to be rejected</label>
            <input style="margin-left: 20px;" type="number" name="custid1"/><br>
            <input style="margin-left: 20px" type="submit" value="Submit"/>
        </form>
    </body>
</html>
