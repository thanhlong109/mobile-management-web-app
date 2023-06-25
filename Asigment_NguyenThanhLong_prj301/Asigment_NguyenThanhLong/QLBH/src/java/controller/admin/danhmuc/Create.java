/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.danhmuc;

import dao.DanhMucDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DanhMuc;

/**
 *
 * @author ACER
 */
public class Create extends HttpServlet {

   
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("type", "dm");
        request.getRequestDispatcher("../../view/admin/danhmuc/create.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try{
            String madm = request.getParameter("mdm");
            String tendm = request.getParameter("tdm");
            boolean trangthai = Boolean.parseBoolean(request.getParameter("tt"));
            DanhMucDAO dmd = new DanhMucDAO();
            String err="";
            if(madm.length()>5){
                err = "Mã danh mục vui lòng tối đa 5 kí tự!";  
            }else if(tendm.length()>50){
                err = "Tên danh mục vui lòng tối đa 50 kí tự!";
            }else if(dmd.details(madm)!=null){
                err = "Mã danh mục đã tồn tại!";
            }else{
                
                dmd.create(new DanhMuc(madm, tendm, trangthai));
                response.sendRedirect("index");
            }
            request.setAttribute("type", "dm");
            request.setAttribute("err", err);
            request.getRequestDispatcher("../../view/admin/danhmuc/create.jsp").forward(request, response);
            
        }catch(Exception e){
            System.out.println(e);
        }
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
