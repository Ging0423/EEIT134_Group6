<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>loop</title>
<link rel="stylesheet" href="<c:url value='/backend/css/style.css'/>"
	type="text/css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/js/all.min.js"
	integrity="sha512-YSdqvJoZr83hj76AIVdOcvLWYMWzy6sJyIMic2aQz5kh2bPTd9dzY3NtdeEAzPp/PhgZqr4aJObB3ym/vsItMg=="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="<c:url value='/css/themify-icons.css'/>">
<style type="text/css">
	.ti-pencil:hover,
	.ti-trash:hover{
		text-decoration: underline;
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
					<label> <input type="text" placeholder="Search here">
						<i class="fas fa-search" aria-hidden="true"></i>
					</label>
				</div>
				<div class="user">
<!-- 					<img src="image/user.jpg"> -->
				</div>
			</div>

			<div class="cardBox">
				<div class="card">
					<div>
						<div class="numbers">${totalArticle}</div>
						<div class="cardName">文章總數量</div>
					</div>
					<div class="iconBox">
						<i class="far fa-eye" aria-hidden="true"></i>
					</div>
				</div>
				<div class="card">
					<div>
						<div class="numbers">${todayArticle}</div>
						<div class="cardName">今日新增文章</div>
					</div>
					<div class="iconBox">
						<i class="far fa-comment" aria-hidden="true"></i>
					</div>
				</div>
				<div class="card">
					<div>
						<div class="numbers">${todayReply}</div>
						<div class="cardName">今日新增回覆</div>
					</div>
					<div class="iconBox">
						<i class="far fa-comment" aria-hidden="true"></i>
					</div>
				</div>
				<div class="card">
					<div>
						<div class="numbers">${mostAuthorName}</div>
						<div class="cardName">最多發文作者</div>
					</div>
					<div class="iconBox">
						<i class="fas fa-user-alt" aria-hidden="true"></i>
					</div>
				</div>
			</div>
			
			<div class="details">
				<div class="recentOrders">
					<div class="cardHeader">
						<h2>文章資訊</h2>
					</div>
					<table id="forum_table">
						<thead>
							<tr>
								<td style="text-align: center;">文章編號</td>
								<td style="text-align: center;">標題</td>
								<td style="text-align: center;">作者名稱</td>
								<td style="text-align: center;">刪除</td>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<table id="showpage">
						<tr>
							<td>總頁數:${totalPages}</td>
							<td colspan="3" align="right"><c:forEach var="i" begin="1"
									end="${totalPages}" step="1">
									<button id="myPage" value="${i}" onclick="changePage(${i})">${i}</button>
								</c:forEach></td>
						</tr>
					</table>
				</div>
				<div class="recentCustomers">
					<div class="cardHeader">
						<h2>文章分析</h2>
					</div>
					<h4>單周發文數量</h4>
					<canvas id="articleInWeek" width="400" height="200"></canvas>
					<h4>單周回覆數量</h4>
					<canvas id="replyInWeek" width="400" height="200"></canvas>
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
	<script src="<c:url value='/js/forum/forum_backend.js'/>"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
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
    
	<script>
  	var ctx = document.getElementById( "articleInWeek" ),
  		example = new Chart(ctx, {
  			type: "bar", // 圖表類型
  			data: {
  				labels: [ '${weekDate[0]}', '${weekDate[1]}', '${weekDate[2]}', '${weekDate[3]}', '${weekDate[4]}', '${weekDate[5]}', '${weekDate[6]}' ], // 標題
  				datasets: [{
  					label: "發文數量", // 標籤
  					data: [ ${weekArticle[0]}, ${weekArticle[1]}, ${weekArticle[2]}, ${weekArticle[3]}, ${weekArticle[4]}, ${weekArticle[5]}, ${weekArticle[6]} ], // 資料
  					backgroundColor: [ // 背景色
  					"#03a9f4",
  					"#03a9f4",
  					"#03a9f4",
  					"#03a9f4",
  					"#03a9f4",
  					"#03a9f4",
  					"#03a9f4"
  					],
  					borderWidth: 1 // 外框寬度
  				}]
  			}
  		});
  	
  	var ctx = document.getElementById( "replyInWeek" ),
		example = new Chart(ctx, {
			type: "bar", // 圖表類型
			data: {
  				labels: [ '${weekDate[0]}', '${weekDate[1]}', '${weekDate[2]}', '${weekDate[3]}', '${weekDate[4]}', '${weekDate[5]}', '${weekDate[6]}' ], // 標題
				datasets: [{
					label: "回覆數量", // 標籤
					data: [ ${weekReply[0]}, ${weekReply[1]}, ${weekReply[2]}, ${weekReply[3]}, ${weekReply[4]}, ${weekReply[5]}, ${weekReply[6]} ], // 資料
					backgroundColor: [ // 背景色
					"#c6e8f7",
					"#c6e8f7",
					"#c6e8f7",
					"#c6e8f7",
					"#c6e8f7",
					"#c6e8f7",
					"#c6e8f7"
					],
					borderWidth: 1 // 外框寬度
				}]
			}
		});
  </script>
</body>
</html>