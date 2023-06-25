<%-- 
    Document   : footer
    Created on : Mar 16, 2023, 10:39:52 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            footer{
                background-color: #333;
                padding: 42px 32px 52px 32px;
                color: rgba(255, 255, 255, 0.9);
                display: grid;
                grid-template-columns: 1fr 2.5fr;
                column-gap: 120px;
                overflow-x: hidden;
                position: relative;
            }
            .f-left .logo{
                font-weight: 800;
                font-size: 20px;
                margin-bottom: 12px;
                color: white;
            }
            .f-left p{
                font-size: 14px;
                line-height: 1.4;
                margin-bottom: 16px;
                text-align: justify;
            }
            .f-left h5{
                margin-bottom: 8px;
                color: white;
            }
            .f-left .social{
                display: grid;
                width: 60%;
                grid-template-columns: 1fr 1fr 1fr 1fr;
                column-gap: 12px;
                color: white;
            }

            .f-left .social .icon{
                background-color: #777;
                text-align: center;
                padding: 4px 0;
            }
            .f-right b{
                font-weight: 600;
            }
            .f-right {
                display: grid;
                grid-template-columns: 1fr 1fr 1fr;
                column-gap: 32px;
            }
            .f-right .f-col h3{
                font-size: 16px;
                margin-bottom: 12px;
                color: white;
            }
            .f-right .f-col p,.f-right .f-col a{
                font-size: 14px;
                line-height: 1.5;
                text-decoration: none;
                color: rgba(255, 255, 255, 0.9);;
                display: block;
            }
            .f-infor{
                position: absolute;
                bottom: 30px;
                font-size: 12px;
                opacity: 0.8;
                left: 50%;
                transform: translateX(-50%);
            }
        </style>
    </head>
    <body>
        <footer>
            <div class="f-left">
                 <div class="logo">
                     Thành Long Mobile
                 </div>
                 <p>
                     Cửa hàng được thành lập với 130 chi nhánh khắp cả nước, đặc biệt 2 chi nhánh lớn ở Hà Nội và Hồ Chí Minh.
                     Trong đó chi Nhánh Hồ chí minh mới được thành lập vào tháng 2 năm 2023, chi nhánh Hà Nội sẽ được mở trong tương lai v:
                     , cửa hành chúng tôi kinh doanh các mặt hàng như điện thoại, máy tính, máy tính bảng và phụ kiện.
                 </p>
                 <h5>Kết nối với chúng tôi</h5>
                 <div class="social">
                     <a class="icon">
                         <i class="fa-brands fa-facebook"></i>
                     </a>
                     <a class="icon">
                         <i class="fa-brands fa-twitter"></i>
                     </a>
                     <a class="icon">
                         <i class="fa-brands fa-telegram"></i>
                     </a>
                     <a class="icon">
                         <i class="fa-brands fa-youtube"></i>
                     </a>
                 </div>
            </div> 
            <div class="f-right">
                 <div class="f-col">
                     <h3>Tổng đài hỗ trợ</h3>
                     <p>Gọi mua hàng <b>1800.2097</b> (7h30 - 22h00)</p>
                     <p>Gọi khiếu nại <b>1800.2063</b> (8h00 - 21h30)</p>
                     <p>Gọi bảo hành <b>1800.2064</b> (8h00 - 21h00)</p>
                 </div>
                 <div class="f-col">
                     <h3>Thông tin và chính sách</h3>
                     <a href="#">Mua hàng và thanh toán Online</a>
                     <a href="#">Mua hàng trả góp Online</a>
                     <a href="#">Tra thông tin đơn hàng</a>
                     <a href="#">Tra thông tin bảo hành</a>
                     <a href="#">Trung tâm bảo hành chính hãng</a>
                     <a href="#">Quy định về việc sao lưu dữ liệu</a>
                     <a href="#">Dịch vụ bảo hành điện thoại</a>
                 </div>
                 <div class="f-col">
                     <h3>Dịch vụ và thông tin khác</h3>
                     <a href="#">Khách hàng doanh nghiệp (B2B)</a>
                     <a href="#">Ưu đãi thanh toán</a>
                     <a href="#">Chính sách Bảo hành</a>
                     <a href="#">Liên hệ hợp tác kinh doanh</a>
                     <a href="#">Tuyển dụng</a>
                 </div>
            </div>
            <div class="f-infor">
                 Copyright @ 2023 All rights reserved | This websit is made by NTLStudio
            </div>
     </footer>
    </body>
</html>
