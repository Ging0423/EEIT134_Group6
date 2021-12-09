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
	<!-- Header part end-->

	<!-- Forum content start here -->
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
			<div class="title">
				<input id="categoryid" type="hidden" value="${article.getCategoryid()}"/>
				<div class="dropdown">
					  <input type="button" id="category_btn" onclick="selectCategory()" class="dropbtn" value="">
					  <div id="category" class="dropdown-content">
						    <a onclick="changeCategoryid(0)">請選擇主題類別</a>
						    <a onclick="changeCategoryid(1)">成品分享</a>
						    <a onclick="changeCategoryid(2)">手作教學</a>
						    <a onclick="changeCategoryid(3)">材料心得</a>
						    <a onclick="changeCategoryid(4)">店家評點</a>
						    <a onclick="changeCategoryid(5)">活動分享</a>
						    <a onclick="changeCategoryid(6)">二手交易</a>
					  </div>
				</div>
				<input type="text" size="25" id="title" onkeyup="titlecheck()" value="${article.getTitle()}">
				<span id="titlecheck">尚可輸入25個字元</span>
			</div>

			<div class="editor_container">
				<textarea id="editor">
					${article.getContent()}
				</textarea>
			</div>

			<span id="contenttest"></span>

<!-- 			<div> -->
<!-- 				<label id="articletag"><span>主題標籤</span></label> <label -->
<!-- 					id="pubdate_set"><span>定時發布</span></label> -->
<!-- 			</div> -->
			
			<div class="newPost">
				<input type="submit" value="修改文章" onclick="sendArticle()">
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
	<script src="<c:url value='/js/forum/forum_updateArticle.js'/>"></script>
</body>

</html>