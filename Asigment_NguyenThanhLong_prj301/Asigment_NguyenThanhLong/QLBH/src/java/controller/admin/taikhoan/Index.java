/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.taikhoan;
import dao.DanhMucDAO;
import dao.NhomTaiKhoanDAO;
import dao.SanPhamDAO;
import dao.TaiKhoanDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DanhMuc;
import model.NhomTaiKhoan;
import model.SanPham;
import model.TaiKhoan;

/**
 *
 * @author ACER
 */
public class Index extends HttpServlet {

   

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ntk = request.getParameter("ntk");
        
        TaiKhoanDAO tkd = new TaiKhoanDAO();
        List<TaiKhoan> list = tkd.read();
        int total = list.size();
        List<List<TaiKhoan>> listType = new ArrayList<>();
            NhomTaiKhoanDAO ntkd = new NhomTaiKhoanDAO();
            List<NhomTaiKhoan> dstk = ntkd.read();
            for(NhomTaiKhoan ntk1 : dstk){
                List<TaiKhoan> i = getFilterList(list, ntk1.getNhomtk());
                if(i.size()>0){
                    listType.add(i);
                }
            }
        if(ntk!=null){
           list = getFilterList(list, ntk);
        }
        request.setAttribute("total", total);
        request.setAttribute("listtype", listType);
        request.setAttribute("type","tk");
        request.setAttribute("list", list);
        request.getRequestDispatcher("../../view/admin/taikhoan/index.jsp").forward(request, response);
        
    }
    
    private List<TaiKhoan> getFilterList(List<TaiKhoan> list, String ntk){
        List<TaiKhoan> filterList = new ArrayList();
        for(TaiKhoan tk : list){
            if(tk.getNhomtk().getNhomtk().equals(ntk)){
                filterList.add(tk);
            }
        
        }
        return filterList;
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
