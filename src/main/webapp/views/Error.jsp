<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.sanpham" %>
<%@ page import="DAO.sanphamDAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <div class="col-xxl-1 pb-3"></div>

            <%
                List<sanpham> sanphamList = new ArrayList();
                try {
                    sanphamDAO sp = new sanphamDAO();
                    sanphamList = sp.findAll();
                } catch (Exception e) {
                    out.println("Error occurred: " + e.getMessage());
                }

                if (sanphamList != null) {
                    for (sanpham product : sanphamList) {
            %>
            <p>Mã: <%= product.getMaSP() %> - Tên: <%= product.getTenSP() %></p>
            <%
                    }
                }
            %>

            <div class="col-xxl-1 pb-3"></div>
        </div>
    </div>
</body>
</html>
