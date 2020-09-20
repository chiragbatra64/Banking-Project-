
<%-- 
    Document   : anotherBank
    Created on : 05-Aug-2020, 4:38:31 PM
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
        <title>Another Bank Transfer</title>
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
                %>
                <label class="welcome">Welcome, <%=name%></label>
                <p class="logout">
                    <i class="fas fa-sign-out-alt Icon"></i>
                    <a class="logout1" href="index.jsp">LOGOUT</a>
                </p>
                <p class="functions">
                    <a href="LoggedIn.jsp">Accounts</a>
                    <a style="margin-left: 30px;background: #999999;border-radius: 5px;color: #ffffff" href="fundsTransfer.jsp">Funds Transfer</a>
                    <a style="margin-left: 30px" href="cards.jsp">Cards</a>
                    <a style="margin-left: 30px" href="loans.jsp">Loans</a>
                </p>
            </div>
        </div>
        <div class="content">
            <div class="content-left">
                <label style="background: #cccccc;color: #0A0A0A;font-size: 35px;">Funds Transfer</label>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;" href="fundsTransfer.jsp">Transfer within Bank</a>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;background: #EEF7FB;color: #0C2074" href="anotherBank.jsp">Transfer to another Bank</a>
            </div>
            <div class="content-right">
                <h1>Transfer Within Bank</h1>
                <form class="fdForm" action="transferAnotherServlet" method="post">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Customer ID</label>
                        <div class="col-sm-10">
                            <input type="text" readonly class="form-control-plaintext" value="<%=custid%>"/>
                        </div>
                    </div>    
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Transfer from Account No</label>
                        <div class="col-sm-10">
                            <input type="text" readonly class="form-control-plaintext" value="<%=accountno%>"/>
                        </div>
                    </div>    
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Balance</label>
                        <div class="col-sm-10">
                            <input type="text" readonly class="form-control-plaintext" value="<%=balance%>"/>
                        </div>
                    </div>    
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Transfer to Account No.</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="toAccount">
                        </div> 
                    </div>    
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Recipient Bank Name</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="recipientBank">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">IFSC Code</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="ifsc">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Amount</label>
                        <div class="col-sm-2">
                            <input type="number" class="form-control" name="amount"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-3">
                            <input type="submit" class="btn btn-primary" value="Continue"/>
                        </div>
                    </div>
                </form>
                <ul style="margin-left: 85px;margin-top: 25px;font-weight: bold">
                    <li>The Bank shall not be responsible for fraudulent online transactions through improper disclosure of confidential details by you.</li>
                    <li>The Bank or its officials do not ask for the details of your Account / IPIN/ Password/ OTP via e-mail, sms or in person.</li>
                </ul>
            </div>
        </div>
        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
