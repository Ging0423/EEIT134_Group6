<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>拍賣平台</title>
<style>
.img1 {
	width: 30%;
}
.container {
  display: flex; /* or inline-flex */
}
.fs {
	width: 500px;
	border: 2px solid black;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<a href="CreateItems.jsp">新增拍賣</a>
	<p />
	<form action="<c:url value='/proj/SearchCtoCItem'/>" method="POST">
		<select name="select">
			<option value="memberId">會員名稱</option>
			<option value="name">商品名稱</option>
			<option value="price">價錢</option>
			<option value="qty">數量</option>
			<option value="description">內容</option>
		</select> <input name="search" type="text">
		<button type="submit">搜尋</button>
		<br>
	</form>
	<form id="myForm"
		action="<c:url value='/proj/deleteMutipleCtoCItem.do'/>" method="POST">
		<input type='hidden' id='hiddenField' name='array' />
		<button type="submit" onclick="d();">多個刪除</button>
	</form>
	<div class="container">
		<div class="row">
			<c:forEach var="item" items='${allItem}'>
				<div class="col">
				<input type="checkbox" name="check" value="${item.itemId}" />
				<form name="multiple"
					action="<c:url value='/proj/UpdateCtoCItem.do'/>" method="POST">
					<img class="img1" src="${item.img}"><br> <input
						name="img" value="${item.img}" type="hidden"> <br> <input
						name="itemId" value="${item.itemId}" type="hidden"> <br>
					<input name="memberId" value="${item.memberId}" type="hidden">
					<br>名稱 <input type="text" name="name" value="${item.name}">
					<br> 數量<input type="number" name="qty" value="${item.qty}">
					<br> 內容
					<textarea name="description">${item.description}</textarea>
					<br> 價格<input type="number" name="price" value="${item.price}">
					<br>
					<button type="submit">更新資料</button>
				</form>
				<form action="<c:url value='/proj/DeleteCtoCItem.do'/>"
					method="POST">
					<input name="itemId" value="${item.itemId}" type="hidden">
					<button type="submit">刪除資料</button>
				</form>
				</div>
			</c:forEach>
			
		</div>
	</div>



	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
		function d() {
			var array = [];
			var checkboxes = document
					.querySelectorAll('input[type=checkbox]:checked');
			for (var i = 0; i < checkboxes.length; i++) {
				array.push(checkboxes[i].value);
			}
			document.getElementById('hiddenField').value = array;
			document.getElementById("myForm").submit();
		}
	</script>
</body>
</html>