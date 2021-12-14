<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loop</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/js/all.min.js"
	integrity="sha512-YSdqvJoZr83hj76AIVdOcvLWYMWzy6sJyIMic2aQz5kh2bPTd9dzY3NtdeEAzPp/PhgZqr4aJObB3ym/vsItMg=="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="<c:url value='/backend/css/style.css'/>"
	type="text/css">
	<link rel="icon" href="img/favicon.png">
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

<style>
.divWidth {
	width: 75%;
	margin-right: auto;
	margin-left: auto;
}
.container{
    position: relative;
    width: 100%;
}

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
body {
  font-family: Arial;
}

* {
  box-sizing: border-box;
}

form.example input[type=text] {
  padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 80%;
  background: #f1f1f1;
}

form.example button {
  float: left;
  width: 20%;
  padding: 10px;
  background: #B08EAD;
  color: white;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none;
  cursor: pointer;
}

form.example::after {
  content: "";
  clear: both;
  display: table;
}

.btn {
background-color:#B08EAD;
color: white
}

</style>
</head>

<body>
<!-- =========== -->
	<div class="container1">
		<div class="navigation">
			<ul>
				<li><a href="<c:url value='/backend'/>"> <span class="icon"><i
							class="fas fa-infinity" aria-hidden="true"></i></span> 
<!-- 							<span class="title"><h2>loop<h2></span> -->
	<span class="title"><img src= "<c:url value='/img/loop.png' />"></span>
				</a></li>
				<li><a href="<c:url value='/backend/admin'/>"> <span class="icon"><i
							class="fas fa-users-cog" aria-hidden="true"></i></span> <span
						class="title">會員專區</span>
				</a></li>
				<li><a href="<c:url value='/backend/allitem'/>"> <span
						class="icon"><i class="fas fa-shopping-bag"
							aria-hidden="true"></i></span> <span class="title">商品管理</span>
				</a></li>
<!--                 ================== -->
<!--                 <li> -->
<%--                     <a href="<c:url value='/backend/useritems'/>"> --%>
<!--                         <span class="icon"><i class="fas fa-shopping-bag" aria-hidden="true"></i></span> -->
<!--                         <span class="title">會員手作商品管理</span> -->
<!--                     </a> -->
<!--                 </li> -->
<!--                 ================== -->
				<li><a href="<c:url value='/backend/order'/>"> <span class="icon"><i
							class="fas fa-cart-arrow-down" aria-hidden="true"></i></span> <span
						class="title">訂單管理</span>
				</a></li>
<%-- 				<li><a href="<c:url value=''/>"> <span class="icon"><i --%>
<!-- 							class="fas fa-comments" aria-hidden="true"></i></span> <span -->
<!-- 						class="title">訊息管理</span> -->
<!-- 				</a></li> -->
				<li><a href="<c:url value='/backend/video'/>"> <span class="icon"><i
							class="far fa-file-video" aria-hidden="true"></i></span> <span
						class="title">教學影片管理</span>
				</a></li>
				<li><a href="<c:url value='/backend/forum'/>"> <span class="icon"><i
							class="far fa-newspaper" aria-hidden="true"></i></span> <span
						class="title">討論區管理</span>
				</a></li>
				<li><a href="<c:url value='/logout'/>"> <span class="icon"><i
							class="fas fa-sign-out-alt" aria-hidden="true"></i></span> <span
						class="title">登出</span>
				</a></li>
			</ul>
		</div>
		
		<div class="main">
			<div class="topbar">
				<div class="toggle" onclick="toggleMenu();">
					<i class="fas fa-bars"></i>
				</div>
				<div class="search">
<form class="example" action="/action_page.php" style="margin:auto;max-width:300px">
  <input type="text" placeholder="Search.." name="search2">
  <button type="submit"><i class="fa fa-search"></i></button>
</form>
				</div>
				<div class="user">
<!-- 					<img src="image/user.jpg"> -->
				</div>
			</div>
			
<!-- ========================= -->			
<div align='center'>
<div style="background-color:#B08EAD"><br>
<h1 style="color:#fff">新增教學影片</h1><br>
<hr>
</div><br>
			
			<div class=divWidth>
			<c:url value="/backend/video/create" var="url"/>
				<form method="POST" action="${url}" id="myform">

					<table class="table table-striped">
						<tr>
							<td>影片名稱</td>
							<td><input id="videoName" name="videoName" type="text"/></td>
							<td></td>
						</tr>
						<tr>
							<td>連結</td>
							<td><input id="link" name="videoLink" type="text" onchange="show();"/></td>
							<td><span id="showVideo"></span></td>
						</tr>
						<tr>
							<td>影片敘述</td>
							<td><textarea rows="3" cols="30" name="videoDescription" id="description"></textarea></td>
						
						<td></td></tr>
						<tr>
							<td>產品編號</td>
							<td><input id="href" name="href" type="text"/></td>
							<td></td>
						</tr>
						<tr>
							<td><button class="btn" type="button" onclick="check();">新增</button></td>
							<td>
								<div class="videoDiv"></div>
							</td>
						</tr>
					</table>
				</form>
				<button type="button" onclick="magic();" >神奇小按鈕</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		window.onload(toggleMenu());

		function toggleMenu() {
			let toggle = document.querySelector('.toggle');
			let navigation = document.querySelector('.navigation');
			let main = document.querySelector('.main');
			toggle.classList.toggle('active');
			navigation.classList.toggle('active');
			main.classList.toggle('active');
		}
		
		function magic() {
			let ind = Math.floor(Math.random()*3);
			var name = [ "小提袋", "保暖物品", "小包包"];
			var url = ["kTD0YPizee0", "AF-O_zJqBXI", "C1-WAEGean4"];
			var des = ["來做東西吧","手作小物","自己動手做"];
			document.getElementById('videoName').value = name[ind];
			document.getElementById('link').value = url[ind];
			document.getElementById('showVideo').innerHTML = '<iframe width="560" height="315"'
				+'src="https://www.youtube.com/embed/'+url[ind]+'"title="YouTube video player" frameborder="0"'
					+'allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"'
					+'allowfullscreen></iframe>';
			document.getElementById('description').innerHTML = des[ind];
			document.getElementById('href').value = "30001"
		}
		
		function check() {
			let name = document.getElementById("videoName").value;
			let url = document.getElementById("link").value;
			let description = document.getElementById('description').innerHTML;
			let href = document.getElementById('href').value;
			let count = 0;
			if(name == "") {
				alert("影片名稱不可為空");
				count++;
			}
			if(url == "") {
				alert("影片連結不可為空");
				count++;
			}
			if(count == 0) {
				 document.getElementById("myform").submit()
			}
		}
		
		function show(){
			var link = document.getElementById('link').value;
			console.log(link);
			document.getElementById('showVideo').innerHTML = '<iframe width="560" height="315"'
			+'src="https://www.youtube.com/embed/'+link+'"title="YouTube video player" frameborder="0"'
				+'allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"'
				+'allowfullscreen></iframe>';
		}
		
	</script>
</body>
</html>