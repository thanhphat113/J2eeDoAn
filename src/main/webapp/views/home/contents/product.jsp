<%-- 
    Document   : product
    Created on : Nov 27, 2023, 2:34:57 PM
    Author     : ACER
--%>
<%@page import="model.sanpham,DAO.sanphamDAO,java.util.List,java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section id="mobile-products" class="product-store position-relative padding-large no-padding-top">
        <div class="container">
            <div class="row">
                <div class="display-header d-flex justify-content-between pb-3">
                    <h2 class="display-7 text-dark text-uppercase">Iphone</h2>
                    <div class="btn-right">
                        <a href="shop.html" class="btn btn-medium btn-normal text-uppercase">Go to Shop</a>
                    </div>
                </div>
                <div class="swiper product-swiper">
                    <div class="swiper-wrapper">
                        <%
                        List<sanpham> listIP = new sanphamDAO().findByStyle("IP");
                        for (sanpham product:listIP){
                        %>
                        <div class="swiper-slide">
                            <div class="product-card position-relative">
                                <div class="image-holder">
                                    <img src="images<%=product.getHinhanh()%>" alt="product-item" class="img-fluid">
                                </div>
                                <div class="cart-concern position-absolute">
                                    <div class="cart-button d-flex">
                                        <a href="#" class="btn btn-medium btn-black">Add to Cart<svg class="cart-outline"><use xlink:href="#cart-outline"></use></svg></a>
                                    </div>
                                </div>
                                <div class="card-detail d-flex justify-content-between align-items-baseline pt-3">
                                    <h3 class="card-title text-uppercase">
                                        <a href="#"><%=product.getTenSP()%></a>
                                    </h3>

                                </div>
                                <span class="item-price text-primary"><%=product.getGia()%></span>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
        <div class="swiper-pagination position-absolute text-center"></div>
    </section>
    <section id="smart-watches" class="product-store padding-large position-relative">
        <div class="container">
            <div class="row">
                <div class="display-header d-flex justify-content-between pb-3">
                    <h2 class="display-7 text-dark text-uppercase">Samsung</h2>
                    <div class="btn-right">
                        <a href="shop.html" class="btn btn-medium btn-normal text-uppercase">Go to Shop</a>
                    </div>
                </div>
                <div class="swiper product-watch-swiper">
                    <div class="swiper-wrapper">
                        <%
                        List<sanpham> listSS = new sanphamDAO().findByStyle("SS");
                        for (sanpham product:listSS){
                        %>
                        <div class="swiper-slide">
                            <div class="product-card position-relative">
                                <div class="image-holder">
                                    <img src="images<%=product.getHinhanh()%>" alt="product-item" class="img-fluid">
                                </div>
                                <div class="cart-concern position-absolute">
                                    <div class="cart-button d-flex">
                                        <a href="#" class="btn btn-medium btn-black">Add to Cart<svg class="cart-outline"><use xlink:href="#cart-outline"></use></svg></a>
                                    </div>
                                </div>
                                <div class="card-detail d-flex justify-content-between align-items-baseline pt-3">
                                    <h3 class="card-title text-uppercase">
                                        <a href="#"><%=product.getTenSP()%></a>
                                    </h3>

                                </div>
                                <span class="item-price text-primary"><%=product.getGia()%></span>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
        <div class="swiper-pagination position-absolute text-center"></div>
    </section>
