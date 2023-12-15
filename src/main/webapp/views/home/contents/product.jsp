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
                <h2 class="display-7 text-dark text-uppercase">Product</h2>
            </div>
            <<form action="Trang-chu" method="post">
                <div class="swiper product-swiper">
                    <div class="swiper-wrapper">
                        <%
                        List<sanpham> list = new sanphamDAO().findAll();
                        for (sanpham product:list){
                        %>

                        <div class="swiper-slide"action>
                            <div class="product-card position-relative">
                                <div class="image-holder">
                                    <img src="images<%=product.getHinhanh()%>" alt="product-item" class="img-fluid">
                                </div>
                                <div class="cart-concern position-absolute">
                                    <div class="cart-button d-flex">
                                        <a href="/Trang-chu/Chi-tiet?productId=<%=product.getMasp()%>&choise=0" class="btn btn-medium btn-black">Add to Cart<svg class="cart-outline"><use xlink:href="#cart-outline"></use></svg></a>
                                    </div>
                                </div>
                                <div class="card-detail d-flex justify-content-between align-items-baseline pt-3">
                                    <h3 class="card-title text-uppercase align-content-center">
                                        <%=product.getTensp()%>
                                    </h3>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>

