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
import model.NhaCungCap;

/**
 *
 * @author Admin
 */
public class NhaCungCapDAO implements ICrud<String,NhaCungCap>{
    List<NhaCungCap> listItems;
    private DBContext db;
    public NhaCungCapDAO() {
        listItems = new ArrayList<>();
        db = new DBContext();
    }

    public NhaCungCapDAO(List<NhaCungCap> listItems) {
        this.listItems = listItems;
        db = new DBContext();
    }

    public List<NhaCungCap> getListItems() {
        return listItems;
    }

    public void setListItems(List<NhaCungCap> listItems) {
        this.listItems = listItems;
    }

    @Override
    public List<NhaCungCap> read() {
        try{
            String sql="select * from tblNhaCungCap";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                String mancc = rs.getString("mancc");
                String tenncc = rs.getString("tenncc");
                String diachi = rs.getString("diachi");
                boolean trangthai = rs.getBoolean("trangthai");
                listItems.add(new NhaCungCap(mancc, tenncc, diachi, trangthai));  
            }
        }catch(SQLException ex){
            Logger.getLogger(NhaCungCap.class.getName()).log(Level.SEVERE,null,ex);
        }
        return listItems;
    }

    @Override
    public NhaCungCap details(String id) {
        try{
            String sql="select * from tblNhaCungCap where mancc=?";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                String tenncc = rs.getString("tenncc");
                String diachi = rs.getString("diachi");
                boolean trangthai = rs.getBoolean("trangthai");
                return new NhaCungCap(id, tenncc, diachi, trangthai);
            }
        }catch(SQLException ex){
            Logger.getLogger(NhaCungCap.class.getName()).log(Level.SEVERE,null,ex);
        }
        return null;
    }

    @Override
    public void create(NhaCungCap newItem) {
        try{
            String sql="insert into tblNhaCungCap values (?,?,?,?)";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, newItem.getMancc());
            stmt.setString(2, newItem.getTenncc());
            stmt.setString(3, newItem.getDiachi());
            stmt.setBoolean(4, newItem.isTrangthai());
            stmt.executeUpdate();
        }catch(SQLException ex){
            Logger.getLogger(NhaCungCap.class.getName()).log(Level.SEVERE,null,ex);
        }
    }

    @Override
    public void update(NhaCungCap edittedItem) {
        try{
            String sql="update tblNhaCungCap set tenncc=? , diachi=? , trangthai=? where madm=?";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(4, edittedItem.getMancc());
            stmt.setString(1, edittedItem.getTenncc());
            stmt.setString(2, edittedItem.getDiachi());
            stmt.setBoolean(3, edittedItem.isTrangthai());
            stmt.executeUpdate();
        }catch(SQLException ex){
            Logger.getLogger(NhaCungCap.class.getName()).log(Level.SEVERE,null,ex);
        }
    }

    @Override
    public void delete(String id) {
         try{
            String sql="delete form tblNhaCungCap where mancc=?";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, id);
            stmt.executeUpdate();
        }catch(SQLException ex){
            Logger.getLogger(NhaCungCap.class.getName()).log(Level.SEVERE,null,ex);
        }
    }
    //test
    public static void main(String[] args) {
        NhaCungCapDAO d = new NhaCungCapDAO();
        System.out.println(d.read().get(0).getTenncc());
    }
     
}
