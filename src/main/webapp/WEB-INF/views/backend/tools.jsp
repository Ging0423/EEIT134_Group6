<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tools</title>
<style>
   table{border:2px solid black; border-collapse:collapse} 
/*      background-color{rgb(208, 148, 234)} */
a {font-size:larger; margin: 50px auto; text-decoration:none}
</style>
</head>
<body>
<div align='center'>
<h3>工具商品資料</h3>
<hr>  
<!-- <table border="1"> -->
<form method="post" action="<c:url value='/backend/updatetools'/>">
   
   <table>
     <tr>
       <td>編號:</td>
       <td><input readonly name="itemId" value=${toolsData.itemId}></td>
     </tr>
      <tr>
       <td>商品名:</td>
       <td><input name="itemName" value=${toolsData.itemName}></td>
     </tr>
      <tr>
       <td>規格:</td>
       <td><input name="specification" value=${toolsData.specification}></td>
     </tr>
      <tr>
       <td>商品描述:</td>
       <td><textarea name="itemDescription" rows="4" cols="21">${toolsData.itemDescription}</textarea></td>
     </tr>
      <tr>
       <td><input type="hidden" name="addDate" value="${toolsData.addDate}"></td>
     </tr>
       <tr>
         <td>數量:</td>
         <td><input name="qty" value=${toolsData.qty}></td>
	  </tr>
      <tr>
         <td>價錢:</td>
         <td><input name="price" value=${toolsData.price}></td>
	  </tr>
	  </table>
<button type="submit">更新</button>
</form>
<form action= "<c:url value='/backend/deletetools'/>" method="post">
<input type="hidden" name="itemId" value="${toolsData.itemId}">
<input type="submit" value="刪除"><br>
<a href="<c:url value='/backend/tools' />">回前頁</a>
</form> 
<c:forEach var="itemImg" items="${itemImg}">
    <img src=<c:url value="/items/img/${itemImg.img}"/> />
</c:forEach>
</div>
</body>
</html>