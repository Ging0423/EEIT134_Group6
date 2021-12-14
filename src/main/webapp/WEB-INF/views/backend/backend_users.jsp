<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>loop</title>
<link rel="stylesheet" href="<c:url value='/css/style_admin.css'/>"
	type="text/css">
<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/backend/css/style.css'/>">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/js/all.min.js"
	integrity="sha512-YSdqvJoZr83hj76AIVdOcvLWYMWzy6sJyIMic2aQz5kh2bPTd9dzY3NtdeEAzPp/PhgZqr4aJObB3ym/vsItMg=="
	crossorigin="anonymous"></script>
	
<style>
	.btn {
	background-color: #B08EAD;
	color: white
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
					<label> <input type="text" placeholder="Search here">
						<!-- <i class="fas fa-search" aria-hidden="true"></i> -->
					</label>
				</div>
				<div class="user">
<!-- 					<img src="image/user.jpg"> -->
				</div>
			</div>

			<div>			
				<div class="user-info">
					<p>會員資料總覽</p>
					<p>目前會員總數 : ${count}</p>

					<form id="myForm" action="<c:url value='/backend/admin/delete'/>" method="POST">
						<input type='hidden' id='hiddenField' name='array' />
						<button class="btn" type="submit" onclick="d();">刪除</button>
						<a href="<c:url value='/backend'/>" class="btn">回後台管理</a>
					</form>
					<table class="table table-bordered border-primary">
						<thead>
							<tr>
								<th>ID</th>
								<th>帳號</th>
								<th>身份</th>
								<th>刪除</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="user" items="${allUsers}">			
								<tr>
									<td><a
										href="<c:url value='/backend/admin/${user.userId}'/>"
										target="_blank" onclick="orderWindow(${user.userId});">${user.userId}</a></td>
									<td>${user.account}</td>
									<td>${user.userIdentity}</td>
									<td><input type="checkbox" name="check" value="${user.userId}"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
		
		function d() {
		    var result = confirm('確定刪除？');  
		    if(result){  
		        alert('刪除成功！');  
				var array = [];
				var checkboxes = document
						.querySelectorAll('input[type=checkbox]:checked');
				for (var i = 0; i < checkboxes.length; i++) {
					array.push(checkboxes[i].value);
				}
				document.getElementById('hiddenField').value = array;
				document.getElementById("myForm").submit();
		    }else{  
		        alert('動作取消！');  
		    }  
		}
	</script>
</body>
</html>