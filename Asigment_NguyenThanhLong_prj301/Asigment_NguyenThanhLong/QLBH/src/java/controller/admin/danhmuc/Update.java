
package controller.admin.danhmuc;

import dao.DanhMucDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DanhMuc;


public class Update extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mdm = request.getParameter("mdm");
        DanhMucDAO dmd = new DanhMucDAO();
        DanhMuc dm = dmd.details(mdm);
        request.setAttribute("dm", dm);
        request.getRequestDispatcher("../../view/admin/danhmuc/edit.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
         try{
            String madm = request.getParameter("mdm");
            String tendm = request.getParameter("tdm");
            boolean trangthai = Boolean.parseBoolean(request.getParameter("tt"));
            String err="";
            if(tendm.length()>50){
                err = "Tên danh mục vui lòng tối đa 50 kí tự!";
            }else{
                DanhMucDAO dmd = new DanhMucDAO();
                dmd.update(new DanhMuc(madm, tendm, trangthai));
                response.sendRedirect("index");
            }
            request.setAttribute("type","dm");
            request.setAttribute("err", err);
            request.getRequestDispatcher("../../view/admin/danhmuc/edit.jsp").forward(request, response);
            
        }catch(Exception e){
            System.out.println(e);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
