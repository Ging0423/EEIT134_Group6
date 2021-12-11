<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="zxx">

<head>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
                        <h2>會員登入</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb part end-->

    <!--================login_part Area =================-->
    <section class="login_part section_padding ">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6">
                    <div class="login_part_text text-center">
                        <div class="login_part_text_iner">
                            <h2>第一次來嗎?</h2>
                            <p>這是一個提供手作材料及教學的網站</p>
                            <a href="<c:url value='/joinmember'/>" class="btn_3">加入會員</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="login_part_form">
                        <div class="login_part_form_iner">
                            <h3>歡迎回來~ <br>
                                請先登入</h3>
                            <form class="row contact_form" action="login" method="post" novalidate="novalidate" id="login">
                                <div class="col-md-12 form-group p_star">
                                    <input type="text" class="form-control" id="account" name="account" value=""
                                        placeholder="Account" onchange="check()"><span style=color:red id="accounterrorMsg"></span>
                                </div>
                                <div class="col-md-12 form-group p_star">
                                    <input type="password" class="form-control" id="password" name="password" value=""
                                        placeholder="Password" onchange="check()"><span style=color:red id="pwerrorMsg"></span>
                                </div>
                                <div class="col-md-12 form-group">
                                    <div class="creat_account d-flex align-items-center">
                                        <input type="checkbox" id="rememberMe" name="rememberMe">
                                        <label for="f-option">記住帳號</label>
                                    </div>
                            	      <button class="btn_3" type="button" onclick="checkok();">登入</button>
                                    <a class="lost_pass" href="#">忘記密碼？</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
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
    function check() {
    	let account = document.getElementById("account").value;
		let description1 = document.getElementById('accounterrorMsg');
		let password = document.getElementById("password").value;
		let description2 = document.getElementById('pwerrorMsg');
    
		let count = 0;
		
		if(account == "") {
			description1.innerHTML="<img src='img/usercheck/checkNO.png'/> 帳號不可空白";
			count++;
		}
			else{
			description1.innerHTML="<img src='img/usercheck/checkYES.png'/>";	
		} 
		
		if(password == "") {
			description2.innerHTML="<img src='img/usercheck/checkNO.png'/> 密碼不可空白";
			count++;
		}
			else{
				description2.innerHTML="<img src='img/usercheck/checkYES.png'/>";	
		}
    
	}
    
    function checkok() {
    	let account = document.getElementById("account").value;
		let description1 = document.getElementById('accounterrorMsg');
		let password = document.getElementById("password").value;
		let description2 = document.getElementById('pwerrorMsg');
    
		let count = 0;
		
		if(account == "") {
			description1.innerHTML="<img src='img/usercheck/checkNO.png'/> 帳號不可空白";
			count++;
		}
			else{
			description1.innerHTML="<img src='img/usercheck/checkYES.png'/>";	
		} 
		
		if(password == "") {
			description2.innerHTML="<img src='img/usercheck/checkNO.png'/> 密碼不可空白";
			count++;
		}
			else{
				description2.innerHTML="<img src='img/usercheck/checkYES.png'/>";	
		}
    
		if(count == 0) {
			alert("登入成功！")
			document.getElementById("login").submit()
		}
	}
    
    
    </script>
    
</body>
</html>