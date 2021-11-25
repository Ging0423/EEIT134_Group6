<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="zxx">
<c:url value='' />
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
		<section class="product_list section_padding">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="product_sidebar">
						<div class="single_sedebar">
							<form action="#">
								<input type="text" name="#" placeholder="Search keyword">
								<i class="ti-search"></i>
							</form>
						</div>
						<div class="single_sedebar">
							<div class="select_option">
								<div class="select_option_list">
									Category <i class="right fas fa-caret-down"></i>
								</div>
								<div class="select_option_dropdown">
									<p>
										<a href="#">Category 1</a>
									</p>
									<p>
										<a href="#">Category 2</a>
									</p>
									<p>
										<a href="#">Category 3</a>
									</p>
									<p>
										<a href="#">Category 4</a>
									</p>
								</div>
							</div>
						</div>
						<div class="single_sedebar">
							<div class="select_option">
								<div class="select_option_list">
									Type <i class="right fas fa-caret-down"></i>
								</div>
								<div class="select_option_dropdown">
									<p>
										<a href="#">Type 1</a>
									</p>
									<p>
										<a href="#">Type 2</a>
									</p>
									<p>
										<a href="#">Type 3</a>
									</p>
									<p>
										<a href="#">Type 4</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-8">
					<div class="product_list">
						<div class="row">
							<c:forEach var="item" items='${allItem}'>
								<div class="col-lg-6 col-sm-6">
									<div class="single_product_item">
<!-- 										<img src="" alt="#" class="img-fluid"> -->
                                            <a href='<c:url value="/items/yarn/${item.itemId}"/>'><img src=""></a>
										<h3>
											<a href='<c:url value="/items/yarn/${item.itemId}"/>'>${item.itemName}</a>
										</h3>
<%-- 										<p>${item.material}</p> --%>
<%-- 										<p>${item.color}</p> --%>
									</div>
								</div>
							</c:forEach>


						</div>
						<div class="load_more_btn text-center">
							<a href="#" class="btn_3">Load More</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- product list part end-->

	<!-- feature part here -->
	<section class="feature_part section_padding">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-lg-6">
					<div class="feature_part_tittle">
						<h3>Credibly innovate granular internal or organic sources
							whereas standards.</h3>
					</div>
				</div>
				<div class="col-lg-5">
					<div class="feature_part_content">
						<p>Seamlessly empower fully researched growth strategies and
							interoperable internal or âorganicâ sources. Credibly
							innovate granular internal or âorganicâ sources whereas high
							standards in web-readiness.</p>
					</div>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-3 col-sm-6">
					<div class="single_feature_part">
						<img src="img/icon/feature_icon_1.svg" alt="#">
						<h4>Credit Card Support</h4>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="single_feature_part">
						<img src="img/icon/feature_icon_2.svg" alt="#">
						<h4>Online Order</h4>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="single_feature_part">
						<img src="img/icon/feature_icon_3.svg" alt="#">
						<h4>Free Delivery</h4>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="single_feature_part">
						<img src="img/icon/feature_icon_4.svg" alt="#">
						<h4>Product with Gift</h4>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- feature part end -->

	<!-- subscribe part here -->
	<section class="subscribe_part section_padding">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="subscribe_part_content">
						<h2>Get promotions & updates!</h2>
						<p>Seamlessly empower fully researched growth strategies and
							interoperable internal or âorganicâ sources credibly innovate
							granular internal .</p>
						<div class="subscribe_form">
							<input type="email" placeholder="Enter your mail"> <a
								href="#" class="btn_1">Subscribe</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- subscribe part end -->

	<!--::footer_part start::-->
	<footer class="footer_part">
		<div class="footer_iner">
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
	<script src="<c:url value='/js/jquery-1.12.1.min.js'/>"></script>
	<!-- popper js -->
	<script src="<c:url value='/js/popper.min.js'/>"></script>
	<!-- bootstrap js -->
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
	<!-- magnific popup js -->
	<script src="<c:url value='/js/jquery.magnific-popup.js'/>"></script>
	<!-- carousel js -->
	<script src="<c:url value='/js/owl.carousel.min.js'/>"></script>
	<script src="<c:url value='/js/jquery.nice-select.min.js'/>"></script>
	<!-- slick js -->
	<script src="<c:url value='/js/slick.min.js'/>"></script>
	<script src="<c:url value='/js/jquery.counterup.min.js'/>"></script>
	<script src="<c:url value='/js/waypoints.min.js'/>"></script>
	<script src="<c:url value='/js/contact.js'/>"></script>
	<script src="<c:url value='/js/jquery.ajaxchimp.min.js'/>"></script>
	<script src="<c:url value='/js/jquery.form.js'/>"></script>
	<script src="<c:url value='/js/jquery.validate.min.js'/>"></script>
	<script src="<c:url value='/js/mail-script.js'/>"></script>
	<!-- custom js -->
	<script src="<c:url value='/js/custom.js'/>"></script>
	<script type="text/javascript">
		
	</script>
</body>

</html>