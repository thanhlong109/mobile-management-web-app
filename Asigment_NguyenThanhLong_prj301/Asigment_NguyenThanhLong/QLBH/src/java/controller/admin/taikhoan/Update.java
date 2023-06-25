
package controller.admin.taikhoan;
import dao.NhomTaiKhoanDAO;
import dao.TaiKhoanDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.NhomTaiKhoan;
import model.TaiKhoan;


public class Update extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tenTk = request.getParameter("tk");
        TaiKhoanDAO tkd = new TaiKhoanDAO();
        NhomTaiKhoanDAO ntkd = new NhomTaiKhoanDAO();
        request.setAttribute("ntk", ntkd.read());
        request.setAttribute("type", "tk");
        request.setAttribute("tk", tkd.details(tenTk));
        request.getRequestDispatcher("../../view/admin/taikhoan/edit.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        request.setAttribute("type", "tk");
        try{
           String username = request.getParameter("username");
           String email = request.getParameter("email");
           String password = request.getParameter("password");
           String trNtk = request.getParameter("ntk");
           boolean trangthai = Boolean.parseBoolean(request.getParameter("tt"));
           TaiKhoanDAO tkd = new TaiKhoanDAO();
           String err;
           if(username.length()>20){
               err="Username vui lòng tối đa 20 kí tự!";
           }else{
               NhomTaiKhoanDAO ntkd = new NhomTaiKhoanDAO();
               NhomTaiKhoan ntk = ntkd.details(trNtk);
               tkd.update(new TaiKhoan(username, password, trangthai, email, ntk));
               response.sendRedirect("index");
               return;
           }
           request.setAttribute("err", err);
            request.getRequestDispatcher("../../view/admin/taikhoan/edit.jsp").forward(request, response);
        }catch(Exception e){
            request.setAttribute("err", e);
            request.getRequestDispatcher("../../view/admin/taikhoan/edit.jsp").forward(request, response);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
