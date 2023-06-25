<%-- 
    Document   : filter
    Created on : Mar 7, 2023, 11:26:26 AM
    Author     : ACER
--%>

<%@page import="model.SanPham"%>
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
            <%
                List<SanPham> listsp = (List<SanPham>) request.getAttribute("filterlist");
                boolean empty = false;
                if(listsp==null||listsp.size()==0){
                    empty = true;
                }
            %>
            <c:if test="<%= empty %>">
                <h3 class="title">Không tìm thấy sản phẩm phù hợp</h3>
            </c:if>
            <c:if test="<%= !empty%>">
                <h3 class="title">Danh Sách Sản Phẩm</h3>
                <div class="row">
                    <c:forEach items="${filterlist}" var="i">
                        <c:if test="${i.trangthai}">
                            <a href="detail?msp=${i.masp}" style="text-decoration: none;">
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
                            </a>

                        </c:if>   
                    </c:forEach>
                 </div>
            </c:if>
  
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
