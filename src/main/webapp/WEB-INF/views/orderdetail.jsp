<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loop</title>
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
.divWidth {
	width: 75%;
	margin-right: auto;
	margin-left: auto;
}
</style>
</head>
<body>

	<jsp:include page="/fragment/header.jsp" />


	<!-- breadcrumb part start-->
	<section class="breadcrumb_part">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<h2>我的訂單明細</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="divWidth">
		<table class="table table-bordered border-primary">
			<tr>
				<td>訂單編號</td>
				<td>${order.orderId}</td>
			</tr>
			<tr>
				<th>收件人</th>
				<td>${order.recipient}</td>
			</tr>
			<tr>
				<td>電話</td>
				<td>${order.tel}</td>
			</tr>
			<tr>
				<td>收件地址</td>
				<td>${order.shippingAddress}</td>
			</tr>
			<tr>
				<td>訂購日期</td>
				<td>${order.orderDate}</td>
			</tr>
			<tr>
				<td>總金額</td>
				<td>${order.total}</td>
			</tr>
			<tr>
				<td>付款狀態</td>
				<td>${order.payState}</td>
			</tr>
			<tr>
				<td>訂單狀態</td>
				<td>${order.orderState}</td>
			</tr>
		</table>
		<table class="table table-bordered border-primary">
			<thead>
				<tr>
					<th>商品編號</th>
					<th>商品名稱</th>
					<th>商品價格</th>
					<th>商品數量</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${orderItems}">
					<tr>
						<td>${item.itemId}</td>
						<td>${item.itemName}</td>
						<td>${item.price}</td>
						<td>${item.qty}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<jsp:include page="/fragment/footer.jsp" />

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
</body>
</html>