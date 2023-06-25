<%-- 
    Document   : details
    Created on : Feb 17, 2023, 3:15:48 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail</title>
        <style>
            .intro{
                margin-top: 24px;
                background-color: #ffffff;
                padding: 50px 30px; 
                display: flex;
                width: 60%;
                box-shadow: 0 0 5px #333;
            }
            .intro .img{
                height: 200px;
                border-right: 2px solid #888;
            }
            .intro img{
                height: 100%;
            }
            .intro-body{
                padding-left: 24px;
                display: flex;
                flex-direction: column;
                position: relative;
            }
            .intro-body h4{
                margin-bottom: 24px;
                font-size: 20px;
            }
            .intro-body p{
                text-align: justify;

            }
            .buy{
                position: absolute;
                align-self: center;
                bottom: 0;
                
            }
            .buy input{
                border-radius: 4px;
                width: 100px;
                margin-bottom: 12px;
                
            }
            .btn-3{
                
                color: white;
                background-color: #ff416b;
                padding: 12px 24px;
                display: inline-block;
                
                border-radius: 24px;
                transition: ease-in-out .3s;
                text-decoration: none;
                font-weight: 600;
                font-size: 13px;
                border: none;
            }
            .btn-3:hover{
                background-color: #e01020;
                
            }
            .km ul{
                list-style-type: none;
                border: 1px solid #888;
                padding: 24px 0px;
            }
            .km{
                padding: 30px;
                margin-left: 32px;;
            }
            .km h4{
                background-color: #888;
                padding: 12px 24px;
                border-radius: 4px 4px 0 0 ;
                font-size: 18px;
                color: white;
            }
            .km li{
                padding: 0 24px;
                line-height: 18px;
                margin-bottom: 24px;
            }
            .km li:hover{
                color: #ff416b;
                cursor: pointer;

            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container">
            
            <h3 class="title">Chi Tiết Sản Phẩm</h3>
            <div class="row">
                <div class="intro">
                    <div class="img">
                        <img src="../view/img/${sp.hinhanh}" alt="">
                    </div>
                    <div class="intro-body">
                        <div >
                            <h4>
                                ${sp.tensp}
                            </h4>
                            <p>
                                ${sp.mota}
                            </p>
                        </div>
                            <form class="buy" action="order" method="post">
                                <br>
                                <label>Số Lượng:</label><input type="number" value="1" name="sl" min="1" max="${sp.soluong}"/><br>
                                
                                <button class="btn-3">Thêm vào giỏ hàng <i class="fa-sharp fa-solid fa-cart-plus"></i></button>
                                <input style="opacity: 0;" name ="msp" type="text" value="${sp.masp}"/><br>
                            </form>
                        
                    </div>
                </div>
                <div class="km">
                    <h4>Ưu đãi thêm</h4>
                    <ul>
                        <li>Giảm thêm tới 1% cho thành viên Smember (áp dụng tùy sản phẩm)</li>
                        <li>Bảo vệ sản phẩm toàn diện với dịch vụ bảo hành mở rộng</li>
                        <li>Giảm thêm 5% tối đa 500.000đ khi thanh toán qua Kredivo</li>
                        <li>Giảm thêm 600.000đ qua thẻ tín dụng JCB cho đơn hàng từ 10.000.000đ</li>
                        <li> Giảm thêm 4% (tối đa 250.000đ) qua ví Moca cho đơn hàng từ 500.000đ</li>
                        <li> Giảm thêm tới 300k cho đơn hàng từ 5 triệu khi thanh toán qua VNPAY</li>
                        <li>Thu cũ đổi mới: Giá thu cao - Thủ tục nhanh chóng - Trợ giá tốt nhất</li>
                    </ul>
                </div>
            </div>
        </div>
       
        <%@include file="footer.jsp" %>
    </body>
</html>
