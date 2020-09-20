<%-- 
    Document   : signUp
    Created on : 17-Jul-2020, 6:13:07 PM
    Author     : batra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <script src="https://kit.fontawesome.com/22cf178b07.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Hind:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <style>
            body{
                font-family: 'Hind', sans-serif;
                background: #0A0A0A;
                color: #cccccc;
            }

            .box{
                width: 40rem;
                height: 40rem;
                padding: 3rem;
                margin: 1rem auto;
                border: 3px #666666 solid;
                border-radius: 9px;
            }

            .formLabel{
                font-size: 22px;
                margin-top: 25px;
                padding-top: 10px;
                margin-left: 10px;
            }

            ::placeholder{
                font-size: 22px;
            }

            .Icon{
                font-size: 30px;
            }

            a{
                text-decoration: none;
            }

            .about{
                margin-top: 160px;
                margin-left: 900px;
            }

            .top{
                display: grid;
                grid-template-columns: 30% 70%;
            }

            .inp-left{
                margin-left: 300px;
            }

            .inp{
                width: 500px;
                height: 50px;
                background: #cccccc;
                color: #000000;
                margin-bottom: 15px;
                font-size: 22px;
            }

            .inp-area{
                width: 500px;
                margin-left: 0px;
                margin-bottom: 10px;
                background: #cccccc;
                color: #000000;
            }

            .inp-btn{
                background:  #666666;
                color: #ffffff;
                border-radius: 10px;
                margin-left: 775px;
                width: 300px;
                height: 44px;
                margin-top: 15px;
            }
        </style>
        <title>Sign Up</title>
    </head>
    <body>
        <div class="top">
            <img src="BankLogo.png"/>
            <p class="about">
                <i class="fas fa-sign-in-alt Icon"></i>
                <a style="color: #cccccc" href="index.jsp">LOGIN</a>
                <i style="margin-left: 40px" class="fas fa-user-friends Icon"></i>
                <a style="color: #cccccc" class="aboutl" href="about.jsp">ABOUT US</a>
                <i style="margin-left: 40px" class="fas fa-phone-alt Icon"></i>
                <a style="color: #cccccc" class="about1" href="contact.jsp">CONTACT US</a>
            </p>
        </div>
    <center><h1>Registration Form</h1></center>
    <center><h4>Please fill all the details carefully.</h4><br></center>
    <!--            <form action="signupServlet" method="post">
                    <label class="formLabel">Name</label>
                    <input style="margin-left: 300px" type="text" name="name"/><br>
                    <label class="formLabel">Father's Name</label>
                    <input style="margin-left: 220px" type="text" name="fathername"/><br>
                    <label class="formLabel">Email</label>
                    <input style="margin-left: 305px" type="email" name="email"/><br>
                    <label class="formLabel">Phone/Contact</label>
                    <input style="margin-left: 211px" type="text" name="phone"/><br>
                    <label class="formLabel">Gender</label>
                    <input style="margin-left: 280px" type="radio" name="gender" value="M"/>
                    <label style="font-size: 22px">Male</label>
                    <input style="margin-left: 26px" type="radio" name="gender" value="F"/>
                    <label style="font-size: 22px">Female</label><br>
                    <label class="formLabel">Date of Birth</label>
                    <input style="margin-left: 240px" type="date" name="dob"/><br>
                    <label class="formLabel">PAN Number</label>
                    <input style="margin-left: 240px" type="text" name="pan"/><br>
                    <label class="formLabel">AADHAR Number</label>
                    <input style="margin-left: 195px" type="text" name="aadhar"/><br>
                    <label class="formLabel">Address</label>
                    <textarea style="margin-left: 285px" name="address" rows="3"></textarea><br>
                    <label class="formLabel">Password</label>
                    <input style="margin-left: 273px" type="password" name="password1"/><br>
                    <input type="submit" value="Register"/>
                </form>-->
    <form action="signupServlet" method="post">
        <div class="row">
            <div class="col">
                <input class="form-control inp inp-left" type="text" placeholder="Name" name="name"/>
            </div>
            <div class="col">
                <input class="form-control inp" type="text" placeholder="Father's Name" name="fathername"/>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <input class="form-control inp inp-left" type="email" placeholder="E-Mail" name="email"/>
            </div>
            <div class="col">
                <input class="form-control inp" type="text" placeholder="Phone/Contact" name="phone"/>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <input class="form-control inp inp-left" type="text" placeholder="Pan Number" name="pan"/>
            </div>
            <div class="col">
                <input class="form-control inp" type="text" placeholder="Aadhar Number" name="aadhar"/>
            </div>
        </div>
        <div class="row" >
            <div class="col">
                <input class="form-control inp inp-left" type="text" placeholder="Gender(M/F)" name="gender"/>
            </div>
            <div class="col">
                <textarea class="form-control inp-area" placeholder="Address" name="address" rows="2"></textarea>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <!--                -->
                <label style="font-size: 27px;" class="inp-left">Date Of Birth</label>
            </div>
            <div class="col">
                <input class="form-control inp" type="date" placeholder="Date of Birth" name="dob"/>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <input class="form-control inp inp-left" type="password" placeholder="Password" name="password1"/>
            </div>
            <div class="col">
                <input class="form-control inp" type="password" placeholder="Re-Type Password" name="password2"/>
            </div>
        </div>
        <div class="row">
            <centre>
                <input type="submit" value="Submit" class="inp-btn"/>
            </centre>
        </div>
    </form>
    <script src="js/Jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
