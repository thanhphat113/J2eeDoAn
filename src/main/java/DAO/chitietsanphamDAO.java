/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Database.DataBase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.chitietsanpham;
import model.sanpham;

/**
 *
 * @author lythanhphat9523
 */
public class chitietsanphamDAO implements iDAO<chitietsanpham> {

    public chitietsanphamDAO() {
    }
    
        @Override
    public Boolean insert(chitietsanpham sp) {
        try (Connection conn = DataBase.getConnection()) {
            String sql="insert into ChiTietSanPham values('CT' + RIGHT('000' + CAST((SELECT COUNT(*) + 1 FROM ChiTietSanPham) AS VARCHAR(3)), 3),?,?,?,?,?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, sp.getMasp());
                pstmt.setString(2, sp.getMau());
                pstmt.setDouble(3, sp.getGiaNhap());
                pstmt.setDouble(4, sp.getGiaBan());
                pstmt.setInt(5, sp.getSoluong());
                
            }
            return true;
        }catch (Exception e){
            return false;
        }
    }


    @Override
    public Boolean update(chitietsanpham a) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Boolean delete(chitietsanpham a) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    @Override
    public List<chitietsanpham> findAll() {
        List<chitietsanpham> list = new ArrayList();
        try (Connection conn = DataBase.getConnection()) {
            Statement st = conn.createStatement();

            String query = "select sp.MaSP,sp.TenSP,lsp.TenLoai,ct.Mau,ct.GiaNhap,ct.GiaBan,sp.HinhAnh,ct.SoLuong,sp.MoTa \n"
                    + "from SanPham sp \n"
                    + "join ChiTietSanPham ct on sp.MaSP=ct.MaSP join Loaisanpham lsp on lsp.MaLoai=sp.MaLoai";
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                String mact = rs.getString("MaCT");
                String masp = rs.getString("MaSP");
                String tensp = rs.getString("TenSP");
                String maloai = rs.getString("TenLoai");
                String mau = rs.getString("Mau");
                int giaNhap = rs.getInt("GiaNhap");
                int giaBan = rs.getInt("GiaBan");
                int soLuong = rs.getInt("SoLuong");
                String hinhanh = rs.getString("HinhAnh");
                String mota = rs.getString("MoTa");

                chitietsanpham sp = new chitietsanpham(mact,mau,giaNhap,giaBan,soLuong,masp,maloai,tensp,mota,hinhanh);
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
                String mota = rs.getString("MoTa");

                sanpham sp = new sanpham(maSP, tenSP, maLoai, hinhAnh,mota);
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
                String hinhanh = rs.getString("HinhAnh");
                sanpham sp = new sanpham(maSP, tenSP, condition,mota, hinhanh);
                list.add(sp);
            }
        } catch (Exception e) {
            e.printStackTrace(); // In stack trace lên console để xem chi tiết lỗi
        }
        return list;
    }

    public List<sanpham> findByKey(String key) {
        List<sanpham> list = new ArrayList();

        return list;
    }


    public List<chitietsanpham> findByCondition(String id) {
        List<chitietsanpham> sp = new ArrayList<>();
        try (Connection conn = DataBase.getConnection()) {

            Statement st = conn.createStatement();
            String query = "select sp.MaSP, sp.TenSP, lsp.TenLoai, ct.Mau, ct.GiaNhap, ct.GiaBan, ct.HinhAnh, ct.SoLuong, sp.MoTa from (( SanPham sp INNER JOIN ChiTietSanPham ct on sp.MaSP = ct.MaSP) INNER JOIN Loaisanpham lsp on lsp.MaLoai=sp.MaLoai ) WHERE sp.MaSP ='" + id + "' OR sp.MaSP IS NULL";
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

//                chitietsanpham sp1 = new chitietsanpham(maSP, tenSP, maLoai, mau, giaNhap, giaBan, hinhAnh, soLuong, MoTa);
//                sp.add(sp1);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return sp;
    }

    public List<sanpham> findById2(String id) {
        List<sanpham> sp = new ArrayList<>();
        Connection conn = null;
        try {
            conn = DataBase.getConnection();

            Statement st = conn.createStatement();

            String query = "select sp.MaSP,sp.TenSP,lsp.TenLoai,ct.Mau,ct.GiaNhap,ct.GiaBan,ct.HinhAnh,ct.SoLuong,sp.MoTa from SanPham sp join ChiTietSanPham ct on sp.MaSP=ct.MaSP join Loaisanpham lsp on lsp.MaLoai=sp.MaLoai where sp.MaSP='" + id + "'";
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
//                sanpham spc = new sanpham(id, tenSP, maLoai, mau, giaNhap, giaBan, hinhAnh, soLuong, MoTa);
//                sp.add(spc);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return sp;
    }

    @Override
    public chitietsanpham findById(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }



    

    
}
