<%-- 
    Document   : contact
    Created on : 23-Jul-2020, 10:06:54 PM
    Author     : batra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/22cf178b07.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Hind:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <title>Contact Us</title>
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
                margin-left: 950px;
                color: #cccccc;
            }
            
            a{
                text-decoration: none;
            }
            
            .content{
                background: #F7F7FA;
                height: 400px;
            }
            
            h1{
                font-size: 65px;
                padding-top: 100px;
                margin-left: 40px;
                color: #0C2074;
            }
            
            .content p{
                font-size: 30px;
                margin-left: 40px;
                margin-right: 720px;
                padding-top: 10px;
            }
            
            .trd{
                width: 80%;
                margin-left: 50px;
                margin-top: 30px;
                font-size: 25px;
            }
            
            .lst{
                text-align: left;
            }
            
            .kst{
                text-align: right;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <img class="logo" src="BankLogo.png"/>
            <p class="about">
                <i class="fas fa-sign-in-alt Icon"></i>
                <a style="color: #cccccc" href="index.jsp">LOGIN</a>
                <i style="margin-left: 40px" class="fas fa-user-friends Icon"></i>
                <a style="color: #cccccc" class="about1" href="about.jsp">ABOUT US</a>
            </p>
        </div>
        <div class="content">
            <h1>Support whenever you need it</h1>
            <p>Help is just one step away: Manage your accounts through our online banking platform,
                contact us by phone or visit your local branch.</p>
        </div>
        <div class="table table-bordered trd">
            <table>
                <tbody>
                    <tr>
                        <td class="lst">Personal Banking</td>
                        <td class="kst">All India : 1860 120 7777</td>
                    </tr>
                    <tr>
                        <td class="lst">Wealth / Private Banking</td>
                        <td class="kst">All India : 1800 103 8181</td>
                    </tr>
                    <tr>
                        <td class="lst">Corporate / Business / Retail Institutional Banking</td>
                        <td class="kst">All India : 1860 120 6699</td>
                    </tr>
                    <tr rowspan="2">
                        <td class="lst">Domestic customers travelling overseas
                            (only available from numbers outside India)</td>
                        <td class="kst">Personal Banking / Wealth / Private Banking +91-40-7140 3333</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td class="kst">Corporate / Business / Retail Institutional Banking +91-22-3344 6699</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
