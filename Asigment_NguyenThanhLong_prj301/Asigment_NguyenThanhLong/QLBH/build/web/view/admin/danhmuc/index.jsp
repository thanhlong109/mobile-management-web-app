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
            <div class="title">Bảng quản lí danh mục</div>
            <div class="add">
                <a href="create"> Thêm Mới <i class="fa-solid fa-plus"></i></a>
            </div>
            <table>
                <tr>
                    <th>
                        Mã Danh Mục
                    </th>
                    <th>
                        Tên Danh Mục
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
                            ${i.madm}
                        </td>
                        <td>
                             ${i.tendm}
                        </td>
                        <td>
                            ${i.trangthai?"Đang kinh doanh":"Tạm ngừng kinh doanh"}
                        </td>
                        <td class="action">
                            <a href="edit?mdm=${i.madm}"><i class="fa-solid fa-pen-to-square"></i></a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
