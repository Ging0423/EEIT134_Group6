<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!doctype html>
<html lang="zxx">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>loop</title>
<link rel="icon" href="<c:url value='/img/favicon.png'/>">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>">
<!-- animate CSS -->
<link rel="stylesheet" href="<c:url value='/css/animate.css'/>">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="<c:url value='/css/owl.carousel.min.css'/>">
<!-- font awesome CSS -->
<link rel="stylesheet" href="<c:url value='/css/all.css'/>">
<!-- flaticon CSS -->
<link rel="stylesheet" href="<c:url value='/css/flaticon.css'/>">
<link rel="stylesheet" href="<c:url value='/css/themify-icons.css'/>">
<!-- font awesome CSS -->
<link rel="stylesheet" href="<c:url value='/css/magnific-popup.css'/>">
<!-- swiper CSS -->
<link rel="stylesheet" href="<c:url value='/css/slick.css'/>">
<!-- style CSS -->
<link rel="stylesheet" href="<c:url value='/css/style.css'/>">
</head>

<body>
	<!--::header part start::-->
	<header class="main_menu home_menu">
		<div class="container">
			<div class="row align-items-center justify-content-center">
				<div class="col-lg-12">
					<nav class="navbar navbar-expand-lg navbar-light">

						<a class="navbar-brand" href="<c:url value='/'/>"> <img
							src='<c:url value="/img/logo.png"/>' alt="logo">
						</a>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="menu_icon"><i class="fas fa-bars"></i></span>
						</button>

						<div class="collapse navbar-collapse main-menu-item"
							id="navbarSupportedContent">
							<ul class="navbar-nav">
								<li class="nav-item"><a class="nav-link"
									href="<c:url value='/'/>">首頁</a></li>
								<li class="nav-item"><a class="nav-link" href="<c:url value='about'/>">關於</a>
								</li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="blog.html"
									id="navbarDropdown_1" role="button" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> 商品 </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
										<a class="dropdown-item" href="<c:url value='/items/yarn'/>">紗線</a>
										<a class="dropdown-item" href="<c:url value='/items/tools'/>">工具</a>
										<a class="dropdown-item" href="<c:url value='/items/books'/>">書籍</a>
										<a class="dropdown-item" href="<c:url value='/items/kits'/>">材料包</a>
									</div>
								</li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="blog.jsp"
									id="navbarDropdown_3" role="button" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> 會員 </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
										<c:if test="${empty isLogin}">
											<a class="dropdown-item" href="<c:url value='/login'/>">
												登入 </a>
										</c:if>
										<c:if test="${isLogin != null}">
											<a class="dropdown-item"
												href="<c:url value='/cart/display'/>">購物車</a>
											<a class="dropdown-item"
												href="<c:url value='/order/myorder'/>">我的訂單</a>
											<a class="dropdown-item"
												href="<c:url value='updatemember'/>">會員資料修改</a>
										</c:if>
										<c:if test="${isLogin != null && isLogin.userIdentity == '0'}">
											<a class="dropdown-item" href="<c:url value='/backend'/>">後台管理</a>
										</c:if>
									</div></li>

								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="blog.html"
									id="navbarDropdown_2" role="button" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> 討論區 </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
										<a class="dropdown-item" href="blog.html"> 討論區</a> 
										<a class="dropdown-item" href="single-blog.html">Single blog</a>
									</div>
								</li>

								<li class="nav-item"><a class="nav-link"
									href="<c:url value='/video'/>">教學影片</a></li>

								<c:if test="${isLogin != null}">
									<li class="nav-item"><div>
											<a href="<c:url value='/logout'/>" class="nav-link">登出</a>
										</div></li>
								</c:if>

							</ul>
						</div>
						<div>

							<c:if test="${isLogin != null}">
								<h5>Hi ${isLogin.userName}</h5>
							</c:if>
						</div>
						<div class="hearer_icon d-flex align-items-center">
							<a id="search_1" href="javascript:void(0)"><i
								class="ti-search"></i></a> <a href="<c:url value='/cart/display'/>">
								<i class="flaticon-shopping-cart-black-shape"></i>
							</a>
						</div>
					</nav>
				</div>
			</div>
		</div>
		<div class="search_input" id="search_input_box">
			<div class="container ">
				<form class="d-flex justify-content-between search-inner">
					<input type="text" class="form-control" id="search_input"
						placeholder="Search Here">
					<button type="submit" class="btn"></button>
					<span class="ti-close" id="close_search" title="Close Search"></span>
				</form>
			</div>
		</div>
	</header>