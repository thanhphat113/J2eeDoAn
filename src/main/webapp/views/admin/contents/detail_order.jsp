<%-- 
    Document   : detail_order
    Created on : Nov 28, 2023, 2:45:07 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<div class="panel-body">
    <table class="table table-hover table-bordered">
        <thead>
            <tr class="info">
                <th>Tên Sản Phẩm</th>
                <th>Hình ảnh</th>
                <th>Đơn giá</th>
                <th>Số lượng</th>
                <th>Tổng tiền</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="order" items="${LIST_DETAILORDER}">

                <tr>
                    <td>${order.tenSP }</td>
                    <td style="width: 20%"><img src="images${order.hinhanh}" alt="product-item" class="img-fluid" ></td>
                    <td>${order.donGia } VND</td>
                    <td>${order.soLuong }</td>
                    <td>${order.tongTien } VND</td>
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
