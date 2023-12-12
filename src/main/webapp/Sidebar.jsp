<%-- 
    Document   : Sidebar
    Created on : 11 thg 12, 2023, 20:54:25
    Author     : lythanhphat9523
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<div class="container-fluid">
		<div class="row flex-nowrap">
			<div class="bg-dark col-auto min-vh-100 d-flex flex-column justify-content-between col-md-2">
				<div class="bg-dark p-2">
					<a class="d-flex text-decoration-none mt-1 align-items-center text-white">
						<i class="fa-solid fa-bars"></i><span class="ms-2 fs-4 d-none d-sm-inline">Menu</span>
					</a>
					<ul class="nav ms-2 nav-pills flex-column mt-4">
						<li class="nav-item py-2 py-sm-0">
                                                    <a href="/San-pham" class="nav-link text-white">
								<i class="fs-5 fas fa-shopping-cart"></i><span class="fs-4 ms-2 d-none d-sm-inline">Product</span>
							</a>
						</li>
						<li class="nav-item py-2 py-sm-0">
							<a href="#" class="nav-link text-white">
								<i class="fs-5 fas fa-gauge"></i><span class="fs-4 ms-2 d-none d-sm-inline">Dashboard</span>
							</a>
						</li>
						<li class="nav-item disabled">
							<a href="#" class="nav-link">Disabled</a>
						</li>
					</ul>
					
				</div>
				<div class="dropdown open p-3">
					<button
						class="btn border-none dropdown-toggle text-white" 
						type="button"
						id="triggerId"
						data-bs-toggle="dropdown"
						aria-haspopup="true"
						aria-expanded="false"
					>
						<i class="fas fa-user"></i><span class="ms-2">Xin chào, </span>
					</button>
					<div class="dropdown-menu" aria-labelledby="triggerId">
						<a class="dropdown-item" href="#">Hồ sơ</a>
                                                <a href="/Trang-chu" class="dropdown-item"><i class="fas fa-sign-out-alt"></i><span class="ms-2">Đăng xuất</span></a>
					</div>
				</div>
			</div>
</body>
</html>
