/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.List;
import model.sanpham;


/**
 *
 * @author lythanhphat9523
 */
public class demo {
    public static void main(String[] args){
        List<sanpham> list = new sanphamDAO().findAll();
        for (sanpham sp : list) {
            System.out.println(new loaisanphamDAO().findById(sp.getMaloai()).getTenloai());
            System.out.println("Mã: "+sp.getMasp()+"Tên: "+sp.getTensp());
        }

    }
}
