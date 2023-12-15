/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.chitietsanphamDAO;
import DAO.sanphamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.chitietsanpham;
import model.sanpham;

/**
 *
 * @author lythanhphat9523
 */
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
        List<sanpham> product= new sanphamDAO().findAll();
        req.setAttribute("products", product);
        req.getRequestDispatcher("productsmanager.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String masp = req.getParameter("id");
        String action = req.getParameter("action");
        if (action.equals("action1")) {
            List<chitietsanpham> list = new chitietsanphamDAO().findByIdList(masp);
            req.setAttribute("products", list);
            req.getRequestDispatcher("DetailProduct.jsp").forward(req, resp);
        } else if (action.equals("action0")) {
            String style = req.getParameter("style");
            String text = req.getParameter("text");
            System.out.println(text);
            System.out.println(style);
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

        } else {
            new sanphamDAO().delete(masp);
            resp.sendRedirect("Danh-sach-san-pham");
        }
    }

}
