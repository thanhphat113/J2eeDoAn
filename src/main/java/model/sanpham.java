/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import DAO.loaisanphamDAO;

/**
 *
 * @author lythanhphat9523
 */
public class sanpham {
    private String masp;
    private String tensp;
    private String tenloai;
    private String maloai;
    private String mota;
<<<<<<< HEAD
    private String gia;
    private String maCT;
    DecimalFormat decimalFormat = new DecimalFormat("#,### VNĐ");
=======
    private String hinhanh;

    public sanpham(String masp,String maloai, String tensp, String mota, String hinhanh) {
        this.masp = masp;
        this.tensp = tensp;
        this.tenloai=new loaisanphamDAO().findById(maloai).getTenloai();
        this.mota = mota;
        this.hinhanh = hinhanh;
        this.maloai = maloai;
    }
>>>>>>> 1be078e5f6224451b3723f85e2b6d596aaff18f4
    
    public sanpham() {
    }

    public String getMasp() {
        return masp;
    }

    public void setMasp(String masp) {
        this.masp = masp;
    }

    public String getTensp() {
        return tensp;
    }

    public void setTensp(String tensp) {
        this.tensp = tensp;
    }

    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

<<<<<<< HEAD
    public String getMau() {
        return mau;
    }

    public void setMau(String mau) {
        this.mau = mau;
    }

    public sanpham(String maSP, String tenSP, String maLoai,String mau, int giaNhap, int giaBan, String hinhanh, int soluong, String mota) {
        this.maSP = maSP;
        this.tenSP = tenSP;
        this.maLoai = maLoai;
        this.giaNhap = giaNhap;
        this.giaBan = giaBan;
        this.hinhanh = hinhanh;
        this.soluong = soluong;
        this.mota = mota;
        this.mau=mau;
        this.gia = decimalFormat.format(giaBan);
    }
    
    public sanpham(String maSP, String tenSP, String maLoai,String mau, int giaNhap, int giaBan, String hinhanh, int soluong, String mota, String maCT) {
        this.maSP = maSP;
        this.tenSP = tenSP;
        this.maLoai = maLoai;
        this.giaNhap = giaNhap;
        this.giaBan = giaBan;
        this.hinhanh = hinhanh;
        this.soluong = soluong;
        this.mota = mota;
        this.mau=mau;
        this.maCT = maCT;
        this.gia = decimalFormat.format(giaBan);
    }

    public String getMaCT() {
        return maCT;
    }

    public void setMaCT(String maCT) {
        this.maCT = maCT;
    }

    public sanpham(String maSP, String tenSP, String maLoai, int giaNhap, int giaBan, String hinhanh, String mota) {
        this.maSP = maSP;
        this.tenSP = tenSP;
        this.maLoai = maLoai;
        this.giaNhap = giaNhap;
        this.giaBan = giaBan;
        this.hinhanh = hinhanh;
        this.mota = mota;
        this.gia = decimalFormat.format(giaBan);
    }
    
    

    public String getMaSP() {
        return maSP;
    }

    public void setMaSP(String maSP) {
        this.maSP = maSP;
    }

    public String getTenSP() {
        return tenSP;
    }

    public void setTenSP(String tenSP) {
        this.tenSP = tenSP;
    }

    public String getMaLoai() {
        return maLoai;
    }

    public void setMaLoai(String maLoai) {
        this.maLoai = maLoai;
    }

    public int getGiaNhap() {
        return giaNhap;
    }

    public void setGiaNhap(int giaNhap) {
        this.giaNhap = giaNhap;
    }

    public int getGiaBan() {
        return giaBan;
    }

    public void setGiaBan(int giaBan) {
        this.giaBan = giaBan;
    }

=======
>>>>>>> 1be078e5f6224451b3723f85e2b6d596aaff18f4
    public String getHinhanh() {
        return hinhanh;
    }

    public void setHinhanh(String hinhanh) {
        this.hinhanh = hinhanh;
    }

    public String getMaloai() {
        return maloai;
    }

    public void setMaloai(String maloai) {
        this.maloai = maloai;
    }

    public String getTenloai() {
        return tenloai;
    }
    
    
}