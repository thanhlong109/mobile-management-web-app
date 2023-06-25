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
            <form action="edit" method="POST">
                
                <label for="tentk">User:</label>
                <input type="text" readonly name="username" value="${tk.tentk}" id="tentk"> <br>
                <label for="pass">Password:</label>
                <input type="text" required name="password" value="${tk.matkhau}" id="pass"> <br>
                <label for="email">Email:</label>
                <input type="email" required name="email" value="${tk.email}" id="email"> <br>
                <label>Trạng Thái:</label>
                <select name="tt">
                    <option value="true" ${tk.trangthai?"selected":""}>
                        Đang hoạt động
                    </option>
                    <option value="false" ${!tk.trangthai?"selected":""}>
                        Ngừng hoạt động
                    </option>
                </select><br>
                <label>Nhóm tài khoản:</label>
                <select name="ntk">
                    <c:forEach var="i" items="${ntk}">
                        <option value="${i.nhomtk}" ${i.nhomtk.equals(tk.nhomtk.nhomtk)?"selected":""}  >
                            ${i.nhomtk}
                        </option>
                    </c:forEach>
                </select><br>
                <button type="submit">Cập Nhật</button>
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
