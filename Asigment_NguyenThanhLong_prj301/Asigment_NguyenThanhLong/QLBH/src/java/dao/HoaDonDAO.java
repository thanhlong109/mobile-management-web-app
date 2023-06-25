/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.HoaDon;
import model.TaiKhoan;

/**
 *
 * @author Admin
 */
public class HoaDonDAO implements ICrud<String,HoaDon>{
    List<HoaDon> listItems;
    private DBContext db;
    public HoaDonDAO() {
        listItems = new ArrayList<>();
        db = new DBContext();
    }

    public HoaDonDAO(List<HoaDon> listItems) {
        this.listItems = listItems;
        db = new DBContext();
    }

    public List<HoaDon> getListItems() {
        return listItems;
    }

    public void setListItems(List<HoaDon> listItems) {
        this.listItems = listItems;
    }

    @Override
    public List<HoaDon> read() {
        try{
            String sql="select * from tblHoaDon";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            TaiKhoanDAO tkdao = new TaiKhoanDAO();
            while(rs.next()){
                String mahd = rs.getString("mahd");
                Date ngaydh = rs.getDate("ngaydh");
                int trangthaixuly = rs.getInt("trangthaixuly");
                TaiKhoan tk = tkdao.details(rs.getString("makh"));
                listItems.add(new HoaDon(mahd, ngaydh, trangthaixuly, tk));  
            }
        }catch(SQLException ex){
            Logger.getLogger(HoaDon.class.getName()).log(Level.SEVERE,null,ex);
        }
        return listItems;
    }

    @Override
    public HoaDon details(String id) {
        try{
            String sql="select * from tblHoaDon where mahd=?";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();
            TaiKhoanDAO tkdao = new TaiKhoanDAO();
            while(rs.next()){
                Date ngaydh = rs.getDate("ngaydh");
                int trangthaixuly = rs.getInt("trangthaixuly");
                TaiKhoan tk = tkdao.details(rs.getString("makh"));
                return new HoaDon(id, ngaydh, trangthaixuly, tk);  
            }
        }catch(SQLException ex){
            Logger.getLogger(HoaDon.class.getName()).log(Level.SEVERE,null,ex);
        }
        return null;
    }

    @Override
    public void create(HoaDon newItem) {
        try{
            String sql="insert into tblHoaDon values (?,?,?,?)";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, newItem.getMahd());
            stmt.setDate(2, newItem.getNgaydh());
            stmt.setInt(3, newItem.getTrangthaixuly());
            stmt.setString(4, newItem.getTaikhoan().getTentk());
            stmt.executeUpdate();
        }catch(SQLException ex){
            Logger.getLogger(HoaDon.class.getName()).log(Level.SEVERE,null,ex);
        }
    }

    @Override
    public void update(HoaDon edittedItem) {
        try{
            String sql="update tblHoaDon set ngaydh=? , trangthaixuly=? , makh=? where mahd=?";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(4, edittedItem.getMahd());
            stmt.setDate(1, edittedItem.getNgaydh());
            stmt.setInt(2, edittedItem.getTrangthaixuly());
            stmt.setString(3, edittedItem.getTaikhoan().getTentk());
            stmt.executeUpdate();
        }catch(SQLException ex){
            Logger.getLogger(HoaDon.class.getName()).log(Level.SEVERE,null,ex);
        }
    }

    @Override
    public void delete(String id) {
         try{
            String sql="delete form tblHoaDon where mahd=?";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, id);
            stmt.executeUpdate();
        }catch(SQLException ex){
            Logger.getLogger(HoaDon.class.getName()).log(Level.SEVERE,null,ex);
        }
    }
    public List<HoaDon> readByTK(TaiKhoan tk){
        try{
            String sql="select * from tblHoaDon where makh=?";
            
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, tk.getTentk());
            ResultSet rs = stmt.executeQuery();
            TaiKhoanDAO tkdao = new TaiKhoanDAO();
            while(rs.next()){
                String mahd = rs.getString("mahd");
                Date ngaydh = rs.getDate("ngaydh");
                int trangthaixuly = rs.getInt("trangthaixuly");
                listItems.add(new HoaDon(mahd, ngaydh, trangthaixuly, tk));  
            }
        }catch(SQLException ex){
            Logger.getLogger(HoaDon.class.getName()).log(Level.SEVERE,null,ex);
        }
        return listItems;
    }
    public int countHdByYearAndMonth(int year,int month){
        try{
            String sql="select COUNT(mahd) as soluong from tblHoaDon where ( YEAR(ngaydh)=? and MONTH(ngaydh)=? ) group by YEAR(ngaydh) , MONTH(ngaydh)";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setInt(1, year);
            stmt.setInt(2, month);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                return rs.getInt("soluong");
            }
            
        }catch(SQLException ex){
            Logger.getLogger(HoaDon.class.getName()).log(Level.SEVERE,null,ex);
        }
        return -1;
    }
    
    public static void main(String[] args) {
        HoaDonDAO hdd = new HoaDonDAO();
        System.out.println(hdd.countHdByYearAndMonth(2023, 3));
    }
     
}
