/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ChiTietHoaDon;
import model.HoaDon;
import model.SanPham;

/**
 *
 * @author Admin
 */
public class ChiTietHoaDonDAO {
    List<ChiTietHoaDon> listItems;
    private DBContext db;
    public ChiTietHoaDonDAO() {
        listItems = new ArrayList<>();
        db = new DBContext();
    }

    public ChiTietHoaDonDAO(List<ChiTietHoaDon> listItems) {
        this.listItems = listItems;
        db = new DBContext();
    }

    public List<ChiTietHoaDon> getListItems() {
        return listItems;
    }

    public void setListItems(List<ChiTietHoaDon> listItems) {
        this.listItems = listItems;
    }

    public List<ChiTietHoaDon> read() {
        try{
            String sql="select * from tblChiTietHoaDon";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            HoaDonDAO hddao = new HoaDonDAO();
            SanPhamDAO spdao = new SanPhamDAO();
            while(rs.next()){
                HoaDon hd = hddao.details(rs.getString("mahd"));
                SanPham sp = spdao.details(rs.getString("masp"));
                int soluong = rs.getInt("soluong");
                float matkhau = rs.getFloat("dongia");
                float khuyenmai = rs.getFloat("khuyenmai");
                float giatri = rs.getFloat("giatri");

                listItems.add(new ChiTietHoaDon(hd, sp, soluong, giatri, khuyenmai, giatri));  
            }
        }catch(SQLException ex){
            Logger.getLogger(ChiTietHoaDon.class.getName()).log(Level.SEVERE,null,ex);
        }
        return listItems;
    }


    public ChiTietHoaDon details(String mahd, String masp) {
        try{
            String sql="select * from tblChiTietHoaDon where (mahd=? and masp=?)";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, mahd);
            stmt.setString(2, masp);
            ResultSet rs = stmt.executeQuery();
            HoaDonDAO hddao = new HoaDonDAO();
            SanPhamDAO spdao = new SanPhamDAO();
            while(rs.next()){
                HoaDon hd = hddao.details(rs.getString("mahd"));
                SanPham sp = spdao.details(rs.getString("masp"));
                int soluong = rs.getInt("soluong");
                float matkhau = rs.getFloat("dongia");
                float khuyenmai = rs.getFloat("khuyenmai");
                float giatri = rs.getFloat("giatri");

                return new ChiTietHoaDon(hd, sp, soluong, giatri, khuyenmai, giatri);  
            }
        }catch(SQLException ex){
            Logger.getLogger(ChiTietHoaDon.class.getName()).log(Level.SEVERE,null,ex);
        }
        return null;
    }
    public ChiTietHoaDon detailsSanPham(String masp) {
        try{
            String sql="select * from tblChiTietHoaDon where masp=?";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, masp);
            ResultSet rs = stmt.executeQuery();
            HoaDonDAO hddao = new HoaDonDAO();
            SanPhamDAO spdao = new SanPhamDAO();
            while(rs.next()){
                HoaDon hd = hddao.details(rs.getString("mahd"));
                SanPham sp = spdao.details(masp);
                int soluong = rs.getInt("soluong");
                float matkhau = rs.getFloat("dongia");
                float khuyenmai = rs.getFloat("khuyenmai");
                float giatri = rs.getFloat("giatri");
                return new ChiTietHoaDon(hd, sp, soluong, giatri, khuyenmai, giatri);  
            }
        }catch(SQLException ex){
            Logger.getLogger(ChiTietHoaDon.class.getName()).log(Level.SEVERE,null,ex);
        }
        return null;
    }


    public void create(ChiTietHoaDon newItem) {
        try{
            String sql="insert into tblChiTietHoaDon values (?,?,?,?,?,?)";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, newItem.getHoadon().getMahd());
            stmt.setString(2, newItem.getSanpham().getMasp());
            stmt.setInt(3, newItem.getSoluong());
            stmt.setFloat(4, newItem.getDongia());
            stmt.setFloat(5, newItem.getKhuyenmai());
            stmt.setFloat(6, newItem.getGiatri());
            stmt.executeUpdate();
        }catch(SQLException ex){
            Logger.getLogger(ChiTietHoaDon.class.getName()).log(Level.SEVERE,null,ex);
        }
    }

 
    public void update(ChiTietHoaDon edittedItem) {
        try{
            String sql="update tblChiTietHoaDon set soluong=? , dongia=? , khuyenmai=? , giatri=? where (mahd=? and masp=?)";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(5, edittedItem.getHoadon().getMahd());
            stmt.setString(6, edittedItem.getSanpham().getMasp());
            stmt.setInt(1, edittedItem.getSoluong());
            stmt.setFloat(2, edittedItem.getDongia());
            stmt.setFloat(3, edittedItem.getKhuyenmai());
            stmt.setFloat(4, edittedItem.getGiatri());
            stmt.executeUpdate();
        }catch(SQLException ex){
            Logger.getLogger(ChiTietHoaDon.class.getName()).log(Level.SEVERE,null,ex);
        }
    }

  
    public void delete(String mahd,String masp) {
         try{
            String sql="delete form tblChiTietHoaDon where (mahd=? and masp=?) ";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, mahd);
            stmt.setString(2, masp);
            stmt.executeUpdate();
        }catch(SQLException ex){
            Logger.getLogger(ChiTietHoaDon.class.getName()).log(Level.SEVERE,null,ex);
        }
    }
    public List<ChiTietHoaDon> detail(HoaDon hd){
        try{
            String sql="select * from tblChiTietHoaDon where mahd=?";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, hd.getMahd());
            ResultSet rs = stmt.executeQuery();
            SanPhamDAO spdao = new SanPhamDAO();
            while(rs.next()){
                SanPham sp = spdao.details(rs.getString("masp"));
                int soluong = rs.getInt("soluong");
                float matkhau = rs.getFloat("dongia");
                float khuyenmai = rs.getFloat("khuyenmai");
                float giatri = rs.getFloat("giatri");

                listItems.add(new ChiTietHoaDon(hd, sp, soluong, giatri, khuyenmai, giatri));  
            }
        }catch(SQLException ex){
            Logger.getLogger(ChiTietHoaDon.class.getName()).log(Level.SEVERE,null,ex);
        }
        return listItems;
    }
     
}
