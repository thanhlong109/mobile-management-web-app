<%-- 
    Document   : leftbar
    Created on : Mar 1, 2023, 12:44:31 PM
    Author     : ACER
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>side bar</title>
         <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" rel="stylesheet">
        <style>
            @import url('https://fonts.googleapis.com/css?family=Montserrat:400,500,600,800');

            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body{
                font-family: 'Montserrat',sans-serif;
                display: flex;
                min-height: 100vh;
            }
            .container{
                padding: 25px 70px 25px 250px;
            }

            table{
                border-collapse: collapse;
            }
            th,td{
                border: 1px solid #eeee;
                padding: 12px 24px;
                transition: .3s;
            }
            tr{
                transition: .3s;
            }
            tr:nth-child(odd){
                background-color: #eeee;
            }
            th{
                background-color: #04AA6D;
                color: white;
            }

            tr:hover{
                background-color: #dddd;
            }
            td select{
                border: white 1px solid;
                padding: 4px;
                outline: none;
            }

            .action{
                padding: 6px 12px;
            }
            .action a{
                font-size: 16px;
                text-decoration: none;
                color: #04AA6D;
                transition: .3s;
                border-radius: 4px;
                position: relative;
                display: inline-block;
                width: 50px;
                height: 40px;
            }
            .action a:hover{
                background-color: #04AA6D;
                color: white;
                font-size: 22px;
            }
            .action i{
                position: absolute;
                top:50%;
                left:50%;
                transform: translate(-50%,-50%);
            }
            .action i+.action i{
                margin-left: 12px;
            }
            .add a:first-child{
                padding: 12px 24px;
                margin-bottom: 20px;
                text-decoration: none;
                display: inline-block;
                color: #333;
                transition: ease-in-out .3s;
                border: 1px solid #888;
            }
            .add a:first-child:hover{
                background-color: #888;
                color: white;
                border-radius: 24px;
            }
            .title{
                padding: 4px 0;
                margin-bottom: 50px;
                font-size: 28px;
                display: inline-block;
                border-bottom: 3px solid #888;
                font-weight: 600;
                color: #444;
                padding: 12px 24px;
            }
            .left{
                background-color: #888;
                padding: 20px 0px;
                position: fixed;
                width: 200px;
                top:0;
                left: 0;
                bottom:0;
            }
            .left h3{
                text-align: center;
            }
            .left h3 a{
                text-align: center;
                color: #888;
                padding: 8px 10px;
                display: inline-block;
                border-radius: 24px;
                background-color: white;
                margin: 12px;
            }
            .left .option a{
                padding: 20px 12px;
                display: block;
                text-decoration: none;
                font-weight: 800;
                color: white;
                transition: ease-in-out .3s;
                border: 1px solid #888;
            }

            .left .option{
                position: relative;

            }
            .left .option:hover a,.left .option.select a{
                background-color: white;
                color: #888;
                letter-spacing: 2px;
                margin-left: 12px;
            }
            form label{
                padding: 12px 24px;
                display: inline-block
            }
            form input{
                padding: 4px 8px;
                border-radius: 4px;
            }
            form select{
                padding: 4px 8px;
                border-radius: 4px;
            }
            form button{
                padding: 8px 24px;
                border-radius: 24px;
                border: 1px solid #888;
                margin: 24px auto;
                display: flex;
                background-color: white;
                font-size: 14px;
                font-weight: 500;
                transition: ease-in-out .3s;
                
            }
            form button:hover{
                background-color: #888;
                color: white;
            }
            .err{
                color: #ff416b;
                margin-left: 24px;
            }
            textarea{
                width: 500px;
                height: 100px;
                border-radius: 4px;
                border: 2px solid #444;
                padding: 8px;
            }
            
            .pagination{
                padding: 6px 24px;
                background-color: #21b2ab;
                display: flex;
                border-radius: 24px;
                max-width: fit-content;
                margin: 12px auto;
            }
            .pagination a{
                min-width: 36px;
                min-height: 36px;
                color: white;
                text-decoration: none;
                text-align: center;
                line-height: 36px;
                border-radius: 24px;
                font-weight: 500;
                transition: ease-in-out .3s;
                margin: 0 12px;
            }
            .pagination a:first-child, .pagination a:last-child{
                width: auto;
                height: auto;
                border-radius: 4px;
                padding: 0 12px;
            }
            .pagination a:hover, .pagination .p-active{
                background-color: white;
                color: #21b2ab;
            }
        </style>
    </head>
    <body>
        <div class="left">
            <h3><a href="../../home/index"><i class="fa-solid fa-house"></i></a></h3>
             <div class="option ${type.equals("tq")?"select":""}">
                <a href="../tongquan/index">Tổng Quan</a>
            </div>
            <div class="option ${type.equals("dm")?"select":""}">
                <a href="../danhmuc/index">Danh mục</a>
            </div>
            <div class="option ${type.equals("ncc")?"select":""}">
                <a href="../nhacungcap/index">Nhà Cung Cấp</a>
            </div>
            <div class="option ${type.equals("sp")?"select":""}">
                <a href="../sanpham/index">Sản Phẩm</a>
            </div>
            <div class="option ${type.equals("tk")?"select":""}">
                <a href="../taikhoan/index">Tài Khoản</a>
            </div>
            <div class="option ${type.equals("hd")?"select":""}">
                <a href="../hoadon/index">Hóa Đơn</a>
            </div>
        </div>
    </body>
</html>
