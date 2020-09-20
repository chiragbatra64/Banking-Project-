<%-- 
    Document   : rd
    Created on : 04-Aug-2020, 11:27:54 AM
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
        <title>Open RD</title>
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
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;background: #EEF7FB;color: #0C2074" href="rd.jsp">Open Recurring Deposit</a>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;" href="fdSum.jsp">Fixed Deposit Summary</a>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;" href="rdSum.jsp">Recurring Deposit Summary</a>
            </div>
            <div class="content-right">
                <h1>Recurring Deposit</h1>
                <form class="fdForm" action="rdServlet" method="post">
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
                        <label class="col-sm-2 col-form-label">Account No</label>
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
                        <label class="col-sm-2 col-form-label">Deposit Amount</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" name="depositAmount">
                        </div>
                        <div class="col-sm-2">
                            <label>per Month</label>
                        </div>
                    </div>    
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Deposit Period</label>
                        <div class="col-sm-1">
                            <input type="number" class="form-control" name="months"/>
                        </div>
                        <div class="col-sm-1">
                            <label class="col-form label">Months</label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-2">
                            <input type="submit" class="btn btn-primary" value="Continue"/>
                        </div>
                    </div>
                </form>

                <ul style="margin-left: 85px;margin-top: 25px;">
                    <li>TDS will be deducted when interest payable or reinvested on RD and FD per customer across all branches exceeds Rs. 40,000/- (Rs. 50,000/- for senior citizens) in a financial year.Individuals seeking exemption from TDS on the interest income of FD and RD, have to submit a completed Form 15 G/H at the nearest branch or online within the first week of the new Financial Year and every time a new deposit is booked.</li>
                    <li>	I/we hereby authorize you to act upon my/our instruction regarding nomination, cancellation or variation of the nomination of the Fixed/Recurring/FCNR Deposit (given through various modes). I/we shall not hold the bank responsible should any claim be raised against the Bank for acting on the instruction of nomination and the Bank does suffer any loss I/we will keep it indemnified from time to time</li>
                    <li>Customer's booking Fixed/Recurring Deposit with holding pattern as either or Survivor can only replicate nominee details as captured in the linked saving/current account. For adding/changing nomination customer will need to visit the nearest branch.</li>
                    <li>For adding fresh nominee details in case of joint Deposit, customer will need to visit the nearest branch .</li>
                    <li></li>
                </ul>
            </div>            
        </div>
        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
