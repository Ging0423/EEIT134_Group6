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
	width: 80%;
	margin-right: auto;
	margin-left: auto;
}
.btn {
background-color:#B08EAD;
color: white
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
						<h2>教學影片</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="container-sm divWidth">
		<table class="table table-bordered border-primary">
			<tr>
				<td><iframe width="1120" height="730"
						src="https://www.youtube.com/embed/${video.videoLink}"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe></td>
			<tr>
				<td><h3>${video.videoName}</h3></td>
			</tr>
			<tr>
				<td>${video.videoDescription}</td>
			</tr>
			<tr>
				<td><a href='<c:url value="/items/${video.href}"/>'>材料包連結</a></td>
			</tr>
		</table>
		<h1>留言區</h1>
		<table id="comment" class="table " style="width:50%;">
		<thead>
		<th>留言者</th>
		<th>留言</th></thead>
			<c:forEach var="comment" items="${comments}">
				<tr>
					<td>${comment.users.userName}</td>
					<td style="">${comment.comment}</td>
				</tr>
			</c:forEach>
		</table>
		<c:choose>
			<c:when test="${isLogin != null}">
				<textarea id="commentTextArea" rows="4" cols="40"></textarea>
				<button type="button" class="btn"
					onclick="getcomment('${video.videoId}');">送出</button>
			</c:when>
			<c:otherwise>
				<c:url value='/login' var="login"/>
				<button calss="btn" onclick="location.href='${login}'">登入留言</button>
			</c:otherwise>
		</c:choose>

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

	<script>
		function getcomment(id) {
			var comment = document.getElementById("commentTextArea").value;
			let obj = new Object();
			obj.comment = comment;
			obj.videoId = id;
			;
			var json = JSON.stringify(obj, null, 4);
			$.ajax({
				type : 'post',
				url : 'comment',
				data : json,
				dataType : 'JSON',
				contentType : 'application/json;charset=utf-8',
				success : function(data) {
					$('#comment').empty("");

					if (data == null) {
					} else {
						var table = $('#comment');
						var tr ="<thead><th>留言者</th><th>留言</th></thead>";
						$.each(data, function(i, n) {
							tr += '<tr><td>' + n.users.userName
									+ '</td><td>' + n.comment + '</td></tr>';
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