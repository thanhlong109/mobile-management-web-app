<%-- 
    Document   : detail
    Created on : Mar 1, 2023, 8:09:06 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
               Chi Tiết Sản Phẩm
            </h3>
            <br>
            <h5>Mã: </h5><span>${sp.masp}</span><br><br>
            <h5>Tên Sản Phẩm: </h5><span>${sp.tensp}</span><br><br>
            <h5>Mô tả: </h5><span>${sp.mota}</span><br><br>
            <h5>Trạng thái: </h5><span>${sp.trangthai?"Đang bán":"Ngừng bán"}</span><br><br>
            <h5>Số lượng: </h5><span>${sp.soluong}</span><br><br>
            <h5>Đơn giá: </h5><span><fmt:formatNumber value="${sp.dongia}" pattern="#,##0"/>₫</span><br><br>
            <h5>Khuyến mại: </h5><span><fmt:formatNumber value="${sp.khuyenmai*100}" pattern="##.##"/>%</span><br><br>
            <h5>Danh mục: </h5><span>${sp.danhmuc.tendm}</span><br><br>
            <h5>Nhà Cung Cấp: </h5><span>${sp.nhacungcap.tenncc}</span><br><br>
            <h5 >Hình Ảnh:</h5>
            <img style="height: 300px;" src="../../view/img/${sp.hinhanh}"/><br>
        </div>
    </body>
</html>
