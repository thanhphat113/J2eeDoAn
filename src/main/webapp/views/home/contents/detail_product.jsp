<%-- 
    Document   : detail_product
    Created on : Dec 14, 2023, 2:52:19 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.sanpham, DAO.sanphamDAO" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/detail_product.css">
        <script src="https://cdn.tailwindcss.com"></script>
        <title>Document</title>
    </head>
    <body>
        <%String masp=request.getParameter("productId");
            int a = Integer.parseInt(request.getParameter("choise"));
//        if(a == null||a == ""||a.equals(null)){
//            a=0;
//        }
        if (masp != null) {
            List<sanpham> list=new sanphamDAO().findById2(masp);
            if (!list.isEmpty()) {
            sanpham sp = list.get(a);
        %>
        <div class="bg-gray-100 py-6">
            <div class="bg-white p-4">
                <div class="px-[10%]">
                    <div class="grid grid-cols-12 gap-4 mb-7">
                        <div class="col-span-5">
                            <div class="relative pt-[100%] w-full shadow">
                                <img
                                    class="absolute top-0 left-0 w-full h-full bg-white object-cover"
                                    src="images<%=sp.getHinhanh()%>"
                                    alt="product detail img"
                                    />
                            </div>
                        </div>
                        <div class="col-span-7 pl-4">
                            <div class="text-black text-[24px] mt-2" >
                                <%=sp.getTenSP()%>
                            </div>

                            <div class="px-5 py-4 text-[#338dbc]">
                                <span class="item-price text-primary" id="gia"><%=sp.getGia()%></span>
                            </div>
                            <form action="/Trang-chu/Chi-tiet?productId=<%=masp%>" method="post">
                                <ul class="nav">
                                    <% for (int i = 0; i < list.size(); i++) {
                                            sanpham sp1 = list.get(i);%>
                                    <li class="nav-item hover">
                                        <a class="nav-link" href="Detail-Product?productId=<%=masp%>&choise=<%=i%>&productCT=<%=sp1.getMaCT()%>"><%=sp1.getMau()%></a>
                                    </li>
                                    <% } %>
                                </ul>
                            </form>
                            <div class="pt-4 grid grid-cols-8 px-5 text-gray-600">
                                <span class="col-span-2 text-base">Số lượng</span>
                                <div class="col-span-6 flex">
                                    <div class="flex">
                                        <button class="bg-white border px-[6px] py-[1px]" onclick="decrement()">
                                            <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                fill="none"
                                                viewBox="0 0 24 24"
                                                strokeWidth="1.5"
                                                stroke="currentColor"
                                                class="w-3 h-6 text-black"
                                                >
                                            <path
                                                strokeLinecap="round"
                                                strokeLinejoin="round"
                                                d="M19.5 12h-15"
                                                />
                                            </svg>
                                        </button>
                                        <input
                                            type="text"
                                            id="quantityInput"
                                            class="border border-l-0 border-r-0 text-center w-[40%] focus:border-transparent"
                                            value="1"
                                            max="<%=sp.getSoluong()%>"
                                            oninput="validateQuantity()"
                                            />

                                        <button class="bg-white border px-[6px] py-[1px]" onclick="increment()">
                                            <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                fill="none"
                                                viewBox="0 0 24 24"
                                                strokeWidth="1.5"
                                                stroke="currentColor"
                                                class="w-3 h-6 text-black"
                                                >
                                            <path
                                                strokeLinecap="round"
                                                strokeLinejoin="round"
                                                d="M12 4.5v15m7.5-7.5h-15"
                                                />
                                            </svg>
                                        </button>
                                        <script>
                                            function validateQuantity() {
                                                var inputElement = document.getElementById("quantityInput");
                                                var currentValue = parseInt(inputElement.value, 10);
                                                var max = <%=sp.getSoluong()%>;
                                                var errorElement = document.getElementById("quantityError");
                                                if (currentValue > max) {
                                                    errorElement.innerText = "Số lượng không được lớn hơn " + max + ".";
                                                    inputElement.value = max;
                                                } else {
                                                    errorElement.innerText = ""; // Xóa thông báo nếu có
                                                }
                                            }
                                            function increment() {
                                                var inputElement = document.getElementById("quantityInput");
                                                var currentValue = parseInt(inputElement.value, 10);
                                                var max = <%=sp.getSoluong()%>;

                                                if (max > currentValue) {
                                                    inputElement.value = currentValue + 1;
                                                } else {
                                                    alert("Số lượng vượt quá giới hạn.");
                                                }
                                                validateQuantity();
                                            }

                                            function decrement() {
                                                var inputElement = document.getElementById("quantityInput");
                                                var currentValue = parseInt(inputElement.value, 10);
                                                if (currentValue > 1) {
                                                    inputElement.value = currentValue - 1;
                                                }
                                                validateQuantity();
                                            }

                                        </script>
                                    </div>
                                    <div class="col-span-1 text-sm" id="quan"><%=sp.getSoluong()%> sản phẩm có sẵn</div>
                                </div>
                            </div>
                            <div id="quantityError" class="text-red-500"></div>
                            <div class="px-5 py-4 flex mt-8">
                                <button
                                    class="border border-[#338dbc] bg-[#338dbc]/20 flex p-3 rounded-sm cursor-pointer"
                                    >
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        fill="none"
                                        viewBox="0 0 24 24"
                                        strokeWidth="1.4"
                                        stroke="currentColor"
                                        class="w-6 h-6 text-[#338dbc] mr-3"
                                        >
                                    <path
                                        strokeLinecap="round"
                                        strokeLinejoin="round"
                                        d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 00-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 00-16.536-1.84M7.5 14.25L5.106 5.272M6 20.25a.75.75 0 11-1.5 0 .75.75 0 011.5 0zm12.75 0a.75.75 0 11-1.5 0 .75.75 0 011.5 0z"
                                        />
                                    </svg>

                                    <a href="CartServlet?action=AddToCart&productid=<%=sp.getMaCT()%>" class="text-[#338dbc]">Thêm vào giỏ hàng</a>
                                </button>
                                <a href="/cart/a">
                                    <button
                                        class="bg-[#338dbc] text-white px-10 py-3 ml-5 cursor-pointer"
                                        >
                                        Mua ngay
                                    </button>
                                </a>
                            </div>
                        </div>
                    </div>
                    <span class="text-[24px] mb-7">Thông tin chi tiết</span>
                    <div class="mt-10 bg-white text-sm w-[80%]">
                        <%=sp.getMota()%>
                    </div>
                </div>
            </div>
        </div>
        <%
            }} else {
        %>
        <p>Không tìm thấy thông tin sản phẩm.</p>
        <%}%>

    </body>
</html>
