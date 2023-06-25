/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.home;

import dao.DanhMucDAO;
import dao.NhaCungCapDAO;
import dao.SanPhamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DanhMuc;
import model.NhaCungCap;
import model.SanPham;

/**
 *
 * @author ACER
 */
public class Search extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword  = request.getParameter("search");
        try{
            SanPhamDAO spd = new SanPhamDAO();
            List<SanPham> dssp = spd.search(keyword);
            String msg;
            if(dssp.isEmpty()){
                msg = "Không tìm thấy kết quả cho từ khóa: "+keyword;
                request.setAttribute("msg", msg);
            }else{
                request.setAttribute("dssp", dssp);
            }
            request.getRequestDispatcher("../view/home/search.jsp").forward(request, response);
            
        }catch(Exception e){
            System.out.println(e);
        }
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
