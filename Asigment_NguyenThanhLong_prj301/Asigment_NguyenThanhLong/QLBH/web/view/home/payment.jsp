<%-- 
    Document   : payment
    Created on : Feb 17, 2023, 3:17:27 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .payment{
                display: flex;
                margin-top: 32px;
                box-shadow: 0 0 10px #6c6d6e;
                width: 1100px;
                margin: auto;
            }
            .payment .payment-del{
                padding-top: 24px;
                background-color: #263238;
                color: white;
                display: flex;
                flex-direction: column;
            }
            .payment-del > h5{
                margin: 0 24px;
                font-size: 16px;
                text-transform: uppercase;
                border-bottom: 1px solid white;
            }
            .payment-del ul{
                margin: 16px 24px;
                list-style-type: none;
                flex: 1;
            }
            .payment-del li{
                line-height: 2;
            }
            .payment-del .sum{
                padding: 24px 24px;
                background-color: #f44336;
            }
            .payment-del .sum p{
                font-size: 12px;
            }
            .payment form {
                padding: 24px;
                background-color: white;
                flex:1;
            }
            .payment form .method{
                height: 40px;
                display: flex;
                margin: 16px 16px;
            }
            .payment form > h5{
                font-size: 16px;
                text-transform: uppercase;
                color: #f44336;
            }
            .payment form .method div{
                margin: 0 16px;
                padding: 8px 12px;
                border:  1px solid #444;
            }
            .payment form .method img{
                height: 100%;

            }
            .flex{
                display: flex;
            }
            .payment .input-box{
                display: flex;
                flex-direction: column;
            }
            .payment .input-box{
                padding: 16px 0 4px 0;
            }
            .payment .input-box label{
                font-weight: 700;
                font-size: 14px;
                color: #444;
                margin-bottom: 4px;
            }
            .payment input{
                padding: 6px 8px;
            }
            .payment button{
                padding: 12px 24px;
                color: white;
                text-transform: uppercase;
                background-color: #17a2b8;
                border: none;
                margin-top: 16px;
                cursor: pointer;
                transition: ease-in-out .3s;
                font-weight: 600;
            }
            .payment button:hover{
                letter-spacing: 2px;
            }
            .payment-result{
                width: 400px;
                box-shadow: 0 0 5px black;
                border-radius: 4px;
                padding: 74px 32px 24px;
                text-align: center;
                position: relative;
                background-color: white;
                margin: 64px auto 0px;
            }
            .payment-result .icon{
                position: absolute;
                top: -50px;
                left: 50%;
                transform: translateX(-50%);
                font-size: 42px;
                color: white;

                padding: 24px 26px;
                border-radius: 50%;

            }

            .payment-result h3{
                margin-bottom: 12px;
                font-weight: 800;
            }
            .payment-result p{
                line-height: 1.5;
            }
            .payment-result a{
                padding: 12px 24px;
                margin-top: 32px;
                text-decoration: none;
                display: inline-block;
                color: white;
                border-radius:  4px;
                font-weight: 600;
                cursor: pointer;
                transition: ease-in-out .3s;
            }

            .payment-result a:hover{
                opacity: 0.7;
            }
            .payment-result.success .icon,.payment-result.success a{
                background-color: #04AA6D;
            }
            .payment-result.success h3{
                color: #04AA6D;
            }
            .payment-result.failed .icon,.payment-result.failed a{
                background-color: #e53f53;
            }
            .payment-result.failed h3{
                color: #e53f53;
            }

        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
         <div class="container">
             
             <c:if test="${paymentResult!=null}">
                 <c:if test="${paymentResult}">
                     <div class="payment-result success">
                        <div class="icon">
                            <i class="fa-solid fa-check"></i>
                        </div>
                        <h3>
                            Thanh Toán Thành Công!
                        </h3>
                        <p>
                            Đơn hàng của bạn đã được thanh toán thành công, đơn hàng sẽ được giao trong vòng vài ngày!
                        </p>
                        <a href="index">Tiếp tục mua sắm</a>
                    </div>
                 </c:if>
                 <c:if test="${!paymentResult}">
                     <div class="payment-result failed">
                        <div class="icon">
                            <i class="fa-solid fa-check"></i>
                        </div>
                        <h3>
                            Thanh Toán Thất bại!
                        </h3>
                        <p>
                            Có vẻ như đã quá thời gian thanh toán, hoặc giỏ hàng của bạn không có gì cả!
                        </p>
                        <a href="index">Mua sắm lại</a>
                    </div>
                 </c:if>
                 
             </c:if>
             <c:if test="${paymentResult==null}">
                <c:if test="${sessionScope.cartList==null || listsize==0}">
                   <p>Bạn chưa mua món hàng nào cả <i class="fa-sharp fa-regular fa-face-frown"></i></p>
               </c:if>
               <c:if test="${sessionScope.cartList!=null && listsize>0}">
                    <div class="payment">
                        <div class="payment-del">
                            <h5>Chi tiết hóa đơn</h5>
                            <ul>
                                <c:forEach var="i" items="${sessionScope.cartList}">
                                    <li>
                                        ${i.sp.tensp}-<fmt:formatNumber value="${i.sp.dongia-(i.sp.dongia*i.sp.khuyenmai)}" pattern="#,##0"/>₫ X ${i.amount}
                                    </li>
                                </c:forEach>
                            </ul>
                            <div class="sum">
                                <h5>Tổng:</h5>
                                <h3><fmt:formatNumber value="<%= cartls.calMoney() %>" pattern="#,##0"/>₫</h3>
                                <p>Đã bao gồm phí vận chuyển và thuế vat</p>
                            </div>
                        </div> 
                                <form action="payment" method="POST">
                            <h5>Phương thức thanh toán</h5>
                            <div class="method">
                                <div>
                                    <img src="../view/img/logo/visa-and-mastercard-logo-26.png" alt="">
                                </div>
                                <div>
                                    <img src="../view/img/logo/1200px-PayPal_logo.svg.png" alt="">
                                </div>
                            </div>
                            <div class="input-box">
                                <label>Tên Trên Thẻ:</label><input required type="text" placeholder="Nguyen Thanh Long" name="name">
                            </div>
                            <div class="flex">
                                <div class="input-box" style="flex:1">
                                <label>Số Thẻ:</label><input type="number" required placeholder="0000 0000 0000 0000" name="card">
                                </div>
                                <div class="input-box"  style="margin-left: 16px;">
                                    <label>CVV:</label><input type="number" required placeholder="* * *" length="3" name="svv">
                                </div>
                            </div>

                            <div class="input-box">
                                <label>Địa Chỉ:</label><input required placeholder="Thu Duc" type="text" name="address">
                            </div>
                            <button type="submit">Thanh Toán <i class="fa-solid fa-arrow-right"></i></button>
                        </form>  
                    </div>
                </c:if>
             </c:if>
        </div> 
         <%@include file="footer.jsp" %>
    </body>
</html>
