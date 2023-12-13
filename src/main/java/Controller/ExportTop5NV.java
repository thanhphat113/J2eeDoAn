/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.NhanVienDAO;
import DAO.ThongKeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Random;
import model.TongChiTieuBanHang;
import model.nhanvien;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author phanm
 */
@WebServlet(name = "ExportTop5NV", urlPatterns = {"/ExportTop5NV"})
public class ExportTop5NV extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ThongKeDAO thongke = new ThongKeDAO();
        NhanVienDAO nhanvien = new NhanVienDAO();
        List<nhanvien> listNhanVien = nhanvien.GetAllNhanVien();
        List<TongChiTieuBanHang> listTop5NhanVien = thongke.getTop5NhanVien();

        int maximum = 2147483647;
        int minimum = 1;

        Random rn = new Random();
        int range = maximum - minimum + 1;
        int randomNum = rn.nextInt(range) + minimum;

        FileOutputStream file = new FileOutputStream("C:\\EXPORTWEB\\" + "top-5-nhan-vien-" + Integer.toString(randomNum) + ".xlsx");
        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet workSheet = workbook.createSheet("1");
        XSSFRow row;
        XSSFCell cell0;
        XSSFCell cell1;
        XSSFCell cell2;
        XSSFCell cell3;
        
        
        row = workSheet.createRow(0);
        cell0 = row.createCell(0);
        cell0.setCellValue("ID");
        cell1 = row.createCell(1);
        cell1.setCellValue("Username");
        cell2 = row.createCell(2);
        cell2.setCellValue("Email");
        cell3 = row.createCell(3);
        cell3.setCellValue("Tổng bán hàng");

        int i = 0;

        for (TongChiTieuBanHang top5 : listTop5NhanVien) {
            for (nhanvien nv : listNhanVien) {
                if (top5.getUserID().equals(nv.getMaNV())) {
                    i = i + 1;
                    row = workSheet.createRow(i);
                    cell0 = row.createCell(0);
                    cell0.setCellValue(nv.getMaNV());
                    cell1 = row.createCell(1);
                    cell1.setCellValue(nv.getHoTen());
                    cell2 = row.createCell(2);
                    cell2.setCellValue(nv.getEmail());
                    cell3 = row.createCell(3);
                    cell3.setCellValue(top5.getTongBanHang());
                }
            }
        }

        workbook.write(file);
        workbook.close();
        file.close();

        request.setAttribute("mess", "Đã xuất file Excel thành công!");
        request.getRequestDispatcher("top5nhanvien").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
