<%-- 
    Document   : passwordChanged
    Created on : 07-Aug-2020, 10:25:37 AM
    Author     : batra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/22cf178b07.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Hind:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <title>Password Changed</title>
        <style>
            form input[type="password"]{
                background: #cccccc;
                color: #000000;
                margin-left: 90px;
                width: 330px;
                height:45px;
                margin-bottom: 30px;
            }

            .signUp{
                color: #cccccc;
                margin-left: 80px;
                font-size: 25px;
            }

            form input[type="text"]{
                background: #cccccc;
                color: #000000;
                margin-left: 90px;
                width: 330px;
                height:45px;
                margin-bottom: 30px;
            }

            .box{
                width: 34rem;
                height: 34rem;
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

            body{
                font-family: 'Hind', sans-serif;
                /*    background-image: url(back1.jpg);*/
                background: #0A0A0A;
                color: #cccccc;
            }

            i{
                color: #cccccc;
                font-size: 5rem;
                margin-left: 220px;
            }

            form input[type="email"]{
                background: #cccccc;
                color: #000000;
                margin-left: 100px;
                width: 330px;
                height:45px;
                margin-bottom: 30px;
            }


            .forgot{
                color: #cccccc;
                margin-left: 100px;
            }

            form input[type="submit"]{
                width: 220px;
                height: 40px;
                margin-left: 142px;
                background:  #666666;
                color: #ffffff;
                border-radius: 10px;
                margin-bottom: 50px;
            }

            .admin{

            }

            a{
                text-decoration: none;
                color: #cccccc;
            }

            ::placeholder{
                font-size: 24px;
            }
        </style>
    </head>
    <body style="background: #0A0A0A;">
        <div class="top">
            <img src="BankLogo.png"/>
            <p class="about">
                <i class="fas fa-sign-out-alt Icon"></i>
                <a style="color: #cccccc" href="index.jsp">LOGIN</a>
                <i style="margin-left: 40px" class="fas fa-user-friends Icon"></i>
                <a style="color: #cccccc" class="aboutl" href="about.jsp">ABOUT US</a>
                <i style="margin-left: 40px" class="fas fa-phone-alt Icon"></i>
                <a style="color: #cccccc" class="about1" href="contact.jsp">CONTACT US</a>
            </p>
        </div>
        <div class="content">
            <h1>Password Successfully Changed</h1>
            <h2>Click on <a href="index.jsp">LOGIN</a> to go to login page</h2>
        </div>
        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
