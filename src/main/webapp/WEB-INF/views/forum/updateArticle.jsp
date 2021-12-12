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
				<input id="categoryid" type="hidden"
					value="${article.getCategoryid()}" />
				<div class="dropdown">
					<input type="button" id="category_btn" onclick="selectCategory()"
						class="dropbtn" value="">
					<div id="category" class="dropdown-content">
						<a onclick="changeCategoryid(0)">請選擇主題類別</a> <a
							onclick="changeCategoryid(1)">成品分享</a> <a
							onclick="changeCategoryid(2)">手作教學</a> <a
							onclick="changeCategoryid(3)">材料心得</a> <a
							onclick="changeCategoryid(4)">店家評點</a> <a
							onclick="changeCategoryid(5)">活動分享</a> <a
							onclick="changeCategoryid(6)">二手交易</a>
					</div>
				</div>
				<input type="text" size="25" id="title" onkeyup="titlecheck()"
					value="${article.getTitle()}"> <span id="titlecheck">尚可輸入25個字元</span>
				<div style="float: right; margin-right: 50px; padding-inline: 10px; background-color: #B08EAD;"><a style="color: #fff;" href="/loop/forum/myforum">返回列表</a></div>
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
	<script type="text/javascript">
		var myEditor;
var categoryid;

$(document).ready(function() {
	categoryid = $('#categoryid').val();
	console.log(categoryid);
	
	if (categoryid == 1){
		document.getElementById("category_btn").value = "成品分享";
	} else if (categoryid == 2){
		document.getElementById("category_btn").value = "手作教學";
	} else if (categoryid == 3){
		document.getElementById("category_btn").value = "材料心得";
	} else if (categoryid == 4){
		document.getElementById("category_btn").value = "店家評點";
	} else if (categoryid == 5){
		document.getElementById("category_btn").value = "活動分享";
	} else if (categoryid == 6){
		document.getElementById("category_btn").value = "二手交易";
	}
})

ClassicEditor
	.create(document.querySelector('#editor'))
	.then(editor => {
		myEditor = editor;
	})
	.catch(error => {
		console.error(error);
	});

//檢查標題字數
function titlecheck() {
	var title = $("#title").val();
	var textleft = 25 - title.length;

	if (textleft >= 0)
		$("#titlecheck").html("尚可輸入" + textleft + "個字元");
	else
		$("#titlecheck").html("已超過標題輸入上限");
}

//檢查文章資料是否錯誤並送出資料到後台
function sendArticle() {
	var title = $("#title").val();
	var errorMessage = [];

	// check文章類別 標題是否空白或標題是否超過字數
	if (categoryid == '0') {
		errorMessage.push('需要選擇文章類別');
	}
	if ($.trim(title) == '') {
		errorMessage.push('\n請加入文章標題');
	}
	if ($.trim(title).length > 25) {
		errorMessage.push('\n標題字數超過上限，請修改標題');
	}
	if (errorMessage.length) {
		alert(errorMessage);
		return;
	}

	//確認資料ok，送出資料到後端
	var article = {
		"articleid": ${article.getArticleid()},
		"title": title,
		"authorid": ${article.getAuthorid()},
		"clickNum": ${article.getClickNum()},
		"likeNum": ${article.getLikeNum()},
		"shareNum": ${article.getShareNum()},
		"categoryid": categoryid,
		"content": myEditor.getData()
	}

	console.log(JSON.stringify(article));
	
	$.ajax({
		type: 'post',
		url: "/loop/forum/myforum/updateArticleSuccess",
		dataType: 'JSON',
		contentType: 'application/json',
		data: JSON.stringify(article),
		success: function(data) {
		}
	});
	
	window.alert("已成功修改文章!!");
// 	window.location.replace("/loop/forum/myforum");
}

/* 點擊下拉式選單後，出現下拉式選單*/
function selectCategory() {
  document.getElementById("category").classList.toggle("show");
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

// 點擊下拉式選單選項，修改categoryid的值
function changeCategoryid(selected){
	categoryid = selected;
	var category_name;
	
	switch (categoryid){
		case 0:
			category_name = "請選擇主題類別";
			break;
		case 1:
			category_name = "成品分享";
			break;
		case 2:
			category_name = "手作教學";
			break;
		case 3:
			category_name = "材料心得";
			break;
		case 4:
			category_name = "店家評點";
			break;
		case 5:
			category_name = "活動分享";
			break;
		case 6:
			category_name = "二手交易";
			break;
		case 7:
			category_name = "請選擇主題類別";
			break;
	}
	
	document.getElementById("category_btn").value = category_name;
	return category_name;
}
	</script>
</body>

</html>