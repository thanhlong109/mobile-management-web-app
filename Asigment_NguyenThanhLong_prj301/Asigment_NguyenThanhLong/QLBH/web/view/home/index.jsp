<%-- 
    Document   : index
    Created on : Feb 17, 2023, 3:15:34 PM
    Author     : Admin
--%>

<%@page import="model.SanPham"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp"  %>
        <div class="container">
        <%
            List<List<SanPham>> listspdm = (List<List<SanPham>>) request.getAttribute("listspdm");
            int max= 10;
            for(List<SanPham> listsp:listspdm){
                
            
        %>
        <h3 class="title"><%= listsp.get(0).getDanhmuc().getTendm() %></h3>
            <div class="row">
                <%
                    int i = 0;
                    for(SanPham sp: listsp){
                        i++;
                        if(i>10){
                            break;
                        }
                %>
                
                <c:if test="<%= sp.isTrangthai() %>">
                        <a href="detail?msp=<%= sp.getMasp() %>" style="text-decoration: none;">
                            <div class="item">
                                <c:if test="<%= sp.getKhuyenmai()>0 %>">
                                    <div class="sale">giảm <fmt:formatNumber value="<%= sp.getKhuyenmai()*100 %>" pattern="##.##"/>%</div>
                                </c:if>

                                <div class="img">
                                    <img src="../view/img/<%= sp.getHinhanh() %>" alt="">
                                </div>
                                <h3><%= sp.getTensp() %></h3>

                                <div class="price">
                                    <c:if test="<%= sp.getKhuyenmai()>0 %>">
                                        <div class="real-p"><fmt:formatNumber value="<%= sp.getDongia()-(sp.getDongia()*sp.getKhuyenmai()) %>" pattern="#,##0"/>₫</div>
                                        <div class="origin-p"><fmt:formatNumber value="<%= sp.getDongia() %>" pattern="#,##0"/>₫</div>
                                    </c:if>
                                    <c:if test="<%= sp.getKhuyenmai()==0 %>">
                                        <div class="real-p"><fmt:formatNumber value="<%= sp.getDongia() %>" pattern="#,##0"/>₫</div>
                                    </c:if>
                                </div>
                            </div>
                        </a>

                    </c:if>   
                <%
                    }
                %>
            </div>
                
        <%
            }
        %>    
            
                
            
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
