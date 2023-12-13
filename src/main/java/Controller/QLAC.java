/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AccountDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Account;

/**
 *
 * @author thine
 */
@WebServlet("/AccountServletManager")
public class QLAC extends HttpServlet {

    String urlTaiKhoanAdmin = "/views/admin/contents/account.jsp";
    String urlUpdateAccountAdmin = "/views/admin/contents/update_account.jsp";
    String urlAdmin = "/admin.jsp";

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet QLAC</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QLAC at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        AccountDAO accountDAO = new AccountDAO();
        List<Account> account = accountDAO.getAll();
        request.setAttribute("accounts", account);
        RequestDispatcher rd = request.getRequestDispatcher(urlAdmin);
        request.setAttribute("VIEW", urlTaiKhoanAdmin);
        rd.forward(request, response);

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

        String accountId = request.getParameter("id");
        if (accountId != null && !accountId.isEmpty()) {
            int userId = Integer.parseInt(accountId);
            AccountDAO accountDAO = new AccountDAO();
            Account account = accountDAO.getAccountById(userId);
            request.setAttribute("accountToUpdate", account);
            RequestDispatcher rd = request.getRequestDispatcher(urlAdmin);
            request.setAttribute("VIEW", urlUpdateAccountAdmin);
            rd.forward(request, response);
        } else {
            // Xử lý tác vụ khác ở đây nếu cần

        }

        /* String accountId = request.getParameter("id");
         String action = request.getParameter("action");

    if (accountId != null && !accountId.isEmpty()) {
        int userId = Integer.parseInt(accountId);
        AccountDAO accountDAO = new AccountDAO();

        if(  null == action) {
            // Xử lý tác vụ khác ở đây nếu cần
        } else switch (action) {
                 case "delete":
                     accountDAO.deleteAccount(userId);
                     response.sendRedirect("qlac"); // Chuyển hướng sau khi xóa
                     break;
                 case "update":
                     Account account = accountDAO.getAccountById(userId);
                     request.setAttribute("accountToUpdate", account);
                     request.getRequestDispatcher("update.jsp").forward(request, response);
                     break;
                 default:
                     break;
             }
    } else {
        // Xử lý tác vụ khác ở đây nếu cần
    }
         */
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
