<%-- 
    Document   : SignedUp
    Created on : 23-Jul-2020, 3:18:45 PM
    Author     : batra
--%>

<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <title>Sign Up</title>
        <script src="https://kit.fontawesome.com/22cf178b07.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Hind:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <style>
            body{
                font-family: 'Hind', sans-serif;
                background: #0A0A0A;
                color: #cccccc;
            }
            .para{
                font-size: 23px;
            }
            
            table{
                width: 75%;
                border: 1px solid #cccccc;
                margin-top: 10px;
                border-collapse: collapse;
            }
            
            .left{
                text-align: left;
                padding: 0.4rem;
            }
            
            .right{
                text-align: right;
                padding: 0.4rem;
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
            
            .tb{
                margin-top: 20px;
                margin-left: 20px;
                width: 60%;
            }
            td{
                color: #cccccc;
            }
        </style>
    </head>
    <body>
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
        <p class="para">You have been successfully registered.</p>
        <p class="para">Our representative will contact you soon.</p>
        <p class="para">Please keep all your documents ready for verification.</p>
        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>    
    </body>
</html>
