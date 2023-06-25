/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.home;

import dao.TaiKhoanDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.TaiKhoan;

/**
 *
 * @author ACER
 */
public class Login extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ss = request.getSession();
        TaiKhoan tk = (TaiKhoan) ss.getAttribute("acc");
        if(tk!=null){
             if(tk.getNhomtk().getNhomtk().equals("adm")){
                 response.sendRedirect("../admin/tongquan/index");
             }else{
                response.sendRedirect("index");
             }
        }else{
            request.setAttribute("type", "login");
            request.getRequestDispatcher("../view/home/login.jsp").forward(request, response);
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            String username = request.getParameter("username");
            String mk = request.getParameter("password");
            TaiKhoanDAO tkd = new TaiKhoanDAO();
            TaiKhoan acc = tkd.details(username);
            String err = "username or password is incorrect!";
            if(acc!=null){
                if(acc.getMatkhau().equals(mk)){
                    HttpSession ss = request.getSession();
                    ss.setAttribute("acc", acc);
                    if(acc.getNhomtk().getNhomtk().equals("adm")){
                        response.sendRedirect("../admin/tongquan/index");
                    }else{
                        response.sendRedirect("index");
                    }
                   
                }else{
                    request.setAttribute("errLogin", err);
                    request.setAttribute("type", "login");
                    request.getRequestDispatcher("../view/home/login.jsp").forward(request, response);
                }
            }else{
                request.setAttribute("errLogin", err);
                request.setAttribute("type", "login");
                request.getRequestDispatcher("../view/home/login.jsp").forward(request, response);
            }
            
        }catch(Exception e){
            System.out.println(e);
        }
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
