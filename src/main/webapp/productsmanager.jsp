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
    </head>
    <body class="bg-light">

        <!--Sản phẩm-->
        <div class="container rounded ml-3 col-md-10">
            <div class="text-center title">Danh sách sản phẩm</div>
            <div class="container mt-3">
                <div class="col-md-6">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Tìm kiếm">
                        <button class="btn btn-success bg-blue" type="submit">Tìm kiếm</button>
                    </div>
                </div>
            </div>
            <div class="container mt-1">
                <div class="list-group overflow-auto border border-secondary" style="max-height: 600px;height: 600px;">
                    <table class="table table-striped">
                        <tr class="bg-grey">
                            <th></th>
                            <th>Hình ảnh</th>
                            <th>Mã sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Loại Sản Phẩm</th>
                            <th>Mô tả</th>
                            <th>Sửa</th>
                            <th>Xóa</th>
                        </tr>
                        
                        
                        <%List<sanpham> list = new sanphamDAO().findAll();
                            for(sanpham sp:list){
                        %>
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
                                <td><img src="images<%=sp.getHinhanh()%>" style="height: 40px;width: 30px;" alt="<%=sp.getTensp()%>" class="img-fluid"></td>
                                <td><%=sp.getMasp()%></td>
                                <td><%=sp.getTensp()%></td>
                                <td><%=new loaisanphamDAO().findById(sp.getMaloai()).getTenloai()%></td>
                                <td><%=sp.getMota()%></td>
                                <td>
                                    <form action="edit" method="post">
                                        <div class="d-flex justify-content-center"><a href="#" class="btn btn-primary size d-flex align-items-center justify-content-center"><i
                                                    class="fa fa-pencil-alt"></i></a></div>
                                    </form>
                                </td>
                                <td>
                                    <form action="deletePd" method="post">
                                        <input type="hidden" name="id" value="<%=sp.getMasp()%>">
                                        <button style="sumit" name="action" class="btn btn-danger size d-flex align-items-center justify-content-center">
                                            <i class="fa fa-trash-alt"></i>
                                        </button>

                                    </form>
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
                        class="fas fa-minus"></i>Xóa sản phẩm</button>
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
