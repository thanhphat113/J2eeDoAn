<%-- 
    Document   : header
    Created on : Nov 28, 2023, 2:42:40 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="panel-heading" style="display: flex; justify-content: space-between;">
    <form action="/J2eeDoAn/OrderManagerServlet" method="post">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Search by Nhân viên" name="maNV" required>
            <div class="input-group-btn">
                <input type="hidden" value="SearchByMaNhanVien" name="action">
                <button class="btn btn-default" type="submit">
                    <i class="glyphicon glyphicon-search"></i>
                </button>
            </div>
        </div>
    </form>
    <br>
    <form action="/J2eeDoAn/OrderManagerServlet" method="post">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Search by Khách hàng" name="maKH" required>
            <div class="input-group-btn">
                <input type="hidden" value="SearchByMaKhachHang" name="action">
                <button class="btn btn-default" type="submit">
                    <i class="glyphicon glyphicon-search"></i>
                </button>
            </div>
        </div>
    </form>
    <br>
    <form action="/J2eeDoAn/OrderManagerServlet" method="post">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Search by mã khuyến mãi" name="maKM" required>
            <div class="input-group-btn">
                <input type="hidden" value="SearchByMaKhuyenMai" name="action">
                <button class="btn btn-default" type="submit">
                    <i class="glyphicon glyphicon-search"></i>
                </button>
            </div>
        </div>
    </form>
    <form action="/J2eeDoAn/OrderManagerServlet" method="post">
        <div class="input-group">
            <input type="date" class="form-control" placeholder="Search" name="date" required>
            <div class="input-group-btn">
                <input type="hidden" value="SearchByDate" name="action">
                <button class="btn btn-default" type="submit">
                    <i class="glyphicon glyphicon-search"></i>
                </button>
            </div>
        </div>
    </form>
    <button type="button" class="btn btn-success">Advance</button>												    	
</div>
