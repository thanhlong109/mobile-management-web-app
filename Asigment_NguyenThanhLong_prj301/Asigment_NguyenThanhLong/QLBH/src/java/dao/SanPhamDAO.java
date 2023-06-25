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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.DanhMuc;
import model.NhaCungCap;
import model.SanPham;

/**
 *
 * @author Admin
 */
public class SanPhamDAO implements ICrud<String,SanPham>{
    List<SanPham> listItems;
    private DBContext db;
    public SanPhamDAO() {
        db = new DBContext();
    }

    public SanPhamDAO(List<SanPham> listItems) {
        this.listItems = listItems;
        db = new DBContext();
    }

    public List<SanPham> getListItems() {
        return listItems;
    }

    public void setListItems(List<SanPham> listItems) {
        this.listItems = listItems;
    }

    @Override
    public List<SanPham> read() {
        listItems = new ArrayList<>();
        try{
            String sql="select * from tblSanPham";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            DanhMucDAO dmdao = new DanhMucDAO();
            NhaCungCapDAO nccdao = new NhaCungCapDAO();
            while(rs.next()){
                String masp = rs.getString("masp");
                String tensp = rs.getString("tensp");
                String mota = rs.getString("mota");
                int soluong = rs.getInt("soluong");
                float dongia = rs.getFloat("dongia");
                String hinhanh = rs.getString("hinhanh");
                boolean trangthai = rs.getBoolean("trangthai");
                float khuyenmai = rs.getFloat("khuyenmai");
                DanhMuc danhmuc = dmdao.details(rs.getString("madm"));
                NhaCungCap nhacungcap = nccdao.details(rs.getString("mancc"));
                listItems.add(new SanPham(masp, tensp, mota, soluong, dongia, hinhanh, trangthai, nhacungcap, danhmuc,khuyenmai));  
            }
        }catch(SQLException ex){
            Logger.getLogger(NhaCungCap.class.getName()).log(Level.SEVERE,null,ex);
        }
        return listItems;
    }

    @Override
    public SanPham details(String id) {
        try{
            String sql="select * from tblSanPham where masp=?";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();
            DanhMucDAO dmdao = new DanhMucDAO();
            NhaCungCapDAO nccdao = new NhaCungCapDAO();
            while(rs.next()){
                String tensp = rs.getString("tensp");
                String mota = rs.getString("mota");
                int soluong = rs.getInt("soluong");
                float dongia = rs.getFloat("dongia");
                String hinhanh = rs.getString("hinhanh");
                boolean trangthai = rs.getBoolean("trangthai");
                float khuyenmai = rs.getFloat("khuyenmai");
                DanhMuc danhmuc = dmdao.details(rs.getString("madm"));
                NhaCungCap nhacungcap = nccdao.details(rs.getString("mancc"));
                return new SanPham(id, tensp, mota, soluong, dongia, hinhanh, trangthai, nhacungcap, danhmuc,khuyenmai);  
            }
        }catch(SQLException ex){
            Logger.getLogger(SanPham.class.getName()).log(Level.SEVERE,null,ex);
        }
        return null;
    }

    @Override
    public void create(SanPham newItem) {
        try{
            String sql="insert into tblSanPham values (?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, newItem.getMasp());
            stmt.setString(2, newItem.getTensp());
            stmt.setString(3, newItem.getMota());
            stmt.setInt(4, newItem.getSoluong());
            stmt.setFloat(5,(float) newItem.getDongia());
            stmt.setString(6, newItem.getHinhanh());
            stmt.setBoolean(7, newItem.isTrangthai());
            stmt.setString(8, newItem.getDanhmuc().getMadm());
            stmt.setString(9, newItem.getNhacungcap().getMancc());
            stmt.setFloat(10, newItem.getKhuyenmai());
            stmt.executeUpdate();
        }catch(SQLException ex){
            Logger.getLogger(SanPham.class.getName()).log(Level.SEVERE,null,ex);
        }
    }

    @Override
    public void update(SanPham edittedItem) {
        try{
            String sql="update tblSanPham set tensp=? , mota=? , soluong=? , dongia=? , hinhanh=? , trangthai=? , madm=? , mancc=? , khuyenmai=? where masp=?";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(10, edittedItem.getMasp());
            stmt.setString(1, edittedItem.getTensp());
            stmt.setString(2, edittedItem.getMota());
            stmt.setInt(3, edittedItem.getSoluong());
            stmt.setFloat(4,(float) edittedItem.getDongia());
            stmt.setString(5, edittedItem.getHinhanh());
            stmt.setBoolean(6, edittedItem.isTrangthai());
            stmt.setString(7, edittedItem.getDanhmuc().getMadm());
            stmt.setString(8, edittedItem.getNhacungcap().getMancc());
            stmt.setFloat(9, edittedItem.getKhuyenmai());
            stmt.executeUpdate();
        }catch(SQLException ex){
            Logger.getLogger(SanPham.class.getName()).log(Level.SEVERE,null,ex);
        }
    }

