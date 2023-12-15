/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.sanphamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import model.sanpham;

/**
 *
 * @author lythanhphat9523
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 5, // 5 MB
        maxRequestSize = 1024 * 1024 * 5 * 5) // 25 MB
public class QLPD extends HttpServlet {

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = resp.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet QLPD</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QLPD at " + req.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<sanpham> product = new sanphamDAO().findAll();
        req.setAttribute("products", product);
        req.getRequestDispatcher("productsmanager.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String masp = req.getParameter("id");
        String style = req.getParameter("style");
        String text = req.getParameter("text");
        String action = req.getParameter("action");
        if (action.equals("action1") && text != null && !text.isEmpty()) {
            if (style.equals("--Kiểu tìm kiếm--")) {
                List<sanpham> list = new sanphamDAO().findAllByName(text);
                req.setAttribute("products", list);
                req.getRequestDispatcher("productsmanager.jsp").forward(req, resp);
            } else if (style.equals("Mã sản phẩm")) {
                List<sanpham> list = new sanphamDAO().findAllByMaSP(text);
                req.setAttribute("products", list);
                req.getRequestDispatcher("productsmanager.jsp").forward(req, resp);
            } else {
                List<sanpham> list = new sanphamDAO().findAllByName(text);
                req.setAttribute("products", list);
                req.getRequestDispatcher("productsmanager.jsp").forward(req, resp);
            }
        } else if (action.equals("action2")) {

        } else if (action.equals("action3")) {
            new sanphamDAO().delete(masp);
            resp.sendRedirect("Danh-sach-san-pham");
        } else {
            try{
            String tensp = req.getParameter("tensp");
            String maloai = req.getParameter("loai");
            String mota = req.getParameter("mota");
            Part part = req.getPart("hinhanh");
            
            String realPath=req.getServletContext().getRealPath("images");
            String filename=Path.of(part.getSubmittedFileName()).getFileName().toString();
            
            if(!Files.exists(Path.of(realPath))){
                    Files.createDirectory(Path.of(realPath));
            }
            part.write(realPath+"/"+filename);
            sanpham sp=new sanpham("",tensp,maloai,mota,"/"+filename);
            new sanphamDAO().insert(sp);
            resp.sendRedirect("Danh-sach-san-pham");

            }catch(Exception e){
                e.printStackTrace();
            }
            
        }
    }
}
