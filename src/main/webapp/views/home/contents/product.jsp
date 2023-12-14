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
<<<<<<< HEAD
            <<form action="Trang-chu" method="post">
                <div class="swiper product-swiper">
                    <div class="swiper-wrapper">
                        <%
                        List<sanpham> list = new sanphamDAO().findAllToIndex();
                        for (sanpham product:list){
                        %>

                        <div class="swiper-slide"action>
                            <div class="product-card position-relative">
                                <div class="image-holder">
                                    <img src="images<%=product.getHinhanh()%>" alt="product-item" class="img-fluid">
                                </div>
                                <div class="cart-concern position-absolute">
                                    <div class="cart-button d-flex">
                                        <a href="/Trang-chu/Chi-tiet?productId=<%=product.getMaSP()%>&choise=0" class="btn btn-medium btn-black">Add to Cart<svg class="cart-outline"><use xlink:href="#cart-outline"></use></svg></a>
                                    </div>
                                </div>
                                <div class="card-detail d-flex justify-content-between align-items-baseline pt-3">
                                    <h3 class="card-title text-uppercase align-content-center">
                                        <%=product.getTenSP()%>
                                    </h3>
=======
            <div class="swiper product-swiper">
                <div class="swiper-wrapper">
                    <%
                    List<sanpham> listIP = new sanphamDAO().findByStyle("IP");
                    for (sanpham product:listIP){
                    %>
                    <div class="swiper-slide">
                        <span id="product" style="display:none;"><%=product.getMaSP()%></span>
                        <div class="product-card position-relative">
                            <div class="image-holder">
                                <img src="images<%=product.getHinhanh()%>" alt="product-item" class="img-fluid">
                            </div>
                            <div class="cart-concern position-absolute">
                                <div class="cart-button d-flex">
                                    <a href="Detail-Product?productId=<%=product.getMaSP()%>&choise=0" class="btn btn-medium btn-black">Detail<svg class="cart-outline"><use xlink:href="#cart-outline"></use></svg></a>
                                    <!--<a href="CartServlet?action=AddToCart&productid=<%=product.getMaSP()%>" class="btn btn-medium btn-black">Add to Cart<svg class="cart-outline"><use xlink:href="#cart-outline"></use></svg></a>-->
>>>>>>> thuy
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
<<<<<<< HEAD
=======
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
                        <span id="product" style="display:none;"><%=product.getMaSP()%></span>
                        <div class="product-card position-relative">
                            <div class="image-holder">
                                <img src="images<%=product.getHinhanh()%>" alt="product-item" class="img-fluid">
                            </div>
                            <div class="cart-concern position-absolute">
                                <div class="cart-button d-flex">
                                    <a href="Detail-Product?productId=<%=product.getMaSP()%>&choise=0" class="btn btn-medium btn-black">Detail<svg class="cart-outline"><use xlink:href="#cart-outline"></use></svg></a>
                                </div>
                            </div>
                            <div class="card-detail d-flex justify-content-between align-items-baseline pt-3">
                                <h3 class="card-title text-uppercase">
                                    <a href="product.jsp?productId=<%=product.getMaSP()%>"><%=product.getTenSP()%></a>
                                </h3>
>>>>>>> thuy

