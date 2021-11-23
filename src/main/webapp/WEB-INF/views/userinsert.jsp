<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>create</title>
</head>
<body>
	<form action="create" method="POST">
		請輸入帳號: <input id="account" name="account" type="text" />${errorMsgaccount}<br>
		請輸入密碼: <input id="password" name="password" type="password" />${errorMsgpassword}<br>
		請選擇身分: <select name="identity">
			<option>請選擇身分</option>
			<option value="1" selected>一般</option>
			<option value="0">管理員</option>
		</select><br> 請輸入名稱: <input id="userName" name="userName" type="text" />${errorMsguserName}<br>
		請輸入電話: <input id="tel" name="tel" type="text" />${errorMsgtel}<br>
		請輸入email: <input id="email" name="email" type="text" />${errorMsgemail}<br>
		請輸入地址: <input id="address" name="address" type="text" />${errorMsgaddress}<br>
		<button type="submit">確認</button>
	</form>
</body>
</html>