package model;

public class DetailOrder {
	private String maHD;
	private String maSP;
	private int donGia;
	private int soLuong;
	private int tongTien;
	public DetailOrder(String maHD, String maSP, int donGia, int soLuong, int tongTien) {
		super();
		this.maHD = maHD;
		this.maSP = maSP;
		this.donGia = donGia;
		this.soLuong = soLuong;
		this.tongTien = tongTien;
	}
	public DetailOrder() {
		super();
	}
	public String getMaHD() {
		return maHD;
	}
	public void setMaHD(String maHD) {
		this.maHD = maHD;
	}
	public String getMaSP() {
		return maSP;
	}
	public void setMaSP(String maSP) {
		this.maSP = maSP;
	}
	public int getDonGia() {
		return donGia;
	}
	public void setDonGia(int donGia) {
		this.donGia = donGia;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public int getTongTien() {
		return tongTien;
	}
	public void setTongTien(int tongTien) {
		this.tongTien = tongTien;
	}
	
}
