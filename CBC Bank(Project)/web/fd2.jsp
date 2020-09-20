<%-- 
    Document   : fd2
    Created on : 07-Aug-2020, 4:16:09 PM
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
        <title>Open FD</title>
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
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;background: #EEF7FB;color: #0C2074" href="fd.jsp">Open Fixed Deposit</a>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;" href="rd.jsp">Open Recurring Deposit</a>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;" href="fdSum.jsp">Fixed Deposit Summary</a>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;" href="rdSum.jsp">Recurring Deposit Summary</a>
            </div>
            <div class="content-right">
                <h1>Fixed Deposit</h1>

                <form class="fdForm" action="fdServlet" method="post">
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
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="depositAmount">
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
                        <div class="col-sm-1">
                            <input type="number" name="days" class="form-control"/>
                        </div>
                        <div class="col-sm-1">
                            <label class="col-form-label">Days</label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-2">
                            <input type="submit" class="btn btn-primary" value="Continue"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-5">
                            <h1>Not enough balance</h1>
                        </div>
                    </div>
                </form>
                <ul style="margin-left: 85px;margin-top: 25px;">
                    <li style="font-weight: bold">	It is reiterated that the interest rate applicable on multiple deposits, across all channels, made by the same customer in a single day in one particular tenor bucket would be the rate which is applicable for the aggregate value.</li>
                    <li>	We hereby authorize you to act upon my/our instruction regarding nomination, cancellation or variation of the nomination of the Fixed/Recurring/FCNR Deposit (given through various modes). I/we shall not hold the bank responsible should any claim be raised against the Bank for acting on the instruction of nomination and the Bank does suffer any loss I/we will keep it indemnified from time to time.</li>
                    <li>	Customers booking Fixed/Recurring Deposit with holding pattern as Either or Survivor can only replicate nominee details as captured in the linked saving/current account. For adding fresh nominee details in case of joint Deposit, please visit the nearest branch.</li>
                    <li>As per section 206AA introduced by finance (No.2) Act, 2009 , every person who receives income on which TDS is deductible shall furnish his pan, failing which TDS shall be deducted at the rate of 20% (as against 10% which is existing TDS rate) in case of domestic deposits and 31.20% in case of NRO deposits</li>
                    <li>	Fixed Deposit liquidation facility is available on NetBanking only for Single Holding FDs.</li>
                    <li>TDS will be deducted when interest payable or reinvested on RD and FD per customer across all branches exceeds Rs. 40,000/- (Rs. 50,000/- for senior citizens) in a financial year.Individuals seeking exemption from TDS on the interest income of FD and RD, have to submit a completed Form 15 G/H at the nearest branch or online within the first week of the new Financial Year and every time a new deposit is booked</li>
                    <li>Senior Citizen Care FD<br>
                        An Additional Premium of 0.25% (over and above the existing premium of 0.50%) shall be given to Senior Citizens who wish to book the Fixed Deposit less than 5 crores for a tenure of 5 (five) years One Day to 10 Years, during special deposit scheme offer commencing from 18th May'20 to 30th Sept'20. This special scheme will be applicable to new Fixed Deposit booked as well as for the Renewals, by Senior Citizens during the above period. This scheme is not available to Non-Resident Indian.<br>
                        In case of premature closure of Fixed Deposit booked in the above scheme (including sweep in / partial closure) on or before 5 years, the interest rate will be 1.00% below the contracted rate or the base rate applicable for the period the deposit has remained with the bank, whichever is lower. In case of premature closure of Fixed Deposit booked in the above scheme (including sweep in / partial closure) post 5 years, the interest rate will be 1.25% below the contracted rate or the base rate applicable for the period the deposit has remained with the bank, whichever is lower. All other terms and conditions as applicable to Fixed Deposit shall remain unchanged and the same shall be applicable to the above scheme too.</li>
                </ul>
            </div>
        </div> 
        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
