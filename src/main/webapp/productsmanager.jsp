<%-- 
    Document   : newjsp
    Created on : 9 thg 12, 2023, 15:27:53
    Author     : lythanhphat9523
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css"/>
        <title>Document</title>
    </head>
    <body class="bg-light">
        <%@include file="Sidebar.jsp"%>
        <!--Sản phẩm-->
        <div class="container rounded ml-3 col-md-10">
            <div class="text-center title">Danh sách sản phẩm</div>
            <div class="container mt-3">
                <div class="row">
                    <div class="col-md-3">
                        <button type="button"
                                class="btn btn-secondary btn-fixed-size dropdown-toggle bg-white text-body"
                                id="dropdownMenuButton1" data-bs-toggle="dropdown">
                            --Kiểu tìm kiếm--
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item"
                                   onclick="updateButtonText('--Kiểu tìm kiếm--', 'dropdownMenuButton1')">--Không--</a>
                            </li>
                            <li><a class="dropdown-item"
                                   onclick="updateButtonText('Mã sản phẩm', 'dropdownMenuButton1')">Mã
                                    sản phẩm</a></li>
                            <li><a class="dropdown-item"
                                   onclick="updateButtonText('Tên sản phẩm', 'dropdownMenuButton1')">Tên sản
                                    phẩm</a>
                            </li>
                            <li><a class="dropdown-item" onclick="updateButtonText('Màu sắc', 'dropdownMenuButton1')">Màu
                                    sắc</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3">
                        <button type="button"
                                class="btn btn-secondary btn-fixed-size dropdown-toggle bg-white text-body"
                                id="dropdownMenuButton2" data-bs-toggle="dropdown">
                            --Mức giá--
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item"
                                   onclick="updateButtonText('--Mức giá--', 'dropdownMenuButton2')">--Không--</a>
                            </li>
                            <li><a class="dropdown-item"
                                   onclick="updateButtonText('Dưới 10.000.000 vnđ', 'dropdownMenuButton2')">Dưới
                                    10.000.000
                                    vnđ</a></li>
                            <li><a class="dropdown-item"
                                   onclick="updateButtonText('Dưới 20.000.000 vnđ', 'dropdownMenuButton2')">Dưới
                                    20.000.000
                                    vnđ</a></li>
                            <li><a class="dropdown-item"
                                   onclick="updateButtonText('trên 20.000.000 vnđ', 'dropdownMenuButton2')">Trên
                                    20.000.000
                                    vnđ</a></li>
                        </ul>
                    </div>
                    <div class="col-md-6">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Tìm kiếm">
                            <button class="btn btn-success bg-blue" type="submit">Tìm kiếm</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container mt-1">
                <div class="list-group overflow-auto border border-secondary" style="max-height: 600px;height: 600px;">
                    <table class="table table-striped">
                        <tr class="bg-grey">
                            <th></th>
                            <th>Hình ảnh</th>
                            <th>Tên sản phẩm</th>
                            <th>Mã sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Màu sắc</th>
                            <th>Giá bán</th>
                            <th>Mô tả</th>
                            <th>Sửa</th>
                            <th>Xóa</th>
                        </tr>

                        <%List<sanpham> list=new sanphamDAO().findAll();
                                for(sanpham sp:list){%>
                        <tr>
                            <td>
                                <div class="d-flex justify-content-center">
                                    <button type="button" id="toggleButton"
                                            class="size btn btn-light border rounded-circle d-flex align-items-center justify-content-center"
                                            autocomplete="">
                                        <i id="toggleIcon" class="fas fa-dash"></i>
                                    </button>
                                </div>
                            </td>
                            <td><img src="images<%=sp.getHinhanh()%>" style="height: 40px;width: 30px;" alt="<%=sp.getTenSP()%>" class="img-fluid"></td>
                            <td><%=sp.getTenSP()%></td>
                            <td><%=sp.getMaSP()%></td>
                            <td><%=sp.getSoluong()%></td>
                            <td><%=sp.getMau()%></td>
                            <td><%=sp.getGia()%></td>
                            <td><%=sp.getMota()%></td>
                            <!-- Sửa mã để sử dụng biểu tượng FontAwesome -->
                            <!-- Sửa mã để sử dụng biểu tượng FontAwesome -->
                            <td>
                                <div class="d-flex justify-content-center"><a href="#"
                                                                              class="btn btn-primary size d-flex align-items-center justify-content-center"><i
                                            class="fa fa-pencil-alt"></i></a></div>
                            </td>
                            <td>
                                <div class="d-flex justify-content-center"><a href="#"
                                                                              class="btn btn-danger size d-flex align-items-center justify-content-center"><i
                                            class="fa fa-trash-alt"></i></a></div>
                            </td>
                        </tr>
                        <%}%>
                    </table>
                </div>
            </div>
            <div class="d-grid">
                <button type="button" class="btn btn-primary btn-block m-2 bg-blue"><i class="fas fa-plus"></i>
                    Thêm
                    sản
                    phẩm</button>
                <button type="button" class="btn btn-primary btn-block ms-2 me-2 mb-2 bg-blue"><i
                        class="fas fa-minus"></i>
                    Xóa
                    sản
                    phẩm</button>
            </div>
        </div>
    </div>
</div>

<script>
    const toggleButtons = document.querySelectorAll('#toggleButton');

    toggleButtons.forEach((button) => {
        const toggleIcon = button.querySelector('i');

        button.addEventListener('click', function () {
            button.classList.toggle('active');
            toggleIcon.classList.toggle('fa-check');
            toggleIcon.classList.toggle('fa-dash');
        });
    });

    function updateButtonText(selectedText, id) {
        document.getElementById(id).innerText = selectedText;
    }

</script>
</body>
</html>
