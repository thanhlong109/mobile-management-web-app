<%-- 
    Document   : search
    Created on : Feb 17, 2023, 3:17:56 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container">
            <c:if test="${msg==null}">
                <h3 class="title">Kết Quả:</h3>
            </c:if>
            <h3 class="title">${msg}</h3>
            <div class="row">
                <c:forEach items="${requestScope.dssp}" var="i">
                    <div class="item">
                        <c:if test="${i.khuyenmai>0}">
                            <div class="sale">giảm <fmt:formatNumber value="${i.khuyenmai*100}" pattern="##.##"/>%</div>
                        </c:if>

                        <div class="img">
                            <img src="../view/img/${i.hinhanh}" alt="">
                        </div>
                        <h3>${i.tensp}</h3>

                        <div class="price">
                            <c:if test="${i.khuyenmai>0}">
                                <div class="real-p"><fmt:formatNumber value="${i.dongia-(i.dongia*i.khuyenmai)}" pattern="#,##0"/>₫</div>
                                <div class="origin-p"><fmt:formatNumber value="${i.dongia}" pattern="#,##0"/>₫</div>
                            </c:if>
                            <c:if test="${i.khuyenmai==0}">
                                <div class="real-p"><fmt:formatNumber value="${i.dongia}" pattern="#,##0"/>₫</div>
                            </c:if>
                        </div>
                    </div>     
                </c:forEach>
            </div>
            <%@include file="footer.jsp" %>
    </body>
</html>
