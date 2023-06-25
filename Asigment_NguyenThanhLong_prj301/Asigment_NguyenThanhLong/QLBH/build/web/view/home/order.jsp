<%-- 
    Document   : order
    Created on : Feb 17, 2023, 3:17:12 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .list-cart{
                list-style-type: none;
                margin-top: 16px;
                background-color: #ffffff;
                padding: 16px 0;
                width: fit-content;
            }
            .list-cart a{
                text-decoration: none;
            }
            .list-cart li{
                height: 100px;
                padding: 16px 44px 16px 24px;
                display: flex;
                position: relative;
            }

            .list-cart li:nth-child(even){
                background-color: #eee;
            }
            .list-cart li:hover{
                background-color: #ddd;
            }
            .item-cart{
                display: flex;
            }
            .item-body{
                padding: 12px 24px;
            }
            .item-body h3{
                color: #444;
            }
            .item-body p{
                margin-top: 16px;
                color: #e01020;
            }
            .item-cart .img,.item-cart img,.list-cart a,.item-cart{
                height: 100%;
            }
            .list-cart-action{
                display: flex;
                margin: auto 0;
                padding: 12px;
                position: absolute;
                right: 0px;
            }
            .list-cart-action a{
                color: #888;
                font-size: 18px;
                padding: 8px 16px;
                border-radius: 16px;
                transition: ease-in-out .3s;
            }
            .list-cart-action a:hover{
                color: #ffffff;
                background-color: #888;
            }
            .bill{
                margin-top: 16px;
                margin-left: 16px;
                background-color: #707070;
                height: fit-content;
            }
            .bill-title{
                font-size: 18px;
                padding: 4px 16px;
                color: white;
                font-weight: 600;
            }
            .bill ul{
                padding: 4px 4px;
                list-style-type: none;
                background-color: #707070;
                font-weight: 500;
                height: fit-content;
            }
            .bill li{
                background-color: #ffff;
                padding: 8px 16px;
                
            }
            .bill li:last-child{
                border-top: 2px solid #707070;
                color: #e01020;
                line-height: 32px;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container">
            <h3 class="title">Giỏ hàng</h3>
            <div class="row">
                 <c:if test="${sessionScope.cartList==null || listsize==0}">
                    <p>Bạn chưa mua món hàng nào cả <i class="fa-sharp fa-regular fa-face-frown"></i></p>
                </c:if>
                <c:if test="${sessionScope.cartList!=null && listsize>0}">
                    <ul class="list-cart">
                        <c:forEach var="i" items="${sessionScope.cartList}">
                            <li>
                                <a href="detail?msp=${i.sp.masp}">
                                    <div class="item-cart">
                                        <div class="img">
                                            <img src="../view/img/${i.sp.hinhanh}" alt="">
                                        </div>
                                        <div class="item-body">
                                            <h3>${i.sp.tensp}</h3>
                                            <p class="price">
                                                <fmt:formatNumber value="${i.sp.dongia-(i.sp.dongia*i.sp.khuyenmai)}" pattern="#,##0"/>₫
                                            </p>
                                        </div>
                                    </div>
                                </a>
                                <div class="list-cart-action">
                                    <a href="orderdelete?msp=${i.sp.masp}"><i class="fa-solid fa-trash"></i></a>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                   <div class="bill">
                        <div class="bill-title">
                            Hóa Đơn
                        </div>
                        <ul>
                            <c:forEach var="i" items="${sessionScope.cartList}">
                                <li>
                                    ${i.sp.tensp}-<fmt:formatNumber value="${i.sp.dongia-(i.sp.dongia*i.sp.khuyenmai)}" pattern="#,##0"/>₫ X ${i.amount}
                                </li>
                            </c:forEach>
                                <li>Tổng: <fmt:formatNumber value="<%= cartls.calMoney() %>" pattern="#,##0"/>₫  <a class="btn-1" style="text-decoration: none" href="payment">Thanh Toán</a></li>
                        </ul>

                   </div>
               </c:if>  
            </div>
                 
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
