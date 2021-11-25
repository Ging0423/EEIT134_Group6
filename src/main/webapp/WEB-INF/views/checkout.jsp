<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="zxx">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>pillloMart</title>
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
						<a class="navbar-brand" href="index.jsp"> <img
							src="<c:url value='/img/logo.png'/>" alt="logo">
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
								<li class="nav-item"><a class="nav-link" href="index.jsp">首頁</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="about.jsp">關於</a>
								</li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="blog.html"
									id="navbarDropdown_1" role="button" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> 商品 </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
										<a class="dropdown-item" href="<c:url value='/items/yarn'/>">線材</a>
										<a class="dropdown-item" href="<c:url value='/items/toold'/>">工具</a>
										<a class="dropdown-item" href="<c:url value='/items/books'/>">書籍</a>
										<a class="dropdown-item" href="<c:url value='/items/kits'/>">材料包</a> 
									</div></li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="blog.jsp"
									id="navbarDropdown_3" role="button" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> 會員 </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
										<a class="dropdown-item" href="login.jsp"> 登錄 </a> <a
											class="dropdown-item" href="checkout.jsp">商品結帳</a> <a
											class="dropdown-item" href="cart.jsp">購物車</a> <a
											class="dropdown-item" href="confirmation.jsp">我的訂單</a>
									</div></li>

								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="blog.html"
									id="navbarDropdown_2" role="button" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> 討論區 </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
										<a class="dropdown-item" href="blog.html"> 討論區</a> <a
											class="dropdown-item" href="single-blog.html">Single blog</a>
									</div></li>

								<li class="nav-item"><a class="nav-link"
									href="contact.html">教學影片</a></li>
							</ul>
						</div>
						<div class="hearer_icon d-flex align-items-center">
							<a id="search_1" href="javascript:void(0)"><i
								class="ti-search"></i></a> <a href="cart.jsp"> <i
								class="flaticon-shopping-cart-black-shape"></i>
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
	<!-- Header part end-->

	<!-- breadcrumb part start-->
	<section class="breadcrumb_part">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<h2>checkout</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb part end-->

	<!--================Checkout Area =================-->
	<section class="checkout_area section_padding">
		<div class="container">
			<div class="returning_customer">
				<div class="check_title">
					<h2>
						Returning Customer? <a href="#">Click here to login</a>
					</h2>
				</div>
				<p>If you have shopped with us before, please enter your details
					in the boxes below. If you are a new customer, please proceed to
					the Billing & Shipping section.</p>
				<form class="row contact_form" action="#" method="post"
					novalidate="novalidate">
					<div class="col-md-6 form-group p_star">
						<input type="text" class="form-control" id="name" name="name"
							value=" " /> <span class="placeholder"
							data-placeholder="Username or Email"></span>
					</div>
					<div class="col-md-6 form-group p_star">
						<input type="password" class="form-control" id="password"
							name="password" value="" /> <span class="placeholder"
							data-placeholder="Password"></span>
					</div>
					<div class="col-md-12 form-group">
						<button type="submit" value="submit" class="btn_3">log in
						</button>
						<div class="creat_account">
							<input type="checkbox" id="f-option" name="selector" /> <label
								for="f-option">Remember me</label>
						</div>
						<a class="lost_pass" href="#">Lost your password?</a>
					</div>
				</form>
			</div>
			<div class="cupon_area">
				<div class="check_title">
					<h2>
						Have a coupon? <a href="#">Click here to enter your code</a>
					</h2>
				</div>
				<input type="text" placeholder="Enter coupon code" /> <a
					class="tp_btn" href="#">Apply Coupon</a>
			</div>
			<div class="billing_details">
				<div class="row">
				<form:form class="row contact_form" method="post"
							novalidate="novalidate" modelAttribute="orderData">
					<div class="col-lg-8">
						<h3>Billing Details</h3>
						
							<div class="col-md-6 form-group p_star">
								<h4>收件人</h4>
								<form:input type="text" class="form-control" name="recipient"
									path="recipient" />
								
							</div>
							<div class="col-md-6 form-group p_star">
							<h4>聯絡方式</h4>
								<form:input type="text" class="form-control" path="tel" />
								
							</div>
							<div class="col-md-6 form-group p_star">
							<h4>收件地址</h4>
								<form:input type="text" class="form-control"
									path="shippingAddress" />
								
							</div>
					</div>
					<div class="col-lg-4">
						<div class="order_box">
							<h2>您的訂單</h2>
							<ul class="list">
								<li><a href="#">商品 <span>總金額</span>
								</a></li>
								<c:set var="subTotal" value="0" />
								<c:forEach var="item" items="${items}">
									<li><a href="#">${item.itemName} <span class="middle">x
												${item.qty}</span> <c:set var="total"
												value="${item.qty*item.price}" /> <span class="last">${total}</span>
									</a></li>
									<c:set var="subTotal" value="${subTotal + total}" />
								</c:forEach>

							</ul>
							<ul class="list list_2">
								<li> <a
									href="#">總額 <span>$${subTotal}</span>
								</a></li>
								<li><a href="#">運費 <span>Flat rate: $50.00</span>
								</a></li>
								<li><a href="#">總金額(含運費) <span>$${subTotal}</span>
								</a></li>
								<form:hidden class="form-control" name="total"
									path="total" value="${subTotal}"/>
							</ul>
							<a class="btn_3" href="#">Proceed to Paypal</a>
							
						</div>
						
					</div>
					</form:form>
				</div>
			</div>
		</div>
	</section>
	<!--================End Checkout Area =================-->

	<!--::footer_part start::-->
	<footer class="footer_part">
		<div class="footer_iner section_bg">
			<div class="container">
				<div class="row justify-content-between align-items-center">
					<div class="col-lg-8">
						<div class="footer_menu">
							<div class="footer_logo">
								<a href="index.html"><img src="img/logo.png" alt="#"></a>
							</div>
							<div class="footer_menu_item">
								<a href="index.html">Home</a> <a href="about.html">About</a> <a
									href="product_list.html">Products</a> <a href="#">Pages</a> <a
									href="blog.html">Blog</a> <a href="contact.html">Contact</a>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="social_icon">
							<a href="#"><i class="fab fa-facebook-f"></i></a> <a href="#"><i
								class="fab fa-instagram"></i></a> <a href="#"><i
								class="fab fa-google-plus-g"></i></a> <a href="#"><i
								class="fab fa-linkedin-in"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="copyright_part">
			<div class="container">
				<div class="row ">
					<div class="col-lg-12">
						<div class="copyright_text">
							<P>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
									class="ti-heart" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</P>
							<div class="copyright_link">
								<a href="#">Turms & Conditions</a> <a href="#">FAQ</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--::footer_part end::-->

	<!-- jquery plugins here-->
	<script src="js/jquery-1.12.1.min.js"></script>
	<!-- popper js -->
	<script src="js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- easing js -->
	<script src="js/jquery.magnific-popup.js"></script>
	<!-- swiper js -->
	<script src="js/swiper.min.js"></script>
	<!-- swiper js -->
	<script src="js/mixitup.min.js"></script>
	<!-- particles js -->
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<!-- slick js -->
	<script src="js/slick.min.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/contact.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/mail-script.js"></script>
	<!-- custom js -->
	<script src="js/custom.js"></script>
</body>

</html>