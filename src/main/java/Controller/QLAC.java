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
<<<<<<< HEAD
@WebServlet(name = "QLAC", urlPatterns = {"/qlac"})
public class QLAC extends HttpServlet {

=======
@WebServlet("/AccountServletManager")
public class QLAC extends HttpServlet {

    String urlTaiKhoanAdmin = "/views/admin/contents/account.jsp";
    String urlUpdateAccountAdmin = "/views/admin/contents/update_account.jsp";
    String urlAdmin = "/admin.jsp";

>>>>>>> thuy
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

<<<<<<< HEAD
=======
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
>>>>>>> thuy
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountDAO accountDAO = new AccountDAO();
<<<<<<< HEAD
        String search = request.getParameter("search");
=======
        List<Account> account = accountDAO.getAll();
        request.setAttribute("accounts", account);
        RequestDispatcher rd = request.getRequestDispatcher(urlAdmin);
        request.setAttribute("VIEW", urlTaiKhoanAdmin);
        rd.forward(request, response);
>>>>>>> thuy

        if (search == null || search.isEmpty()) {
            List<Account> account = accountDAO.getAll();

            request.setAttribute("accounts", account);
            request.getRequestDispatcher("qlacmoi.jsp").forward(request, response);
        } else {

            List<Account> account = accountDAO.searchByUsername(search);

            request.setAttribute("accounts", account);
            request.getRequestDispatcher("qlacmoi.jsp").forward(request, response);
        }
    }

<<<<<<< HEAD
=======
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
>>>>>>> thuy
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accountId = request.getParameter("id");
        if (accountId != null && !accountId.isEmpty()) {
            int userId = Integer.parseInt(accountId);
            AccountDAO accountDAO = new AccountDAO();
            Account account = accountDAO.getAccountById(userId);
            request.setAttribute("accountToUpdate", account);
<<<<<<< HEAD
            request.getRequestDispatcher("update.jsp").forward(request, response);
=======
            RequestDispatcher rd = request.getRequestDispatcher(urlAdmin);
            request.setAttribute("VIEW", urlUpdateAccountAdmin);
            rd.forward(request, response);
>>>>>>> thuy
        } else {
            // Xử lý tác vụ khác ở đây nếu cần

        }
<<<<<<< HEAD

    }



=======

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
>>>>>>> thuy
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
