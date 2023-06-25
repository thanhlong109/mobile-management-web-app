/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.home;

import dao.NhomTaiKhoanDAO;
import dao.TaiKhoanDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.NhomTaiKhoan;
import model.TaiKhoan;

/**
 *
 * @author ACER
 */
public class Signup extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("type", "signup");
        request.getRequestDispatcher("../view/home/login.jsp").forward(request, response);
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
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        TaiKhoanDAO tkd = new TaiKhoanDAO();
        TaiKhoan tk = tkd.details(username);
        String err="";
        if(username.length()>20){
            err="Username vui lòng tối đa 20 kí tự!";
            request.setAttribute("type", "signup");
        }else if(tk!=null){
            err="username is already exist!";
            request.setAttribute("type", "signup");
            
        }else{
            NhomTaiKhoanDAO ntkd = new NhomTaiKhoanDAO();
            NhomTaiKhoan ntk = ntkd.details("cus");
            tkd.create(new TaiKhoan(username, password, true, email, ntk));
            request.setAttribute("type", "login");
        }
        request.setAttribute("errSignup", err);
        request.getRequestDispatcher("../view/home/login.jsp").forward(request, response);
        
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
