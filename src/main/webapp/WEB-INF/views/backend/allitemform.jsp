<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Books Form</title>
<style>
table {margin:auto; width:70%}
table,th,td{border:2px solid black; border-collapse:collapse}
/*      background-color{rgb(208, 148, 234)} */
</style> 
</head>
<body>
<%-- <input type="button" name="button1" id="button1" value= "<c:url value='/backend/yarn'/>"> --%>
<!-- <button type="button" name="button1" id="button1">紗線</button> -->


<!-- <li class="nav-item dropdown"> -->
<!-- <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_1" role="button" data-toggle="dropdown" -->
<!-- aria-haspopup="true" aria-expanded="false"> 商品管理 </a> -->
								    <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
										<a class="dropdown-item" href="<c:url value='/backend/yarn'/>">紗線</a>
										<a class="dropdown-item" href="<c:url value='/backend/tools'/>">工具</a>
										<a class="dropdown-item" href="<c:url value='/backend/books'/>">書籍</a>
										<a class="dropdown-item" href="<c:url value='/backend/kits'/>">材料包</a>
									</div>
								</li>
<div align='center'>
<h3>商品資料</h3>
<hr>
<%-- <a href="<c:url value='/backend/books/create'/>">新增書籍</a> --%>

<table border='1'>
	<thead>
		<th>編號</th>
		<th>商品名稱</th>
		<th>庫存數量</th>
		<th>價格</th>		
	</thead>
		<c:forEach var="item" items='${allItem}'>
			<tr>
				<td><a href= "<c:url value='/backend/items/${item.itemId}'/>">${item.itemId}</a></td>
				<td>${item.itemName}</td>
				<td>${item.qty}</td>
				<td>$${item.price}</td>
			</tr>
		</c:forEach>
	</table>
	<a href="/backend/backend_index">回首頁</a>
	</div>
</body>
</html>