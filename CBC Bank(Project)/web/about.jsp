<%-- 
    Document   : about
    Created on : 23-Jul-2020, 4:14:27 PM
    Author     : batra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/22cf178b07.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Hind:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <title>About CBC Bank</title>
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
            .conference{
                width: 100%;
                height: 700px;
            }

            .content1{
                background: #EEF7FB;
                height: 600px;
                margin-top: 100px;
            }

            .our{
                color: #0C2074;
                padding-top: 150px;
                font-size: 45px;
            }

            .company{
                padding-top: 50px;
                font-size: 30px;
                margin-left: 100px;
                margin-right: 100px;
            }

            .arrow1{
                font-size: 90px;
            }

            .content2{
                height: 600px;
                display: grid;
                grid-template-columns: 30% 70%;
            }

            .content2-left{
                display: grid;
                margin-top: 150px;
            }

            .content2-right{
                display: grid;
            }

            .history{
                font-size: 30px;
                padding-top: 0;
            }

            .our1{
                color: #0C2074;
                font-size: 45px;
                padding-top: 100px;
            }

            .content3{
                background: #EEF7FB;
                height: 600px;
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
        </style>
    </head>
    <body>
        <div class="header">
            <img class="logo" src="BankLogo.png"/>
            <p class="about">
                <i class="fas fa-sign-in-alt Icon"></i>
                <a style="color: #cccccc" href="index.jsp">LOGIN</a>
                <i style="margin-left: 40px" class="fas fa-phone-alt Icon"></i>
                <a style="color: #cccccc" class="about1" href="contact.jsp">CONTACT US</a>
            </p>
        </div>
        <img src="Conference3.jpg" class="conference"/>
    <center>
        <i class="fas fa-arrow-down arrow1"></i>
    </center>
    <div class="content1">
        <center>
            <h1 class="our">Our Company</h1>
            <p class="company">Our relationships are built on trust that we build every day through every interaction. 
                Our employees are empowered to do the right thing to ensure they share our customers’ vision for success.
                We work as a partner to provide financial products and services that make banking safe, simple and convenient.
                We’re here to help navigate important milestones and strengthen futures together.</p>
        </center>
    </div>
    <div class="content2">
        <img class="content2-left" src="BankLogo1.png"/>
        <div class="content2-right">
            <h1 class="our1">Our History</h1>
            <p class="history">Our history dates back to 1993 when First National Bank of Punjab opened for business. 
                As regional banks proliferated across the country in the years that followed, 
                a number of other predecessors were born. After a series of mergers at the turn of the 21st century, 
                we formally took on the CBC Bank name and established our headquarters in Chandigarh. 
                Today, CBC Bank is the fifth-largest bank in the country,
                with more than 70,000 employees and $495 billion in assets as of December 31, 2019.</p>
        </div>
    </div>
    <div class="content3">
        <center>
            <h1 class="our">Our Businesses</h1>
            <p class="company">Our diverse business mix is fundamental in delivering a consistent, predictable and repeatable 
                financial performance year after year. Our core businesses include Consumer & Business Banking, 
                Corporate & Commercial Banking, Payment Services and Wealth Management & Investment Services. 
                Through our “One U.S. Bank” philosophy, we are able to bring the power of the whole bank to every 
                customer, every single day.</p>
        </center>
    </div>
</body>
</html>
