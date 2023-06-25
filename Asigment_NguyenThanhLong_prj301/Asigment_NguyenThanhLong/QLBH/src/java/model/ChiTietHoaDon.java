/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ACER
 */
public class ChiTietHoaDon {
    private HoaDon hoadon;
    private SanPham sanpham;
    private int soluong;
    private float dongia;
    private float khuyenmai;
    private float giatri;

    public ChiTietHoaDon() {
    }

    public ChiTietHoaDon(HoaDon hoadon, SanPham sanpham, int soluong, float dongia, float khuyenmai, float giatri) {
        this.hoadon = hoadon;
        this.sanpham = sanpham;
        this.soluong = soluong;
        this.dongia = dongia;
        this.khuyenmai = khuyenmai;
        this.giatri = giatri;
    }

    public HoaDon getHoadon() {
        return hoadon;
    }

    public void setHoadon(HoaDon hoadon) {
        this.hoadon = hoadon;
    }

    public SanPham getSanpham() {
        return sanpham;
    }

    public void setSanpham(SanPham sanpham) {
        this.sanpham = sanpham;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public float getDongia() {
        return dongia;
    }

    public void setDongia(float dongia) {
        this.dongia = dongia;
    }

    public float getKhuyenmai() {
        return khuyenmai;
    }

    public void setKhuyenmai(float khuyenmai) {
        this.khuyenmai = khuyenmai;
    }

    public float getGiatri() {
        return giatri;
    }

    public void setGiatri(float giatri) {
        this.giatri = giatri;
    }
    
    
}
