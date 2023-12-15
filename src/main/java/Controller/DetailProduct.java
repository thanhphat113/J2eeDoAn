/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import DAO.chitietsanphamDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import model.chitietsanpham;

/**
 *
 * @author lythanhphat9523
 */

@WebServlet("/Detail-Product")

public class DetailProduct extends HttpServlet {

    String urlChiTietSanPham = "/views/home/contents/detail_product.jsp";
    String urlTrangChu = "/index.jsp";

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = resp.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DetailProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailProduct at " + req.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("VIEW", urlChiTietSanPham);
        RequestDispatcher rd = req.getRequestDispatcher(urlChiTietSanPham);
        rd.forward(req, resp);
        String masp = req.getParameter("id");
        List<chitietsanpham> list=new chitietsanphamDAO().findByIdList(masp);
        req.setAttribute("products", list);
        req.getRequestDispatcher("DetailProduct.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String masp = req.getParameter("selectedColor");
        int a = Integer.parseInt(req.getParameter("selectedColor"));
        req.setAttribute("choise", a);
        req.getRequestDispatcher("product.jsp").forward(req, resp);
        String mact = req.getParameter("id");
        String action = req.getParameter("action");
        if(action.equals("action1")){
            
        }else {
            new chitietsanphamDAO().delete(mact);
            resp.sendRedirect("Chi-tiet?id="+masp);
        }
        
    }
}
