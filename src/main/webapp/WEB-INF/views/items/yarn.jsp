<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="zxx">
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
						<h2>紗線</h2>
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
							<input type="text" name="key" placeholder="輸入關鍵字找紗線">
<!-- 								<input type="text" name="key" placeholder="Search keyword"> -->
								<i class="ti-search"></i>
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
<!-- 									<div class="product_display"> -->
										<img src='<c:url value="/items/img/${item.img}" />' alt="#" class="img-fluid">
<%--                                             <a href='<c:url value="/items/books/${item.itemId}"/>'><img src='<c:url value="/items/img/${itemImg.img}" />'</a> --%>
										<h3>
											<a href='<c:url value="/items/yarn/${item.itemId}"/>'>${item.itemName}</a>
										</h3>
										<p>$${item.price}</p>
										<%-- 										<p>${item.material}</p> --%>
										<%-- 										<p>${item.color}</p> --%>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="load_more_btn text-center">
							<a href="#" class="btn_3">更多商品</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- product list part end-->
	    <jsp:include page="/fragment/footer.jsp" />
	<!-- Header part end-->
	
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
</body>
</html>