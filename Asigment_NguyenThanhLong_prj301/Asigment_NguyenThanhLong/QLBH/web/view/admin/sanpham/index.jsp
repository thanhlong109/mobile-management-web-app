<%-- 
    Document   : index
    Created on : Feb 17, 2023, 3:16:06 PM
    Author     : Admin
--%>

<%@page import="model.SanPham"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh muc list</title>
        <style>
            .number-item{
                background-color: #00868B;
                color: white;
                font-weight: 600;
                padding: 12px 24px;
                border-radius: 4px;
                margin-left: 32px;
                text-decoration: none;
                margin-bottom: 20px;
                cursor:pointer;
                transition: ease-in-out .3s;
            }
            .number-item:hover{
                opacity: 0.8;
            }
            .add{
                display: flex;
                flex-wrap: wrap;
            }
        </style>
    </head>
    <body>
        <%@include file="../common/leftbar.jsp" %>
        <%
            List<List<SanPham>> listtyle = (List<List<SanPham>>) request.getAttribute("listtype");
            
        %>
        <div class="container">
            <div class="title">Bảng quản lí sản phẩm</div>
            <div class="add">
                <a href="create"> Thêm Mới <i class="fa-solid fa-plus"></i></a>
                <a href="index" class="number-item">Tổng Số Sản Phẩm: ${total}</a>
                <%
                    for(List<SanPham> listsp : listtyle){

                %>
                    <a href="index?mdm=<%= listsp.get(0).getDanhmuc().getMadm() %>" class="number-item"><%= listsp.get(0).getDanhmuc().getTendm() %> : <%= listsp.size() %> </a>
                <%
                    }
                %>
                
            </div>
            <table>
                <tr>
                    <th>
                        Mã Sản Phẩm
                    </th>
                    <th>
                        Hình Ảnh
                    </th>
                    <th>
                        Tên Sản Phẩm
                    </th>
                    <th>
                        Số Lượng
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
                            ${i.masp}
                        </td>
                        <td>
                            <img style="height: 100px;" src="../../view/img/${i.hinhanh}"/>
                        </td>
                        <td>
                             ${i.tensp}
                        </td>
                        <td>
                            ${i.soluong}
                        </td>
                        <td>
                            ${i.trangthai?"Đang bán":"Ngừng bán"}
                        </td>
                        <td class="action">
                            <a href="detail?msp=${i.masp}"><i class="fa-solid fa-circle-info"></i></a>
                            <a href="edit?msp=${i.masp}"><i class="fa-solid fa-pen-to-square"></i></a>
                            <a href="delete?msp=${i.masp}"><i class="fa-solid fa-trash"></i></a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <p class="err"> ${err}</p>
            <br>
            <div class="pagination">
                <a href="index?page=${page>1?(page-1):1}&mdm=${mdm}">Prev</a>
                <c:forEach begin="${1}" var="i" end="${numpage}">
                    <a href="index?page=${i}&mdm=${mdm}" <c:if test="${i==page}">class="p-active"</c:if> >${i}</a>
                </c:forEach>
                <a href="index?page=${page<numpage?(page+1):numpage}&mdm=${mdm}">Next</a>
            </div>
        </div>
            
    </body>
</html>
