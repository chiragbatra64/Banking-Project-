<%-- 
    Document   : fdSum
    Created on : 04-Aug-2020, 12:30:56 PM
    Author     : batra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.Month"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <script src="https://kit.fontawesome.com/22cf178b07.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Hind:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <title>FD Summary</title>
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
            Date date = new Date();
            int months = 0;
            String date1 = null;
            String ldate1 = null;
            LocalDate ldate;
            Double amount;
            int years;
            int totalMonths;
            String[] dateList = new String[3];
            SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/bank?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
            Statement st1 = con1.createStatement();
            ResultSet rs1 = st1.executeQuery("select * from fds where customerid='" + custid + "'");
            if (rs1.next()) {
                totalMonths = rs1.getInt(3);
                amount = rs1.getDouble(2);
                date = rs1.getDate(5);
                ldate = LocalDate.now();
                date1 = df.format(date);
//                ldate1 = df.format(ldate);
                dateList = date1.split("/");
                int month = Integer.parseInt(dateList[0]);
                int year = Integer.parseInt(dateList[2]);
                if (year == ldate.getYear()) {
                    months = ldate.getMonthValue() - month;
                    years = 0;
                } else {
                    months = 12 - month;
                    months = months + ldate.getMonthValue();
                    if (months > 12) {
                        years = ldate.getYear() - year;
                    } else {
                        years = 0;
                    }
                }
                if (years == 0) {
                    amount = amount + 0;
                } else {
                    amount = amount + (0.0525 * amount * years);
                }
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
                    <a style="background: #999999;border-radius: 5px;color: #ffffff" href="LoggedIn.jsp">Accounts</a>
                    <a style="margin-left: 30px" href="fundsTransfer.jsp">Funds Transfer</a>
                    <a style="margin-left: 30px" href="cards.jsp">Cards</a>
                    <a style="margin-left: 30px" href="loans.jsp">Loans</a>
                </p>
            </div>
        </div>
        <div class="content">
            <div class="content-left">
                <label style="background: #cccccc;color: #0A0A0A;font-size: 35px;">Accounts</label>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;" href="LoggedIn.jsp">Account Summary</a>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;" href="fd.jsp">Open Fixed Deposit</a>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;" href="rd.jsp">Open Recurring Deposit</a>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;background: #EEF7FB;color: #0C2074" href="fdSum.jsp">Fixed Deposit Summary</a>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;" href="rdSum.jsp">Recurring Deposit Summary</a>
            </div>
            <div class="content-right">
                <h1>Fixed Deposit Summary</h1>
                <table class="table table-striped" style="margin-left: 10px;font-size: 20px;width: 980px">
                    <tbody>
                        <tr>
                            <td>Customer ID</td>
                            <td>Name</td>
                            <td>Amount</td>
                            <td>Total Months</td>
                            <td>Months Covered</td>
                        </tr>
                    </tbody>
                    <tbody>
                        <tr>
                            <td style="font-weight: bold" scope="col"><%=custid%></td>
                            <td style="font-weight: bold" scope="col"><%=name%></td>
                            <td style="font-weight: bold" scope="col"><%=amount%></td>
                            <td style="font-weight: bold" scope="col"><%=totalMonths%></td>
                            <td style="font-weight: bold" scope="col"><%=months%></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div> 

        <%
        } else {


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
                    <a style="background: #999999;border-radius: 5px;color: #ffffff" href="LoggedIn.jsp">Accounts</a>
                    <a style="margin-left: 30px" href="fundsTransfer.jsp">Funds Transfer</a>
                    <a style="margin-left: 30px" href="cards.jsp">Cards</a>
                    <a style="margin-left: 30px" href="loans.jsp">Loans</a>
                </p>
            </div>
        </div>
        <div class="content">
            <div class="content-left">
                <label style="background: #cccccc;color: #0A0A0A;font-size: 35px;">Accounts</label>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;" href="LoggedIn.jsp">Account Summary</a>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;" href="fd.jsp">Open Fixed Deposit</a>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;" href="rd.jsp">Open Recurring Deposit</a>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;background: #EEF7FB;color: #0C2074" href="fdSum.jsp">Fixed Deposit Summary</a>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;" href="rdSum.jsp">Recurring Deposit Summary</a>
            </div>
            <div class="content-right">
                <h1>Fixed Deposit Summary</h1>
                <h2>You don't have any Fixed Deposits on Customer ID: <%=custid%></h2>
            </div>
        </div> 

        <%            }

        %>
        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
