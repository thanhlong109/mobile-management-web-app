/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.taikhoan;


import dao.HoaDonDAO;
import dao.TaiKhoanDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.HoaDon;
import model.TaiKhoan;

/**
 *
 * @author ACER
 */
public class Detail extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tentk = request.getParameter("tk");
        TaiKhoanDAO tkd = new TaiKhoanDAO();
        TaiKhoan tk = tkd.details(tentk);
        request.setAttribute("tk",tk );
        request.setAttribute("type", "tk");
        HoaDonDAO hdd = new HoaDonDAO();
        List<HoaDon> list = hdd.readByTK(tk);
        if(list.size()>0){
            request.setAttribute("dshd", list);
        }
        request.getRequestDispatcher("../../view/admin/taikhoan/detail.jsp").forward(request, response);
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
