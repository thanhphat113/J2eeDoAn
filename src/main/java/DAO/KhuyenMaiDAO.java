package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.KhuyenMai;
import model.sanpham;
import Database.DataBase;

public class KhuyenMaiDAO {
	public ArrayList<KhuyenMai> selectAllKhuyenMai(){
		ArrayList<KhuyenMai> ls = new ArrayList<KhuyenMai>();
		Connection conn = null;
		try {
			conn = DataBase.getConnection();
			String sql = "SELECT * FROM KhuyenMai";
			Statement stmt = conn.createStatement();
			
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String maKM = rs.getString("MaKM");
				float tileKM = rs.getFloat("TiLeKM");
				KhuyenMai km = new KhuyenMai(maKM, tileKM);		
				ls.add(km);
			}
		conn.close();
		} catch (Exception e) {
			System.out.print("Cant connect");
		}
		return ls;
	}
	
	public KhuyenMai searchByMaxKhuyenMai(String maKM){
		Connection conn = null;
		try {
			conn = DataBase.getConnection();
			String sql = "SELECT * FROM KhuyenMai WHERE MaKM LIKE '%"+maKM+"'";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String MaKM = rs.getString("MaKM");
				float tileKM = rs.getFloat("TiLeKM");
				KhuyenMai km = new KhuyenMai(MaKM, tileKM);	
				return km;
			}
			
		conn.close();
		} catch (Exception e) {
			System.out.print("Cant connect");
			
		}
		return null;
	}
}
