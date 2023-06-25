<%-- 
    Document   : index
    Created on : Feb 17, 2023, 3:16:06 PM
    Author     : Admin
--%>

<%@page import="model.TaiKhoan"%>
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
            List<List<TaiKhoan>> listtyle = (List<List<TaiKhoan>>) request.getAttribute("listtype");
            
        %>
        <div class="container">
            <div class="title">Bảng quản lí tài khoản </div>
            <div class="add">
                <a style="display:none;"></a>
                <a href="index" class="number-item">Tổng Số User:${total} </a>
                <%
                    for(List<TaiKhoan> listtk : listtyle){

                %>
                    <a href="index?ntk=<%= listtk.get(0).getNhomtk().getNhomtk() %>" class="number-item"><%= listtk.get(0).getNhomtk().getNhomtk() %> : <%= listtk.size() %> </a>
                <%
                    }
                %>
                
            </div>
            <table>
                <tr>
                    <th>
                        User
                    </th>
                    <th>
                        Email
                    </th>
                    <th>
                        Role
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
                            ${i.tentk}
                        </td>
                        <td>
                             ${i.email}
                        </td>
                        <td>
                            ${i.nhomtk.nhomtk}
                        </td>
                        <td>
                            ${i.trangthai?"Hoạt động":"Ngừng hoạt động"}
                        </td>
                        <td class="action">
                            <a href="detail?tk=${i.tentk}"><i class="fa-solid fa-circle-info"></i></a>
                            <a href="edit?tk=${i.tentk}"><i class="fa-solid fa-pen-to-square"></i></a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <p class="err"> ${err}</p>
        </div>
    </body>
</html>
