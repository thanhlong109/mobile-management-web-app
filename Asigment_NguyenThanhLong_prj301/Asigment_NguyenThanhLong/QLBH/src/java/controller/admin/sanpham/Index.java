/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.sanpham;
import dao.DanhMucDAO;
import dao.SanPhamDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DanhMuc;
import model.SanPham;
import util.MyTools;

/**
 *
 * @author ACER
 */
public class Index extends HttpServlet {

    private List<SanPham> list2;
    private List<SanPham> list;

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String xpage = request.getParameter("page");
        List<List<SanPham>> listType = new ArrayList<>();
        SanPhamDAO spd = new SanPhamDAO();
        list2 = spd.read();
        list=list2;
        DanhMucDAO dmd = new DanhMucDAO();
        List<DanhMuc> dsdm = dmd.read();
        for(DanhMuc dm : dsdm){
            List<SanPham> i = getFilterList(list2, dm.getMadm());
            if(i.size()>0){
                listType.add(i);
            }
        }
        String mdm = request.getParameter("mdm");
        if(mdm!=null&&mdm.length()>0){
           list = getFilterList(list2, mdm);
        }
        int total = list2.size();
        /*pt*/
            int itemPerPage = 6;
            int size = list.size();
            int numPage = (int) Math.ceil(size / (double) itemPerPage);
            int page=1;

            try{
                page = Integer.parseInt(xpage);
            }catch(Exception e){
                System.out.println(e);
            }
            int start = (page - 1) * itemPerPage;
            int end = Math.min(page * itemPerPage, size);
            List<SanPham> lst = MyTools.getListByPage(list, start, end);

            request.setAttribute("list", lst);
            request.setAttribute("page", page);
            request.setAttribute("numpage", numPage);
            
            request.setAttribute("total", total);
            request.setAttribute("listtype", listType);
            request.setAttribute("mdm", mdm);
                    
        
        
        
        request.setAttribute("type","sp");
        request.getRequestDispatcher("../../view/admin/sanpham/index.jsp").forward(request, response);
        
    }
    
    private List<SanPham> getFilterList(List<SanPham> list, String mdm){
        List<SanPham> filterList = new ArrayList();
        for(SanPham sp : list){
            if(sp.getDanhmuc().getMadm().equals(mdm)){
                filterList.add(sp);
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
