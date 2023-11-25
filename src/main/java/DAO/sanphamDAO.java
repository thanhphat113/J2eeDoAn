/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Database.DataBase;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.sanpham;

/**
 *
 * @author lythanhphat9523
 */
public class sanphamDAO {

    public sanphamDAO() {
    }

    public boolean create(sanpham sp) {
        try {
            Connection conn = DataBase.getConnection();

            Statement st = conn.createStatement();

            //Buoc 3:
            String sql = "INSERT INTO SinhVien() values(?,?,?,?,?,?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, sp.getMaSP());
                pstmt.setString(2, sp.getTenSP());
                pstmt.setString(3, sp.getMaLoai());
                pstmt.setDouble(4, sp.getGiaNhap());
                pstmt.setDouble(5, sp.getGiaBan());
                pstmt.setString(6, sp.getMota());
                pstmt.setString(7, sp.getHinhanh());
                pstmt.setInt(8, sp.getSoluong());
                
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            int ketqua = st.executeUpdate(sql);
            if (ketqua > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;

    }

    public void update(sanpham sanpham) {

    }

    public void delete(sanpham sp) {

    }

    public List<sanpham> findAll() {
        List<sanpham> list = new ArrayList();
        try {
            Connection conn = DataBase.getConnection();

            Statement st = conn.createStatement();

            String query = "select * from SanPham";
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                String maSP = rs.getString("MaSP");
                String tenSP = rs.getString("TenSP");
                String maLoai = rs.getString("maLoai");
                int giaNhap = rs.getInt("GiaNhap");
                int giaBan = rs.getInt("GiaBan");
                int soLuong = rs.getInt("SoLuong");
                String hinhAnh = rs.getString("HinhAnh");
                String MoTa = rs.getString("MoTa");

                sanpham sp = new sanpham(maSP, tenSP, maLoai, giaNhap, giaBan, hinhAnh, soLuong, MoTa);
                list.add(sp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<sanpham> findByStyle(String condition) {
        List<sanpham> list = new ArrayList();
        try {
            Connection conn = DataBase.getConnection();

            Statement st = conn.createStatement();

            String query = "select * from SanPham where MaLoai='"+condition+"'";
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                String maSP = rs.getString("MaSP");
                String tenSP = rs.getString("TenSP");
                String maLoai = rs.getString("maLoai");
                int giaNhap = rs.getInt("GiaNhap");
                int giaBan = rs.getInt("GiaBan");
                int soLuong = rs.getInt("SoLuong");
                String hinhAnh = rs.getString("HinhAnh");
                String MoTa = rs.getString("MoTa");

                sanpham sp = new sanpham(maSP, tenSP, maLoai, giaNhap, giaBan, hinhAnh, soLuong, MoTa);
                list.add(sp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<sanpham> findByKey(String key) {
        List<sanpham> list = new ArrayList();

        return list;
    }

}
