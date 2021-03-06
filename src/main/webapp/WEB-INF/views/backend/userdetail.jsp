<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loop</title>
<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/backend/css/style.css'/>"
	type="text/css">
<link rel="icon" href="img/favicon.png">
<!-- Bootstrap CSS -->

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/js/all.min.js"
	integrity="sha512-YSdqvJoZr83hj76AIVdOcvLWYMWzy6sJyIMic2aQz5kh2bPTd9dzY3NtdeEAzPp/PhgZqr4aJObB3ym/vsItMg=="
	crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
		<div class="navigation">
			<ul>
				<li><a href="<c:url value='/backend/admin'/>"> <span class="icon"><i
							class="fas fa-infinity" aria-hidden="true"></i></span> <span
						class="title"><h2>loop</h2></span>
				</a></li>
				<li><a href="<c:url value='/backend/admin'/>"> <span
						class="icon"><i class="fas fa-users-cog" aria-hidden="true"></i></span>
						<span class="title">管理員專區</span>
				</a></li>
				<li><a href="<c:url value='/backend/allitem'/>"> <span
						class="icon"><i class="fas fa-shopping-bag"
							aria-hidden="true"></i></span> <span class="title">商品管理</span>
				</a></li>
				<li><a href="<c:url value='/backend/order'/>"> <span
						class="icon"><i class="fas fa-cart-arrow-down"
							aria-hidden="true"></i></span> <span class="title">訂單管理</span>
				</a></li>
				<li><a href="<c:url value=''/>"> <span class="icon"><i
							class="fas fa-comments" aria-hidden="true"></i></span> <span
						class="title">訊息管理</span>
				</a></li>
				<li><a href="<c:url value=''/>"> <span class="icon"><i
							class="far fa-file-video" aria-hidden="true"></i></span> <span
						class="title">教學影片管理</span>
				</a></li>
				<li><a href="<c:url value=''/>"> <span class="icon"><i
							class="far fa-newspaper" aria-hidden="true"></i></span> <span
						class="title">討論區管理</span>
				</a></li>
				<li><a href="<c:url value='/logout'/>"> <span class="icon"><i
							class="fas fa-sign-out-alt" aria-hidden="true"></i></span> <span
						class="title">登出</span>
				</a></li>
			</ul>
		</div>
		<div class="main">
			<div class="topbar">
				<div class="toggle" onclick="toggleMenu();">
					<i class="fas fa-bars"></i>
				</div>
				<div class="search">
					<label> <input type="text" placeholder="Search here">
						<i class="fas fa-search" aria-hidden="true"></i>
					</label>
				</div>
				<div class="user">
					<img src="image/user.jpg">
				</div>
			</div>

			<table class="table table-bordered border-primary" id="ajaxTable">				
					<tr>
						<td>ID：${user.userId}</td>
						<!--<td>${user.userId}</td>-->
					</tr>
					<tr>
						<td>帳號：${user.account}</td>
						<!--<td>${user.account}</td>-->
					</tr>
					<tr>	
						<td>身份：${user.userIdentity}</td>
						<!--<td>${user.userIdentity}</td>-->
					</tr>
					
					<tr>
						<td>暱稱：${user.userName}</td>
						<!--<td>${user.userName}</td>-->
					</tr>
					
					<tr>	
						<td>email：${user.email}</td>
						<!--<td>${user.email}</td>-->
					</tr>					
					<tr>	
						<td>電話：${user.tel}</td>
						<!--<td>${user.tel}</td>-->
					</tr>
					<tr>
						<td>地址：${user.userAddress}</td>
						<!--<td>${user.userAddress}</td>-->
					</tr>					
				</table>
		</div>
	</div>
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
	<script>
		window.onload(toggleMenu());

		function toggleMenu() {
			let toggle = document.querySelector('.toggle');
			let navigation = document.querySelector('.navigation');
			let main = document.querySelector('.main');
			toggle.classList.toggle('active');
			navigation.classList.toggle('active');
			main.classList.toggle('active');
		}

		/*function payState() {
			var state = document.getElementById("orderSelector").value;

			$
					.ajax({
						type : 'post',
						url : 'searchState',
						data : state,
						dataType : 'JSON',
						contentType : 'application/json;charset=utf-8',
						success : function(data) {
							$('#ajaxTable').empty("");

							if (data == null) {
							} else {
								var table = $('#ajaxTable');
								var allTotal = 0;
								var tr = '<table class="table table-bordered border-primary" id="ajaxTable"><thead>'
										+ '<tr><th>ID</th><th>帳號</th><th>密碼</th><th>身份</th><th>名稱</th><th>email</th>'
										+ '<th>電話</th><th>地址</th></tr></thead><tbody>'
								$.each(data, function(i, n) {
									tr += '<tr>' + '<td>' + n.orderId + '</td>'
											+ '<td>' + n.recipient + '</td>'
											+ '<td>' + n.tel + '</td>' + '<td>'
											+ n.shippingAddress + '</td>'
											+ '<td>' + n.orderDate + '</td>'
											+ '<td>' + n.total + '</td>'
											+ '<td>' + n.payState + '</td>'
											+ '<td>' + n.orderState
											+ '</td></tr>';

								});
								tr += '</tbody></table>'
								table.append(tr);
							}
						}
					});
		}*/
	</script>
</body>
</html>