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
				
				<input type="button" value="${totalPages}">
				
				<div class="showpage">
					<table id="showpage">
						<tr>
							<td><button><i class="ti-control-backward"></i></button></td>
							<td colspan="5" align="right">
								<c:forEach var="i" items="${totalPages}" begin="1" end="${totalPages}" step="1">
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
<<<<<<< Updated upstream
	<script src="<c:url value='/js/forum/forum_main.js'/>"></script>
=======
	<script type="text/javascript">
	var categoryid = 0;
	var indexPage = 1;
	var sortType = "articleid"

	$(document).ready(function() {
		load(sortType, categoryid, indexPage);
	})

	function load(sortType, categoryid, indexPage) {
		if(document.URL.indexOf("#")!=-1){
			url = document.URL.substring(0, document.URL.length-1);
			
		}
		
		if (indexPage == '1') {
			$('#minusPage').hide();
		} else {
			$('#minusPage').show();
		}

		if (indexPage == $('#totalPages').val()) {
			$('#plusPage').hide();
		} else {
			$('#plusPage').show();
		}

		var table = $('#forum_table > tbody');
		table.empty("");

		$.ajax({
			type: 'post',
			url: '/loop/forum/sortType=' + sortType + '/' + categoryid + '/' + indexPage,	//要連結的網址
			dataType: 'JSON',	//要下載的格式
			contentType: 'application.json',	//要上傳的格式
			success: function(data) {
				var json = JSON.stringify(data, null, 4);
				
				if (data == null) {
					$('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
				} else {
					$.each(data, function(i, n) {
						var reply_name, reply_date;
						if(n.reply.length !== 0){
							reply_name = n.reply[n.reply.length-1].users.userName;
							reply_date = n.reply[n.reply.length-1].replydate;
						}else{
							reply_name = n.users.userName;
							reply_date = n.postdate;
						}
						
						var tr = "<tr align='center'>" +
							"<td>" + categoryName(n.categoryid) + "</td>" +
							"<td><a href='/loop/forum/article/" + n.articleid + "'>" + n.title + "</a></td>" +
							"<td>" + n.users.userName + "<br/><span style='font-size:8px; font-weight:lighter;'>" + n.postdate + "</span></td>" +
							"<td>" + n.reply.length + "/" + n.clickNum + "</td>" +
							"<td>" + reply_name + "<br/><span style='font-size:8px; font-weight:lighter;'>" + reply_date + "</span></td>" +
							"</tr>";
						table.append(tr);
					});
				}
			}
		});
		
		
			//Check if the current URL contains '#'
			if(document.URL.indexOf("#")==-1){
				//Set the URL to whatever it was plus "#""
				url = document.URL + "#";
				location = "#"
				//reload the page
				location.reload();
			}

		
		document.getElementById('myPage' + indexPage).style.backgroundColor = "#B08EAD";
		document.getElementById('myPage' + indexPage).style.color = "#fff";
	}

	function searchArticle() {
		keyword = $('#keyword').val();
		var table = $('#forum_table > tbody');

		$.ajax({
			type: 'post',
			url: '/loop/forum/search/' + categoryid + '/' + keyword + '/' + indexPage,	//要連結的網址
			dataType: 'JSON',	//要下載的格式
			contentType: 'application.json',	//要上傳的格式
			success: function(data) {
				table.empty("");
				var json = JSON.stringify(data, null, 4);

				if (data == null) {
					//$('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
				} else {
					$.each(data, function(i, n) {
						var reply_name, reply_date;
						if(n.reply.length !== 0){
							reply_name = n.reply[n.reply.length-1].users.userName;
							reply_date = n.reply[n.reply.length-1].replydate;
						}else{
							reply_name = n.users.userName;
							reply_date = n.postdate;
						}
						
						var tr = "<tr align='center'>" +
							"<td>" + categoryName(n.categoryid) + "</td>" +
							"<td><a href='/loop/forum/article/" + n.articleid + "'>" + n.title + "</a></td>" +
							"<td>" + n.authorid + "<br/><span style='font-size:8px; font-weight:lighter;'>" + n.postdate + "</span></td>" +
							"<td>" + n.reply.length + "/" + n.clickNum + "</td>" +
							"<td>" + reply_name + "<br/><span style='font-size:8px; font-weight:lighter;'>" + reply_date + "</span></td>" +
							"</tr>";
						table.append(tr);
					});
				}
			}
		});


	}

	function changePage(page) {
		document.getElementById('myPage' + indexPage).style.backgroundColor = "#fff";
		document.getElementById('myPage' + indexPage).style.color = "black";

		indexPage = page;
		load(sortType, categoryid, indexPage);
	};

	function addPage(page) {
		document.getElementById('myPage' + indexPage).style.backgroundColor = "#fff";
		document.getElementById('myPage' + indexPage).style.color = "black";

		if (page > 0) {
			indexPage = indexPage + 1;
		} else if (page < 0) {
			indexPage = indexPage - 1;
		}
		load(sortType, categoryid, indexPage);
	}

	function categoryName(categoryid) {
		switch (categoryid) {
			case 1:
				return '成品分享';
				break;
			case 2:
				return '手作教學';
				break;
			case 3:
				return '材料心得';
				break;
			case 4:
				return '店家評點';
				break;
			case 5:
				return '活動分享';
				break;
			case 6:
				return '二手交易';
		}
	}

	/* 點擊下拉式選單後，出現下拉式選單*/
	function selectSortType() {
		document.getElementById("sortType").classList.toggle("show");
	}

	// 點擊下拉式選單外後，關閉選單
	window.onclick = function(event) {
		if (!event.target.matches('.dropbtn')) {
			var dropdowns = document.getElementsByClassName("dropdown-content");
			var i;
			for (i = 0; i < dropdowns.length; i++) {
				var openDropdown = dropdowns[i];
				if (openDropdown.classList.contains('show')) {
					openDropdown.classList.remove('show');
				}
			}
		}
	}

	function changeSortType(sortType) {
		switch (sortType) {
			case 1:
				$('#sortType_btn').html("最新發佈 <i class='ti-angle-down'></i>");
				sortType = "articleid";
				load(sortType, categoryid, indexPage);
				break;
			case 2:
				$('#sortType_btn').html("最多瀏覽 <i class='ti-angle-down'></i>");
				sortType = "clickNum";
				load(sortType, categoryid, indexPage);
				break;
			case 3:
				$('#sortType_btn').html("最新回覆 <i class='ti-angle-down'></i>");
				sortType = "replyid";
				load(sortType, categoryid, indexPage);
				break;
			case 4:
				$('#sortType_btn').html("最多按讚 <i class='ti-angle-down'></i>");
				sortType = "likeNum";
				load(sortType, categoryid, indexPage);
				break;
		}
	}

	function changeCategoryid(newid) {
		categoryid = newid;
		load(sortType, categoryid, indexPage);
	}

	</script>
>>>>>>> Stashed changes
</body>

</html>