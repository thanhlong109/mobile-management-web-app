/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author ACER
 */
public class HoaDon {
    private String mahd;
    private Date ngaydh;
    private int trangthaixuly;
    private TaiKhoan taikhoan;

    public HoaDon() {
    }

    public HoaDon(String mahd, Date ngaydh, int trangthaixuly, TaiKhoan taikhoan) {
        this.mahd = mahd;
        this.ngaydh = ngaydh;
        this.trangthaixuly = trangthaixuly;
        this.taikhoan = taikhoan;
    }

    public String getMahd() {
        return mahd;
    }

    public void setMahd(String mahd) {
        this.mahd = mahd;
    }

    public Date getNgaydh() {
        return ngaydh;
    }

    public void setNgaydh(Date ngaydh) {
        this.ngaydh = ngaydh;
    }

    public int getTrangthaixuly() {
        return trangthaixuly;
    }

    public void setTrangthaixuly(int trangthaixuly) {
        this.trangthaixuly = trangthaixuly;
    }

    public TaiKhoan getTaikhoan() {
        return taikhoan;
    }

    public void setTaikhoan(TaiKhoan taikhoan) {
        this.taikhoan = taikhoan;
    }

    

 
    
    
}
