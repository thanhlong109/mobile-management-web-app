/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.home;

import dao.ChiTietHoaDonDAO;
import dao.HoaDonDAO;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CartItem;
import model.CartList;
import model.ChiTietHoaDon;
import model.HoaDon;
import model.SanPham;
import model.TaiKhoan;

/**
 *
 * @author ACER
 */
public class Payment extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("../view/home/payment.jsp").forward(request, response);
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            HttpSession ss = request.getSession();
            TaiKhoan tk = (TaiKhoan) ss.getAttribute("acc");
            CartList cl = (CartList) ss.getAttribute("cartList");
            java.util.Date now = new java.util.Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String trDate = sdf.format(now);
            Date d = Date.valueOf(trDate);
            
            if(tk!=null&&cl!=null){
                String mahd ="hd-"+ getRandom(0, 1000)+"-"+trDate;
                HoaDon hd = new HoaDon(mahd, d, 1,tk);
                HoaDonDAO hdd = new HoaDonDAO();
                hdd.create(hd);
                for(CartItem ci :cl){
                    SanPham sp = ci.getSp();
                    float giatri = (float)(ci.getAmount()*(sp.getDongia()-sp.getDongia()*sp.getKhuyenmai()));
                    ChiTietHoaDon cthd = new ChiTietHoaDon(hd, sp, ci.getAmount(), (float)sp.getDongia() , sp.getKhuyenmai(),giatri);
                    ChiTietHoaDonDAO cthdd = new ChiTietHoaDonDAO();
                    cthdd.create(cthd);
                    sp.setSoluong(sp.getSoluong()-ci.getAmount());
                }
                ss.removeAttribute("cartList");
                request.setAttribute("paymentResult", true); 
            }else{
                request.setAttribute("paymentResult", false);  
            }
            request.getRequestDispatcher("../view/home/payment.jsp").forward(request, response);
        }catch(Exception e){
             request.setAttribute("paymentResult", false);
                request.getRequestDispatcher("../view/home/payment.jsp").forward(request, response);
        }
    }
    private int getRandom(int min, int max){
        Random r = new Random();
        int range = max-min+1;
        int value = r.nextInt(range)+min;
        return value;
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
