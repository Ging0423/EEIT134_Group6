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
				<input id="keyword" type="text" placeholder="請輸入搜尋內容" size="30">
				<button onclick="searchArticle()" class="search_btn">搜尋</button>
			</div>
		</div>
		
		<div class="forum_container">
			<div class="function_list">
				<div class="newPost_btn">
					<a href="<c:url value='/forum/newPost'/>">
					<input type="button" value="發文">
					</a>
				</div>
				
				<div class="showpage">
					<table id="showpage">
						<tr>
							<td><button><i class="ti-control-backward"></i></button></td>
							<td colspan="5" align="right">
								<c:forEach var="i" begin="1" end="${totalPages}" step="1">
									<button id="myPage" value="${i}" onclick="change(${i})">${i}</button>
								</c:forEach>
							</td>
							<td>
								<input type="text" id="pageGo" placeholder="1" size="2">/${totalPages}
							</td>
							<td><button><i class="ti-control-forward"></i></button></td>
						</tr>
					</table>
				</div>

				<div class="category_list">
					<ul>
						<li><a onclick="load(0,1)">全部<span>${articleAmount[0]}</span></a></li>
						<li><a onclick="load(1,1)">成品分享<span>${articleAmount[1]}</span></a></li>
						<li><a onclick="load(2,1)">手作教學<span>${articleAmount[2]}</span></a></li>
						<li><a onclick="load(3,1)">材料心得<span>${articleAmount[3]}</span></a></li>
						<li><a onclick="load(4,1)">店家評點<span>${articleAmount[4]}</span></a></li>
						<li><a onclick="load(5,1)">活動分享<span>${articleAmount[5]}</span></a></li>
						<li><a onclick="load(6,1)">二手交易<span>${articleAmount[6]}</span></a></li>
					</ul>
				</div>
			</div>

			<div class="forum_list">
				<table id="forum_table" class="forum_table">
					<thead>
						<tr>
							<td>分類</td>
							<td>文章標題</td>
							<td>作者</td>
							<td>回覆/查看</td>
							<td>最後發表</td>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
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
	<script src="<c:url value='/js/forum/forum_main.js'/>"></script>
	
	<script type="text/javascript">
	
		console.log(${totalPages})
	
	</script>
</body>

</html>