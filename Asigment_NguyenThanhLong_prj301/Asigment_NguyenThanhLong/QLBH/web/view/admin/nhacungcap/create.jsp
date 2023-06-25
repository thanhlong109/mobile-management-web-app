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
                Thêm Nhà Cung Cấp
            </h3>
            <form action="create" method="POST">
                
                <label for="mncc">Mã Nhà Cung Cấp:</label>
                <input type="text" required name="mncc" placeholder="Mã danh mục..." id="mncc"> <br>
                <label for="tncc">Tên Nhà Cung Cấp:</label>
                <input type="text" required name="tncc" placeholder="Tên danh mục..." id="tncc"> <br>
                <label for="dc">Địa Chỉ:</label>
                <input type="text" required name="dc" placeholder="Tên danh mục..." id="dc"> <br>
                <label>Trạng Thái:</label>
                <select name="tt">
                    <option value="true">
                        Đang hợp tác
                    </option>
                    <option value="false">
                        Tạm dừng hợp tác
                    </option>
                </select><br>
                <button type="submit">Thêm mới</button>
            </form>
            <p class="err"> ${err}</p>
        </div>
    </body>
</html>
