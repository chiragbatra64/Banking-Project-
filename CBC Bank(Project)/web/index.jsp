<%-- 
    Document   : index
    Created on : 17-Jul-2020, 3:30:04 PM
    Author     : batra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="style.css"/>
        <script src="https://kit.fontawesome.com/22cf178b07.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Hind:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <style>
            form input[type="password"]{
                font-size: 22px;
                background: #cccccc;
                color: #000000;
                margin-left: 100px;
                width: 330px;
                height:45px;
            }

            .signUp{
                color: #cccccc;
                margin-left: 80px;
                font-size: 25px;
            }

            form input[type="text"]{
                font-size: 22px;
                background: #cccccc;
                color: #000000;
                margin-left: 100px;
                width: 330px;
                height:45px;
                margin-bottom: 30px;
            }

            .box{
                width: 40rem;
                height: 40rem;
                padding: 3rem;
                margin: 1rem auto;
                border: 3px #666666 solid;
                border-radius: 9px;
            }

            .box label{
                font-size: 40px;
                margin-left: 130px;
                padding-top: 10px;
                font-weight: 500;
            }

            .top{
                display: grid;
                grid-template-columns: 30% 70%;
            }

            .Icon{
                font-size: 30px;
            }

            .about{
                margin-top: 130px;
                margin-left: 700px;
            }
        </style>
        <title>Log In</title>
    </head>
    <body style="background: #0A0A0A;">
        <div class="top">
            <img src="BankLogo.png"/>
            <p class="about">
                <i class="fas fa-user-friends Icon"></i>
                <a style="color: #cccccc" class="aboutl" href="about.jsp">ABOUT US</a>
                <i style="margin-left: 40px" class="fas fa-phone-alt Icon"></i>
                <a style="color: #cccccc" class="about1" href="contact.jsp">CONTACT US</a>
            </p>
        </div>
        <%
            if (request.isRequestedSessionIdValid() && session != null) {
                session.invalidate();
            }
            Cookie[] cookies = null;
            cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    cookie.setMaxAge(0);
                    cookie.setValue(null);
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }
            }

        %>

        <div class="box">
            <i class="far fa-user-circle"></i><br>
            <label> Customer Login </label>
            <form action="loginServlet" method="post">
                <input type="text" placeholder="Customer ID" name="customerid"/><br>
                <input type="password" placeholder="Password" name="password"/><br>
                <a class="forgot" href="forgot.jsp">Forgot Password?Click to Reset</a><br>
                <input type="submit" value="LOGIN"/><br>
                <a class="signUp" href="signUp.jsp">Don't have an account.Register here</a><br>
                <a style="color: #cccccc; margin-left: 190px;font-size: 25px;" class="admin" href="admin.jsp">Admin Login</a>
            </form>
        </div>
        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
