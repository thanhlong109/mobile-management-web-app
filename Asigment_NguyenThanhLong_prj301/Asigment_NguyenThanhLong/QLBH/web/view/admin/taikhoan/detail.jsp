<%-- 
    Document   : detail
    Created on : Mar 1, 2023, 8:09:06 PM
    Author     : ACER
--%>

<%@page import="model.ChiTietHoaDon"%>
<%@page import="dao.ChiTietHoaDonDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.HoaDon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            h5{
                display: inline-block;
            }
            span{
                padding-left: 12px;
            }
        </style>
    </head>
    <body>
        <%
            List<HoaDon> list = (List<HoaDon>) request.getAttribute("dshd");
            
        %>
        <%@include file="../common/leftbar.jsp" %>
        <div class="container">
            <h3 class="title">
               Chi Tiết Tài Khoản
            </h3>
            <br>
            <h5>User: </h5><span>${tk.tentk}</span><br><br>
            <h5>Email: </h5><span>${tk.email}</span><br><br>
            <h5>Role: </h5><span>${tk.nhomtk.nhomtk}</span><br><br>
            <h5>Trạng thái: </h5><span>${tk.trangthai?"Hoạt động":"Ngừng hoạt động"}</span><br><br>
            <h5>Lịch sử mua hàng:</h5>
            <c:if test="${dshd==null}">
                Chưa thực hiện mua hàng!
            </c:if>
            <c:if test="${dshd!=null}">
                <br>
                <br>
                <table>
                    <tr>
                        <th>
                            Mã hóa đơn
                        </th>
                        <th>
                            Sản phẩm - Giá - Khuyến mại - Số lượng
                        </th>
                        <th>
                            Tổng hóa đơn
                        </th>
                    </tr>
                    <%
                     for(HoaDon hd: list){
                         ChiTietHoaDonDAO cthdd = new ChiTietHoaDonDAO();
                         List<ChiTietHoaDon> dscthd = cthdd.detail(hd);
                     %>
                     <tr>
                         <td>
                             <%= hd.getMahd() %>
                         </td>
                         <td>
                             <%
                                 float giatri =0;
                                 for(ChiTietHoaDon cthd:dscthd){
                                     giatri+=cthd.getGiatri();
                                     
                            %>
                            <p><%= cthd.getSanpham().getTensp() %> - <fmt:formatNumber value="<%= cthd.getDongia() %>" pattern="#,##0"/>₫ - <%= cthd.getKhuyenmai()*100 %>% -x <%= cthd.getSoluong() %></p>
                             <%    
                                 }
                             %>
                         </td>
                         <td>
                             <fmt:formatNumber value="<%= giatri %>" pattern="#,##0"/>₫
                         </td>
                         
                     </tr>
                    <%       
                        }
                    %>
                </table>
            </c:if>    
        </div>
    </body>
</html>
