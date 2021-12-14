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
	<header class="main_menu home_menu">
		<div class="container">
			<div class="row align-items-center justify-content-center">
				<div class="col-lg-12">
					<nav class="navbar navbar-expand-lg navbar-light">
						<a class="navbar-brand" href="index.jsp"> <img
							src="img/logo.png" alt="logo">
						</a>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="menu_icon"><i class="fas fa-bars"></i></span>
						</button>

						<div class="collapse navbar-collapse main-menu-item"
							id="navbarSupportedContent">
							<ul class="navbar-nav">
								<li class="nav-item"><a class="nav-link"
									href="<c:url value='/'/>">首頁</a></li>
								<li class="nav-item"><a class="nav-link" href="about.jsp">關於</a>
								</li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="blog.html"
									id="navbarDropdown_1" role="button" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> 商品 </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
										<a class="dropdown-item" href="<c:url value='/items/yarn'/>">線材</a>
										<a class="dropdown-item" href="<c:url value='/items/toold'/>">工具</a>
										<a class="dropdown-item"
											href="<c:url value='/items/package'/>">套組</a> <a
											class="dropdown-item" href="<c:url value='/items/books'/>">工具書</a>

									</div></li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="blog.jsp"
									id="navbarDropdown_3" role="button" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> 會員 </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
										<a class="dropdown-item" href="login.jsp"> 登錄 </a> <a
											class="dropdown-item" href="checkout.jsp">商品結帳</a> <a
											class="dropdown-item" href="<c:url value='/cart'/>">購物車</a> <a
											class="dropdown-item" href="confirmation.jsp">我的訂單</a> <a
											class="dropdown-item" href="<c:url value='/forum/myforum'/>">我的文章</a>
									</div></li>

								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="blog.html"
									id="navbarDropdown_2" role="button" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> 討論區 </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
										<a class="dropdown-item" href="<c:url value='/forum'/>">
											討論區</a> <a class="dropdown-item" href="single-blog.html">Single
											blog</a>
									</div></li>

								<li class="nav-item"><a class="nav-link"
									href="contact.html">教學影片</a></li>
							</ul>
						</div>
						<div class="hearer_icon d-flex align-items-center">
							<a id="search_1" href="javascript:void(0)"><i
								class="ti-search"></i></a> <a href="<c:url value='/cart'/>"> <i
								class="flaticon-shopping-cart-black-shape"></i>
							</a>
						</div>
					</nav>
				</div>
			</div>
		</div>
		<div class="search_input" id="search_input_box">
			<div class="container ">
				<form class="d-flex justify-content-between search-inner">
					<input type="text" class="form-control" id="search_input"
						placeholder="Search Here">
					<button type="submit" class="btn"></button>
					<span class="ti-close" id="close_search" title="Close Search"></span>
				</form>
			</div>
		</div>
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
				</div>

<<<<<<< Updated upstream
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
=======
<div class="showpage">
						<table id="showpage">
							<input type="hidden" value="${totalPagesInArticle}" id="totalPages">
							<tr>
								<td><a href="/loop/forum">返回列表</a></td>
								<td><button id="minusPage" onclick="addPage(-1)">
										<i class="ti-control-backward"></i>
									</button></td>
								<td id="page_btn" colspan="5" align="right">
								<c:forEach var="i" begin="1" end="${totalPagesInArticle}" step="1">
									<button id="myPage${i}" value="${i}" onclick="changePage(${i})">${i}</button>
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
							<td style="width: 300px;">
								<img src="<c:url value='/img/author/author_1.png'/>">
								<br/>
								<h4>${article.getAuthorid()}</h4>
=======
							<td style="width: 300px;" valign="top">
								<h4>${article.getUsers().getUserName()}</h4>
>>>>>>> Stashed changes
								<hr>
								<h6>發表於:${article_date}</h6>
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

	<!-- subscribe part here -->
	<section class="subscribe_part section_padding">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="subscribe_part_content">
						<h2>Get promotions & updates!</h2>
						<p>Seamlessly empower fully researched growth strategies and
							interoperable internal or “organic” sources credibly innovate
							granular internal .</p>
						<div class="subscribe_form">
							<input type="email" placeholder="Enter your mail"> <a
								href="#" class="btn_1">Subscribe</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- subscribe part end -->

	<!--::footer_part start::-->
	<footer class="footer_part">
		<div class="footer_iner">
			<div class="container">
				<div class="row justify-content-between align-items-center">
					<div class="col-lg-8">
						<div class="footer_menu">
							<div class="footer_logo">
								<a href="index.html"><img src="img/logo.png" alt="#"></a>
							</div>
							<div class="footer_menu_item">
								<a href="index.html">Home</a> <a href="about.html">About</a> <a
									href="product_list.html">Products</a> <a href="#">Pages</a> <a
									href="blog.html">Blog</a> <a href="contact.html">Contact</a>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="social_icon">
							<a href="#"><i class="fab fa-facebook-f"></i></a> <a href="#"><i
								class="fab fa-instagram"></i></a> <a href="#"><i
								class="fab fa-google-plus-g"></i></a> <a href="#"><i
								class="fab fa-linkedin-in"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="copyright_part">
			<div class="container">
				<div class="row ">
					<div class="col-lg-12">
						<div class="copyright_text">
							<P>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
									class="ti-heart" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</P>
							<div class="copyright_link">
								<a href="#">Turms & Conditions</a> <a href="#">FAQ</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
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
<<<<<<< Updated upstream
	<script src="<c:url value='/js/forum/forum_article.js'/>"></script>
