
package controller.admin.sanpham;

import dao.ChiTietHoaDonDAO;
import dao.SanPhamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class Delete extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String msp = request.getParameter("msp");
        SanPhamDAO spd = new SanPhamDAO();
        ChiTietHoaDonDAO cthdd = new ChiTietHoaDonDAO();
        if(cthdd.detailsSanPham(msp)==null){
            spd.delete(msp);
            response.sendRedirect("index");
        }else{
            String err = "Sản phẩm không thể xóa do là khóa ngoại của chi tiết hóa đơn!";
            request.setAttribute("err", err);
            response.sendRedirect("index");
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
