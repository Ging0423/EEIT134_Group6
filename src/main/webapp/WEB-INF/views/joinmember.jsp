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
	<form:form action="joinmember" method="POST" modelAttribute="usersData" id="userinsert">
		<div class="col-md-6 form-group p_star">
			<h4>會員帳號：</h4>
			<form:input type="text" class="form-control" id="account"
				name="account" path="account" onblur="checkaccountisduplicate()"/><span style=color:red id="accounterrorMsg"></span>

		</div>
		<div class="col-md-6 form-group p_star">
			<h4>會員密碼：</h4>
			<form:input type="password" class="form-control" name="password" id="password"
				path="userPassword" onblur="check()"/><span style=color:red id="pwerrorMsg"></span>

		</div>
		<div class="col-md-6 form-group p_star">
			<h4>會員名稱：</h4>
			<form:input type="text" class="form-control" name="userName" id="userName"
				path="userName" onblur="check()"/><span style=color:red id="userNameerrorMsg"></span>

		</div>
		<div class="col-md-6 form-group p_star">
			<h4>email：</h4>
			<form:input type="text" class="form-control" id="email" path="email" placeholder="example@example.com" 
			onblur="checkemailisduplicate()"/>
			<span style=color:red id="emailerrorMsg"></span>
			
		</div>
		<div class="col-md-6 form-group p_star">
			<h4>會員電話：</h4>
			<form:input type="text" class="form-control" id="tel" path="tel" placeholder="09XX-XXX-XXX" onblur="check()"/>
			<span style=color:red id="telerrorMsg"></span>
		</div>
		
		<div class="col-md-6 form-group p_star">
			<h4>會員地址：</h4>
			<form:input type="text" class="form-control" id="userAddress"
				path="userAddress" onblur="check()"/><span style=color:red id="userAddresserrorMsg"></span>
				
		</div>
		<div>
			<!--<button class="btn_3" type="submit">加入會員</button>-->
			<button class="btn_3" type="button" onclick="checkok();">加入會員</button>
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
	
		var count = 0;
		var count3 = 0;	
		
		function magic() {			
			var name = ["john"];
			document.getElementById('account').value = name[count];
			document.getElementById('userName').value = name[count];
			document.getElementById('tel').value = "66316666";
			document.getElementById('email').value = "eeitloopdemo@gmail.com";
			document.getElementById('userAddress').value = "台北市大安區復興南路一段390號2樓";
			count++;
			if (count == 1) {
				count = 0;
			}
		}
		
		function check() {
			var count2 = 0;

			let password = document.getElementById("password").value;
			let description2 = document.getElementById('pwerrorMsg');
			let userName = document.getElementById("userName").value;
			let description3 = document.getElementById('userNameerrorMsg');
			let tel = document.getElementById("tel").value;
			let description5 = document.getElementById('telerrorMsg');
			let userAddress = document.getElementById("userAddress").value;
			let description6 = document.getElementById('userAddresserrorMsg');
																										
			
			if(password == "") {
				description2.innerHTML="<img src='img/usercheck/checkNO.png'/> 必填欄位";
				count2++;
			}
				else{
					description2.innerHTML="<img src='img/usercheck/checkYES.png'/>";	
			}
			if(userName == "") {
				description3.innerHTML="<img src='img/usercheck/checkNO.png'/> 必填欄位";
				count2++;
			}
				else{
					description3.innerHTML="<img src='img/usercheck/checkYES.png'/>";	
			}
	
			if(tel == "") {
				description5.innerHTML="<img src='img/usercheck/checkNO.png'/> 必填欄位";
				count2++;
			}
				else{
					description5.innerHTML="<img src='img/usercheck/checkYES.png'/>";	
			}
			if(userAddress == "") {
				description6.innerHTML="<img src='img/usercheck/checkNO.png'/> 必填欄位";
				count2++;
			}
				else{
					description6.innerHTML="<img src='img/usercheck/checkYES.png'/>";	
			}
			console.log("四欄位中有"+count2+"個錯誤");
			
		}
		
		function checkok() {
			let account = document.getElementById("account").value;
			let description1 = document.getElementById('accounterrorMsg');
			let password = document.getElementById("password").value;
			let description2 = document.getElementById('pwerrorMsg');
			let userName = document.getElementById("userName").value;
			let description3 = document.getElementById('userNameerrorMsg');
			let email = document.getElementById("email").value;
			let description4 = document.getElementById('emailerrorMsg');
			let tel = document.getElementById("tel").value;
			let description5 = document.getElementById('telerrorMsg');
			let userAddress = document.getElementById("userAddress").value;
			let description6 = document.getElementById('userAddresserrorMsg');
																										
			var count1 = 0;
			
			 if(checkaccountisduplicate()) {
				
				count1++;
				 console.log("帳號欄位裡面有"+count1+/*","+count3+*/"個錯誤");
				 }else{
					 console.log("帳號欄位裡面有"+count1+/*","+count3+*/"個錯誤");
					 
			}
		/*		else{
				description1.innerHTML="<img src='img/usercheck/checkYES.png'/>";	
			} */
			


			
			
			
			//console.log("帳號欄位外面有"+count1+/*","+count3+*/"個錯誤");

			
			
			
			if(password == "") {
				description2.innerHTML="<img src='img/usercheck/checkNO.png'/> 必填欄位";
				count1++;
			}
				else{
					description2.innerHTML="<img src='img/usercheck/checkYES.png'/>";	
			}
			if(userName == "") {
				description3.innerHTML="<img src='img/usercheck/checkNO.png'/> 必填欄位";
				count1++;
			}
				else{
					description3.innerHTML="<img src='img/usercheck/checkYES.png'/>";	
			}
			
			
			
			/////////////////////////////////////////////////////////////////////////////////////////
			/*if(email == "") {
				description4.innerHTML="<img src='img/usercheck/checkNO.png'/> 必填欄位";
				count1++;
				
			}
				else{
					description4.innerHTML="<img src='img/usercheck/checkYES.png'/>";	
			}*/
			
			 if(checkemailisduplicate()) {
					
					count1++;
					 console.log("email欄位裡面有"+count1+/*","+count3+*/"個錯誤");
					 }else{
						 console.log("email欄位裡面有"+count1+/*","+count3+*/"個錯誤");
						 
				}
			/////////////////////////////////////////////////////////////////////////////////////////
			
			
			
			if(tel == "") {
				description5.innerHTML="<img src='img/usercheck/checkNO.png'/> 必填欄位";
				count1++;
			}
				else{
					description5.innerHTML="<img src='img/usercheck/checkYES.png'/>";	
			}
			if(userAddress == "") {
				description6.innerHTML="<img src='img/usercheck/checkNO.png'/> 必填欄位";
				count1++;
			}
				else{
					description6.innerHTML="<img src='img/usercheck/checkYES.png'/>";	
			}
			
			console.log("全部有"+count1+"個錯誤");
			if( count1 == 0) {
				alert("註冊成功！")
				document.getElementById("userinsert").submit()
			}
		}
			
		   function checkaccountisduplicate(){
			let account = document.getElementById("account").value;
			let description1 = document.getElementById('accounterrorMsg');
			if(account == "") {
				description1.innerHTML="<img src='img/usercheck/checkNO.png'/> 必填欄位";
				return true;
			}
				else{
				 $.ajax({
					   type:'post',
					   url:'joinmember/acisduplicate',
					   data:account,
					   contentType : 'application/json; charset=UTF-8',
					   success: function(data){					   
						   if(data==true){
							   var count4 = 0;
							   description1.innerHTML = "<img src='img/usercheck/checkNO.png'/> 此帳號已被使用, 請重新輸入！";
							   count4++;
							   console.log("ajax內帳號有"+count4+"個錯誤");
							   return true;
						   }else{						   
							   description1.innerHTML = "<img src='img/usercheck/checkYES.png'/>";
							  	return false;
						   }
					   }
				   });
			  } 
		   }
		   
		   
		   
		   
		   
		   function checkemailisduplicate(){
				let email = document.getElementById("email").value;
				let description4 = document.getElementById('emailerrorMsg');
				if(email == "") {
					description4.innerHTML="<img src='img/usercheck/checkNO.png'/> 必填欄位";
				}else{
			    $.ajax({
					   type:'post',
					   url:'joinmember/emisduplicate',
					   data:email,
					   contentType : 'application/json; charset=UTF-8',
					   success: function(data){					   
						   if(data==true){
							   description4.innerHTML = "<img src='img/usercheck/checkNO.png'/> 此email已被使用, 請重新輸入！";
						   }else{						   
							   description4.innerHTML = "<img src='img/usercheck/checkYES.png'/>";					   	   
						   }
					   }
				   });
				}
				

			   }
	</script>
	
</body>

</html>