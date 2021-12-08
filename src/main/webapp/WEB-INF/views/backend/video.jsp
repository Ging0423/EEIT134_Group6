<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loop</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/js/all.min.js"
	integrity="sha512-YSdqvJoZr83hj76AIVdOcvLWYMWzy6sJyIMic2aQz5kh2bPTd9dzY3NtdeEAzPp/PhgZqr4aJObB3ym/vsItMg=="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="<c:url value='/backend/css/style.css'/>"
	type="text/css">
<link rel="icon" href="<c:url value='img/favicon.png'/>">
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
	width: 90%;
	margin-right: auto;
	margin-left: auto;
}
</style>
</head>
<body>
	<div class="container">
		<div class="navigation">
			<ul>
				<li><a href="<c:url value='/'/>"> <span class="icon"><i
							class="fas fa-infinity" aria-hidden="true"></i></span> <span
						class="title"><h2>loop</h2></span>
				</a></li>
				<li><a href="<c:url value=''/>"> <span class="icon"><i
							class="fas fa-users-cog" aria-hidden="true"></i></span> <span
						class="title">管理員專區</span>
				</a></li>
				<li><a href="<c:url value='/backend/allitem'/>"> <span
						class="icon"><i class="fas fa-shopping-bag"
							aria-hidden="true"></i></span> <span class="title">商品管理</span>
				</a></li>
				<li><a href="<c:url value=''/>"> <span class="icon"><i
							class="fas fa-cart-arrow-down" aria-hidden="true"></i></span> <span
						class="title">訂單管理</span>
				</a></li>
				<li><a href="<c:url value=''/>"> <span class="icon"><i
							class="fas fa-comments" aria-hidden="true"></i></span> <span
						class="title">訊息管理</span>
				</a></li>
				<li><a href="<c:url value='/backend/video'/>"> <span
						class="icon"><i class="far fa-file-video"
							aria-hidden="true"></i></span> <span class="title">教學影片管理</span>
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
					<label> <input type="text" placeholder="Search here">
						<i class="fas fa-search" aria-hidden="true"></i>
					</label>
				</div>
				<div class="user">
					<img src="image/user.jpg">
				</div>
			</div>
			<div>
				<div class="divWidth">
					<a class="btn btn-primary"
						href="<c:url value='/backend/video/create'/>">新增影片</a>
					<table class="table table-striped table-bordered border-primary">
						<thead>
							<tr>
								<th>影片連結</th>
								<th style="padding: 4px;">影片編號</th>
								<th style="padding: 10px;">影片名稱</th>
								<th style="padding: 10px;">影片敘述</th>
								<th style="padding: 10px;">商品連結</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="video" items="${allVideo}">
								<tr>
									<td><iframe width="560" height="315"
											src="https://www.youtube.com/embed/${video.videoLink}"
											title="YouTube video player" frameborder="0"
											allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
											allowfullscreen></iframe></td>
									<td><a href="<c:url value='/backend/video/${video.videoId}'/>">${video.videoId}</a></td>
									<td>${video.videoName}</td>
									<td>${video.videoDescription}</td>
									<td><a href='<c:url value="/items/${video.href}"/>'>${video.href}</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
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