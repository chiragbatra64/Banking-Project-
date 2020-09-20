<%-- 
    Document   : admin
    Created on : 18-Jul-2020, 3:27:11 PM
    Author     : batra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/22cf178b07.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Hind:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <style>
            body{
                font-family: 'Hind', sans-serif;
                color: #cccccc;
            }

            i{
                color: #cccccc;
                font-size: 5rem;
                margin-left: 200px;
            }

            .de{
                font-size: 40px;
                margin-left: 130px;
                padding-top: 10px;
                font-weight: 500;
            }

            a{
                text-decoration: none;
            }

            .box{
                width: 30rem;
                height: 30rem;
                padding: 3rem;
                margin: 1rem auto;
                border: 3px #666666 solid;
                border-radius: 9px;
            }

            form input[type="text"]{
                background: #cccccc;
                color: #000000;
                margin-left: 80px;
                margin-top: 30px;
                width: 330px;
                height:45px;
                margin-bottom: 30px;
                font-size: 22px;
            }

            form input[type="password"]{
                background: #cccccc;
                color: #000000;
                margin-left: 80px;
                width: 330px;
                height:45px;
                margin-bottom: 30px;
                font-size: 22px;
            }

            form input[type="submit"]{
                width: 220px;
                height: 40px;
                margin-left: 130px;
                background:  #666666;
                color: #ffffff;
                margin-top: 25px;
                border-radius: 10px;
                margin-bottom: 50px;
            }

            .di{
                font-size: 20px;
            }

            ::placeholder{
                font-size: 24px;
            }

            .Icon{
                font-size: 30px;
            }

            .about{
                margin-top: 130px;
                margin-left: 600px;
            }

            .top{
                display: grid;
                grid-template-columns: 30% 70%;
            }
        </style>
        <title>Admin Login</title>
    </head>
    <body style="background: #0A0A0A;">
        <div class="top">
            <img src="BankLogo.png"/>
            <p class="about">
                <i class="fas fa-sign-in-alt Icon"></i>
                <a style="color: #cccccc" href="index.jsp">LOGIN(CUSTOMER)</a>
                <i style="margin-left: 40px"  class="fas fa-user-friends Icon"></i>
                <a style="color: #cccccc" class="aboutl" href="about.jsp">ABOUT US</a>
                <i style="margin-left: 40px" class="fas fa-phone-alt Icon"></i>
                <a style="color: #cccccc" class="about1" href="contact.jsp">CONTACT US</a>
            </p>
        </div>
        <div class="box">
            <i class="fas fa-user-lock"></i><br>
            <label class="de"> Admin Login </label><br>
            <form action="adminServlet" method="post">
                <input type="text" placeholder="Username" name="email"/><br>
                <input type="password" placeholder="Password" name="password"/><br>
                <input type="submit" value="Login"/>
                <center><label class="di">For being an admin,contact existing admins</label></center>
            </form>
        </div>
    </body>
</html>
