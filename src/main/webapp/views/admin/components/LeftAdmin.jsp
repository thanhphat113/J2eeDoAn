<%-- 
    Document   : LeftAdmin
    Created on : Dec 13, 2023, 1:07:01 PM
    Author     : ACER
--%>
<%@page import="model.nhanvien,DAO.NhanVienDAO,java.util.List,java.io.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-white" style="padding: 0px">
    <div class="position-sticky">
        <div class="list-group list-group-flush mx-3 mt-4">
            <a href="StatisticController" class="list-group-item list-group-item-action py-2 ripple" aria-current="true">
                <i class="fas fa-tachometer-alt fa-fw me-3"></i><span>Main dashboard</span>
            </a>
            <a href="OrderManagerServlet" class="list-group-item list-group-item-action py-2 ripple">
                <i class="fas fa-file-invoice-dollar fa-fw me-3"></i><span>Quản lý Hóa Đơn</span>
            </a>

            <a href="AccountServletManager" class="list-group-item list-group-item-action py-2 ripple">
                <i class="fas fa-user-circle fa-fw me-3"></i><span>Quản lý tài khoản</span>
            </a>
            <a href="ProductsController" class="list-group-item list-group-item-action py-2 ripple">
                <i class="fas fa-shoe-prints fa-fw me-3"></i><span>Quản lý sản phẩm</span>
            </a>
            <a href="managerSupplier" class="list-group-item list-group-item-action py-2 ripple">
                <i class="fas fa-parachute-box fa-fw me-3"></i><span>Quản lý nhà cung cấp</span>
            </a>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    <i class="fa fa-line-chart" aria-hidden="true"></i>
                    <span>Thống Kê</span>
                </a>
                <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Tùy chọn:</h6>                        
                        <a href="doanhThuTheoThu" class="list-group-item list-group-item-action py-2 ripple">
                            <i class="fas fa-chart-pie fa-fw me-3"></i><span>Danh thu thứ</span>
                        </a>
                        <a href="doanhThuTheoThang" class="list-group-item list-group-item-action py-2 ripple">
                            <i class="fas fa-chart-bar fa-fw me-3"></i><span>Doanh thu tháng</span>
                        </a>
                        <a href="top10" class="list-group-item list-group-item-action py-2 ripple">
                            <i class="fas fa-shoe-prints fa-fw me-3"></i><span>Top 10 sản phẩm</span>
                        </a>
                        <a href="top5khachhang" class="list-group-item list-group-item-action py-2 ripple">
                            <i class="fas fa-user-circle fa-fw me-3"></i><span>Top 5 khách hàng</span>
                        </a>
                        <a href="top5nhanvien" class="list-group-item list-group-item-action py-2 ripple">
                            <i class="fas fa-user-circle fa-fw me-3"></i><span>Top 5 nhân viên</span>
                        </a>
                    </div>
                </div>
            </li>
            <%  
                        HttpSession sessionDangNhap = request.getSession();
                        
                        if(sessionDangNhap.getAttribute("loginUserID")!=null){
                            int id = Integer.parseInt(sessionDangNhap.getAttribute("loginUserID").toString());
                            NhanVienDAO nvDAO = new NhanVienDAO();
                            String hoten = nvDAO.searchNhanVienByMaTK(id).getHoTen();
            %>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                    <span> Xin chào <%=hoten%> </span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingOne" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">                
                        <a href="/Trang-chu?action=Logout" class="list-group-item list-group-item-action py-2 ripple">
                            <i class="fas fa-chart-pie fa-fw me-3"></i><span>Đăng Xuất</span>
                        </a>
                    </div>
                </div>
            </li>
            <%}%>
        </div>
    </div>
</nav>
