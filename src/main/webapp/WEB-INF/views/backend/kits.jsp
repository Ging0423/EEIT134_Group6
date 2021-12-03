<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kits</title>
<style>
#img {margin:left; width:20%}
    table{border:2px solid black; border-collapse:collapse}
/*      background-color{rgb(208, 148, 234)} */
a {font-size:larger; margin: 50px auto; text-decoration:none}
</style>
</head>
<body>
<div align='center'>
<h3>材料包商品資料</h3>
<hr>
<form method="post" action="<c:url value='/backend/updatekits'/>" />
<!-- <table border='1'> -->
<%-- <c:url var='path' value='/backend/updatebooks'/> --%>

<table>
	  <tr>
	     <td>編號:</td>
	     <td><input readonly name="itemId" value=${kitsData.itemId}></td>
	  </tr>
       <tr>
         <td>工具名稱:</td>
         <td><input name="itemName" value=${kitsData.itemName}></td>
	  </tr>
      <tr>
         <td>工具描述:</td>
         <td><textarea name="itemDescription" rows="4" cols="21">${kitsData.itemDescription}</textarea><td>
<!--          <td><input id="itemDescription" name="itemDescription" type="text" /></td> -->
      </tr>
      <tr>
<!--          <td>日期:</td> -->
         <td><input type="hidden" name="addDate" value="${kitsData.addDate}"></td>
      </tr>
      <tr>
         <td>庫存數量:</td>
         <td><input name="qty" value=${kitsData.qty}></td>
	  </tr>
      <tr>
         <td>價格:</td>
         <td><input name="price" value=${kitsData.price}></td>
	  </tr>
	  </table>
<button type="submit">更新</button>
</form>
<form action= "<c:url value='/backend/deletekits'/>" method="post">
<input type="hidden" name="itemId" value="${kitsData.itemId}">
<input type="submit" value="刪除"><br>
<a href="<c:url value='/backend/kits' />">回前頁</a>
</form>
<c:forEach var="itemImg" items="${itemImg}">
    <img id="img" src=<c:url value="/items/img/${itemImg.img}"/> />
</c:forEach>
</div>
</body>
</html>

</body>
</html>