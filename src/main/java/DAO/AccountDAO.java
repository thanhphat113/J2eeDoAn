package DAO;



/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */



import Database.DBContext;
import Database.DataBase;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import  java.sql.SQLException;

/**
 *
 * @author thine
 */
public class AccountDAO extends DBContext{
        
      
  
    
    public List<Account> getAll(){
        List<Account> list = new ArrayList<>();
        String sql = "select * from tblAccount";
        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Account a = new Account(rs.getString("username"), rs.getString("password"));
                list.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
    
    public static void main(String[] args) {
        AccountDAO a = new AccountDAO();
        List<Account> list = a.getAll();
        System.out.println(list.get(0).getUsername());
        System.out.println(list.get(0).getPassword());
      
    }
    
    
}