=======
	<script type="text/javascript">
	var indexPage = 1;
	var replyEditor;
	var articleid = $("#articleid").val()

	ClassicEditor
		.create(document.querySelector('#replyEditor'), {
			toolbar: ["heading", "|", "alignment:left", "alignment:center", "alignment:right", "alignment:adjust", "|", "bold", "italic", "blockQuote", "link", "|", "bulletedList", "numberedList", "imageUpload", "|", "undo", "redo"],
			language: 'zh'
		})
		.then(editor => {
			replyEditor = editor;
		})
		.catch(error => {
			console.error(error);
		});

	$(document).ready(function() {
		load(indexPage);
	})

	function load(indexPage) {
		if(!${checkLogin}){
			console.log('未登入');
			document.getElementById('replyDiv').style.display="none";
		}else{
			console.log('登入');
			document.getElementById('replyDiv').style.display="";
		}
		
		if (indexPage = 1) {
			$('#minusPage').hide();
		} else {
			$('#minusPage').show();
		}

		if (indexPage == $('#totalPages').val()) {
			$('#plusPage').hide();
		} else {
			$('#plusPage').show();
		}

		var table = $('#reply_table > tbody');

		$.ajax({
			type: 'post',
			url: '/loop/forum/reply/' + articleid + '/' + indexPage,	//要連結的網址
			dataType: 'JSON',	//要下載的格式
			contentType: 'application.json',	//要上傳的格式
			success: function(data) {
				table.empty("");
				var json = JSON.stringify(data);

				if (data == null) {
				} else {
					$.each(data, function(i, n) {
						var tr = "<tr align='center'>" +
							"<td style='width: 300px;', valign='top'>" +
							"<br/>" + n.users.userName +
							"<hr/>" + "發表於:" + n.replydate + "</td>" +
							"<td>" + n.content + "</td>" +
							"</tr>";
						table.append(tr);
					});
				}
			}
		});

		document.getElementById('myPage' + indexPage).style.backgroundColor = "#B08EAD";
		document.getElementById('myPage' + indexPage).style.color = "#fff";
	}

	function changePage(page) {
		document.getElementById('myPage' + indexPage).style.backgroundColor = "#fff";
		document.getElementById('myPage' + indexPage).style.color = "black";

		indexPage = page;

		if (type == 'article') {
			load(categoryid, indexPage);
		} else if (type == 'reply') {
			load(categoryid, indexPage);
		}
	};

	function addPage(page) {
		document.getElementById('myPage' + indexPage).style.backgroundColor = "#fff";
		document.getElementById('myPage' + indexPage).style.color = "black";

		if (page > 0) {
			indexPage = indexPage + 1;
		} else if (page < 0) {
			indexPage = indexPage - 1;
		}
	}

	function addPage(page) {

	}

	function addLikeNum() {
		$.ajax({
			type: 'get',
			url: '/loop/forum/article/' + articleid + '/addLikeNum',	//要連結的網址
			dataType: 'JSON',	//要下載的格式
			contentType: 'application.json',	//要上傳的格式
			success: function(data) {
			}
		});
		
		window.location.reload();
	}

	function addShareNum() {
		$.ajax({
			type: 'get',
			url: '/loop/forum/article/' + articleid + '/addShareNum',	//要連結的網址
			dataType: 'JSON',	//要下載的格式
			contentType: 'application.json',	//要上傳的格式
			success: function(data) {
			}
		});
		
		window.open('https://www.facebook.com/sharer/sharer.php?u=' + window.location);
		window.location.reload();
	}
	function replyArticle() {
		var obj = new Object();
		obj.articleid = articleid;
		obj.content = replyEditor.getData();

		$.ajax({
			type: 'post',
			url: "/loop/forum/reply/newReply",
			dataType: 'JSON',
			contentType: 'application/json',
			data: JSON.stringify(obj),
			success: function(data) {
			}
		});

		window.alert("回覆新增成功!!");
		load(1);
	}

	function gotoReply() {
		window.location.hash = $('replyEditor_container');
	}

	</script>
>>>>>>> Stashed changes
</body>

</html>