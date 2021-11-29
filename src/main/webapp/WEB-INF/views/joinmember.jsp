<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="zxx">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>loop</title>
<link rel="icon" href="img/favicon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet" href="css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="css/all.css">
<!-- flaticon CSS -->
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/themify-icons.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="css/magnific-popup.css">
<!-- swiper CSS -->
<link rel="stylesheet" href="css/slick.css">
<!-- style CSS -->
<link rel="stylesheet" href="css/style.css">
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
						<h2>加入會員</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb part end-->

	<!--================login_part Area =================-->
	<form:form action="joinmember" method="POST" modelAttribute="usersData">
		<div class="col-md-6 form-group p_star">
			<h4>會員帳號</h4>
			<form:input type="text" class="form-control" id="account"
				name="account" path="account" />

		</div>
		<div class="col-md-6 form-group p_star">
			<h4>會員密碼</h4>
			<form:input type="password" class="form-control" name="password"
				path="userPassword" />

		</div>
		<div class="col-md-6 form-group p_star">
			<h4>會員名稱</h4>
			<form:input type="text" class="form-control" name="userName"
				path="userName" />

		</div>
		<div class="col-md-6 form-group p_star">
			<h4>email</h4>
			<form:input type="text" class="form-control" id="email" path="email" />

		</div>
		<div class="col-md-6 form-group p_star">
			<h4>會員電話</h4>
			<form:input type="text" class="form-control" id="tel" path="tel" />

		</div>
		<div class="col-md-6 form-group p_star">
			<h4>會員地址</h4>
			<form:input type="text" class="form-control" id="userAddress"
				path="userAddress" />

		</div>
		<div>
			<button class="btn_3" type="submit">加入會員</button>
			<button class="btn_3" type="button" onclick="magic();">一鍵輸入</button>
		</div>
	</form:form>
	<br>
	<!--================login_part end =================-->
	<jsp:include page="/fragment/footer.jsp" />
	<!--::footer_part end::-->

	<!-- jquery plugins here-->
	<script src="js/jquery-1.12.1.min.js"></script>
	<!-- popper js -->
	<script src="js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- easing js -->
	<script src="js/jquery.magnific-popup.js"></script>
	<!-- swiper js -->
	<script src="js/swiper.min.js"></script>
	<!-- swiper js -->
	<script src="js/mixitup.min.js"></script>
	<!-- particles js -->
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<!-- slick js -->
	<script src="js/slick.min.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/contact.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/mail-script.js"></script>
	<!-- custom js -->
	<script src="js/custom.js"></script>
	<script>
		var count = 0
		function magic() {
			var name = [ "john", "amy", "tom", "ann", "test", "who" ];
			document.getElementById('account').value = name[count];
			document.getElementById('userName').value = name[count];
			document.getElementById('tel').value = "66316666";
			document.getElementById('email').value = name[count]
					+ "@google.com";
			document.getElementById('userAddress').value = "台北市大安區復興南路一段390號2樓";
			count++;
			if (count == 6) {
				count = 0;
			}
		}
	</script>
</body>

</html>