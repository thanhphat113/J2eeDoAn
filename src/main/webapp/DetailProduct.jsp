<%-- 
    Document   : newjsp
    Created on : 9 thg 12, 2023, 15:27:53
    Author     : lythanhphat9523
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="model.sanpham" %>
<%@ page import="DAO.sanphamDAO" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css"/>
        <title>Document</title>
    </head>
    <body class="bg-light">

        <!--Sản phẩm-->
        <div class="container rounded ml-3 col-md-10">
            <div class="text-center title">Chi tiết sản phẩm</div>
            <div class="container mt-1">
                <div class="list-group overflow-auto border border-secondary" style="max-height: 600px;height: 600px;">
                    <table class="table table-striped">
                        <thead>
                            <tr class="bg-grey">
                                <th>Hình ảnh</th>
                                <th>Mã chi tiết</th>
                                <th>Tên sản phẩm</th>
                                <th>Màu sắc</th>
                                <th>Số lượng</th>
                                <th>Giá nhập</th>
                                <th>Giá bán</th>
                                <th>Sửa</th>
                                <th>Xóa</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${products}" var="sp">
                                <tr>
                                    <td><img src="images${sp.getHinhanh()}" style="height: 40px;width: 30px;" alt="${sp.getTensp()}" class="img-fluid"></td>
                                    <td>${sp.getMact()}</td>
                                    <td>${sp.getTensp()}</td>
                                    <td>${sp.getMau()}</td>
                                    <td>${sp.getSoluong()}</td>
                                    <td>${sp.getGiaIm()}</td>
                                    <td>${sp.getGia()}</td>
                                    <td>
                                        <form action="Chi-tiet" method="post">
                                            <input type="hidden" name="id" value="${sp.getMact()}">
                                            <input type="hidden" name="action" value="action1">
                                            <div class="d-flex justify-content-center"><a href="#" class="btn btn-primary size d-flex align-items-center justify-content-center"><i
                                                        class="fa fa-pencil-alt"></i></a></div>
                                        </form>
                                    </td>
                                    <td>
                                        <form action="Chi-tiet" method="post">
                                            <input type="hidden" name="id" value="${sp.getMact()}">
                                            <input type="hidden" name="masp" value="${sp.getMasp()}">
                                            <input type="hidden" name="action" value="action2">
                                            <button style="submit" name="action" class="btn btn-danger size d-flex align-items-center justify-content-center">
                                                <i class="fa fa-trash-alt"></i>
                                            </button>

                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="d-grid">
                <button type="button" class="btn btn-primary btn-block m-2 bg-blue"><i class="fas fa-plus"></i>
                    Thêm
                    sản
                    phẩm</button>
            </div>
        </div>
    </body>
</html>
