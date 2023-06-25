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
                Cập Nhât Nhà Cung Cấp
            </h3>
            <form action="edit" method="POST">
                
                <label for="mncc">Mã Nhà Cung Cấp:</label>
                <input type="text" readonly name="mncc" value="${ncc.mancc}" id="mncc"> <br>
                <label for="tncc">Tên Danh Muc:</label>
                <input type="text" required name="tncc" value="${ncc.tenncc}" id="tncc"> <br>
                <label for="dc">Địa Chỉ:</label>
                <input type="text" required name="dc" value="${ncc.diachi}" id="dc"> <br>
                <label>Trạng Thái:</label>
                <select name="tt">
                    <option value="true" ${ncc.trangthai?"selected":""}>
                        Đang hợp tác
                    </option>
                    <option value="false" ${!ncc.trangthai?"selected":""}>
                        Tạm dừng hợp tác
                    </option>
                </select><br>
                <button type="submit">Cập Nhật</button>
            </form>
            <p class="err"> ${err}</p>
        </div>
    </body>
</html>
