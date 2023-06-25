
package controller.home;

import dao.SanPhamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ACER
 */
public class Filter extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mncc = request.getParameter("mncc");
        String lgia = request.getParameter("lgia");
        String ggia = request.getParameter("ggia");
        String mdm = request.getParameter("mdm");
        SanPhamDAO spd = new SanPhamDAO();
        try{
            if(mncc!=null){
                request.setAttribute("filterlist", spd.filterByNCC(mncc));
            }else if(lgia!=null&&ggia!=null){
                float gial = Float.parseFloat(lgia);
                float giag = Float.parseFloat(ggia);
                request.setAttribute("filterlist", spd.filterPriceRange(giag, gial));
            }else if(lgia!=null){
                float gia = Float.parseFloat(lgia);
                request.setAttribute("filterlist", spd.filterPriceLess(gia));
            }else if(ggia!=null){
                float gia = Float.parseFloat(ggia);
                request.setAttribute("filterlist", spd.filterPriceGreater(gia));
            }else if(mdm!=null){
                request.setAttribute("filterlist", spd.filterByDM(mdm));
            }
            request.getRequestDispatcher("../view/home/filter.jsp").forward(request, response);
        }catch(Exception e){
            System.out.println(e);
        }
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
