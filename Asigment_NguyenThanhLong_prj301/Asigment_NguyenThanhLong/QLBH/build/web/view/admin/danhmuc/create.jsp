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
                Tạo Danh Mục Mới
            </h3>
            <form action="create" method="POST">
                
                <label for="mdm">Mã Danh Mục:</label>
                <input type="text" required name="mdm" placeholder="Mã danh mục..." id="mdm"> <br>
                <label for="tdm">Tên Danh Muc:</label>
                <input type="text" required name="tdm" placeholder="Tên danh mục..." id="tdm"> <br>
                <label>Trạng Thái:</label>
                <select name="tt">
                    <option value="true">
                        Đang kinh doanh
                    </option>
                    <option value="false">
                        Tạm dừng kinh doanh
                    </option>
                </select><br>
                <button type="submit">Tạo Mới</button>
            </form>
            <p class="err"> ${err}</p>
        </div>
    </body>
</html>
