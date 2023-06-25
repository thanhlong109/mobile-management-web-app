<%-- 
    Document   : detail
    Created on : Mar 1, 2023, 8:09:06 PM
    Author     : ACER
--%>

<%@page import="model.ChiTietHoaDon"%>
<%@page import="dao.ChiTietHoaDonDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.HoaDon"%>
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
               Chi Tiết Hóa Đơn
            </h3>
            <br>
            <h5>Mã Hóa Đơn: </h5><span>${hd.mahd}</span><br><br>
            <h5>Ngày Thanh Toán: </h5><span><fmt:formatDate pattern="dd/MM/YYYY" value="${hd.ngaydh}"/></span><br><br>
            <h5>Trạng thái: </h5><span>${hd.trangthaixuly==1?"Thành Công":"Thất bại"}</span><br><br>
            <h5>Sản phẩm: </h5><br><br>
            <table>
                <tr>
                    <th>
                        Sản phẩm
                    </th>
                    <th>
                         Giá 
                    </th>
                    <th>
                        Khuyến mại
                    </th>
                    <th>
                        Số lượng
                    </th>
                    <th>
                        Giá Trị
                    </th>
                </tr>
                <c:set var="total" value="${0}"/>
                <c:forEach var="i" items="${dscthd}" >
                    <tr>
                        <td>
                            ${i.sanpham.tensp}
                        </td>
                        <td><fmt:formatNumber value="${i.dongia}" pattern="#,##0"/>₫</td>
                        <td><fmt:formatNumber value="${i.khuyenmai*100}" pattern="##.##"/>%</td>
                        <td>${i.soluong}</td>
                        <td><fmt:formatNumber value="${i.giatri}" pattern="#,##0"/>₫</td>
                    </tr>
                    <c:set var="total" value="${total+i.giatri}"/>
                </c:forEach>
                    <tr>
                        <td>Tổng: </td><td></td><td></td><td></td><td><fmt:formatNumber value="${total}" pattern="#,##0"/>₫</td>
                    </tr>
            </table>
                    <br>
            
        </div>
    </body>
</html>
