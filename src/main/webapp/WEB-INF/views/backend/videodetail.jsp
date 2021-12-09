<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/js/all.min.js"
	integrity="sha512-YSdqvJoZr83hj76AIVdOcvLWYMWzy6sJyIMic2aQz5kh2bPTd9dzY3NtdeEAzPp/PhgZqr4aJObB3ym/vsItMg=="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="<c:url value='/backend/css/style.css'/>">
<style>
.divWidth {
	width: 80%;
	margin-right: auto;
	margin-left: auto;
}
</style>
</head>

<body>
	<div class="container1">
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
			<div class="container-sm divWidth">
				<c:url value='/backend/video/update' var="update" />
				<form:form method="POST" action="${update}" modelAttribute="video">
					<table class="table table-bordered border-primary">
						<tr>
							<td>影片編號</td>
							<td><form:input readonly="true" path="videoId" name="videoId"/></td>
						</tr>
						<tr>
							<td>影片連結碼</td>
							<td><form:input path="videoLink" name="videoLink"
									type="text" /></td>
						</tr>
						<tr>
							<td></td>
							<td><iframe width="530" height="315"
									src="https://www.youtube.com/embed/${video.videoLink}"
									title="YouTube video player" frameborder="0"
									allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
									allowfullscreen></iframe></td>
						<tr>
							<td>影片名稱</td>
							<td><form:input path="videoName" name="videoName"
									type="text" /></td>
						</tr>
						<tr>
							<td>影片描述</td>
							<td><form:input path="videoDescription"
									name="videoDescription" type="text" /></td>
						</tr>
						<tr>
							<td>套件包編號</td>
							<td><form:input path="href" name="href" type="text" /></a></td>
						</tr>
					</table>
					<button type="submit" class="btn btn-primary">修改</button>
				</form:form>
				<h1>留言區</h1>
				<table id="comment" class="table " style="width: 50%;">
					<thead>
						<th>留言者</th>
						<th>留言</th>
						<th></th>
					</thead>
					<c:forEach var="comment" items="${comments}">
						<tr>
							<td>${comment.users.userName}</td>
							<td style="">${comment.comment}</td>
							<td><button type="button" class="btn btn-danger"
									onclick="deleteById(${comment.id}, ${comment.videoId});">刪除</button>
						</tr>
					</c:forEach>
				</table>
			</div>
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
	<script src="<c:url value='/js/custom.js'/>"></script>

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

		function deleteById(id, videoId) {
			let obj = new Object();
			obj.videoId = videoId;
			obj.id = id;
			var json = JSON.stringify(obj, null, 4);
			$.ajax({
				type : 'post',
				url : id+'/deleteComment',
				data : json,
				dataType : 'JSON',
				contentType : 'application/json;charset=utf-8',
				success : function(data) {
					$('#comment').empty("");

					if (data == null) {
					} else {
						var table = $('#comment');
						var tr = "<thead><th>留言者</th><th>留言</th><th></th></thead>";
						$.each(data, function(i, n) {
							tr += '<tr><td>' + n.users.userName + '</td><td>'
									+ n.comment + '</td><td><button type="button" class="btn btn-danger"'
									+'onclick="deleteById('+n.id+');">刪除</button></tr>';
						});
						tr += '</table>'
						table.append(tr);
					}
				}
			});
		}
	</script>
</body>
</html>