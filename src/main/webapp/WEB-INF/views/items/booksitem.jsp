<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!Doctype html>
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
<style>
.single_product_img {margin:auto; width:70%}
.text{font-size:large}
</style>
</head>

<body>
	<!--::header part start::-->
		    <jsp:include page="/fragment/header.jsp" />
	<!-- Header part end-->

	<!-- breadcrumb part start-->
	<section class="breadcrumb_part single_product_breadcrumb">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner"></div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb part end-->

	<!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="product_img_slide owl-carousel">
					<c:forEach var="itemImg" items="${itemImg}">
						<div class="single_product_img">
							<img src='<c:url value="/items/img/${itemImg.img}" />' alt="#" class="img-fluid">
						</div>
					</c:forEach>
					</div>
				</div>
				<div class="col-lg-8">
					<div class="single_product_text text-center">
						<h3>${item.itemName}</h3>
						<p class="text">作者：${item.publisher}</p>
				        <p class="text">出版社：${item.author}</p>
						<p class="text">內容簡介</p>
						<hr>
						<p class="text">${item.itemDescription}</p>
						<%--            <form action="<c:url value='/addToCart'/>" method="POST"> --%>
						<form action="<c:url value='/cart/addToCart'/>" method="POST"
							name="addToCart">
							<input type="hidden" name="itemId" value="${item.itemId}">
							<div class="card_area">
								<div class="product_count_area">
									<p>數量</p>
									<div class="product_count d-inline-block">
										<span class="product_count_item inumber-decrement"> <i
											class="ti-minus"></i></span> <input
											class="product_count_item input-number" name="qty"
											type="text" value="1" min="0" max="10"> <span
											class="product_count_item number-increment"> <i
											class="ti-plus"></i></span>
									</div>
									<p>$${item.price}</p>
								</div>
								<div class="add_to_cart">
									<button type="submit" class="btn_3">加入購物車</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	<!--::footer_part start::-->
    <jsp:include page="/fragment/footer.jsp" />
    <!--::footer_part end::-->
	</div>

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

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
</body>

</html>