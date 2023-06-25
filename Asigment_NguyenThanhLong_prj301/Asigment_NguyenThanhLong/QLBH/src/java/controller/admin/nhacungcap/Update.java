
package controller.admin.nhacungcap;
import dao.NhaCungCapDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.NhaCungCap;


public class Update extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mncc = request.getParameter("mncc");
        NhaCungCapDAO nccd = new NhaCungCapDAO();
        NhaCungCap ncc = nccd.details(mncc);
        request.setAttribute("ncc", ncc);
        request.getRequestDispatcher("../../view/admin/nhacungcap/edit.jsp").forward(request, response);
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
            String err="";
            if(tenncc.length()>50){
                err = "Tên nhà cung cấp vui lòng tối đa 50 kí tự!";
            }else if(dc.length()>100){
                err = "Địa chỉ vui lòng tối đa 100 kí tự!";
            }else{
                NhaCungCapDAO nccd = new NhaCungCapDAO();
                nccd.update(new NhaCungCap(mancc, tenncc, dc, trangthai));
                response.sendRedirect("index");
            }
            request.setAttribute("type","ncc");
            request.setAttribute("err", err);
            request.getRequestDispatcher("../../view/admin/nhacungcap/edit.jsp").forward(request, response);
            
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
