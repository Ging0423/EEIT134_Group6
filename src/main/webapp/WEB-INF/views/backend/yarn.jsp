<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<head>
<!-- =========== -->
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
<title>Yarn</title>
<style>
#img {margin:left; width:20%}
table{border:2px solid black; border-collapse:collapse; margin:auto; width:70%}
tr{background-color:#F4EDF2}
.a{align='center'; width:99%}
/* a {font-size:larger; margin: 50px auto; text-decoration:none} */
a {text-decoration:none}

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
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
</style>
</head>
<body>
<!-- =========== -->
	<div class="container">
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
                    <img src="image/user.jpg">
                </div>
            </div>
<!-- ========================= -->

<div align='center'>
<div style="background-color:#B08EAD"><br>
<h1 style="color:#fff">紗線商品資料</h1><br>
<hr>
</div><br>
<form method="post" action="<c:url value='/backend/updateyarn'/>" enctype="multipart/form-data">

    <table>
    <tr><td>編號:</td></tr>
    <tr><td><input class=a readonly name="itemId" value=${yarnData.itemId}></td></tr>
    <tr><td>紗線名稱:</td></tr>
    <tr><td><input class=a name="itemName" value=${yarnData.itemName}></td></tr>
    <tr><td>材質:</td></tr>
    <tr><td><input class=a name="material" value=${yarnData.material}></td></tr>
    <tr><td>尺寸(直徑、規格):</td></tr>
    <tr><td><input class=a name="size" value=${yarnData.size}></td></tr>
    <tr><td>顏色:</td></tr>
    <tr><td><input class=a name="color" value=${yarnData.color}></td></tr>
    <tr><td>紗線描述:</td></tr>
    <tr><td><textarea class=a name="itemDescription" rows="8" cols="20">${yarnData.itemDescription}</textarea></td></tr>
    <tr><td><input class=a type="hidden" name="addDate" value=${yarnDate.addDate}></td></tr>
    <tr><td>庫存數量:</td></tr>
    <tr><td><input class=a name="qty" value=${yarnData.qty}></td></tr>
    <tr><td>價格:</td>
    <tr><td><input class=a name="price" value=${yarnData.price}></td></tr>
    </table>
    
    <c:forEach var="itemImg" items="${itemImg}">
<!--      <input type="file" name="img" accept="image/*"/>  -->
	  <img id="img" src=<c:url value="/items/img/${itemImg.img}"/> />
      </c:forEach>
      
      <br><img type="file" id="img1" accept="image/*" width=20% />
      <img type="file" id="img2" accept="image/*" width=20% />
      <img type="file" id="img3" accept="image/*" width=20% />
      
      <br>圖片封面:<input type="file" name="img" accept="image/*" onchange="document.getElementById('img1').src = window.URL.createObjectURL(this.files[0])"/>
	  <input type="file" name="img" accept="image/*" onchange="document.getElementById('img2').src = window.URL.createObjectURL(this.files[0])"/>  
	  <input type="file" name="img" accept="image/*" onchange="document.getElementById('img3').src = window.URL.createObjectURL(this.files[0])"/>
      
<br><button type="submit">更新</button>
</form>
<form action= "<c:url value='/backend/deleteyarn' />" method="post">
<input type="hidden" name="itemId" value="${yarnData.itemId}">
<input type="submit" value="刪除"><br>
<a href="<c:url value='/backend/yarn' />">回紗線商品資料總表</a>
</form>
<%-- <c:forEach var="itemImg" items="${itemImg}"> --%>
<%--      <img id="img" src=<c:url value="/items/img/${itemImg.img}"/> /> --%>
<%-- </c:forEach> --%>
</div>

<!--     ================================ -->
<script>
        window.onload(toggleMenu());

        function toggleMenu(){
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