<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--     <title>後臺管理系統-商家版</title> -->
<link rel="stylesheet" href="<c:url value='/backend/css/style.css'/>" type="text/css"/>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/js/all.min.js"
	integrity="sha512-YSdqvJoZr83hj76AIVdOcvLWYMWzy6sJyIMic2aQz5kh2bPTd9dzY3NtdeEAzPp/PhgZqr4aJObB3ym/vsItMg=="
	crossorigin="anonymous"></script>
<!-- =========== -->
<title>loop</title>
<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/backend/css/style.css'/>"
	type="text/css">
<link rel="icon" href="img/favicon.png">

<style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

body {
  font-family: Arial;
}

* {
  box-sizing: border-box;
}

form.example input[type=text] {
  padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 80%;
  background: #f1f1f1;
}

form.example button {
  float: left;
  width: 20%;
  padding: 10px;
  background: #B08EAD;
  color: white;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none;
  cursor: pointer;
}

form.example::after {
  content: "";
  clear: both;
  display: table;
}
</style>

<!-- Bootstrap CSS -->

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/js/all.min.js"
	integrity="sha512-YSdqvJoZr83hj76AIVdOcvLWYMWzy6sJyIMic2aQz5kh2bPTd9dzY3NtdeEAzPp/PhgZqr4aJObB3ym/vsItMg=="
	crossorigin="anonymous"></script>
	
</head>

<body>
<!-- =========== -->
	<div class="container1">
		<div class="navigation">
			<ul>
				<li><a href="<c:url value='/backend'/>"> <span class="icon"><i
							class="fas fa-infinity" aria-hidden="true"></i></span> 
<!-- 							<span class="title"><h2>loop<h2></span> -->
	<span class="title"><img src= "<c:url value='/img/loop.png' />"></span>
				</a></li>
				<li><a href="<c:url value='/backend/admin'/>"> <span class="icon"><i
							class="fas fa-users-cog" aria-hidden="true"></i></span> <span
						class="title">會員專區</span>
				</a></li>
				<li><a href="<c:url value='/backend/allitem'/>"> <span
						class="icon"><i class="fas fa-shopping-bag"
							aria-hidden="true"></i></span> <span class="title">商品管理</span>
				</a></li>
<!--                 ================== -->
<!--                 <li> -->
<%--                     <a href="<c:url value='/backend/useritems'/>"> --%>
<!--                         <span class="icon"><i class="fas fa-shopping-bag" aria-hidden="true"></i></span> -->
<!--                         <span class="title">會員手作商品管理</span> -->
<!--                     </a> -->
<!--                 </li> -->
<!--                 ================== -->
				<li><a href="<c:url value='/backend/order'/>"> <span class="icon"><i
							class="fas fa-cart-arrow-down" aria-hidden="true"></i></span> <span
						class="title">訂單管理</span>
				</a></li>
<%-- 				<li><a href="<c:url value=''/>"> <span class="icon"><i --%>
<!-- 							class="fas fa-comments" aria-hidden="true"></i></span> <span -->
<!-- 						class="title">訊息管理</span> -->
<!-- 				</a></li> -->
				<li><a href="<c:url value='/backend/video'/>"> <span class="icon"><i
							class="far fa-file-video" aria-hidden="true"></i></span> <span
						class="title">教學影片管理</span>
				</a></li>
				<li><a href="<c:url value='/backend/forum'/>"> <span class="icon"><i
							class="far fa-newspaper" aria-hidden="true"></i></span> <span
						class="title">討論區管理</span>
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
<form class="example" action="/action_page.php" style="margin:auto;max-width:300px">
  <input type="text" placeholder="Search.." name="search2">
  <button type="submit"><i class="fa fa-search"></i></button>
</form>
				</div>
				<div class="user">
					<img src="image/user.jpg">
				</div>
			</div>
			
<div align='center'>
<div style="background-color:#B08EAD"><br>
<h1 style="color:#fff">訂單管理</h1><br>
<hr>
</div><br> 

			<div>
			<form action="<c:url value='${order.orderId}/updateState'/>" method="POST">
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
						<td><select name="state">
								<option selected>${order.orderState}</option>
								<option>未付款</option>
								<option>已付款</option>
								<option>已出貨</option>
						</select></td>
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
								<td><a href="/backend/items/${item.itemId}">${item.itemId}</a></td>
								<td>${item.itemName}</td>
								<td>${item.price}</td>
								<td>${item.qty}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button class="btn btn-primary" type="submit">更新訂單</button>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		window.onload(toggleMenu());

		function toggleMenu() {
			let toggle = document.querySelector('.toggle');
			let navigation = document.querySelector('.navigation');
			let main = document.querySelector('.main');
			toggle.classList.toggle('active');
			navigation.classList.toggle('active');
			main.classList.toggle('active');
		}
	</script>
</body>
</html>