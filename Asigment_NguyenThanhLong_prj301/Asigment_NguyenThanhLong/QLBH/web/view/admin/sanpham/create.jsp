<%-- 
    Document   : create
    Created on : Feb 17, 2023, 3:16:45 PM
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
        <%@include file="../common/leftbar.jsp" %>
        <div class="container">
            <h3 class="title">
                Nhập sản phẩm mới
            </h3>
            <form action="create" method="POST" enctype="multipart/form-data">
                
                <label for="msp">Mã Sản Phẩm:</label>
                <input type="text" required name="msp" value="${sp.masp}" placeholder="Mã Sản phẩm..." id="msp"> <br>
                <label for="tsp">Tên Sản Phẩm:</label>
                <input type="text" required name="tsp" value="${sp.tensp}" placeholder="Tên sản phẩm..." id="tsp"> <br>
                <label for="mt">Mô tả:</label>
                <textarea required name="mt" placeholder="Mô tả sản phẩm..." id="mt">${sp.mota}</textarea><br>
                <label for="sl">Số lượng:</label>
                <input type="number" required name="sl" value="${sp.soluong}" placeholder="Số lượng sản phẩm..." id="sl"> <br>
                <label for="dg">Đơn giá:</label>
                <input type="number" required name="dg" value="${sp.dongia}" placeholder="Đơn giá sản phẩm..." id="gd"> <br>
                <label for="slider">Khuyến Mại:</label>
                <input type="range" value="0" id="slider" name="km" min="0" max="1" step="0.01">
                <span id="output">0%</span> <br>
                <label>Hình Ảnh:</label>
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
                    <c:forEach var="i" items="${dsdm}" >
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
                
                <button type="submit">Tạo Mới</button>
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
