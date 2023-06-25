/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.home;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CartItem;
import model.CartList;

/**
 *
 * @author ACER
 */
public class Order extends HttpServlet {

    

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("../view/home/order.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String msp = request.getParameter("msp");
        try{
            int sl = Integer.parseInt(request.getParameter("sl"));
            HttpSession ss = request.getSession();
            CartList cl = (CartList) ss.getAttribute("cartList");
            if(cl!=null){
                cl.addToCart(msp, sl);
            }else{
                cl = new CartList();
                cl.addToCart(msp, sl);
            }
            ss.setAttribute("cartList", cl);
            response.sendRedirect("index");
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
