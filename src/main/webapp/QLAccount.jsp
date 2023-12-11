
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up </title>
<%
    // Lấy thông báo từ session
    String loginSuccessMessage = (String)session.getAttribute("loginSuccessMessage");
    // Kiểm tra nếu thông báo tồn tại thì hiển thị nó
    if (loginSuccessMessage != null && !loginSuccessMessage.isEmpty()) {
%>
    <div class="alert alert-success">
        <%= loginSuccessMessage %>
    </div>
<%
    // Xóa thông báo khỏi session để tránh hiển thị nó lần tiếp theo
    session.removeAttribute("loginSuccessMessage");
}
%>
<!-- Font Icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link href="css/qlac.css" rel="stylesheet" type="text/css"/>



<link href="css/login.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    
  

	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
                                    <form>
                                    <h1>Quản lý Account</h1>

                                    <table border="1">
                                        <tr>
                                            <th>User ID</th>
                                            <th>Username</th>
                                            <th>Password</th>
                                            <th>Permission</th>
                                            <th>Status</th>
                                        </tr>

                                        <c:forEach items="${accounts}" var="account">
                                            <tr>
                                                <td>${account.userID}</td>
                                                <td>${account.username}</td>
                                                <td>${account.password}</td>
                                                     <c:choose>
                                                        <c:when test="${account.quyen == 1}">
                                                            <td>Admin</td>
                                                        </c:when>
                                                        <c:when test="${account.quyen == 2}">
                                                            <td>Nhân viên</td>
                                                        </c:when>
                                                        <c:when test="${account.quyen == 3}">
                                                            <td>Khách</td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td>Unknown</td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                            
                                             
                                                    <c:choose>
                                                        <c:when test="${account.trangThai == 1}">
                                                            <td>hoạt động</td>
                                                        </c:when>
                                                        <c:when test="${account.trangThai == 0}">
                                                            <td> đã ngừng</td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td>Unknown</td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                
                                                
                                                
                                                     <td>
                                                        <form action="qlac" method="post">
                                                            <input type="hidden" name="id" value="${account.userID}">
                                                            <button type="submit" name="action">Update</button>
                                                        </form>
                                                    </td>
                                                    <td>
                                                       <form action="deleteAc" method="post">
                                                            <input type="hidden" name="id" value="${account.userID}">
                                                            <button type="submit" name="action" value="delete">Delete</button>
                                                        </form>
                                                    </td>
                                            </tr>
                                        </c:forEach>
                                        </form>	
				</div>
			</div>
		</section>

	</div>


	<script src="vendor/jquery/jquery.min.js"></script>
	
        <script src="js/login.js" type="text/javascript"></script>
        
   
</body>

</html>