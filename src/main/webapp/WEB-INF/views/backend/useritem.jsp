<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員商品</title>
<style>
#img {margin:left; width:20%}
   table{border:2px solid black; border-collapse:collapse} 

a {font-size:larger; margin: 50px auto; text-decoration:none}
</style>
</head>
<body>
<div align='center'>
<h3>會員商品資料</h3>
<hr>  
<!-- <table border="1"> -->
<form method="post" action="<c:url value='/backend/updateuseritem'/>">
   
   <table>
     <tr>
       <td>商品編號:</td>
       <td><input readonly name="itemId" value=${userData.itemId}></td>
     </tr>
      <tr>
       <td>會員編號:</td>
       <td><input readonly name="userId" value=${userData.userId}></td>
     </tr>
     <tr>
       <td>商品名稱:</td>
       <td><input name="itemName" value=${userData.itemName}></td>
     </tr>
      <tr>
       <td>商品描述:</td>
       <td><textarea name="itemDescription" rows="4" cols="21">${userData.itemDescription}</textarea></td>
     </tr>
      <tr>
       <td><input type="hidden" name="addDate" value="${userData.addDate}"></td>
     </tr>
       <tr>
         <td>數量:</td>
         <td><input name="qty" value=${userData.qty}></td>
	  </tr>
      <tr>
         <td>價錢:</td>
         <td><input name="price" value=${userData.price}></td>
	  </tr>
	  </table>
<button type="submit">更新</button>
</form>
<form action= "<c:url value='/backend/deleteuseritem'/>" method="post">
<input type="hidden" name="itemId" value="${userData.itemId}">
<input type="submit" value="刪除"><br>
<a href="<c:url value='/backend/useritem' />">回前頁</a>
</form> 
<c:forEach var="itemImg" items="${itemImg}">
     <img id="img" src=<c:url value="/items/img/${itemImg.img}"/> />
</c:forEach>
</div>
</body>
</html>