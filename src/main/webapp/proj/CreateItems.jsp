<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<c:url value='/proj/CreateCtoCItem.do'/>" enctype="multipart/form-data" method="POST">
	名稱<input type="text" name="name"></inputtype><br>
	數量<input type="number" name="qty"></inputtype><br>
	內容<textarea name="description"></textarea><br>
	價格<input type="number" name="price"></inputtype><br>
	照片<input type="file" accept="image/*" name="img"></inputtype><br>
	
	<button type="submit">新增</button>
	</form>
</body>
</html>