<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<!-- =========== -->
<title>All Item Form</title>
<!-- ====== -->
<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/backend/css/style.css'/>"
	type="text/css">
<link rel="icon" href="img/favicon.png">
<!-- ====== -->

<style>
.img {
	width: 20%
}
#ajaxTable {
	margin: auto;
	width: 95%
}

/* table { */
/* 	margin: auto; */
/* 	width: 70% */
/* } */

/* table, th, td { */
/* 	border: 2px solid black; */
/* 	border-collapse: collapse */
/* } */

/* th { */
/* 	background-color: #F4EDF2 */
/* } */

/* .a { */
/* 	font-size: x-large */
/* } */

a { 
text-decoration: none
} 

/* a {
	font-size: larger;
	margin: 50px auto;
	text-decoration: none
} */
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
<!-- ========================= -->

			<div align='center'>
				<div style="background-color: #B08EAD">
					<br>
					<h1 style="color: #fff">商品管理</h1>
					<br>
					<hr>
				</div>

				<div>
					<select class=a onchange="javascript:location.href=this.value;">
						<option value="<c:url value='/backend/allitem'/>">所有商品</option>
						<option value="<c:url value='/backend/yarn'/>">紗線</option>
						<option value="<c:url value='/backend/tools'/>">工具</option>
						<option value="<c:url value='/backend/books'/>">書籍</option>
						<option value="<c:url value='/backend/kits'/>">材料包</option>
						<!-- <option value="http://localhost:8080/loop/backend/allitems">所有商品</option> -->
						<!-- <option value="http://localhost:8080/loop/backend/yarn">紗線</option> -->
						<!-- <option value="http://localhost:8080/loop/backend/tools">工具</option> -->
						<!-- <option value="http://localhost:8080/loop/backend/books">書籍</option> -->
						<!-- <option value="http://localhost:8080/loop/backend/kits">材料包</option> -->
					</select>
				</div>
				<br>

				<table class="table table-bordered border-primary" id="ajaxTable">
					<thead>
					<tr>
						<th>編號</th>
						<th>商品名稱</th>
						<th>庫存數量</th>
						<th>價格</th>
						<th width="800">圖片</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="item" items='${allItem}'>
						<tr>
							<td><a href="<c:url value='/backend/items/${item.itemId}'/>">${item.itemId}</a></td>
							<td>${item.itemName}</td>
							<td>${item.qty}</td>
							<td>$${item.price}</td>
							<td ><c:forEach var="img" items="${item.imgs}">
									<img class="img" src='<c:url value="/items/img/${img.img}"/>' />
								</c:forEach></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<a class=a href="/loop/backend">回後台管理</a>
			</div>
		</div>
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