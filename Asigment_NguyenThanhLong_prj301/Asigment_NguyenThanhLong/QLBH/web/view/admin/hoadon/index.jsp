<%-- 
    Document   : index
    Created on : Feb 17, 2023, 3:16:06 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hoa Đơn list</title>
    </head>
    <body>
        <%@include file="../common/leftbar.jsp" %>
        
        <div class="container">
            <div class="title">Bảng quản lí hóa đơn</div>
            <table>
                <tr>
                    <th>
                        Mã Hóa Đơn
                    </th>
                    <th>
                        Tài khoản Thanh Toán
                    </th>
                    <th>
                        Ngày Thanh Toán
                    </th>
                    <th>
                        Action
                    </th>
                </tr>
                <c:forEach items="${list}" var="i">
                    <tr>
                        <td>
                            ${i.mahd}
                        </td>
                        <td>
                             ${i.taikhoan.tentk}
                        </td>
                        <td>
                            ${i.ngaydh}
                        </td>
                        <td class="action">
                            <a href="detail?mhd=${i.mahd}"><i class="fa-solid fa-circle-info"></i></a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
