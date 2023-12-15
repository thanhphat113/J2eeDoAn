<%-- 
    Document   : newjsp
    Created on : 9 thg 12, 2023, 15:27:53
    Author     : lythanhphat9523
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="model.sanpham" %>
<%@ page import="model.loaisanpham" %>
<%@ page import="DAO.sanphamDAO" %>
<%@ page import="DAO.loaisanphamDAO"%>


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
            #myForm,#myFormFix {
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
        <div class="container rounded ml-3 ">
            <div class="text-center title">Danh sách sản phẩm</div>
            <div class="container mt-3">
                <form action="Danh-sach-san-pham" method="post">
                    <div class="row">
                        <div class="col-md-3">
                            <button type="button"
                                    class="btn btn-secondary btn-fixed-size dropdown-toggle bg-white text-body"
                                    id="selectedStyle" data-bs-toggle="dropdown">
                                --Kiểu tìm kiếm--
                            </button>
                            <ul name="Style" class="dropdown-menu">
                                <li><a class="dropdown-item"
                                       onclick="updateStyle('--Kiểu tìm kiếm--')">--Không--</a>
                                </li>
                                <li><a class="dropdown-item"
                                       onclick="updateStyle('Mã sản phẩm')">Mã
                                        sản phẩm</a></li>
                                <li><a class="dropdown-item"
                                       onclick="updateStyle('Tên sản phẩm')">Tên sản
                                        phẩm</a>
                                </li>
                                <input type="hidden" name="style" id="hiddenStyle" value="">
                                <input type="hidden" name="action" value="action1">
                            </ul>
                        </div>
                        <div class="col-md-9">
                            <div class="input-group mb-3">
                                <input type="input" name="text" class="form-control" placeholder="Tìm kiếm">
                                <button class="btn btn-success bg-blue" type="submit">Tìm kiếm</button>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="container mt-1">
                    <div class="list-group overflow-auto border border-secondary" style="max-height: 600px;height: 600px;">
                        <table class="table table-striped">
                            <tr class="bg-grey">
                                <th>Hình ảnh</th>
                                <th>Mã sản phẩm</th>
                                <th>Tên sản phẩm</th>
                                <th>Loại Sản Phẩm</th>
                                <th>Mô tả</th>
                                <th>Xem</th>
                                <th>Sửa</th>
                                <th>Xóa</th>
                            </tr>
                            <c:forEach items="${products}" var="sp">
                                <tr>
                                    <td><img src="images${sp.getHinhanh()}" style="height: 40px;width: 30px;" alt="${sp.getTensp()}" class="img-fluid"></td>
                                    <td>${sp.getMasp()}</td>
                                    <td>${sp.getTensp()}</td>
                                    <td>${sp.getTenloai()}</td>
                                    <td>${sp.getMota()}</td>
                                    <td>
                                        <form action="Chi-tiet" method="get">
                                            <input type="hidden" name="id" value="${sp.getMasp()}">
                                            <button style="sumit" class="btn btn-secondary size d-flex align-items-center justify-content-center">
                                                <i class="fas fa-bars"></i>
                                            </button>
                                        </form>
                                    </td>
                                    <td>
                                        <form action="Danh-sach-san-pham" method="post">
                                            <input type="hidden" name="id" value="${sp.getMasp()}">
                                            <input type="hidden" name="action" value="action2">
                                            <button style="submit" name="action" class="btn btn-primary size d-flex align-items-center justify-content-center">
                                                <i class="fas fa-tools"></i>
                                            </button>
                                        </form>
                                    </td>
                                    <td>
                                        <form action="Danh-sach-san-pham" method="post">
                                            <input type="hidden" name="id" value="${sp.getMasp()}">
                                            <input type="hidden" name="action" value="action3">
                                            <button style="submit" name="action" class="btn btn-danger size d-flex align-items-center justify-content-center">
                                                <i class="fa fa-trash-alt"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
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
            
            <form id="myForm" action="Danh-sach-san-pham" method="post" enctype="multipart/form-data" style="weight:300px;">
                <input type="hidden" name="action" value="action4">
                <div class="text-center title">Thêm sản phẩm</div>
                <!-- Nội dung form -->
                <div class="container-fluid m-0 p-0">
                    <div class="row">
                        <div class="col-md-6">
                            Tên sản phẩm
                            <br><input class="m-1" stype="text" name="tensp" cols="30"><br>
                            Loại sản phẩm
                            <br><select class="m-1" id="loai" name="cars">
                                <%List<loaisanpham> list=new loaisanphamDAO().findAll();
                                for (loaisanpham a:list){%>
                                <option value="<%=a.getMaloai()%>"><%=a.getTenloai()%></option>
                                <%}%>
                            </select><br>
                            Mô tả
                            <br><textarea style="resize:none;" class="m-1" name="mota" row="4" cols="30"></textarea><br>

                            <button style="width: 100px;" type="submit" class="btn btn-primary" id="submit">Xác nhận</button>
                            <button style="width: 100px;" type="button" class="btn btn-danger ms-4" id="cancel">Huỷ</button>
                        </div>
                        <div class="col-md-6">
                            <div class="container m-2">
                                <div class="form-group d-flex align-items-center justify-content-center" onclick="chooseFile()">
                                    <div id="image-container" class="d-flex align-items-center justify-content-center">
                                        <img id="selected-image" src="#" alt="Selected Image" class="img-thumbnail">
                                        <input type="file" name="hinhanh" id="file-input" style="display: none;" class="form-control-file" onchange="displayImage()">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <form id="myFormFix" action="Danh-sach-san-pham" method="post" enctype="multipart/form-data" style="weight:300px;">
                <input type="hidden" name="action" value="action4">
                <div class="text-center title">Sửa sản phẩm</div>
                <!-- Nội dung form -->
                <div class="container-fluid m-0 p-0">
                    <div class="row">
                        <c:set var="myVariable" value="${requestScope.myValue}" />
                        <div class="col-md-6">
                            Tên sản phẩm
                            <br><input class="m-1" stype="text" name="tensp" cols="30"><br>
                            Loại sản phẩm
                            <br><select class="m-1" id="loai" name="cars">
                                <%List<loaisanpham> list1=new loaisanphamDAO().findAll();
                                for (loaisanpham a:list1){%>
                                <option value="<%=a.getMaloai()%>"><%=a.getTenloai()%></option>
                                <%}%>
                            </select><br>
                            Mô tả
                            <br><textarea style="resize:none;" class="m-1" name="mota" row="4" cols="30"></textarea><br>

                            <button style="width: 100px;" type="submit" class="btn btn-primary" id="submit">Xác nhận</button>
                            <button style="width: 100px;" type="button" class="btn btn-danger ms-4" id="cancel">Huỷ</button>
                        </div>
                        <div class="col-md-6">
                            <div class="container m-2">
                                <div class="form-group d-flex align-items-center justify-content-center" onclick="chooseFile()">
                                    <div id="image-container" class="d-flex align-items-center justify-content-center">
                                        <img id="selected-image" src="#" alt="Selected Image" class="img-thumbnail">
                                        <input type="file" name="hinhanh" id="file-input" style="display: none;" class="form-control-file" onchange="displayImage()">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <script>
                function updateStyle(value) {
                    var selectedStyleElement = document.getElementById("selectedStyle");
                    var hiddenStyleInput = document.getElementById("hiddenStyle");

                    selectedStyleElement.innerHTML = value;

                    // Cập nhật giá trị trong input hidden
                    hiddenStyleInput.value = value;
                }

                $(document).ready(function () {
                    $("#toggleForm").click(function () {
                        $("#myForm").fadeToggle();
                        resetForm();
                    });

                    $("#cancel").click(function () {
                        $("#myForm").fadeToggle();
                        resetForm();
                    });
                    $("#Fix").click(function () {
                        $("#myFormFix").fadeToggle();
                        resetForm();
                    });


                });

                function chooseFile() {
                    document.getElementById('file-input').click();
                }

                function displayImage() {
                    var input = document.getElementById('file-input');
                    var imageContainer = document.getElementById('image-container');
                    var selectedImage = document.getElementById('selected-image');
                    var uploadIcon = document.getElementById('upload-icon');

                    var file = input.files[0];

                    if (file) {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            selectedImage.src = e.target.result;
                            uploadIcon.style.display = 'none';
                        };
                        reader.readAsDataURL(file);
                    } else {
                        selectedImage.src = '#';
                        uploadIcon.style.display = 'block';
                    }
                }

                function resetForm() {
                    // Thiết lập giá trị các trường form về rỗng
                    document.getElementsByName('tensp')[0].value = '';
                    document.getElementById('loai').value = 'IP';
                    document.getElementsByName('mota')[0].value = '';
                    document.getElementById('selected-image').src = '#';
                }


            </script>
    </body>
</html>
