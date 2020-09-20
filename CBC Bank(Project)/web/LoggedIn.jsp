<%-- 
    Document   : LoggedIn
    Created on : 17-Jul-2020, 5:49:06 PM
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
        <title>Logged In</title>
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
        </style>
    </head>
    <body>
        <div class="header">
            <img class="logo" src="BankLogo.png"/>
            <div class="header-right">
                <%
                    Cookie cookie=null;
                    Cookie[] cookies = null;
                    String custid= null;
                    cookies=request.getCookies();
                    if(cookies!=null){
                        for(int i=0;i<cookies.length;i++){
                            cookie=cookies[i];
                            if(cookie.getName().equals("custid")){
                                custid=cookie.getValue();
                            }
                        }
                    }
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bank?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from permanentcustomers where customerid='" + custid + "'");
                    rs.next();
                    String name=rs.getString(4);
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
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;background: #EEF7FB;color: #0C2074" href="LoggedIn.jsp">Account Summary</a>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;" href="fd.jsp">Open Fixed Deposit</a>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;" href="rd.jsp">Open Recurring Deposit</a>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;" href="fdSum.jsp">Fixed Deposit Summary</a>
                <a style="color: #cccccc;font-size: 25px;margin-top: 20px;" href="rdSum.jsp">Recurring Deposit Summary</a>
            </div>
            <div class="content-right">
                <h1>Account Summary</h1>
                <label style="background: #EEF7FB;color: #0C2074;margin-top: 20px;margin-left: 10px;font-size: 28px;height: 50px;width: 500px;">Savings Account</label>
                <label style="background: #EEF7FB;color: #0C2074;margin-top: 20px;font-size: 23px">                                          </label>
                <label style="background: #EEF7FB;color: #0C2074;margin-top: 20px;font-size: 28px;height: 50px;width: 450px">Total Available Balance:INR <%=balance%></label>
                <table class="table table-striped" style="margin-left: 10px;font-size: 20px;width: 980px">
                    <tbody>
                        <tr>
                            <td>Account No.</td>
                            <td>Name</td>
                            <td>Aadhar No.</td>
                            <td>Balance</td>
                        </tr>
                    </tbody>
                    <tbody>
                        <tr>
                            <td style="font-weight: bold" scope="col"><%=accountno%></td>
                            <td style="font-weight: bold" scope="col"><%=name%></td>
                            <td style="font-weight: bold" scope="col"><%=aadhar%></td>
                            <td style="font-weight: bold" scope="col"><%=balance%></td>
                        </tr>
                    </tbody>
                </table>
                <h2 style="margin-top: 30px;margin-left: 10px">Note:</h2>
                <ul style="margin-left: 55px;">
                    <li>The Available Balance displayed includes the credit balance and overdraft limit (if any) in your account.
                        <ol style="margin-left: 90px;">
                            <li> It does not include Uncleared Funds.</li>
                            <li> It includes amount marked for hold</li>
                        </ol> 
                    </li>
                    <li>The Hold Balance may also include pending service charges due to be recovered from your account.</li>
                </ul>
            </div>
        </div>
        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
