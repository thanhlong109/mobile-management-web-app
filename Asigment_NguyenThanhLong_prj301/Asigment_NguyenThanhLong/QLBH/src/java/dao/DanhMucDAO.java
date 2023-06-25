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
import model.DanhMuc;

/**
 *
 * @author Admin
 */
public class DanhMucDAO implements ICrud<String,DanhMuc>{
    List<DanhMuc> listItems;
    private DBContext db;
    public DanhMucDAO() {
        db = new DBContext();
    }

    public DanhMucDAO(List<DanhMuc> listItems) {
        this.listItems = listItems;
        db = new DBContext();
    }

    public List<DanhMuc> getListItems() {
        return listItems;
    }

    public void setListItems(List<DanhMuc> listItems) {
        this.listItems = listItems;
    }

    @Override
    public List<DanhMuc> read() {
        listItems = new ArrayList<>();
        try{
            String sql="select * from tblDanhMuc";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                String tendm = rs.getString("tendm");
                String madm = rs.getString("madm");
                boolean trangthai = rs.getBoolean("trangthai");
                listItems.add(new DanhMuc(madm, tendm, trangthai));  
            }
        }catch(SQLException ex){
            Logger.getLogger(DanhMuc.class.getName()).log(Level.SEVERE,null,ex);
        }
        return listItems;
    }
    
    public List<String> readMDM() {
        List<String> list = new ArrayList<>();
        try{
            
            String sql="select madm from tblDanhMuc";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                String madm = rs.getString("madm");
                list.add(madm);  
            }
        }catch(SQLException ex){
            Logger.getLogger(DanhMuc.class.getName()).log(Level.SEVERE,null,ex);
        }
        return list;
    }
    @Override
    public DanhMuc details(String id) {
        try{
            String sql="select * from tblDanhMuc where madm=?";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                String madm = rs.getString("madm");
                String tendm = rs.getString("tendm");
                boolean trangthai = rs.getBoolean("trangthai");
                return new DanhMuc(madm, tendm, trangthai);  
            }
        }catch(SQLException ex){
            Logger.getLogger(DanhMuc.class.getName()).log(Level.SEVERE,null,ex);
        }
        return null;
    }

    @Override
    public void create(DanhMuc newItem) {
        try{
            String sql="insert into tblDanhMuc values (?,?,?)";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, newItem.getMadm());
            stmt.setString(2, newItem.getTendm());
            stmt.setBoolean(3, newItem.isTrangthai());
            stmt.executeUpdate();
        }catch(SQLException ex){
            Logger.getLogger(DanhMuc.class.getName()).log(Level.SEVERE,null,ex);
        }
    }

    @Override
    public void update(DanhMuc edittedItem) {
        try{
            String sql="update tblDanhMuc set tendm=? , trangthai=? where madm=?";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(3, edittedItem.getMadm());
            stmt.setString(1, edittedItem.getTendm());
            stmt.setBoolean(2, edittedItem.isTrangthai());
            stmt.executeUpdate();
        }catch(SQLException ex){
            Logger.getLogger(DanhMuc.class.getName()).log(Level.SEVERE,null,ex);
        }
    }

    @Override
    public void delete(String id) {
         try{
            String sql="delete form tblDanhMuc where madm=?";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, id);
            stmt.executeUpdate();
        }catch(SQLException ex){
            Logger.getLogger(DanhMuc.class.getName()).log(Level.SEVERE,null,ex);
        }
    }
    public static void main(String[] args) {
        DanhMucDAO dm = new DanhMucDAO();
        System.out.println(dm.read().get(2).getMadm());
    }
     
}
