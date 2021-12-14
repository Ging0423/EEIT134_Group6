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

								</c:forEach></td>
								<td style="width:40px;"><button id="plusPage" onclick="addPage(1)">
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
							<td style="width: 300px;" valign="top">
								<h4>${article.getUsers().getUserName()}</h4>
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

			<div id="replyDiv" class="replyEditor_container">
				<textarea id="replyEditor">
					<p>請輸入回覆內容</p>
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
</body>

</html>