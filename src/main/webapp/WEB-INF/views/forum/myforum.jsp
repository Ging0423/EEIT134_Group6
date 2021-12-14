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
					<a href="<c:url value='/forum/newPost'/>"> <input type="button"
						value="發文">
					</a>
					<div class="dropdown sortType_select">
						<span>
							<button id="sortType_btn" onclick="selectSortType()" class="dropbtn">
								發文列表<i class="ti-angle-down"></i>
							</button>
						</span>
						<div id="sortType" class="dropdown-content">
							<a href="/loop/forum/myforum">發文列表</a>
							<a href="/loop/forum/myforum/reply">留言列表</a> 
						</div>
					</div>
				</div>

				<div class="showpage">
						<table id="showpage">
							<input type="hidden" value="${totalPagesOfUser}" id="totalPagesOfUser">
							<input type="hidden" value="${totalPagesOfReply}" id="totalPagesOfReply">
							<tr>
								<td><button id="minusPage" onclick="addPage(-1)">
										<i class="ti-control-backward"></i>
									</button></td>
								<td id="page_btn" colspan="5" align="right">
								<c:forEach var="i" begin="1" end="${totalPagesOfUser}" step="1">
									<button id="myPage${i}" value="${i}" onclick="changePage(${i})">${i}</button>
								</c:forEach></td>
								<td style="width:40px;"><button id="plusPage" onclick="addPage(1)">
										<i class="ti-control-forward"></i>
									</button></td>
							</tr>
						</table>
					</div>

				<div id="category_list" class="category_list">
					<ul>
						<li><a onclick="load(0,1)">全部<span>${articleAmountOfUser[0]}</span></a></li>
						<li><a onclick="load(1,1)">成品分享<span>${articleAmountOfUser[1]}</span></a></li>
						<li><a onclick="load(2,1)">手作教學<span>${articleAmountOfUser[2]}</span></a></li>
						<li><a onclick="load(3,1)">材料心得<span>${articleAmountOfUser[3]}</span></a></li>
						<li><a onclick="load(4,1)">店家評點<span>${articleAmountOfUser[4]}</span></a></li>
						<li><a onclick="load(5,1)">活動分享<span>${articleAmountOfUser[5]}</span></a></li>
						<li><a onclick="load(6,1)">二手交易<span>${articleAmountOfUser[6]}</span></a></li>
					</ul>
				</div>
			</div>

			<div class="forum_list">
				<table id="forum_table" class="forum_table">
					<thead>
						<tr>
							<td>文章分類</td>
							<td>標題</td>
							<td>回覆/查看</td>
							<td>最後發表</td>
							<td>修改文章</td>
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
	<script type="text/javascript">
	var categoryid = 0;
	var indexPage = 1;
	var type = 'article';

	$(document).ready(function() {
		load(categoryid, indexPage);
	})

	function load(categoryid, indexPage) {
		if (indexPage == '1') {
			$('#minusPage').hide();
		} else {
			$('#minusPage').show();
		}

		if (indexPage == $('#totalPagesOfUser').val()) {
			$('#plusPage').hide();
		} else {
			$('#plusPage').show();
		}
		
		var table = $('#forum_table > tbody');
		
		$.ajax({
			type: 'post',
			url: '/loop/forum/myforum/type=article/' + categoryid + '/' + indexPage,	//要連結的網址
			dataType: 'JSON',	//要下載的格式
			contentType: 'application.json',	//要上傳的格式
			success: function(data) {
				table.empty("");
				var json = JSON.stringify(data, null, 4);

				if (data == null) {
					$('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
				} else {
					$.each(data, function(i, n) {
						var reply_name, reply_date;
						if (n.reply.length !== 0) {
							reply_name = n.reply[n.reply.length-1].users.userName;
							reply_date = n.reply[n.reply.length-1].replydate;
						} else {
							reply_name = n.users.userName;
							reply_date = n.postdate;
						}

						var tr = "<tr align='center'>" +
							"<td>" + categoryName(n.categoryid) + "</td>" +
							"<td><a href='/loop/forum/article/" + n.articleid + "'>" + n.title + "</a></td>" +
							"<td>" + n.reply.length + "/" + n.clickNum + "</td>" +
							"<td>" + reply_name + "<br/><span style='font-size:8px; font-weight:lighter;'>" + reply_date + "</span></td>" +
							"<td><a href='/loop/forum/myforum/update/" + n.articleid + "'><i class='ti-pencil'></i></a>" + "/" +
							"<a onclick='checkDelete(" + n.articleid + ")'><i class='ti-trash'></i></a></td>" +
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
		
		if(type == 'article'){
			load(categoryid, indexPage);
		}else if(type == 'reply'){
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
		
		if(type == 'article'){
			load(categoryid, indexPage);
		}else if(type == 'reply'){
			loadReply(indexPage);
		}
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

	function checkDelete(articleid) {
		var deleteArticle = confirm("確定刪除文章嗎?");

		if (deleteArticle == true) {
			$.ajax({
				type: 'post',
				url: '/loop/forum/myforum/delete/' + articleid,	//要連結的網址
				dataType: 'JSON',	//要下載的格式
				contentType: 'application.json',	//要上傳的格式
				success: function(data) {
					window.alert("已成功刪除文章!!");
				}
			});
		}

		window.location.reload();
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

// 	function changeSortType(sortType) {
// 		switch (sortType) {
// 			case 1:
// 				document.getElementById("category_list").style.visibility = '';
// 				$('#sortType_btn').html("發文列表 <i class='ti-angle-down'></i>");
// 				indexPage = 1;
// 				type = 'article';
// 				load(categoryid, indexPage);
// 				break;
// 			case 2:
// 				document.getElementById("category_list").style.visibility = 'hidden';
// 				$('#sortType_btn').html("留言列表 <i class='ti-angle-down'></i>");
// 				indexPage = 1;
// 				type = 'reply';
// 				loadReply(indexPage);
// 				break;
// 		}
// 	}

	</script>
</body>

</html>