<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="zxx">
<c:url value='' />
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>loop</title>
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
<style type="text/css">
	.single_product_item {
	display: none;
}

/* =========回頂部========= */
.back-to-top {
display: none; /* 默認是隱藏的，這樣在第一屏才不顯示 */
position: fixed; /* 位置是固定的 */
bottom: 20px; /* 顯示在頁面底部 */
right: 30px; /* 顯示在頁面的右邊 */
z-index: 99; /* 確保不被其他功能覆蓋 */
border: 1px solid #B08EAD; /* 顯示邊框 */
outline: none; /* 不顯示外框 */
background-color: #fff; /* 設置背景背景顏色 */
color: #B08EAD; /* 設置文本顏色 */
cursor: pointer; /* 滑鼠移到按鈕上顯示手型 */
padding: 10px 15px 15px 15px; /* 增加一些內邊距 */
border-radius: 10px; /* 增加圓角 */
}
.back-to-top:hover {
background-color: #B08EAD; /* 滑鼠移上去時，反轉顏色 */
color: #fff;
}
/* =========回頂部========= */
</style>
</head>

<body>
	<!--::header part start::-->
	    <jsp:include page="/fragment/header.jsp" />
	<!-- Header part end-->
	
	 <!-- breadcrumb part start-->
    <section class="breadcrumb_part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <h2>書籍</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb part end-->
    
	<!-- product list part start-->
	<section class="product_list section_padding">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="product_sidebar">
						<div class="single_sedebar">
							<form name="form1" action="/loop/items/search" method='GET'>
							<input type="text" name="key" placeholder="輸入關鍵字找書籍">
<!-- 								<input type="text" name="key" placeholder="Search keyword"> -->
								<a href="javascript:document.form1.submit();"><i class="ti-search"></i></a>
								</form>	
						</div>
						<div class="single_sedebar">
<!-- 							<form name="form2" action="/loop/items/searchprice" method='GET'> -->
<!-- 								<input type="text" name="price" placeholder="Search keyword"> -->
<!-- 								<a href="javascript:document.form2.submit();"><i class="ti-search"></i></a> -->
<!-- 							</form> -->
<!-- 						</div> -->
						<div class="single_sedebar">
<!-- 							<div class="select_option"> -->
<!-- 								<div class="select_option_list"> -->
<!-- 									Category <i class="right fas fa-caret-down"></i> -->
<!-- 								</div> -->
<!-- 								<div class="select_option_dropdown"> -->
<!-- 									<p> -->
<!-- 										<a href="#">Category 1</a> -->
<!-- 									</p> -->
<!-- 									<p> -->
<!-- 										<a href="#">Category 2</a> -->
<!-- 									</p> -->
<!-- 									<p> -->
<!-- 										<a href="#">Category 3</a> -->
<!-- 									</p> -->
<!-- 									<p> -->
<!-- 										<a href="#">Category 4</a> -->
<!-- 									</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="single_sedebar"> -->
<!-- 							<div class="select_option"> -->
<!-- 								<div class="select_option_list"> -->
<!-- 									Type <i class="right fas fa-caret-down"></i> -->
<!-- 								</div> -->
<!-- 								<div class="select_option_dropdown"> -->
<!-- 									<p> -->
<!-- 										<a href="#">Type 1</a> -->
<!-- 									</p> -->
<!-- 									<p> -->
<!-- 										<a href="#">Type 2</a> -->
<!-- 									</p> -->
<!-- 									<p> -->
<!-- 										<a href="#">Type 3</a> -->
<!-- 									</p> -->
<!-- 									<p> -->
<!-- 										<a href="#">Type 4</a> -->
<!-- 									</p> -->
<!-- 								</div> -->
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-8">
					<div class="product_list">
						<div class="row">
							<c:forEach var="item" items='${allItem}'>
								<div class="col-lg-6 col-sm-6">
									<div class="single_product_item">
									<div class="product_display">
                                    <img src='<c:url value="/items/img/${item.img}" />' alt="#" class="img-fluid">
<%--                                             <a href='<c:url value="/items/books/${item.itemId}"/>'><img src='<c:url value="/items/img/${itemImg.img}" />'</a> --%>
										<h3>
											<a href='<c:url value="/items/books/${item.itemId}"/>'>${item.itemName}</a>
										</h3>
                                            <p>$${item.price}</p>
<%-- 										<p>${item.color}</p> --%>
									</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="load_more_btn text-center">
							<a href="#" class="btn_3" id="loadmore">Load More</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- product list part end-->

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
<%-- 	<script src="<c:url value='/js/contact.js'/>"></script> --%>
	<script src="<c:url value='/js/jquery.ajaxchimp.min.js'/>"></script>
	<script src="<c:url value='/js/jquery.form.js'/>"></script>
	<script src="<c:url value='/js/jquery.validate.min.js'/>"></script>
	<script src="<c:url value='/js/mail-script.js'/>"></script>
	<!-- custom js -->
	<script src="<c:url value='/js/custom.js'/>"></script>
	
<script src ="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"> </script>
<script src ="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"> </script>
	
<script>  
$(document).ready (function () {  
  $(".single_product_item").slice(0, 6).show();  
  $(".btn_3").on("click", function(e){  
    e.preventDefault();  
    $(".single_product_item:hidden").slice(0, 6).slideDown();  
    if ($(".single_product_item:hidden").length == 0) {  
      $(".btn_3").text("沒有更多商品").addClass("noContent");  
    }  
  });  
  })  
</script> 	
<!-- 			=============回頂部======================== -->
<button class="js-back-to-top back-to-top">︽</button>


<!-- <div style="background-color:#5cb85c;color:white;padding:20px">固定到底部</div> -->
<!-- <div style="background-color:#f6f6f6;padding:20px 20px 1000px"> -->
<!-- 該實例演示了如何創建一個「回到頂部」按鈕。請往下滾動，體驗效果。</div> -->
<button class="js-back-to-top back-to-top" title="回到頭部">&#65085;</button>
<script src="https://cdn.staticfile.org/jquery/2.2.4/jquery.min.js"></script>
<script>

$(function () {
var $win = $(window);
var $backToTop = $('.js-back-to-top');
// 當用戶滾動到離頂部100像素時，展示回到頂部按鈕
$win.scroll(function () {
if ($win.scrollTop() > 10) {
$backToTop.show();
} else {
$backToTop.hide();
}
});
//當用戶點擊按鈕時，通過動畫效果返回頭部
$backToTop.click(function () {
$('html, body').animate({scrollTop: 0}, 200);
});
});
</script>
		=============回頂部======================== -->
 	
</body>
</html>