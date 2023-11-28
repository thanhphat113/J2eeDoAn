package Controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import DAO.DetailOrderDAO;
import DAO.OrderDAO;
import model.Account;
import model.DetailOrder;
import model.khachhang;
import model.nhanvien;
import model.Order;

/**
 * Servlet implementation class OrderManagerServlet
 */
@WebServlet("/OrderManagerServlet")
public class OrderManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Account acc = new Account();
    khachhang kh = new khachhang();
    nhanvien nv = new nhanvien();
    Order ord = new Order();
    OrderDAO ordDAO = new OrderDAO();
    DetailOrder dord = new DetailOrder();
    DetailOrderDAO dordDAO = new DetailOrderDAO();
    String urlDonHangAdmin = "/views/admin/contents/order.jsp";
    String urlChiTietDonHangAdmin = "/views/admin/contents/detail_order.jsp";
    String urlAdmin = "/admin.jsp";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderManagerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String action = request.getParameter("action");
			if(action==null) {
				RequestDispatcher rd = request.getRequestDispatcher(urlAdmin);
				request.setAttribute("VIEW", urlDonHangAdmin);
				ArrayList<Order> ls = ordDAO.selectAllOrder();
				request.setAttribute("LIST_ORDER", ls);
				rd.forward(request, response);
			}else if(action.equals("Detail")) {
				String maHD = request.getParameter("orderId");
				ArrayList<DetailOrder> ls = dordDAO.searchDetailOrder(maHD);
				request.setAttribute("LIST_DETAILORDER", ls);
				RequestDispatcher rd = request.getRequestDispatcher(urlAdmin);
				request.setAttribute("VIEW", urlChiTietDonHangAdmin);
				rd.forward(request, response);
			}else if(action.equals("Delete")) {
				String maHD = request.getParameter("orderId");
				ordDAO.deleteOrder(maHD);
				RequestDispatcher rd = request.getRequestDispatcher(urlAdmin);
				request.setAttribute("VIEW", urlDonHangAdmin);
				ArrayList<Order> ls = ordDAO.selectAllOrder();
				request.setAttribute("LIST_ORDER", ls);
				rd.forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String action = request.getParameter("action");
			if(action==null) {
				RequestDispatcher rd = request.getRequestDispatcher(urlAdmin);
				request.setAttribute("VIEW", urlDonHangAdmin);
				ArrayList<Order> ls = ordDAO.selectAllOrder();
				System.out.println(123);
				request.setAttribute("LIST_ORDER", ls);
				rd.forward(request, response);
			}else if(action.equals("Detail")) {
				String maHD = request.getParameter("orderId");
				System.out.println(maHD);
				RequestDispatcher rd = request.getRequestDispatcher(urlAdmin);
				request.setAttribute("VIEW", urlChiTietDonHangAdmin);
				rd.forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
