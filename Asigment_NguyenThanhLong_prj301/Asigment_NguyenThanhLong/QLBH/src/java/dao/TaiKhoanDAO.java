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
import model.TaiKhoan;

/**
 *
 * @author Admin
 */
public class TaiKhoanDAO implements ICrud<String,TaiKhoan>{
    List<TaiKhoan> listItems;
    private DBContext db;
    public TaiKhoanDAO() {
        listItems = new ArrayList<>();
        db = new DBContext();
    }

    public TaiKhoanDAO(List<TaiKhoan> listItems) {
        this.listItems = listItems;
        db = new DBContext();
    }

    public List<TaiKhoan> getListItems() {
        return listItems;
    }

    public void setListItems(List<TaiKhoan> listItems) {
        this.listItems = listItems;
    }

    @Override
    public List<TaiKhoan> read() {
        try{
            String sql="select * from tblTaiKhoan";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            NhomTaiKhoanDAO ntkdao = new NhomTaiKhoanDAO();
            while(rs.next()){
                String tentk = rs.getString("tentk");
                String matkhau = rs.getString("matkhau");
                boolean trangthai = rs.getBoolean("trangthai");
                String email = rs.getString("email");
                
                NhomTaiKhoan ntk = ntkdao.details(rs.getString("nhomtk"));
                
                listItems.add(new TaiKhoan(tentk, matkhau, trangthai, email, ntk));  
            }
        }catch(SQLException ex){
            Logger.getLogger(TaiKhoan.class.getName()).log(Level.SEVERE,null,ex);
        }
        return listItems;
    }

    @Override
    public TaiKhoan details(String id) {
        try{
            String sql="select * from tblTaiKhoan where tentk=?";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();
            NhomTaiKhoanDAO ntkdao = new NhomTaiKhoanDAO();
            while(rs.next()){
                String matkhau = rs.getString("matkhau");
                boolean trangthai = rs.getBoolean("trangthai");
                String email = rs.getString("email");
                
                NhomTaiKhoan ntk = ntkdao.details(rs.getString("nhomtk"));
                
                return new TaiKhoan(id, matkhau, trangthai, email, ntk);
            }
        }catch(SQLException ex){
            Logger.getLogger(TaiKhoan.class.getName()).log(Level.SEVERE,null,ex);
        }
        return null;
    }

    @Override
    public void create(TaiKhoan newItem) {
        try{
            String sql="insert into tblTaiKhoan values (?,?,?,?,?)";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, newItem.getTentk());
            stmt.setString(2, newItem.getMatkhau());
            stmt.setBoolean(3, newItem.isTrangthai());
            stmt.setString(4, newItem.getEmail());
            stmt.setString(5, newItem.getNhomtk().getNhomtk());
            stmt.executeUpdate();
        }catch(SQLException ex){
            Logger.getLogger(TaiKhoan.class.getName()).log(Level.SEVERE,null,ex);
        }
    }

    @Override
    public void update(TaiKhoan edittedItem) {
        try{
            String sql="update tblTaiKhoan set matkhau=? , trangthai=? , email=? , nhomtk=? where tentk=?";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(5, edittedItem.getTentk());
            stmt.setString(1, edittedItem.getMatkhau());
            stmt.setBoolean(2, edittedItem.isTrangthai());
            stmt.setString(3, edittedItem.getEmail());
            stmt.setString(4, edittedItem.getNhomtk().getNhomtk());
            stmt.executeUpdate();
        }catch(SQLException ex){
            Logger.getLogger(TaiKhoan.class.getName()).log(Level.SEVERE,null,ex);
        }
    }

    @Override
    public void delete(String id) {
         try{
            String sql="delete form tblTaiKhoan where tentk=?";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, id);
            stmt.executeUpdate();
        }catch(SQLException ex){
            Logger.getLogger(TaiKhoan.class.getName()).log(Level.SEVERE,null,ex);
        }
    }
    public static void main(String[] args) {
        TaiKhoanDAO tkd = new TaiKhoanDAO();
        System.out.println(tkd.details("admlond"));
    }
     
}
