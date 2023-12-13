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
        try (Connection conn = DataBase.getConnection()) {
            Statement st = conn.createStatement();

            //Buoc 3:
            String sql = "INSERT INTO SanPham() values('SP' + RIGHT('000' + CAST((SELECT COUNT(*) + 1 FROM SanPham) AS VARCHAR(3)), 3),?,?,?,?,?)" + " insert into ChiTietSanPham values('CT' + RIGHT('000' + CAST((SELECT COUNT(*) + 1 FROM ChiTietSanPham) AS VARCHAR(3)), 3),?,?,?,?,?,?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
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
        try (Connection conn = DataBase.getConnection()) {
            Statement st = conn.createStatement();

            String query = "select sp.MaSP,sp.TenSP,lsp.TenLoai,ct.Mau,ct.GiaNhap,ct.GiaBan,ct.HinhAnh,ct.SoLuong,sp.MoTa \n"
                    + "from SanPham sp \n"
                    + "join ChiTietSanPham ct on sp.MaSP=ct.MaSP join Loaisanpham lsp on lsp.MaLoai=sp.MaLoai";
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                String maSP = rs.getString("MaSP");
                String tenSP = rs.getString("TenSP");
                String maLoai = rs.getString("TenLoai");
                String mau = rs.getString("Mau");
                int giaNhap = rs.getInt("GiaNhap");
                int giaBan = rs.getInt("GiaBan");
                int soLuong = rs.getInt("SoLuong");
                String hinhAnh = rs.getString("HinhAnh");
                String MoTa = rs.getString("MoTa");

                sanpham sp = new sanpham(maSP, tenSP, maLoai, mau, giaNhap, giaBan, hinhAnh, soLuong, MoTa);
                list.add(sp);
            }
        } catch (Exception e) {
            System.out.println("Lỗi: " + e.getMessage()); // In thông báo lên console
            e.printStackTrace(); // In stack trace lên console để xem chi tiết lỗi
        }
        return list;
    }

    public List<sanpham> findAllToIndex() {
        List<sanpham> list = new ArrayList();
        try (Connection conn = DataBase.getConnection()) {
            Statement st = conn.createStatement();

            String query = "select * from SanPham";
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                String maSP = rs.getString("MaSP");
                String tenSP = rs.getString("TenSP");
                String maLoai = rs.getString("MaLoai");;
                String hinhAnh = rs.getString("HinhAnh");
                String MoTa = rs.getString("MoTa");

                sanpham sp = new sanpham(maSP, tenSP, maLoai, hinhAnh);
                list.add(sp);
            }
        } catch (Exception e) {
            System.out.println("Lỗi: " + e.getMessage()); // In thông báo lên console
            e.printStackTrace(); // In stack trace lên console để xem chi tiết lỗi
        }
        return list;
    }

    public List<sanpham> findByStyle(String condition) {
        List<sanpham> list = new ArrayList();
        try (Connection conn = DataBase.getConnection()) {

            Statement st = conn.createStatement();

            String query = "select * from SanPham where MaLoai='" + condition + "'";
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                String maSP = rs.getString("MaSP");
                String tenSP = rs.getString("TenSP");
                String mota = rs.getString("mota");
                sanpham sp = new sanpham(maSP, tenSP, condition, mota);
                list.add(sp);
            }
        } catch (Exception e) {
            System.out.println("Lỗi: " + e.getMessage()); // In thông báo lên console
            e.printStackTrace(); // In stack trace lên console để xem chi tiết lỗi
        }
        return list;
    }

    public List<sanpham> findByKey(String key) {
        List<sanpham> list = new ArrayList();

        return list;
    }

    public List<sanpham> findById(String id) {
        List<sanpham> sp = new ArrayList<>();
        try (Connection conn = DataBase.getConnection()) {

            Statement st = conn.createStatement();

            String query = "select sp.MaSP,sp.TenSP,lsp.TenLoai,ct.Mau,ct.GiaNhap,ct.GiaBan,sp.HinhAnh,ct.SoLuong,sp.MoTa from SanPham sp join ChiTietSanPham ct on sp.MaSP=ct.MaSP join Loaisanpham lsp on lsp.MaLoai=sp.MaLoai where sp.MaSP='" + id + "'";
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                String tenSP = rs.getString("TenSP");
                String maLoai = rs.getString("TenLoai");
                int giaNhap = rs.getInt("GiaNhap");
                int giaBan = rs.getInt("GiaBan");
                int soLuong = rs.getInt("SoLuong");
                String hinhAnh = rs.getString("HinhAnh");
                String MoTa = rs.getString("MoTa");
                String mau = rs.getString("Mau");
                sanpham spc = new sanpham(id, tenSP, maLoai, mau, giaNhap, giaBan, hinhAnh, soLuong, MoTa);
                sp.add(spc);
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return sp;
    }

}
