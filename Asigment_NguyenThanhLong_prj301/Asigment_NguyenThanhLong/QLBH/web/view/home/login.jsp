<%-- 
    Document   : login
    Created on : Feb 17, 2023, 3:26:40 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <style>
            @import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body{
                font-family: 'Montserrat', sans-serif;
            }
            .main{
                background-color: #f3e0e2;
                width: 100vw;
                height: 100vh;
            }
            .box{
                display: flex;
                position: relative;
                top: 50%;
                left: 50%;
                transform: translate(-50%,-50%);
                width: 700px;
                background: linear-gradient(90deg,#ff464b,#ff416b);
                border-radius: 10px;
                box-shadow: 0 5px 10px rgba(0, 0, 0, 0.375);
            }
            .login-box{
                width: 350px;
                padding: 50px 40px;
                background: rgba(255, 255, 255);
                border-radius: 10px 0 0 10px;
                position: relative;

            }
            .signup-box{
                width: 350px;
                padding: 50px 40px;
                background: rgba(255, 255, 255);
                border-radius: 0 10px 10px 0;
                position: relative;
            }
            .login-box h2,.signup-box h2{
                margin: 0 0 40px;
                padding: 0;
                color: #333;
                text-align: center;
            }
            .login-box .user-box, .signup-box .user-box{
                position: relative;
            }

            .login-box .user-box input,.signup-box .user-box input{
                width: 100%;
                padding: 10px 0;
                font-size: 16px;
                color: #333;
                margin-bottom: 40px;
                border: none;
                border-bottom:  1px solid #333;
                outline: none;
                background: transparent;
            }
            .signup-box .user-box input.input-wrong{
               border-bottom: 1px  solid red;
            }
            .login-box .user-box label,.signup-box .user-box label{
                position: absolute;
                top:0;
                left:0;
                padding: 10px 0;
                font-size: 16px;
                color: #333;
                pointer-events: none;
                transition: .5s; 
            }
             .user-box input:focus ~ label,
            .user-box input:valid ~ label{
                top:-20px;
                left: 0;
                color: #ff416b;
                font-size: 12px;
            }

            .check{
                font-size: 16px;
                color: #333;
                user-select: none;
            }
            .center{
                display: flex;
            }
            form .btn-login{
                margin: 0 auto;
                position: relative;
                display: inline-block;
                padding: 12px 24px;
                color: white;
                background-color: #ff464b;
                font-size: 16px;
                text-decoration: none;
                overflow: hidden;
                transition: .5s;
                margin-top: 60px;
                letter-spacing: 4px;
                border-radius: 24px;
                border: none;
            }
             .btn-login:hover{
                background: #ff416b;
                color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 25px #ff416b;
            }
            .slide-box{
                width: 50%;
                position: absolute;
                left: 0;
                display: flex;
                flex-direction: column;
                height: 100%;
                background: linear-gradient(90deg,#ff464b,#ff416b);
                z-index: 999;
                top:0px;
                border-radius: 10px 0 0 10px;
                transition: ease-in-out .8s;

            }
            .slide-box.right{
                left: 50%;
                right: 0;
                border-radius: 0 10px 10px 0;
            }


            .slide-box h2{
                margin: 40% 20px 20px 20px ;
                font-size: 32px;
                text-align: center;
                color: white;
                font-weight: bold;

            }
            .slide-box p{
                margin: 16px 32px;
                text-align: center;
                color: white;
            }
            .slide-box button{
                margin-top: 50px;
                align-self: center;
                width: fit-content;
                background: transparent;
                color: white;
                border: 0px;
                cursor: pointer;
                font-weight: bold;
                transition: .3s;
                font-size: 14px;
            }
            .slide-box button:hover{
                letter-spacing: 2px;
            }
            .note-signup{
                position: absolute;
                top:60px;
                color: red;
                text-align: center;
            }
            .note-login{
                position: absolute;
                top:240px;
                color: red;
                text-align: center;
            }
        </style>
    </head>
    <body>
        
        <div class="main">
        <div class="box">
            <div class="login-box">
                <h2>LogIn</h2>
                <form action="login" method="POST">
                    <div class="user-box">
                        <input type="text" name="username" required>
                        <label>Username</label>
                    </div>
                    <div class="user-box">
                        <input class="pass" type="password" name="password" required>
                        <label>Password</label>
                        <p class="note-login">${errLogin}</p>
                    </div>
                    <div class="check">
                        <input onchange="show()" type="checkbox" id="passwordShow" class="show">
                        <label for="passwordShow">Show</label>
                        
                    </div>
                    <div class="center">
                        <button class="btn-login" type="submit">
                            Login
                        </button>
                    </div>
                   
                </form>
            </div>
            <div class="signup-box">
                <h2>SignUp</h2>
                <form action="signup" method="POST">
                    <div class="user-box">
                        <input type="text" name="username" required>
                        <label>Username</label>
                    </div>
                    <div class="user-box">
                        <input class="email" type="email" name="email" required>
                        <label>Email</label>
                    </div>
                    <div class="user-box">
                        <input class="pass1" type="password" onchange="checkPass()" name="password" required>
                        <label>Password</label>
                    </div>
                    <div class="user-box">
                        <input class="pass2" type="password" onchange="checkPass()" required>
                        <label>Retype Password</label>
                        <p class="note-signup">${errSignup}</p>
                    </div>

                    <div class="center">
                        <button id="btn2" class="btn-login" type="submit" >
                            Signup
                        </button>     
                    </div>
                   
                </form>
            </div>
            <%
                String type = (String) request.getAttribute("type");
            %>
            <div class="slide-box <%= type.equals("login")?"right":"" %>">
                <div>
                    <h2>
                        Welcome To My Site
                    </h2>
                    <p class="slide-box-p1">
                        Login and have a great shopping experience
                    </p>
                    <p class="slide-box-p2">
                        If you don't have acount before, please touch button below
                    </p>
                   
                </div>
                <button id="change" onclick="change()">
                    Create new Account
                </button>
            </div>
        </div>
    </div>
        <script>
            function show(){
                var pass = document.querySelector(".pass");
                var checkbox = document.getElementById("passwordShow");
                if(checkbox.checked){
                    pass.setAttribute("type","text");

                }else{
                    pass.setAttribute("type","password");
                }

            }
            function checkPass(){
                var button = document.getElementById("btn2");
                var pass1 = document.querySelector(".pass1");
                var pass2 = document.querySelector(".pass2");
                if(pass1.value==pass2.value){
                    pass1.classList.remove("input-wrong");
                    pass2.classList.remove("input-wrong");
                    document.querySelector(".note-signup").innerHTML="";
                    btn2.disabled = false;
                }else{
                    pass1.classList.add("input-wrong");
                    pass2.classList.add("input-wrong");
                    document.querySelector(".note-signup").innerHTML="passwords don't match!";
                    btn2.disabled = true;
                }

            }

            function change(){
                var changebtn = document.getElementById("change");
                var slidebox = document.querySelector(".slide-box");
                var slideboxp1 = document.querySelector(".slide-box-p1");
                var slideboxp2 = document.querySelector(".slide-box-p2"); 
                let data = changebtn.innerHTML;
                if(slidebox.classList.contains("right")){

                    slideboxp1.innerHTML="Fill in the information so that we can contact you";
                    slideboxp2.innerHTML="If you already have an account, click blow button to login";
                    changebtn.innerHTML="Go to login";
                    slidebox.classList.remove("right");
                }else{
                    slideboxp1.innerHTML="Login and have a great shopping experience";
                    slideboxp2.innerHTML="If you don't have acount before, please touch button below";
                    changebtn.innerHTML="Create new Account";
                    slidebox.classList.add("right");
                }
            }
    </script>
    </body>
</html>
