<%-- 
    Document   : update
    Created on : Mar 1, 2023, 2:14:16 PM
    Author     : ACER
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
                Cập Nhât Danh Mục
            </h3>
            <form action="edit" method="POST">
                
                <label for="mdm">Mã Danh Mục:</label>
                <input type="text" readonly name="mdm" value="${dm.madm}" id="mdm"> <br>
                <label for="tdm">Tên Danh Muc:</label>
                <input type="text" required name="tdm" value="${dm.tendm}" id="tdm"> <br>
                <label>Trạng Thái:</label>
                <select name="tt">
                    <option value="true" ${dm.trangthai?"selected":""}>
                        Đang kinh doanh
                    </option>
                    <option value="false" ${!dm.trangthai?"selected":""}>
                        Tạm dừng kinh doanh
                    </option>
                </select><br>
                <button type="submit">Cập Nhật</button>
            </form>
            <p class="err"> ${err}</p>
        </div>
    </body>
</html>
