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
<h1 style="color:#fff">新增書籍商品資料</h1><br>
<hr>
</div>
<form method="post" action="createbooks" enctype="multipart/form-data">
<table class="table table-bordered border-primary" id="ajaxTable">
  
       <thead>
         <tr>
         <th>書名</th>
         <th>出版社</th>
         <th>作者</th>
         <th>庫存數量</th>
         <th>價格</th>
         </tr>
         </thead>
         <tbody>
         <td><input size="50" id="itemName" name="itemName" type="text" /></td>
         <td><input id="publisher" name="publisher" type="text" /></td>
         <td><input id="author" name="author" type="text" /></td>
         <td><input id="qty" name="qty" type="number" min="0"/></td>
         <td><input id="price" name="price" type="number" min="0"/></td>
         </tbody>
         <thead>
         <tr>
         <th colspan="5" >內容簡介</th>
         </tr>
         </thead>
         <tbody>
         <tr>
         <td colspan="5"><textarea cols="190"rows="8" id="itemDescription" name="itemDescription" rows="8" cols="20"></textarea></td></tr>
         </tr>
         </tbody>
          <thead>
         <tr>
         <th colspan="5">圖片</th>
         </tr>
         </thead>
              <tbody>
      <tr>
      <div align="center" id="imgClass"><br>
      <td colspan="5" align="center">圖片封面:<input type="file" name="img" accept="image/*" onchange="document.getElementById('img1').src = window.URL.createObjectURL(this.files[0])"/>
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
	     <button class="btn" type="button" onclick="magic();">一鍵輸入</button>
	   <a href="<c:url value='/backend/books' />">書籍商品資料總表</a>
	     </div>
	  <script>	
		function magic() {	
			document.getElementById('itemName').value = "好簡單的棒針&鉤針可愛小童帽";
			document.getElementById('publisher').value = "Elegant-Boutique 新手作";
			document.getElementById('author').value = "Boutique-Sha";
			document.getElementById('itemDescription').value = "從頭開始裝可愛！ 22頂大人小孩都心動的加萌手織帽  無論是冬日寒風還是夏日烈陽，都需要一頂帽子來保護小寶貝免於風吹日曬。那麼就來親手織一頂最流行的栗子帽吧！本書收錄２２頂近年大人氣的各式栗子帽、尖帽，還有可愛的貓耳帽、小熊草帽、貝蕾帽與護耳毛帽等，根據使用線材的不同，可以依需求製作出冬日保暖，或是夏日涼爽透氣的可愛帽子。 大多使用棒針或鉤針的基礎針法就能完成，作法簡單，造型可愛。快翻開本書，為小寶貝編織一頂萌上加萌的可愛手織帽吧！";
			document.getElementById('qty').value = "100";
			document.getElementById('price').value = "315";
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