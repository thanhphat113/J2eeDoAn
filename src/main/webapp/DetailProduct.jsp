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
        <style>
            #myForm{
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: #fff;
                border: 1px solid #ccc;
                border-radius: 8px;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
        </style>
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
                                            <input type="hidden" name="masp" value="${sp.getMasp()}">
                                            <input type="hidden" name="action" value="action1">
                                            <button tyle="submit" class="btn btn-primary size d-flex align-items-center justify-content-center">
                                                <i class="fa fa-pencil-alt"></i>
                                            </button>
                                        </form>
                                    </td>
                                    <td>
                                        <form action="Chi-tiet" method="post">
                                            <input type="hidden" name="id" value="${sp.getMact()}">
                                            <input type="hidden" name="masp" value="${sp.getMasp()}">
                                            <input type="hidden" name="action" value="action2">
                                            <button tyle="submit" name="action" class="btn btn-danger size d-flex align-items-center justify-content-center">
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
                <button type="button" id="toggleForm" class="btn btn-primary btn-block m-2 bg-blue"><i class="fas fa-plus"></i>
                    Thêm
                    sản
                    phẩm</button>
            </div>
        </div>

        <form id="myForm" action="Chi-tiet" method="post">
            <input type="hidden" name="masp" value="${masp}">
            <input type="hidden" name="action" value="action3">
            <div class="text-center title">Thêm chi tiết</div>
            <div class="container-fluid m-0 p-0">
                <div class="row border border-2 border-black ">
                    <div class="col-md-6 ">
                        Màu
                        <br><input class="m-1" stype="text" name="mau" cols="30"><br>
                        Số lượng
                        <br><input tyle="number" class="m-1" name="soluong" cols="30"><br>
                    </div>
                    <div class="col-md-6">
                        Giá nhập
                        <br><input type="number" class="m-1" name="gianhap" cols="30"><br>
                        Giá bán
                        <br><input tyle="number" class="m-1" name="giaban" cols="30"></textarea><br>
                    </div>
                    <div class="d-flex justify-content-center">
                        <button style="width: 100px;" type="submit" class="btn btn-primary">Xác nhận</button>
                        <button style="width: 100px;" type="button" id="cancel" class="btn btn-danger ms-4">Huỷ</button>
                    </div>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
    </form>

    <script>
        $(document).ready(function () {
            $("#toggleForm").click(function () {
                
                $("#myForm").fadeToggle();
                resetForm();
            });
            $("#cancel").click(function () {
                        $("#myForm").fadeToggle();
                        resetForm();
                    });
        });

        function resetForm() {
            // Thiết lập giá trị các trường form về rỗng
            document.getElementsByName('mau')[0].value = '';
            document.getElementById('soluong').value = '';
            document.getElementsByName('giaban')[0].value = '';
            document.getElementById('gianhap').value = '';
        }
    </script>
</body>
</html>
