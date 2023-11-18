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
        sanphamDAO product=new sanphamDAO();
        List<sanpham> list= product.findAll();
        for (sanpham sp : list) {
            System.out.println("Mã: "+sp.getMaSP()+"Tên: "+sp.getTenSP());
        }
    }
}
