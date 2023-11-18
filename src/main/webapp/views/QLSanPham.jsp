<%-- 
    Document   : QLSanPham
    Created on : 6 thg 11, 2023, 21:10:39
    Author     : lythanhphat9523
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.sanpham,DAO.sanphamDAO,java.util.List,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-fluid">
            <img src="pictures/banner.png" alt="banner" class="w-100"/>
        </div>

        <div class="container pt-3">
            <div class="row">
                <div class=" col-xxl-1 pb-3"></div>
                
                <c:forEach var="product" items="${sanphamList}">
                    <div class="col-6 col-md-3 col-xxl-2 pb-3">
                            <div class="card">
                                <img src="pictures/iphone-15.jpeg" alt="" class="card-img-top img-fluid imgcrop"/>
                                <div class="card-body">
                                    <h4 class="card-title">${product.getTenSP()}</h4>
                                </div>
                            </div>
                        </div>
                </c:forEach>
                <div class=" col-xxl-1 pb-3"></div>
            </div>
        </div>


        <!--
                        <div class="col-6 col-md-3 col-xxl-2 pb-3">
                            <div class="card">
                                <img src="pictures/iphone-15.jpeg" alt="" class="card-img-top img-fluid imgcrop"/>
                                <div class="card-body">
                                    <h4 class="card-title">picture 2</h4>
                                </div>
                            </div>
                        </div>
        
                        <div class="col-6 col-md-3 col-xxl-2 pb-3">
                            <div class="card">
                                <img src="pictures/iphone-15.jpeg" alt="" class="card-img-top img-fluid imgcrop"/>
                                <div class="card-body">
                                    <h4 class="card-title">picture 1</h4>
                                </div>
                            </div>
                        </div>
        
                        <div class="col-6 col-md-3 col-xxl-2 pb-3">
                            <div class="card">
                                <img src="pictures/iphone-15.jpeg" alt="" class="card-img-top img-fluid imgcrop"/>
                                <div class="card-body">
                                    <h4 class="card-title">picture 2</h4>
                                </div>
                            </div>
                        </div>
        
                        <div class="col-6 col-md-3 col-xxl-2 pb-3">
                            <div class="card">
                                <img src="pictures/iphone-15.jpeg" alt="" class="card-img-top img-fluid imgcrop"/>
                                <div class="card-body">
                                    <h4 class="card-title">picture 2</h4>
                                </div>
                            </div>
                        </div>
        
                        
        
        -->

    </body>
</html>
