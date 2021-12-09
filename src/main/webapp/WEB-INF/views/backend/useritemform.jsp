<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
<!-- =========== -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--     <title>後臺管理系統-商家版</title> -->
<link rel="stylesheet" href="css/style.css" type="text/css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/js/all.min.js"
	integrity="sha512-YSdqvJoZr83hj76AIVdOcvLWYMWzy6sJyIMic2aQz5kh2bPTd9dzY3NtdeEAzPp/PhgZqr4aJObB3ym/vsItMg=="
	crossorigin="anonymous"></script>
</head>
<!-- =========== -->
<title>Books Form</title>
<style>
table{margin:auto; width:70%}
table,th,td{border:2px solid black; border-collapse:collapse}
th{background-color:#F4EDF2}
/* a {font-size:x-large; margin: 50px auto; text-decoration:none} */
a {text-decoration:none}
</style> 

<body>
<!-- =========== -->
	<div class="container">
		<div class="navigation">
			<ul>
				<li><a href="<c:url value=''/>"> <span class="icon"><i
							class="fas fa-infinity" aria-hidden="true"></i></span> <span
						class="title"><h2>Loop</h2></span>
				</a></li>
				<li><a href="<c:url value=''/>"> <span class="icon"><i
							class="fas fa-users-cog" aria-hidden="true"></i></span> <span
						class="title">管理員專區</span>
				</a></li>
				<li><a href="<c:url value='/backend/allitem'/>"> <span
						class="icon"><i class="fas fa-shopping-bag"
							aria-hidden="true"></i></span> <span class="title">商品管理</span>
				</a></li>
<!--                 ================== -->
                <li>
                    <a href="<c:url value='/backend/useritem'/>">
                        <span class="icon"><i class="fas fa-shopping-bag" aria-hidden="true"></i></span>
                        <span class="title">會員手作商品管理</span>
                    </a>
                </li>
<!--                 ================== -->
				<li><a href="<c:url value=''/>"> <span class="icon"><i
							class="fas fa-cart-arrow-down" aria-hidden="true"></i></span> <span
						class="title">訂單管理</span>
				</a></li>
				<li><a href="<c:url value=''/>"> <span class="icon"><i
							class="fas fa-comments" aria-hidden="true"></i></span> <span
						class="title">訊息管理</span>
				</a></li>
				<li><a href="<c:url value=''/>"> <span class="icon"><i
							class="far fa-file-video" aria-hidden="true"></i></span> <span
						class="title">教學影片管理</span>
				</a></li>
				<li><a href="<c:url value=''/>"> <span class="icon"><i
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
					<label> 
					    <input type="text" placeholder="Search here">
						<i class="fas fa-search" aria-hidden="true"></i>
					</label>
				</div>
				<div class="user">
					<img src="image/user.jpg">
				</div>
			</div>
<!-- ========================= -->

<div align='center'>
<div style="background-color:#B08EAD"><br>
<h1 style="color:#fff">會員手作商品資料總表</h1><br>
<hr>
</div><br>

<a class=a href="<c:url value='/backend/useritem/create'/>">新增</a>

<table border='1'>
	<thead>
		<th>商品編號</th>
		<th>會員編號</th>
		<th>產品名</th>
		<th>商品簡介</th>
		<th>日期</th>
		<th>商品數量</th>
		<th>價格</th>	
	</thead>
		<c:forEach var="item" items='${allItem}'>
			<tr>
				<td><a href= "<c:url value='/backend/useritem/${item.itemId}'/>">${item.itemId}</a></td>
				<td><a href= "<c:url value='/backend/useritem/${item.userId}'/>">${item.userId}</a></td>
				<td>${item.itemName}</td>
				<td>${item.itemDescription}</td>
				<td>${item.addDate}</td>
				<td>${item.qty}</td>
				<td>$${item.price}</td>
			</tr>
		</c:forEach>
	</table>
	<a class=a href="/loop/backend/useritem">回商品資料總表</a>
	</div>
	<!--     ================================ -->
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
	</script>
	<!--     ================================ -->
</body>
</html>