/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.tongquan;

import dao.DanhMucDAO;
import dao.HoaDonDAO;
import dao.SanPhamDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ACER
 */
public class Index extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SanPhamDAO spd = new SanPhamDAO();
        request.setAttribute("type", "tq");
        request.setAttribute("dsdmsl", spd.getDMAndQuantity());
        
        request.setAttribute("dsnccsl", spd.getNCCAndQuantity());
        request.setAttribute("slhd", getSoluongHd(2023));
        request.getRequestDispatcher("../../view/admin/tongquan/index.jsp").forward(request, response);
    }
    private int[] getSoluongHd(int year){
        HoaDonDAO hdd = new HoaDonDAO();
        int[] slhd = new int[12];
        for(int i=0;i<12;i++){
            int sl = hdd.countHdByYearAndMonth(2023, i+1);
            if(sl==-1){
                slhd[i]=0;
            }else{
                slhd[i]=sl;
            }
        }
        return slhd;
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            int year = Integer.parseInt(request.getParameter("year"));
            SanPhamDAO spd = new SanPhamDAO();
            request.setAttribute("type", "tq");
            request.setAttribute("dsdmsl", spd.getDMAndQuantity());
            request.setAttribute("dsnccsl", spd.getNCCAndQuantity());
            request.setAttribute("slhd", getSoluongHd(year));
            request.getRequestDispatcher("../../view/admin/tongquan/index.jsp").forward(request, response);
        }catch(Exception e){
            System.out.println(e);
        }
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
