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
	<h1>Insert successful!!!!!</h1>
	<table>
		<tr>
			<td>帳號:</td>
			<td>${uAccount}</td>
		</tr>
		<tr>
			<td>密碼:</td>
			<td>${uPassword}</td>
		</tr>
		<tr>
			<td>身分代號:</td>
			<td>${uIdentity}</td>
		</tr>
		<tr>
			<td>名稱:</td>
			<td>${uName}</td>
		</tr>
		<tr>
			<td>Email:</td>
			<td>${uEmail}</td>
		</tr>
		<tr>
			<td>電話:</td>
			<td>${uTel}</td>
		</tr>
		<tr>
			<td>地址:</td>
			<td>${uAddress}</td>
		</tr>
		<tr>
			<td>新增時間:</td>
			<td>${uRegisterDate}</td>
		</tr>
	</table>
</body>
</html>