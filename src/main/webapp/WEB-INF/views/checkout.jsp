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
    <jsp:include page="/fragment/header.jsp" />
	<!-- Header part end-->

	<!-- breadcrumb part start-->
	<section class="breadcrumb_part">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<h2>結帳</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb part end-->

	<!--================Checkout Area =================-->
	<section class="checkout_area section_padding">
		<div class="container">
			<div class="billing_details">
				<div class="row">
				<c:url var="checkout" value='/order/checkout'/>
				<form:form class="row contact_form" method="post"
							novalidate="novalidate" modelAttribute="orderData" action="${checkout}">
					<div class="col-lg-8">
						<h3>訂單細節</h3>
						
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
												value="${item.qty*item.price}" /> <span class="last">  ${total}</span>
									</a></li>
									<c:set var="subTotal" value="${subTotal + total}" />
								</c:forEach>

							</ul>
							<ul class="list list_2">
								<li> <a
									href="#">總額 <span>$${subTotal}</span>
								</a></li>
								<li><a href="#">總金額(含運費) <span>$${subTotal}</span>
								</a></li>
								<form:hidden class="form-control" name="total"
									path="total" value="${subTotal}"/>
							</ul>
							<button class="btn_3" type="submit">結帳去</button>
							
						</div>
						
					</div>
					</form:form>
				</div>
			</div>
		</div>
	</section>
	<!--================End Checkout Area =================-->

	<!--::footer_part start::-->
	<jsp:include page="/fragment/footer.jsp" />
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
>>>>>>> main
</body>

</html>