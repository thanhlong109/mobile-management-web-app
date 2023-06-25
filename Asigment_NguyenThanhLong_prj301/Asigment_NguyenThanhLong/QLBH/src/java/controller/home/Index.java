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
import java.util.ArrayList;
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
public class Index extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SanPhamDAO spd = new SanPhamDAO();
        List<List<SanPham>> listspdm = new ArrayList<>();
        DanhMucDAO dmd = new DanhMucDAO();
        List<String> listdm = dmd.readMDM();
        for(int i =0;i<listdm.size();i++){
            List<SanPham> listsp = spd.filterByDM(listdm.get(i));
            if(listsp.size()>0){
                listspdm.add(listsp);
            }
        }
        request.setAttribute("listspdm", listspdm);
        request.getRequestDispatcher("../view/home/index.jsp").forward(request, response);
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
