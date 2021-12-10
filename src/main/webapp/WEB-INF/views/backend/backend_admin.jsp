<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>後臺管理系統-商家版</title>
<link rel="stylesheet" href="<c:url value='/css/style_admin.css'/>"
	type="text/css">
<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/backend/css/style.css'/>">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/js/all.min.js"
	integrity="sha512-YSdqvJoZr83hj76AIVdOcvLWYMWzy6sJyIMic2aQz5kh2bPTd9dzY3NtdeEAzPp/PhgZqr4aJObB3ym/vsItMg=="
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container1">
		<div class="navigation">
			<ul>
				<li><a href="<c:url value='/'/>"> <span class="icon"><i
							class="fas fa-infinity" aria-hidden="true"></i></span> <span
						class="title"><h2>Loop</h2></span>
				</a></li>
				<li><a href="<c:url value='/backend/admin'/>"> <span
						class="icon"><i class="fas fa-users-cog" aria-hidden="true"></i></span>
						<span class="title">會員管理</span>
				</a></li>
				<li><a href="#"> <span class="icon"><i
							class="fas fa-shopping-bag" aria-hidden="true"></i></span> <span
						class="title">商品管理</span>
				</a></li>
				<li><a href="<c:url value='/backend/order'/>"> <span
						class="icon"><i class="fas fa-cart-arrow-down"
							aria-hidden="true"></i></span> <span class="title">訂單管理</span>
				</a></li>
				<li><a href="#"> <span class="icon"><i
							class="fas fa-comments" aria-hidden="true"></i></span> <span
						class="title">訊息管理</span>
				</a></li>
				<li><a href="#"> <span class="icon"><i
							class="far fa-file-video" aria-hidden="true"></i></span> <span
						class="title">教學影片管理</span>
				</a></li>
				<li><a href="#"> <span class="icon"><i
							class="far fa-newspaper" aria-hidden="true"></i></span> <span
						class="title">討論區管理</span>
				</a></li>
				<li><a href="#"> <span class="icon"><i
							class="far fa-newspaper" aria-hidden="true"></i></span> <span
						class="title">公告與活動管理</span>
				</a></li>
				<li><a href="#"> <span class="icon"><i
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
					<img src="image/user.jpg">
				</div>
			</div>

			<div>			
				<div class="user-info">
					<p>會員資料總覽</p>
					<p>目前會員總數 : ${count}</p>

					<form id="myForm" action="<c:url value='/backend/admin/delete'/>" method="POST">
						<input type='hidden' id='hiddenField' name='array' />
						<button class="btn" type="submit" onclick="d();">多筆刪除</button>
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
									<!--<td>${user.userPassword}</td>-->
									<td>${user.userIdentity}</td>
									<!--<td>${user.userName}</td>-->
									<!--<td>${user.email}</td>-->
									<!--<td>${user.tel}</td>-->
									<!--<td>${user.userAddress}</td>-->
									<td><input type="checkbox" name="check" value="${user.userId}"></td>
								</tr>
								<!--<c:forEach var="count" items="${counter}" varStatus="counterstatus">
								
								</c:forEach>-->
							</c:forEach>
						</tbody>
					</table>
					<!--  	<table class="table table-bordered border-primary">

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
						</table>-->
					<!--  <button class="btn btn-primary" type="submit">更新訂單</button>-->
					</form>
					<!--	<table class="table table-bordered border-primary">
					<tr>
						<td>帳號</td>
						<td>密碼</td>
						<td>身份</td>
						<td>名稱</td>
						<td>email</td>
						<td>電話</td>
						<td>地址</td>
					</tr>
				</table> -->

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