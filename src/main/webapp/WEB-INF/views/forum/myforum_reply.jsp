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
							<button id="sortType_btn" onclick="selectSortType()"
								class="dropbtn">
								留言列表<i class="ti-angle-down"></i>
							</button>
						</span>
						<div id="sortType" class="dropdown-content">
							<a href="/loop/forum/myforum">發文列表</a> <a
								href="/loop/forum/myforum/reply">留言列表</a>
						</div>
					</div>
				</div>
				<c:forEach var="i" begin="0" end="${replyAmount}" step="1">
				<input type="hidden" id="categoryid${i}" value="${categoryList[i]}">
				<input type="hidden" id="title${i}" value="${titleList[i]}">
				<input type="hidden" id="clickNum${i}" value="${clickNumList[i]}">
				<input type="hidden" id="replyNum${i}" value="${replyNumList[i]}">
				<input type="hidden" id="replyName${i}" value="${replyNameList[i]}">
				<input type="hidden" id="replyDate${i}" value="${replyDateList[i]}">
				</c:forEach>
				
				<div class="showpage">
					<table id="showpage">
						<input type="hidden" value="${totalPagesOfReply}" id="totalPagesOfReply">
						<tr>
							<td><button id="minusPage" onclick="addPage(-1)">
									<i class="ti-control-backward"></i>
								</button></td>
							<td id="page_btn" colspan="5" align="right"><c:forEach
									var="i" begin="1" end="${totalPagesOfReply}" step="1">
									<button id="myPage${i}" value="${i}" onclick="changePage(${i})">${i}</button>
								</c:forEach></td>
							<td style="width: 40px;"><button id="plusPage"
									onclick="addPage(1)">
									<i class="ti-control-forward"></i>
								</button></td>
						</tr>
					</table>
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
	var indexPage = 1;
	var type = 'article';

	$(document).ready(function() {
		load(indexPage);
	})

	function load(indexPage) {
		if (indexPage == '1') {
			$('#minusPage').hide();
		} else {
			$('#minusPage').show();
		}

		if (indexPage == $('#totalPagesOfReply').val()) {
			$('#plusPage').hide();
		} else {
			$('#plusPage').show();
		}
		
		var table = $('#forum_table > tbody');

		$.ajax({
			type: 'post',
			url: '/loop/forum/myforum/type=reply/' + indexPage,	//要連結的網址
			dataType: 'JSON',	//要下載的格式
			contentType: 'application.json',	//要上傳的格式
			success: function(data) {
				table.empty("");
				var json = JSON.stringify(data, null, 4);

				if (data == null) {
					$('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
				} else {
					$.each(data, function(i, n) {
						var categoryid = document.getElementById('categoryid'+i).value;
						var title = document.getElementById('title'+i).value;
						var clickNum = document.getElementById('clickNum'+i).value;
						var replyNum = document.getElementById('replyNum'+i).value;
						var replyName = document.getElementById('replyName'+i).value;
						var replyDate = document.getElementById('replyDate'+i).value;
						
						var tr = "<tr align='center' style='background-color: #f7f5f7'>" +
							"<td>" + categoryName(categoryid) + "</td>" +
							"<td><a href='/loop/forum/article/" + n.articleid + "'>" + title + "</a></td>" +
							"<td>" + replyNum + "/" + clickNum + "</td>" +
							"<td>" + replyName + "<br/><span style='font-size:8px; font-weight:lighter;'>" + replyDate + "</span></td>" +
							"</tr>";
						table.append(tr);
						
						var tr2 = "<tr align='center'>" +
								  "<td colspan='4' >" + n.content + "</td>" +
								  "</tr>"
						table.append(tr2);
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

	function categoryName(categoryid) {
		switch (categoryid) {
			case '1':
				return '成品分享';
				break;
			case '2':
				return '手作教學';
				break;
			case '3':
				return '材料心得';
				break;
			case '4':
				return '店家評點';
				break;
			case '5':
				return '活動分享';
				break;
			case '6':
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

	</script>
</body>

</html>