<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Sidebar -->
<nav id="sidebarMenu">
    <div class="position-sticky">
<<<<<<< HEAD
      <div class="list-group list-group-flush mx-3 mt-4">
        <a href="admin" class="list-group-item list-group-item-action py-2 ripple" aria-current="true">
          <i class="fas fa-tachometer-alt fa-fw me-3"></i><span>Main dashboard</span>
        </a>
        <a href="doanhThuTheoThu" class="list-group-item list-group-item-action py-2 ripple">
          <i class="fas fa-chart-pie fa-fw me-3"></i><span>Danh thu thứ</span>
        </a>
         <a href="doanhThuTheoThang" class="list-group-item list-group-item-action py-2 ripple">
          <i class="fas fa-chart-bar fa-fw me-3"></i><span>Doanh thu tháng</span>
        </a>
        <a href="hoaDon" class="list-group-item list-group-item-action py-2 ripple"><i class="fas fa-file-invoice-dollar fa-fw me-3"></i><span>Hóa Đơn</span></a>
       
         <a href="qlac" class="list-group-item list-group-item-action py-2 ripple">
          <i class="fas fa-user-circle fa-fw me-3"></i><span>Quản lý tài khoản</span>
        </a>
        <a href="manager" class="list-group-item list-group-item-action py-2 ripple">
          <i class="fas fa-shoe-prints fa-fw me-3"></i><span>Quản lý sản phẩm</span>
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
         <a href="managerSupplier" class="list-group-item list-group-item-action py-2 ripple">
          <i class="fas fa-parachute-box fa-fw me-3"></i><span>Quản lý nhà cung cấp</span>
        </a>
      </div>
    </div>
  </nav>
  <!-- Sidebar -->
=======
        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="admin">
                <div class="sidebar-brand-icon rotate-n-15"><i class="fa-solid fa-face-grin-wink"></i></div>
                <div class="sidebar-brand-text mx-3">Admin</div>
            </a>
            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="admin" class="list-group-item list-group-item-action py-2 ripple" aria-current="true">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Tổng quan</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                <!-- Interface -->
            </div>

            <!-- Sidebar - Brand -->     
            <li class="nav-item">
                <a class="nav-link" href="hoaDon" class="list-group-item list-group-item-action py-2 ripple">
                    <i class="fas fa-file-invoice-dollar fa-fw me-3"></i>                   
                    <span>Hóa Đơn</span></a>
            </li> 
            <!--Hóa Đơn-->
            <hr class="sidebar-divider">                    
            <li class="nav-item">
                <a class="nav-link" href="hoaDon" class="list-group-item list-group-item-action py-2 ripple">
                    <i class="fas fa-file-invoice-dollar fa-fw me-3"></i>                   
                    <span>Hóa Đơn</span></a>
            </li> 

            <hr class="sidebar-divider">                    
            <li class="nav-item">
                <a class="nav-link" href="hoaDon" class="list-group-item list-group-item-action py-2 ripple">
                    <i class="fas fa-file-invoice-dollar fa-fw me-3"></i>                   
                    <span>Hóa Đơn</span></a>
            </li> 
            <hr class="sidebar-divider">

            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    <i class="fa fa-line-chart" aria-hidden="true"></i>
                    <span>Thống Kê</span>
                </a>
                <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Tùy chọn:</h6>                        
                        <a class="collapse-item" href="doanhThuTheoThu" class="list-group-item list-group-item-action py-2 ripple">
                            <i class="fas fa-chart-pie fa-fw me-3"></i><span> Danh thu thứ</span>
                        </a>
                        <a class="collapse-item" href="doanhThuTheoThang" class="list-group-item list-group-item-action py-2 ripple">
                            <i class="fas fa-chart-bar fa-fw me-3"></i><span> Doanh thu tháng</span>
                        </a>
                        <a class="collapse-item" href="top10" class="list-group-item list-group-item-action py-2 ripple">
                            <i class="fas fa-shoe-prints fa-fw me-3"></i><span> Top 10 sản phẩm</span>
                        </a>
                        <a class="collapse-item" href="top5khachhang" class="list-group-item list-group-item-action py-2 ripple">
                            <i class="fas fa-user-circle fa-fw me-3"></i><span> Top 5 khách hàng</span>
                        </a>
                        <a class="collapse-item" href="top5nhanvien" class="list-group-item list-group-item-action py-2 ripple">
                            <i class="fas fa-user-circle fa-fw me-3"></i><span> Top 5 nhân viên</span>
                        </a>
                    </div>
                </div>
            </li>
            <hr class="sidebar-divider">                    
            <!-- End of Sidebar -->
            </div>
            </nav>
>>>>>>> 8de0c51989fcf1e9a4a730da694c4005e9590e43
