<%-- 
    Document   : order
    Created on : Nov 28, 2023, 2:44:30 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<div class="panel-body">
    <table class="table table-hover table-bordered">
        <thead>
            <tr class="info">
                <th>Mã Hóa Đơn</th>
                <th>Người nhập</th>
                <th>Khách hàng</th>
                <th>Mã khuyến mãi áp dụng</th>
                <th>Tổng tiền</th>
                <th>Ngày tạo</th>
                <th colspan="3" style="text-align: center">Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="order" items="${LIST_ORDER}">

                <tr>
                    <td>${order.maHD }</td>
                    <td>${order.maNV }</td>
                    <td>${order.maKH }</td>
                    <td>${order.maKM }</td>
                    <td>${order.tongTien } VND</td>
                    <td>${order.ngayTao }</td>
                    <td><a href="/J2eeDoAn/OrderManagerServlet?action=Detail&orderId=${order.maHD}" class="btn btn-success">Chi tiết</a></td>
                    <td><a href="/J2eeDoAn/OrderManagerServlet?action=Update&orderId=${order.maHD}" class="btn btn-success">Sửa</a></td>
                    <td><a class="btn btn-danger" onclick="confirmDeleteOrder('${order.maHD}')">Xóa</a></td>
                </tr>

            </c:forEach>

        </tbody>
    </table>
    <ul class="pagination">
        <li class="active"><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
    </ul>			  		    	
</div>
