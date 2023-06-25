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
import model.NhomTaiKhoan;

/**
 *
 * @author Admin
 */
public class NhomTaiKhoanDAO implements ICrud<String,NhomTaiKhoan>{
    List<NhomTaiKhoan> listItems;
    private DBContext db;
    public NhomTaiKhoanDAO() {
        listItems = new ArrayList<>();
        db = new DBContext();
    }

    public NhomTaiKhoanDAO(List<NhomTaiKhoan> listItems) {
        this.listItems = listItems;
        db = new DBContext();
    }

    public List<NhomTaiKhoan> getListItems() {
        return listItems;
    }

    public void setListItems(List<NhomTaiKhoan> listItems) {
        this.listItems = listItems;
    }

    @Override
    public List<NhomTaiKhoan> read() {
        try{
            String sql="select * from tblNhomTaiKhoan";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                String nhomtk = rs.getString("nhomtk");
                String mota = rs.getString("mota");
                boolean trangthai = rs.getBoolean("trangthai");
                listItems.add(new NhomTaiKhoan(nhomtk, mota, trangthai));  
            }
        }catch(SQLException ex){
            Logger.getLogger(NhomTaiKhoan.class.getName()).log(Level.SEVERE,null,ex);
        }
        return listItems;
    }

    @Override
    public NhomTaiKhoan details(String id) {
        try{
            String sql="select * from tblNhomTaiKhoan where nhomtk=?";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                String mota = rs.getString("mota");
                boolean trangthai = rs.getBoolean("trangthai");
                return new NhomTaiKhoan(id, mota, trangthai); 
            }
        }catch(SQLException ex){
            Logger.getLogger(NhomTaiKhoan.class.getName()).log(Level.SEVERE,null,ex);
        }
        return null;
    }

    @Override
    public void create(NhomTaiKhoan newItem) {
        try{
            String sql="insert into tblNhomTaiKhoan values (?,?,?)";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, newItem.getNhomtk());
            stmt.setString(2, newItem.getMota());
            stmt.setBoolean(3, newItem.isTrangthai());
            stmt.executeUpdate();
        }catch(SQLException ex){
            Logger.getLogger(NhomTaiKhoan.class.getName()).log(Level.SEVERE,null,ex);
        }
    }

    @Override
    public void update(NhomTaiKhoan edittedItem) {
        try{
            String sql="update tblNhomTaiKhoan set mota=? , trangthai=? where nhomtk=?";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(3, edittedItem.getNhomtk());
            stmt.setString(1, edittedItem.getMota());
            stmt.setBoolean(2, edittedItem.isTrangthai());
            stmt.executeUpdate();
        }catch(SQLException ex){
            Logger.getLogger(NhomTaiKhoan.class.getName()).log(Level.SEVERE,null,ex);
        }
    }

    @Override
    public void delete(String id) {
         try{
            String sql="delete form tblNhomTaiKhoan where nhomtk=?";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, id);
            stmt.executeUpdate();
        }catch(SQLException ex){
            Logger.getLogger(NhomTaiKhoan.class.getName()).log(Level.SEVERE,null,ex);
        }
    }
     
}
