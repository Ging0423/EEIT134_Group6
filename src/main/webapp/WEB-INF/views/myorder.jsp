<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
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
.divWidth {
	width: 75%;
	margin-right: auto;
	margin-left: auto;
}
</style>
</head>

<body>
	<jsp:include page="/fragment/header.jsp" />

	<section class="breadcrumb_part">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<h2>我的訂單</h2>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div class="container-sm divWidth">
		<table class="table table-striped table-hover">
			<thead>
				<td>訂單編號</td>
				<td>收件人</td>
				<td>電話</td>
				<td>收件地址</td>
				<td>訂購日期</td>
				<td>總金額</td>
				<td>付款狀態</td>
				<td>訂單狀態</td>
				<td></td>
			</thead>
			<tbody>
				<c:forEach var="order" items="${allOrder}">
					<tr>
						<td><a href="<c:url value='/order/${order.orderId}'/>" target="_blank" onclick="orderWindow(${order.orderId});"/>${order.orderId}</a></td>
						<td>${order.recipient}</td>
						<td>${order.tel}</td>
						<td>${order.shippingAddress}</td>
						<td>${order.orderDate}</td>
						<td>${order.total}</td>
						<td>${order.payState}</td>
						<td>${order.orderState}</td>
						<c:choose>
							<c:when test='${order.payState == "付款成功"}'>
								<td></td>
							</c:when>
							<c:otherwise>
								<td><button type="button"
										onclick="ajaxCheckout(${order.orderId});">信用卡結帳</button></td>
							</c:otherwise>

						</c:choose>
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

	<script>function ajaxCheckout(orderId) {
    	var json = new Object();
		json.orderId = orderId;
		$
		.ajax({
			type : 'post',
			url : 'goECPay',
			data : JSON.stringify(json),
			dataType : 'html',
			contentType : 'application/json;charset=utf-8',
			success : function(data) {
				var myWindow = window.open();
				myWindow.document.write(data);		
				}
			});
		}
    </script>
</body>
</html>