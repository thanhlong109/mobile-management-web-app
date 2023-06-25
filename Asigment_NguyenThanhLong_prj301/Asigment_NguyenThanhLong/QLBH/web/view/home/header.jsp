<%-- 
    Document   : header
    Created on : Feb 25, 2023, 10:52:58 PM
    Author     : ACER
--%>

<%@page import="model.CartList"%>
<%@page import="model.DanhMuc"%>
<%@page import="dao.DanhMucDAO"%>
<%@page import="dao.NhaCungCapDAO"%>
<%@page import="model.NhaCungCap"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            @import url('https://fonts.googleapis.com/css?family=Montserrat:400,500,600,800');

            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body{
                width: 100vw;
                background-color: #f3e0e2;
                font-family: 'Montserrat', sans-serif;
                overflow-x: hidden;
            }
            header{
                display: flex;
                height: 80px;
                background-color: white;
                padding: 0px 80px;
                border-bottom: 5px solid #ff416b;
                align-items: center;
                justify-content: space-between;
                position: fixed;
                top:0;
                left: 0;
                right:0;
                z-index: 99;
            }
            header .logo a{
                cursor: pointer;
                color: #333;
                transition: .7s;
            }
            header .logo a:hover{
                color: #ff416b;
            }
            .header-mid{
                display: flex;
                flex: 1;
                justify-content: space-around;
                align-items: center;
                padding: 0 12px;
            }
            .search input{
                padding: 8px 8px;
                width: 250px;
                border-radius: 24px;
                outline: none;
                border: 1px solid #333;
                transition: 0.3s;
            }
            .search input:hover,.search input:focus{
                width: 300px;
            }
            .search button{
                border: none;
                background: white;
                font-size: 16px;
                padding: 8px 10px;
                border-radius: 50%;
                color: #ff416b;
                transition: .3s;
            }
            .search button:hover{
                background: #ff416b;
                color: white;
            }
            .header-right{
                width: 350px;
            }
            .user{
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .user .a{
                transition: .3s;
            }
            .user .user-avata{
                display: flex;
                
                align-items: center;
            }
            .user h5{
                font-size: 14px;
                font-weight: 600;
                margin-right: 12px;
            }
            .btn-1{
                color: white;
                background-color: #ff416b;
                padding: 8px 16px;
                border-radius: 4px;
                transition: .3s;
                font-weight: 600;
                font-size: 14px;
            }
            .btn-1:hover{
                background-color: #e01020;
                color: white;
            }
            header a{
                text-decoration: none;
                color: #333;
            }
            .nav{
                display: flex;
            }
            .nav-show:hover{
                color: #ff416b;
                cursor: pointer;
            }
            .nav .nav-show{
                margin-left: 14px;
                position: relative;

            }
            .nav .sub-nav a{
                text-decoration: none;
                color: white;
                transition: .3s;

            }
            .nav .sub-nav li:hover a{
                color: #ff416b;
                letter-spacing: 2px;
            }
            .nav .nav-show:hover .sub-nav{
                display: block;
            }
            .nav .nav-show:hover .sub-nav::before,.subcart::before{
                content: "";
                display: block;
                position: absolute;
                height: 35px;
                width: 100%;
                top: -30px;
            }
            .nav .sub-nav{
                display: none;
                position: absolute;
                list-style-type: none;
                left: 0;
                top:40px;
                background-color: #333;
                color: white;
                width: 200px;
                border-top: 2px solid #ff416b;
                box-shadow: 0 0 5px #333;
            }
            .nav li{
                padding-left: 18px;
                line-height: 2.5;
                width: 100%;
                transition: ease-in-out .3s;
                letter-spacing: 0;
            }
            .nav li:hover{
                background-color: white;
            }
            .cart:hover::before{
                content: "";
                display: block;
                position: absolute;
                height: 35px;
                width: 350px;
                top: 20px;
                left: -60%;

            }
            .container{
                margin: 0 auto;
                padding: 150px 30px 50px 70px;
                background-color: #f5f2f2;
                min-height: 100vh;
            }
            .title{
                color: #ff416b;
                border-left: 5px solid #ff416b;
                padding-left: 16px;
            }
            .row{
                border-bottom: 3px solid #ff416b;
                padding: 32px 0;
                display: flex;
                flex-wrap: wrap;
                margin: 0 -15px;
                margin-bottom: 42px;
            }
            .item{
                width: 250px;
                background-color: white;
                position: relative;
                padding: 40px 20px;
                border-radius: 8px;
                box-shadow: 0 3px 5px rgba(0, 0, 0, 0.299);
                transition: ease-in-out .3s;
                margin: 15px 15px;
                
            }
            
            .item .sale{
                position: absolute;
                top: 5px;
                background-color: #e01020;
                color: white;
                width: fit-content;
                left: -2px;
                font-weight: bold;
                font-size: 14px;
                padding: 4px 16px 4px 8px;
                border-radius: 8px 24px 24px 0px;
                box-shadow: 0 2px 2px #33333356;
            }
            .item .img{
                width: 100%;
                margin-bottom: 8px;
                padding: 28px 0 8px 0;
                text-align: center;
                height: 200px;
                position: relative;
            }
            .item img{
                width: 80%;
                position: absolute;
                left: 50%;
                transform: translateX(-50%);
                top:20px;
                transition: ease-in-out .3s;
            }
            .item:hover img{
                top:5px;
            }
            .item:hover h3{
                color: #ff416b;
            }
            .item h3{
                text-align: center;
                font-size: medium;
                height: 38px;
                margin-bottom: 16px;
                color: #444;
                transition: ease-in-out .3s;
            }
            .item:hover{
                box-shadow: 0 3px 5px #ff416a43;
            }
            .item .price{
                display: flex;
                font-size: 15px;
                font-weight: 600;
            }
            .real-p{
                margin-right: 8px;
                color: #e01020;
            }
            .origin-p{
                text-decoration: line-through;
                color: #707070;
            }
            /*cart*/
            .cart{
                position: relative;

            }
            .cart:hover{
                color: #ff416b;
            }
            .cart:hover .subcart{
                display: block;
            }

            .subcart{
                background-color: white;
                position: absolute;
                width: 400px;
                right: 0;
                top: 50px;
                transform: translateX(40%);
                flex-direction: column;
                box-shadow: 0 0 5px #888;
                padding: 16px 0;
                display: none;
                transition: ease-in-out .3s;
                
                
            }
            .subcart ul{
                max-height: 300px;
                overflow-y: scroll;
                border-bottom: 2px solid #ff416b;
            }
            .subcart img{
                height: 100%;
            }
            .subcart li{
                display: flex;
                height: 60px;
                padding: 8px 4px 8px 16px;
               
            }
            .subcart li:hover{
                background-color: #eee;
            }
            .subcart .item-img{
                height: 100%;
                
            }
            .cart-body{
                padding: 0 16px;
            }
            .cart-body h4,.cart-body span{
                font-size: 14px;
                color: #444;
            }
            .cart-body p{
                font-size: 14px;
                color: #ff416b;
            }
            .cart .sl{
                background-color: #ff416b;
                padding: 2px 6px;
                color: white;
                border-radius: 16px;
            }
            .not-buy{
                text-align: center;
                margin-bottom: 24px;
            }
            .thanhtoan{
                display: flex;
                padding: 12px 12px 6px 12px;
                margin: auto;
                align-items: center;
            }
            .thanhtoan div{
                padding: 0 12px;
                text-align: center;
                display: flex;
            }
            .thanhtoan div:first-child h4{
                color: #e01020;
                margin-right: 16px;
            }
            .thanhtoan div:first-child span{
                color: #e01020;
            }
            

            
        </style>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" rel="stylesheet">
        
    </head>
    <body>
        <%
            HttpSession ss = request.getSession();
            if(ss.getAttribute("dshang")==null){
                NhaCungCapDAO nccd = new NhaCungCapDAO();
                List<NhaCungCap> dshang = nccd.read();
                ss.setAttribute("dshang", dshang);
            }
            if(ss.getAttribute("dsdm")==null){
                DanhMucDAO dmd = new DanhMucDAO();
                List<DanhMuc> dm = dmd.read();
                ss.setAttribute("dsdm", dm);
            }
            CartList cartls = (CartList) ss.getAttribute("cartList");
            int size=0;
            if(cartls!=null){
                size = cartls.size();
            }
           
        %>
        <header id="header" >
        <div class="logo">
            <h3><a href="index">Thành Long Mobile</a></h3>
        </div>
        <div class="header-mid">
            <div class="nav">
                <div class="nav-show">
                    Theo Hãng<i class="fa-solid fa-chevron-down"></i>
                    <ul class="sub-nav">
                        <c:forEach var="i" items="${sessionScope.dshang}">
                            <li><a href="filter?mncc=${i.mancc}">${i.tenncc}</a></li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="nav-show">
                    Theo Giá<i class="fa-solid fa-chevron-down"></i>
                    <ul class="sub-nav">
                        <li><a href="filter?lgia=5000000">Dưới 5 triệu</a></li>
                        <li><a href="filter?ggia=5000000&lgia=10000000">Từ 5 - 10 triệu</a></li>
                        <li><a href="filter?ggia=1000000&lgia=15000000">Từ 10 - 15 triệu</a></li>
                        <li><a href="filter?ggia=1500000&lgia=20000000">Từ 15 - 20 triệu</a></li>
                        <li><a href="filter?ggia=20000000">Trên 20 triệu</a></li>
                    </ul>
                </div>
                <div class="nav-show">
                    Danh Mục<i class="fa-solid fa-chevron-down"></i>
                    <ul class="sub-nav">
                        <c:forEach var="i" items="${sessionScope.dsdm}">
                            <c:if test="${i.trangthai}">
                                <li><a href="filter?mdm=${i.madm}">${i.tendm}</a></li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            
            <div class="search">
                <form action="search">
                    <input type="text" name="search" placeholder="tìm kiếm... ">
                    <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                </form>
            </div>
        </div>
        <div class="header-right">
            <div class="user">
                <div class="user-cart">
                    <c:set var="listsize" value="<%= size %>" />
                    <c:if test='${sessionScope.acc.nhomtk.nhomtk.equals("adm")}'>
                        <a class="a" href="../admin/tongquan/index">Quản lý kho</a>
                    </c:if>
                    <c:if test='${!sessionScope.acc.nhomtk.nhomtk.equals("adm")}'>
                        <div class="cart">
                            giỏ hàng
                            <i class="fa-sharp fa-solid fa-cart-shopping"></i>
                            <c:if test="${sessionScope.cartList!=null}">
                                <span class="sl"><%= cartls.size() %></span>
                            </c:if>
                            <div class="subcart">
                                <ul>
                                    <c:if test="${sessionScope.cartList!=null && listsize >0 }">
                                        <c:forEach items="${sessionScope.cartList}" var="i">
                                            <a href="order">
                                                <li>
                                                    <div class="item-img">
                                                        <img src="../view/img/${i.sp.hinhanh}" alt="">
                                                    </div>
                                                    <div class="cart-body">
                                                        <h4>${i.sp.tensp}</h4>
                                                        <p><fmt:formatNumber value="${i.sp.dongia-(i.sp.dongia*i.sp.khuyenmai)}" pattern="#,##0"/>₫</p>
                                                    </div>
                                                    <span>x${i.amount}</span>
                                                </li>
                                            </a>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${sessionScope.cartList==null || listsize==0}">
                                        <p class="not-buy">Bạn chưa mua món hàng nào cả</p>
                                        <p style="text-align: center;font-size: 28px;"><i class="fa-sharp fa-regular fa-face-frown"></i></p>
                                    </c:if>
                                </ul>
                                <div class="thanhtoan">
                                    <c:if test="${sessionScope.cartList!=null && listsize>0}">
                                        <div >
                                            <h4>Tổng Tiền: </h4>
                                            <span><fmt:formatNumber value="<%= cartls.calMoney() %>" pattern="#,##0"/>₫</span> 
                                        </div>
                                        <div>
                                            <a class="btn-1" href="payment">Thanh Toán</a>
                                        </div>  
                                    </c:if>
                                </div>
                            </div>
   
                        </div>
                    </c:if>
                </div>
                <div class="user-avata">
                    <c:if test="${sessionScope.acc==null}">
                        <a class="btn-1" href="login">Đăng kí/Đăng nhập</a>
                    </c:if>
                    <c:if test="${sessionScope.acc!=null}">
                        <h5>${sessionScope.acc.tentk}</h5>
                        <a class="btn-1" href="logout">Đăng xuất</a>
                    </c:if>
                </div>
               
            </div>
        </div>
       
    </header>
    </body>
</html>