    @Override
    public void delete(String id) {
         try{
            String sql="delete from tblSanPham where masp=?";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, id);
            stmt.executeUpdate();
        }catch(SQLException ex){
            Logger.getLogger(SanPham.class.getName()).log(Level.SEVERE,null,ex);
        }
    }
    
    public List<SanPham> search(String key){
        listItems = new ArrayList<>();
        try{
            String sql="select * from tblSanPham where tensp like ?";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            key = "%"+key+"%";
            stmt.setString(1,key );
            ResultSet rs = stmt.executeQuery();
            DanhMucDAO dmdao = new DanhMucDAO();
            NhaCungCapDAO nccdao = new NhaCungCapDAO();
            while(rs.next()){
                String masp = rs.getString("masp");
                String tensp = rs.getString("tensp");
                String mota = rs.getString("mota");
                int soluong = rs.getInt("soluong");
                float dongia = rs.getFloat("dongia");
                String hinhanh = rs.getString("hinhanh");
                boolean trangthai = rs.getBoolean("trangthai");
                float khuyenmai = rs.getFloat("khuyenmai");
                DanhMuc danhmuc = dmdao.details(rs.getString("madm"));
                NhaCungCap nhacungcap = nccdao.details(rs.getString("mancc"));
                listItems.add(new SanPham(masp, tensp, mota, soluong, dongia, hinhanh, trangthai, nhacungcap, danhmuc,khuyenmai));  
            }
        }catch(SQLException ex){
            Logger.getLogger(NhaCungCap.class.getName()).log(Level.SEVERE,null,ex);
        }
        return listItems;
    }
    public List<SanPham> filterByNCC(String mncc){
        listItems = new ArrayList<>();
         try{
            String sql="select masp,tensp,mota,soluong,dongia,hinhanh,sp.trangthai,khuyenmai,madm,sp.mancc from tblSanPham sp join tblNhaCungCap ncc on (sp.mancc=ncc.mancc) where ncc.mancc=?";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, mncc);
            ResultSet rs = stmt.executeQuery();
            DanhMucDAO dmdao = new DanhMucDAO();
            NhaCungCapDAO nccdao = new NhaCungCapDAO();
            while(rs.next()){
                String masp = rs.getString("masp");
                String tensp = rs.getString("tensp");
                String mota = rs.getString("mota");
                int soluong = rs.getInt("soluong");
                float dongia = rs.getFloat("dongia");
                String hinhanh = rs.getString("hinhanh");
                boolean trangthai = rs.getBoolean("trangthai");
                float khuyenmai = rs.getFloat("khuyenmai");
                DanhMuc danhmuc = dmdao.details(rs.getString("madm"));
                NhaCungCap nhacungcap = nccdao.details(rs.getString("mancc"));
                listItems.add(new SanPham(masp, tensp, mota, soluong, dongia, hinhanh, trangthai, nhacungcap, danhmuc,khuyenmai));  
            }
        }catch(SQLException ex){
            Logger.getLogger(NhaCungCap.class.getName()).log(Level.SEVERE,null,ex);
        }
        return listItems;
    }
    public List<SanPham> filterPriceGreater(float price){
        listItems = new ArrayList<>();
        try{
            String sql="select * from tblSanPham sp where sp.dongia >= ?";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setFloat(1, price);
            ResultSet rs = stmt.executeQuery();
            DanhMucDAO dmdao = new DanhMucDAO();
            NhaCungCapDAO nccdao = new NhaCungCapDAO();
            while(rs.next()){
                String masp = rs.getString("masp");
                String tensp = rs.getString("tensp");
                String mota = rs.getString("mota");
                int soluong = rs.getInt("soluong");
                float dongia = rs.getFloat("dongia");
                String hinhanh = rs.getString("hinhanh");
                boolean trangthai = rs.getBoolean("trangthai");
                float khuyenmai = rs.getFloat("khuyenmai");
                DanhMuc danhmuc = dmdao.details(rs.getString("madm"));
                NhaCungCap nhacungcap = nccdao.details(rs.getString("mancc"));
                listItems.add(new SanPham(masp, tensp, mota, soluong, dongia, hinhanh, trangthai, nhacungcap, danhmuc,khuyenmai));  
            }
        }catch(SQLException ex){
            Logger.getLogger(NhaCungCap.class.getName()).log(Level.SEVERE,null,ex);
        }
        return listItems;
    }
    public List<SanPham> filterPriceLess(float price){
        listItems = new ArrayList<>();
        try{
            String sql="select * from tblSanPham sp where sp.dongia <= ?";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setFloat(1, price);
            ResultSet rs = stmt.executeQuery();
            DanhMucDAO dmdao = new DanhMucDAO();
            NhaCungCapDAO nccdao = new NhaCungCapDAO();
            while(rs.next()){
                String masp = rs.getString("masp");
                String tensp = rs.getString("tensp");
                String mota = rs.getString("mota");
                int soluong = rs.getInt("soluong");
                float dongia = rs.getFloat("dongia");
                String hinhanh = rs.getString("hinhanh");
                boolean trangthai = rs.getBoolean("trangthai");
                float khuyenmai = rs.getFloat("khuyenmai");
                DanhMuc danhmuc = dmdao.details(rs.getString("madm"));
                NhaCungCap nhacungcap = nccdao.details(rs.getString("mancc"));
                listItems.add(new SanPham(masp, tensp, mota, soluong, dongia, hinhanh, trangthai, nhacungcap, danhmuc,khuyenmai));  
            }
        }catch(SQLException ex){
            Logger.getLogger(NhaCungCap.class.getName()).log(Level.SEVERE,null,ex);
        }
        return listItems;
    }
     public List<SanPham> filterPriceRange(float min, float max){
         listItems = new ArrayList<>();
        try{
            String sql="select * from tblSanPham sp where (sp.dongia >= ? and sp.dongia<=?)";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setFloat(1, min);
            stmt.setFloat(2, max);
            ResultSet rs = stmt.executeQuery();
            DanhMucDAO dmdao = new DanhMucDAO();
            NhaCungCapDAO nccdao = new NhaCungCapDAO();
            while(rs.next()){
                String masp = rs.getString("masp");
                String tensp = rs.getString("tensp");
                String mota = rs.getString("mota");
                int soluong = rs.getInt("soluong");
                float dongia = rs.getFloat("dongia");
                String hinhanh = rs.getString("hinhanh");
                boolean trangthai = rs.getBoolean("trangthai");
                float khuyenmai = rs.getFloat("khuyenmai");
                DanhMuc danhmuc = dmdao.details(rs.getString("madm"));
                NhaCungCap nhacungcap = nccdao.details(rs.getString("mancc"));
                listItems.add(new SanPham(masp, tensp, mota, soluong, dongia, hinhanh, trangthai, nhacungcap, danhmuc,khuyenmai));  
            }
        }catch(SQLException ex){
            Logger.getLogger(NhaCungCap.class.getName()).log(Level.SEVERE,null,ex);
        }
        return listItems;
    }
    public List<SanPham> filterByDM(String mdm){
        listItems = new ArrayList<>();
         try{
            String sql="select masp,tensp,mota,soluong,dongia,hinhanh,sp.trangthai,khuyenmai,sp.madm,sp.mancc from tblSanPham sp join tblDanhMuc dm on (sp.madm=dm.madm) where dm.madm=?";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            stmt.setString(1, mdm);
            ResultSet rs = stmt.executeQuery();
            DanhMucDAO dmdao = new DanhMucDAO();
            NhaCungCapDAO nccdao = new NhaCungCapDAO();
            while(rs.next()){
                String masp = rs.getString("masp");
                String tensp = rs.getString("tensp");
                String mota = rs.getString("mota");
                int soluong = rs.getInt("soluong");
                float dongia = rs.getFloat("dongia");
                String hinhanh = rs.getString("hinhanh");
                boolean trangthai = rs.getBoolean("trangthai");
                float khuyenmai = rs.getFloat("khuyenmai");
                DanhMuc danhmuc = dmdao.details(rs.getString("madm"));
                NhaCungCap nhacungcap = nccdao.details(rs.getString("mancc"));
                listItems.add(new SanPham(masp, tensp, mota, soluong, dongia, hinhanh, trangthai, nhacungcap, danhmuc,khuyenmai));  
            }
        }catch(SQLException ex){
            Logger.getLogger(NhaCungCap.class.getName()).log(Level.SEVERE,null,ex);
        }
        return listItems;
    }
    public Map<String,Integer> getDMAndQuantity(){
        
        Map<String,Integer> list = new HashMap<>();
        try{
            String sql = "select dm.tendm, COUNT(sp.masp) as soluong from tblSanPham sp join tblDanhMuc dm on (sp.madm=dm.madm) group by dm.tendm";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                String tendm = rs.getString("tendm");
                int soluong = rs.getInt("soluong");
                list.put(tendm, soluong);
            }
            return list;
        }catch(Exception e){
            System.out.println(e);
        }
        return null;
    }
    public Map<String,Integer> getNCCAndQuantity(){
        
        Map<String,Integer> list = new HashMap<>();
        try{
            String sql = "select ncc.tenncc, count(sp.masp) as soluong from tblSanPham sp join tblNhaCungCap ncc on (ncc.mancc=sp.mancc) group by ncc.tenncc";
            PreparedStatement stmt = db.getConnection().prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                String tendm = rs.getString("tenncc");
                int soluong = rs.getInt("soluong");
                list.put(tendm, soluong);
            }
            return list;
        }catch(Exception e){
            System.out.println(e);
        }
        return null;
    }

    
    //test
    public static void main(String[] args) {
        SanPhamDAO d = new SanPhamDAO();
        System.out.println(d.getDMAndQuantity().get("Điện thoại"));
    }
     
}
