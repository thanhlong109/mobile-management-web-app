<%-- 
    Document   : update
    Created on : Mar 1, 2023, 2:14:16 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../common/leftbar.jsp" %>
        <div class="container">
            <h3 class="title">
                Cập Nhât Sản Phẩm
            </h3>
            <form action="edit" method="POST" enctype="multipart/form-data">
                
                <label for="msp">Mã Sản Phẩm:</label>
                <input type="text" readonly name="msp" value="${sp.masp}" id="msp"> <br>
                <label for="tsp">Tên Sản Phẩm:</label>
                <input type="text" required name="tsp" value="${sp.tensp}" id="tsp"> <br>
                <label for="mtsp">Mô Tả Sản Phẩm:</label>
                <textarea type="text" required name="mt" id="mtsp">${sp.mota}</textarea> <br>
                <label for="sl">Số Lượng:</label>
                <input type="number" required name="sl" value="${sp.soluong}" id="sl"> <br>
                <label for="dg">Đơn giá:</label>
                <input type="text" required name="dg" value="<fmt:formatNumber value="${sp.dongia}" pattern="##.##"/>" placeholder="Đơn giá sản phẩm..." id="dg"> <br>
                <label for="slider">Khuyến Mại:</label>
                <input type="range" value="${sp.khuyenmai}" id="slider" name="km" min="0" max="1" step="0.01">
                <span id="output"><fmt:formatNumber value="${sp.khuyenmai*100}" pattern="##.##"/>%</span> <br>
                <label >Hình Ảnh:</label>
                <img style="height: 300px;" src="../../view/img/${sp.hinhanh}"/><br>
                <input type="file" name="haFile"><br>
                <label>Trạng Thái:</label>
                <select name="tt">
                    <option value="true" ${sp.trangthai?"selected":""}>
                        Đang bán
                    </option>
                    <option value="false" ${!sp.trangthai?"selected":""}>
                        Ngừng bán
                    </option>
                </select><br>
                <label>Danh Mục:</label>
                <select name="mdm">
                    <c:forEach var="i" items="${dsdm}">
                        <option value="${i.madm}" ${i.madm.equals(sp.danhmuc.madm)?"selected":""}>
                            ${i.tendm}
                        </option>
                    </c:forEach>
                </select><br>
                <label>Nhà Cung Cấp:</label>
                <select name="mncc">
                    <c:forEach var="i" items="${dsncc}">
                        <option value="${i.mancc}" ${i.mancc.equals(sp.nhacungcap.mancc)?"selected":""}>
                            ${i.tenncc}
                        </option>
                    </c:forEach>
                </select><br>
                <button type="submit">Cập Nhật</button>
                <input type="text" style="opacity: 0" name="ha" value="${sp.hinhanh}">
            </form>
            <p class="err"> ${err}</p>
            
        </div>
        <script>
                const sliderElement = document.getElementById("slider");
                const outputElement = document.getElementById("output");

                sliderElement.addEventListener("input", function(event) {
                const value = parseFloat(event.target.value);
                outputElement.textContent = value.toFixed(2)*100+"%";
                });
        </script>
    </body>
</html>
