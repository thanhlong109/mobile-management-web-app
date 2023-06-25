/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.hoadon;

import dao.ChiTietHoaDonDAO;
import dao.HoaDonDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ChiTietHoaDon;
import model.HoaDon;

/**
 *
 * @author ACER
 */
public class Detail extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mahd = request.getParameter("mhd");
        HoaDonDAO hdd = new HoaDonDAO();
        HoaDon hd = hdd.details(mahd);
        request.setAttribute("hd", hd);
        ChiTietHoaDonDAO cthdd = new ChiTietHoaDonDAO();
        List<ChiTietHoaDon> list = cthdd.detail(hd);
        request.setAttribute("type", "hd");
        if(list.size()>0){
            request.setAttribute("dscthd", list);
        }
        request.getRequestDispatcher("../../view/admin/hoadon/detail.jsp").forward(request, response);
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
