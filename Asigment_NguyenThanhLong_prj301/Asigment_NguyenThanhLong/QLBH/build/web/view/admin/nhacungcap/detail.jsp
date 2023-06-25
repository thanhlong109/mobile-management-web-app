<%-- 
    Document   : detail
    Created on : Mar 1, 2023, 8:09:06 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            h5{
                display: inline-block;
            }
            span{
                padding-left: 12px;
            }
        </style>
    </head>
    <body>
        <%@include file="../common/leftbar.jsp" %>
        
        <div class="container">
            <h3 class="title">
               Nhà Cung Cấp Apple
            </h3>
            <br>
            <h5>Mã: </h5><span>${ncc.mancc}</span><br><br>
            <h5>Địa chỉ: </h5><span>${ncc.diachi}</span><br><br>
            <h5>Trạng thái: </h5><span>${ncc.trangthai?"Đang hợp tác":"Tạm dừng hợp tác"}</span><br>
        </div>
    </body>
</html>
