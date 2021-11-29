<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kits Form</title>
<style>
     table,th,td{border:2px solid black; border-collapse:collapse}
/*      background-color{rgb(208, 148, 234)} */
</style> 
</head>
<body>
<div align='center'>
<h3>材料包商品資料</h3>
<hr>
<a herf="<c:url value='/backend/tools/create'/>">新增書籍</a>
<table border='1'> 
	<thead>
		<th>編號</th>
		<th>商品名</th>
		<th>商品描述</th>
		<th>日期</th>
		<th>數量</th>
		<th>價錢</th>		
	</thead>
		<c:forEach var="item" items='${allItem}'>
			<tr>
				<td><a href= "<c:url value='/backend/kits/${item.itemId}'/>">${item.itemId}</a></td>
				<td>${item.itemName}</td>
				<td>${item.itemDescription}</td>
				<td>${item.addDate}</td>
				<td>${item.qty}</td>
				<td>$${item.price}</td>
			</tr>
		</c:forEach>
	</table>
	<a href="/backend">回首頁</a>
	</center>
</body>
</html>