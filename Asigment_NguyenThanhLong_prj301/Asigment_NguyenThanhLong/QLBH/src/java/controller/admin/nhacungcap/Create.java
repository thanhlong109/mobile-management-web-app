/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.nhacungcap;

import dao.NhaCungCapDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.NhaCungCap;

/**
 *
 * @author ACER
 */
public class Create extends HttpServlet {

   
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("type", "ncc");
        request.getRequestDispatcher("../../view/admin/nhacungcap/create.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try{
            String mancc = request.getParameter("mncc");
            String tenncc = request.getParameter("tncc");
            String dc = request.getParameter("dc");
            boolean trangthai = Boolean.parseBoolean(request.getParameter("tt"));
            NhaCungCapDAO nccd = new NhaCungCapDAO();
            
            String err="";
            if(mancc.length()>5){
                err = "Mã nhà cung cấp vui lòng tối đa 5 kí tự!";  
            }else if(tenncc.length()>50){
                err = "Tên nhà cung cấp vui lòng tối đa 50 kí tự!";
            }else if(dc.length()>100){
                err = "Địa chỉ vui lòng tối đa 100 kí tự!";
            }else if(nccd.details(mancc)!=null){
                err = "Mã nhà cung cấp đã tồn tại!";
            }else{
                
                nccd.create(new NhaCungCap(mancc, tenncc, dc, trangthai));
                response.sendRedirect("index");
            }
            request.setAttribute("type","ncc");
            request.setAttribute("err", err);
            request.getRequestDispatcher("../../view/admin/nhacungcap/create.jsp").forward(request, response);
            
        }catch(Exception e){
            System.out.println(e);
        }
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
