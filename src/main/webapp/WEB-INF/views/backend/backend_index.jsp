<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>後臺管理系統-商家版</title>
<link rel="stylesheet" href="<c:url value='/backend/css/style.css'/>"
	type="text/css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/js/all.min.js"
	integrity="sha512-YSdqvJoZr83hj76AIVdOcvLWYMWzy6sJyIMic2aQz5kh2bPTd9dzY3NtdeEAzPp/PhgZqr4aJObB3ym/vsItMg=="
	crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
							class="fas fa-infinity" aria-hidden="true"></i></span> <!-- 							<span class="title"><h2>loop<h2></span> -->
						<span class="title"><img
							src="<c:url value='/img/loop.png' />"></span>
				</a></li>
				<li><a href="<c:url value='/backend/admin'/>"> <span
						class="icon"><i class="fas fa-users-cog" aria-hidden="true"></i></span>
						<span class="title">會員專區</span>
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
				<li><a href="<c:url value='/backend/order'/>"> <span
						class="icon"><i class="fas fa-cart-arrow-down"
							aria-hidden="true"></i></span> <span class="title">訂單管理</span>
				</a></li>
				<%-- 				<li><a href="<c:url value=''/>"> <span class="icon"><i --%>
				<!-- 							class="fas fa-comments" aria-hidden="true"></i></span> <span -->
				<!-- 						class="title">訊息管理</span> -->
				<!-- 				</a></li> -->
				<li><a href="<c:url value='/backend/video'/>"> <span
						class="icon"><i class="far fa-file-video"
							aria-hidden="true"></i></span> <span class="title">教學影片管理</span>
				</a></li>
				<li><a href="<c:url value='/backend/forum'/>"> <span
						class="icon"><i class="far fa-newspaper" aria-hidden="true"></i></span>
						<span class="title">討論區管理</span>
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
					<form class="example" action="/action_page.php"
						style="margin: auto; max-width: 300px">
						<input type="text" placeholder="Search.." name="search2">
						<button type="submit">
							<i class="fa fa-search"></i>
						</button>
					</form>
				</div>
				<div class="user">
					<img src="image/user.jpg">
				</div>
			</div>

			<div class="cardBox">
				<div class="card">
					<div>
						<div class="numbers">${totalOrder}</div>
						<div class="cardName">訂單總數量</div>
					</div>
					<div class="iconBox">
						<i class="far fa-eye" aria-hidden="true"></i>
					</div>
				</div>
				<div class="card">
					<div>
						<div class="numbers">${notSend}</div>
						<div class="cardName">未出貨訂單數量</div>
					</div>
					<div class="iconBox">
						<i class="far fa-comment" aria-hidden="true"></i>
					</div>
				</div>
				<div class="card">
					<div>
						<div class="numbers">${isSend}</div>
						<div class="cardName">已出貨訂單數量</div>
					</div>
					<div class="iconBox">
						<i class="fas fa-dollar-sign" aria-hidden="true"></i>
					</div>
				</div>
				<div class="card">
					<div>
						<div class="numbers">${isSend}</div>
						<div class="cardName">已完成訂單數量</div>
					</div>
					<div class="iconBox">
						<i class="fas fa-dollar-sign" aria-hidden="true"></i>
					</div>
				</div>
			</div>

			<div class="details">
				<div class="recentOrders">
					<div class="cardHeader">
						<h2>訂單資訊</h2>
						<a href="<c:url value='/backend/order'/>" class="btn">View All</a>
					</div>
					<table>
						<thead>
							<tr>
								<td>訂單編號</td>
								<td>價錢</td>
								<td>客戶名稱</td>
								<td>訂單狀態</td>
							</tr>
						</thead>
						<tbody id="order">
						</tbody>
					</table>
					<table id="showpage">
						<tr>
							<td>總頁數:${totalPages} 總訂單數:${totalElements}</td>
							<td colspan="3" align="right"><c:forEach var="i" begin="1"
									end="${totalPages}" step="1">
									<button id="myPage" value="${i}" onclick="change(${i})">${i}</button>
								</c:forEach></td>
						</tr>
					</table>
				</div>
				<div class="recentCustomers">
					<div class="cardHeader">
						<h2>新加入會員</h2>
						<a href="<c:url value='/backend/admin'/>" class="btn">View All</a>
					</div>
					<table>
						<tbody>
							<c:forEach var="user" items="${users}">
								<tr>
									<td><h4>${user.userName}</h4> <span>${user.userId}</span></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
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
	<script>
    $(document).ready(function() {
		var pid = $('#pid').val();
		load(pid);
		
	});
    var indexPage=1;
    $(document).ready(function(){
 	   load(indexPage);
    });
    function change(page){
 	   indexPage = page;
 	   load(indexPage);
    }   
	function load(indexPage) {
		$.ajax({
					type : 'post',
					url :   'backend/page/'+indexPage,
					dataType : 'JSON',
					contentType : 'application/json',
					success : function(data) {
						var json = JSON.stringify(data, null, 4);
						
						$('#order').empty("");
						if (data == null) {
							$('#order').prepend(
									"<tr><td colspan='2'>暫無資料</td></tr>");
						} else {
							var table = $('#order');
							 $.each(data, function(i,n){
								   var tr = '<tr><td>'
	                                +n.orderId+'</td><td>NTD '
	                                +n.total+'</td><td>'
	                                +n.users.userName+'</td><td><span>'
	                                +n.orderState+'</span></td></tr>';                            
								   table.append(tr);
							   });
						}
						
					}
				});
	}   
        window.onload(toggleMenu());

        function toggleMenu(){
            let toggle = document.querySelector('.toggle');
            let navigation = document.querySelector('.navigation');
            let main = document.querySelector('.main');
            toggle.classList.toggle('active');
            navigation.classList.toggle('active');
            main.classList.toggle('active');
        }
        window.location.reload();
    </script>
</body>
</html>