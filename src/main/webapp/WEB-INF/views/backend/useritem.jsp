<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<!-- =========== -->
<meta charset="UTF-8">
+<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--     <title>後臺管理系統-商家版</title> -->
<link rel="stylesheet" href="<c:url value='/backend/css/style.css'/>" type="text/css"/>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/js/all.min.js"
	integrity="sha512-YSdqvJoZr83hj76AIVdOcvLWYMWzy6sJyIMic2aQz5kh2bPTd9dzY3NtdeEAzPp/PhgZqr4aJObB3ym/vsItMg=="
	crossorigin="anonymous"></script>
</head>
<!-- =========== -->
<title>會員商品</title>
<style>
#img {margin:left; width:20%}
table{border:2px solid black; border-collapse:collapse; margin:auto; width:70%}
tr{background-color:#F4EDF2}
.a{align='center'; width:99%}
/* a {font-size:larger; margin: 50px auto; text-decoration:none} */
a {text-decoration:none}
</style>
<body>
<!-- =========== -->
<div class="container">
        <div class="navigation">
            <ul>
                <li>
                    <a href="<c:url value=''/>">
                        <span class="icon"><i class="fas fa-infinity" aria-hidden="true"></i></span>
                        <span class="title"><h2>Loop</h2></span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value=''/>">
                        <span class="icon"><i class="fas fa-users-cog" aria-hidden="true"></i></span>
                        <span class="title">管理員專區</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value=''/>">
                        <span class="icon"><i class="fas fa-shopping-bag" aria-hidden="true"></i></span>
                        <span class="title">商品管理</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value=''/>">
                        <span class="icon"><i class="fas fa-cart-arrow-down" aria-hidden="true"></i></span>
                        <span class="title">訂單管理</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value=''/>">
                        <span class="icon"><i class="fas fa-comments" aria-hidden="true"></i></span>
                        <span class="title">訊息管理</span>
                     </a>
                </li>
                <li>
                    <a href="<c:url value=''/>">
                        <span class="icon"><i class="far fa-file-video" aria-hidden="true"></i></span>
                        <span class="title">教學影片管理</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value=''/>">
                        <span class="icon"><i class="far fa-newspaper" aria-hidden="true"></i></span>
                        <span class="title">討論區管理</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/logout'/>">    
                        <span class="icon"><i class="fas fa-sign-out-alt" aria-hidden="true"></i></span>
                        <span class="title">登出</span>
                    </a>
                </li>
            </ul>
        </div>
     </div>
        
        <div class="main">
            <div class="topbar">
                <div class="toggle" onclick="toggleMenu();">
                <i class="fas fa-bars"></i>
                </div>
                <div class="search">
                    <label>
                        <input type="text" placeholder="Search here">
                        <i class="fas fa-search" aria-hidden="true"></i>
                    </label>
                </div>
                <div class="user">
                    <img src="image/user.jpg">
                </div>
            </div>
<!-- ========================= -->

<div align='center'>
<div style="background-color:#B08EAD"><br>
<h1 style="color:#fff">會員商品資料</h1><br>
<hr>
</div><br>  

<form method="post" action="<c:url value='/backend/updateuseritem'/>">
   
	<table>
	<tr><td>商品編號:</td></tr>
	<tr><td><input readonly name="itemId" value=${userData.itemId}></td></tr> 
	<tr><td>會員編號:</td></tr>
	<tr><td><input readonly name="userId" value=${userData.userId}></td></tr>
	<tr><td>商品名稱:</td></tr>
	<tr><td><input name="itemName" value=${userData.itemName}></td></tr>
	<tr><td>商品描述:</td></tr>
	<tr><td><textarea name="itemDescription" rows="4" cols="21">${userData.itemDescription}</textarea></td></tr>
	<tr><td><input class=a type="hidden" name="addDate" value="${userData.addDate}"></td></tr>
	<tr><td>數量:</td></tr>
	<tr><td><input name="qty" value=${userData.qty}></td></tr>
	<tr><td>價錢:</td></tr>
	<tr><td><input name="price" value=${userData.price}></td></tr>
	</table>
	  <c:forEach var="itemImg" items="${itemImg}">
	  <img id="img" src=<c:url value="/items/img/${itemImg.img}"/> />
      </c:forEach>
<br><button type="submit">更新</button>
</form>
<form action= "<c:url value='/backend/deleteuseritem'/>" method="post">
<input type="hidden" name="itemId" value="${userData.itemId}">
<input type="submit" value="刪除"><br>
<a href="<c:url value='/backend/useritem' />">回會員商品資料總表</a>

</form> 
<%-- <c:forEach var="itemImg" items="${itemImg}"> --%>
<%--     <img id="img" src=<c:url value="/items/img/${itemImg.img}"/> /> --%>
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