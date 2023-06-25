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
        <title>Danh muc list</title>
    </head>
    <body>
        <%@include file="../common/leftbar.jsp" %>
        
        <div class="container">
            <div class="title">Bảng quản lí nhà cung cấp</div>
            <div class="add">
                <a href="create"> Thêm Mới <i class="fa-solid fa-plus"></i></a>
            </div>
            <table>
                <tr>
                    <th>
                        Mã Nhà Cung Cấp
                    </th>
                    <th>
                        Tên Nhà Cung Cấp
                    </th>
                    <th>
                        Trạng Thái
                    </th>
                    <th>
                        Action
                    </th>
                </tr>
                <c:forEach items="${list}" var="i">
                    <tr>
                        <td>
                            ${i.mancc}
                        </td>
                        <td>
                             ${i.tenncc}
                        </td>
                        <td>
                            ${i.trangthai?"Đang hợp tác":"Tạm ngừng hợp tác"}
                        </td>
                        <td class="action">
                            <a href="detail?mncc=${i.mancc}"><i class="fa-solid fa-circle-info"></i></a>
                            <a href="edit?mncc=${i.mancc}"><i class="fa-solid fa-pen-to-square"></i></a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
