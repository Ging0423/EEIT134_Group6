<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--     <title>後臺管理系統-商家版</title> -->
<link rel="stylesheet" href="<c:url value='/backend/css/style.css'/>" type="text/css"/>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/js/all.min.js"
	integrity="sha512-YSdqvJoZr83hj76AIVdOcvLWYMWzy6sJyIMic2aQz5kh2bPTd9dzY3NtdeEAzPp/PhgZqr4aJObB3ym/vsItMg=="
	crossorigin="anonymous"></script>
	
<!-- =========== -->
<title>loop</title>
<!-- ====== -->
<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/backend/css/style.css'/>"
	type="text/css">
<link rel="icon" href="img/favicon.png">
<!-- ====== -->
<style>
#ajaxTable {
	margin: auto;
	width: 70%
}
.single_product_img {margin:auto; width:70%}
/* .a{align='center'; width:99%} */
/* table{border:2px solid black; border-collapse:collapse; margin:auto; width:70%} */
/* tr{background-color:#F4EDF2} */

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
<h1 style="color:#fff">新增紗線商品資料</h1><br>
<hr>
</div>
<form method="post" action="createyarn" enctype="multipart/form-data">
   <table class="table table-bordered border-primary" id="ajaxTable">

    <thead>
      <tr>
      <th>紗線名稱</th>
      <th>材質</th>
      <th>尺寸(直徑、規格)</th>
      </tr>
     </thead>
     <tbody>
      <tr>
      <td><input size="50" id="itemName" name="itemName" type="text" /></td>
      <td><input id="material" name="material" type="text"/></td>
      <td><input id="size" name="size" type="text"></td>
      </tr>
      </tbody>
      <thead>
      <tr>
      <th>顏色</th>
      <th>庫存數量</th>
      <th>價格</th>
      </tr>
      </thead>
      <tbody>
      <tr>
      <td><input id="color" name="color" type="text"/></td>
      <td><input id="qty" name="qty" type="number" min="0"/></td>
      <td><input id="price" name="price" type="number" min="0"/></td>
      </tr>
      </tbody>
      <thead>
      <tr>
      <th colspan="4">紗線描述</th>
      </tr>
      </thead>
      <tbody>
      <tr>
      <td colspan="4"><textarea cols="190"rows="8" id="itemDescription" name="itemDescription"></textarea></td>
      </tr>
      </tbody>
<!--       </table> -->
      <thead>
      <tr>
      <th colspan="4">圖片</th>
      </tr>
      </thead>
      <tbody>
      <tr>
      <div align="center" id="imgClass"><br>
      <td colspan="4" align="center">封面:<input type="file" name="img" accept="image/*" onchange="document.getElementById('img1').src = window.URL.createObjectURL(this.files[0])"/>
	  <input type="file" name="img" accept="image/*" onchange="document.getElementById('img2').src = window.URL.createObjectURL(this.files[0])"/>  
	  <input type="file" name="img" accept="image/*" onchange="document.getElementById('img3').src = window.URL.createObjectURL(this.files[0])"/><br>
	    
      <img type="file" id="img1" accept="image/*" width=20% />
      <img type="file" id="img2" accept="image/*" width=20% />
      <img type="file" id="img3" accept="image/*" width=20% /><br>
      </td>
      </div>
      </tr>
      </tbody>
	  </table>
	 
	  <div align="center">
	  <button class="btn" type="submit" value="send">送出</button>
	  </form>
	  <button class="btn" type="button" onclick="magic();">一鍵輸入</button><br>
	  <a href="<c:url value='/backend/yarn' />">紗線商品資料總表</a>
	  </div>
	  <script>
	  function magic() {
		  document.getElementById('itemName').value = "Soi索依(200g)";
		  document.getElementById('material').value = "紙 100% ";
		  document.getElementById('size').value = "3mm、重量200g±10g";
		  document.getElementById('color').value = "紅";
		  document.getElementById('itemDescription').value = "推薦鉤針尺寸3.5mm、4mm 由桑葉製成的天然纖維紙紗線。 堅固、輕便且可水洗。成品觸感: 柔軟、有彈性觸感涼爽。建議使用成品: 夏季包袋、帽子、配飾、手拿包...。";
		  document.getElementById('qty').value = "883";
		  document.getElementById('price').value = "960";  
	  }
	  </script>
	  
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
	    
	     </div>  
	     
	     <!--     ================================ -->
	    
	<script>
		window.onload(toggleMenu());

		function toggleMenu() {
			let toggle = document.querySelector('.toggle');
			let navigation = document.querySelector('.navigation');
			let main = document.querySelector('.main');
			toggle.classList.toggle('active');
			navigation.classList.toggle('active');
			main.classList.toggle('active');
		}
	</script>
	<!--     ================================ -->
</body>
</html>