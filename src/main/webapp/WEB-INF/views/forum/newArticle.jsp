<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<<<<<<< Updated upstream
<!doctype html>
<html lang="zxx">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Loop 討論區-發文</title>
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
											class="dropdown-item" href="<c:url value='/myarticle'/>">我的文章</a>
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

	<section class="forum_content">
		<div id="editor">
			<p>請在這裡填寫內容</p>
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
	<script src="你的路徑/build/ckeditor.js"></script>
	<script>
		ClassicEditor.create( document.querySelector( '#editor' ), {
			// 這裡可以設定 plugin
		}).then( editor => {
			console.log( 'Editor was initialized', editor );
		}).catch( err => {
			console.error( err.stack );
		});
	</script>
</body>

=======
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>發布新文章</title>
<script src="<c:url value='/js/jquery-1.12.1.min.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/css/forumstyle.css'/>">
<script src="<c:url value='/js/ckeditor.js'/>"></script>
</head>
<body>
	<div class="forum_content">
		<span> <select id="category">
				<option value='0'>請選擇主題類別</option>
				<option value="1">成品分享</option>
				<option value="2">手作教學</option>
				<option value="3">材料心得</option>
				<option value="4">店家評點</option>
				<option value="5">活動分享</option>
				<option value="6">二手交易</option>
		</select> <input type="text" size="25" id="title" onkeyup="titlecheck()">
			<span id="titlecheck">尚可輸入25個字元</span>
		</span>

		<textarea id="editor">
			<p>請輸入文章內容</p>
		</textarea>
		
		<span id="contenttest"></span>

		<div>
			<label id="articletag"><span>主題標籤</span></label> <label
				id="pubdate_set"><span>定時發布</span></label>
		</div>

		<input type="submit" value="發表新文章" onclick="sendArticle()">
	</div>

	<script type="text/javascript">
		var myEditor;
		
		ClassicEditor.create( document.querySelector('#editor'), {
		})
		.then(editor => {
			console.log( 'Editor was initialized', editor );
			myEditor = editor;
		 })
		 .catch( err => {
			console.error( err.stack );
		 });
		
		//檢查標題字數
		function titlecheck(){
	    	var title = $("#title").val();
	    	var textleft = 25-title.length;
	    	
	    	if(textleft >= 0)
	    		$("#titlecheck").html("尚可輸入" + textleft + "個字元");
	    	else
	    		$("#titlecheck").html("已超過標題輸入上限");
	    }
		
		//檢查文章資料是否錯誤並送出資料到後台
		function sendArticle(){
			var title = $("#title").val();
			var categoryid = $("#category").val();
			var errorMessage = [];
			
			// check文章類別 標題是否空白或標題是否超過字數
			if($.trim(categoryid) == '0'){
				errorMessage.push('需要選擇文章類別');
			}
			if($.trim(title) == ''){
				errorMessage.push('\n請加入文章標題');
			}
			if($.trim(title).length >25){
				errorMessage.push('\n標題字數超過上限，請修改標題');
			}
			if(errorMessage.length){
				alert (errorMessage);
				return;
			}
			
			//確認資料ok，送出資料到後端
			var article = {
				"title":title,
				"authorid":1,
				"categoryid":categoryid,
				"content":myEditor.getData()
			}
				
			//發文成功送去的頁面url
			const url = "/loop/forum/newArticleSuccess";
			
			$.ajax({
				type:'post',
				url: url,
				dataType:'JSON',
				contentType:'application/json',
				data:JSON.stringify(article),
				success: function(data){
					console.log(data);
				}
			}); 
		}
	</script>

	<script>
		
	
		
		
		
			

			
// 			// Create XMLHttpRequest
// 			var xhr = new XMLHttpRequest();

// 			// Create Callback function
// 			xhr.onreadystatechange = function(){
// 			  if(xhr.readyState === 4 && xhr.status === 200){
// // 			    document.getElementById('ajax').innerHTML = xhr.responseText;
// 			   }
// 			};

// 			// open('格式','網址','同步與非同步')
// 			xhr.open('POST', url)

// 			// send request
// 			// 傳送資料:title, categoryid, authorid, content
// 			xhr.send(article);
			
	</script>
</body>
>>>>>>> Stashed changes
</html>