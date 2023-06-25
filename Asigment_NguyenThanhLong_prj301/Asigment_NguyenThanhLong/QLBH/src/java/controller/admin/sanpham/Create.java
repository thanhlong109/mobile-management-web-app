/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.sanpham;

import dao.DanhMucDAO;
import dao.NhaCungCapDAO;
import dao.SanPhamDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.DanhMuc;
import model.NhaCungCap;
import model.SanPham;

/**
 *
 * @author ACER
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
  maxFileSize = 1024 * 1024 * 5, 
  maxRequestSize = 1024 * 1024 * 5 * 5)

public class Create extends HttpServlet {

   
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        NhaCungCapDAO nccd = new NhaCungCapDAO();
        request.setAttribute("dsncc", nccd.read());
        DanhMucDAO dmd = new DanhMucDAO();
        request.setAttribute("dsdm", dmd.read());
        request.setAttribute("type", "sp");
        request.getRequestDispatcher("../../view/admin/sanpham/create.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        SanPham sp;
        NhaCungCapDAO nccd = new NhaCungCapDAO();    
        DanhMucDAO dmd = new DanhMucDAO();
        request.setAttribute("dsncc", nccd.read());
        request.setAttribute("dsdm", dmd.read());
        request.setAttribute("type","sp");
        try{
            String mancc = request.getParameter("mncc");
            String tensp = request.getParameter("tsp");
            String msp = request.getParameter("msp");
            int sl = Integer.parseInt(request.getParameter("sl"));
            float dongia = Float.parseFloat(request.getParameter("dg"));
            String mt = request.getParameter("mt");
            String madm = request.getParameter("mdm");
            float km = Float.parseFloat(request.getParameter("km"));
            boolean trangthai = Boolean.parseBoolean(request.getParameter("tt"));
            String hinhanh = getFileName(request);
            SanPhamDAO spd = new SanPhamDAO();
            String err;
            if(msp.length()>5){
                err = "Mã sản phẩm vui lòng tối đa 5 kí tự!";  
            }else if(tensp.length()>50){
                err = "Tên sản phẩm vui lòng tối đa 50 kí tự!";
            }else if(mt.length()>250){
                err = "Mô tả vui lòng tối đa 250 kí tự!";
            }else if(spd.details(msp)!=null){
                err = "Mã sản phẩm đã tồn tại!";
            }else{
                NhaCungCap ncc = nccd.details(mancc);
                DanhMuc dm = dmd.details(madm);
                sp = new SanPham(msp, tensp, mt, sl, dongia, hinhanh, trangthai,ncc ,dm , km);
                spd.create(sp);
                response.sendRedirect("index");
                return;
            }
            request.setAttribute("err", err);
            request.getRequestDispatcher("../../view/admin/sanpham/create.jsp").forward(request, response);
            
        }catch(Exception e){
            request.setAttribute("err", e);
            request.getRequestDispatcher("../../view/admin/sanpham/create.jsp").forward(request, response);
        }
    }
    
     private String getFileName(HttpServletRequest request)
     throws ServletException, IOException{
        String fileName;
        String UPLOAD_DIRECTORY = "img";
        String realPath = getServletContext().getRealPath("");
        int i = realPath.indexOf("build\\web");
        realPath = realPath.substring(0,i);
        String uploadPath = realPath + "web\\view\\"+UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();
        Part part = request.getPart("haFile");
        fileName = part.getSubmittedFileName();
       if(fileName.length()!=0){
            part.write(uploadPath + File.separator + fileName);
        }
       return fileName;
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
