<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="zxx">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Loop 討論區</title>
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
<!-- forum CSS -->
<link rel="stylesheet" href="<c:url value='/css/forumstyle.css'/>">
</head>

<body>
	<!--::header part start::-->
	<jsp:include page="/fragment/header.jsp" />
	</header>
	<!-- Header part end-->

	<!-- Forum content start here -->
	<!-- 	要傳給javascript的數值 -->
	<input type="hidden" value="${article.getArticleid()}" id="articleid"/>
	
	<section class="forum">
		<div class="banner">
			<h2>討論區</h2>
			<span>你，與世界的對話</span>
			<div class="search">
				<input type="text" placeholder="請輸入搜尋內容" size="30"> <a
					href="#" class="search_btn">搜尋</a>
			</div>
		</div>

		<div class="forum_container">
			<div class="function_list">
				<div class="newPost_btn">
					<a href="<c:url value='/forum/newPost'/>"> <input type="button"	value="發文"></a>
					<a onclick="gotoReply()"> <input type="button" value="回覆"></a>
				</div>

				<div class="showpage">
					<table id="showpage">
						<tr>
							<td><a href="<c:url value='/forum'/>">返回列表</a></td>
							<td><button onclick="addPage(1)">
									<i class="ti-control-backward"></i>
								</button></td>
							<td colspan="5" align="right"><c:forEach var="i" begin="1"
									end="5" step="1">
									<button id="myPage" value="${i}" onclick="change(${i})">${i}</button>
								</c:forEach></td>
							<td>
								<!-- 								<input type="number" id="pageGo" placeholder="1">/10 -->
							</td>
							<td><button>
									<i class="ti-control-forward"></i>
								</button></td>
						</tr>
					</table>
				</div>
			</div>
			
			<div class="forum_list">
				<table id="forum_table" class="forum_table forum_content">
					<thead>
						<tr>
							<td colspan="2" style="font-size:30px;">${article.getTitle()}</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 300px;">
								<img src="<c:url value='/img/author/author_1.png'/>">
								<br/>
								<h4>${article.getAuthorid()}</h4>
								<hr>
								<h6>發表於:${article.getPostdate()}</h6>
							</td>
							<td class="article_content">${article.getContent()}</td>
						</tr>
					</tbody>
				</table>

				<div class="like_function_list">
					<a onclick="addLikeNum()"><i class="ti-heart">按讚${likeNum}</i></a> <a
						onclick="addShareNum()"><i class="ti-facebook">分享</i></a>
				</div>
			
				<table id="reply_table" class="reply_table">
					<tbody>
					</tbody>
				</table>
			</div>

			<div class="replyEditor_container">
				<textarea id="replyEditor">
					<p>請輸入文章內容</p>
				</textarea>
				<button onclick="replyArticle()">回覆文章</button>
			</div>
		</div>
	</section>
	<!-- Forum content end -->

	

	<!--::footer_part start::-->
	<jsp:include page="/fragment/footer.jsp" />
	<!--::footer_part end::-->

	<!-- jquery plugins here-->
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
	<script src="<c:url value='/js/ckeditor.js'/>"></script>
	<script src="<c:url value='/js/forum/forum_article.js'/>"></script>
</body>

</html>