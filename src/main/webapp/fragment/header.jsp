<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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
									href="<c:url value='/'/>">??????</a></li>
								<li class="nav-item"><a class="nav-link"
									href="<c:url value='about'/>">??????</a></li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="blog.html"
									id="navbarDropdown_1" role="button" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> ?????? </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
										<a class="dropdown-item" href="<c:url value='/items/yarn'/>">??????</a>
										<a class="dropdown-item" href="<c:url value='/items/tools'/>">??????</a>
										<a class="dropdown-item" href="<c:url value='/items/books'/>">??????</a>
										<a class="dropdown-item" href="<c:url value='/items/kits'/>">?????????</a>
									</div></li>
								<c:choose>
									<c:when test="${isLogin != null}">
										<li class="nav-item dropdown"><a
											class="nav-link dropdown-toggle" href="blog.jsp"
											id="navbarDropdown_3" role="button" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"> ?????? </a>
											<div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
												<a class="dropdown-item"
													href="<c:url value='/cart/display'/>">?????????</a> <a
													class="dropdown-item"
													href="<c:url value='/order/myorder'/>">???????????? </a> <a
													class="dropdown-item"
													href="<c:url value='/forum/myforum'/>">????????????</a> <a
													class="dropdown-item" href="<c:url value='updatemember'/>">??????????????????</a>
												<c:if
													test="${isLogin != null && isLogin.userIdentity == '0'}">
													<a class="dropdown-item" target="_blank" href="<c:url value='/backend'/>">????????????</a>
												</c:if>
											</div></li>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
								<li class="nav-item"><a class="nav-link"
									href="<c:url value='/forum'/>">?????????</a></li>

								<li class="nav-item"><a class="nav-link"
									href="<c:url value='/video'/>">????????????</a></li>
									
								<%-- <li class="nav-item"><a class="nav-link"
									href="<c:url value='/items/useritems'/>">??????????????????</a></li> --%>


								<c:choose>
									<c:when test="${empty isLogin}">
										<li class="nav-item"><a class="nav-link"
											href="<c:url value='/login'/>">??????</a></li>
									</c:when>
									<c:otherwise>
										<li class="nav-item"><a class="nav-link"
											href="<c:url value='/logout'/>">??????</a></li>
									</c:otherwise>
								</c:choose>

							</ul>
						</div>
						<div>

							<c:if test="${isLogin != null}">
								<h5>Hi, ${isLogin.userName}</h5>
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