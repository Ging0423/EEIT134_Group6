<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Books</title>
<style>
    table{border:2px solid black; border-collapse:collapse}
/*      background-color{rgb(208, 148, 234)} */
a {font-size:larger; margin: 50px auto; text-decoration:none}
</style>
</head>
<body>
<div align='center'>
<h3>書籍商品資料</h3>
<hr>
<form method="post" action="<c:url value='/backend/updatebooks'/>">
<%-- <c:url var='path' value='/backend/updatebooks'/> --%>

	<table>
	  <tr>
	     <td>編號:</td>
	     <td><input readonly name="itemId" value=${booksData.itemId}></td>
	  </tr>
       <tr>
         <td>書名:</td>
         <td><input name="itemName" value=${booksData.itemName}></td>
	  </tr>
      <tr>
         <td>出版社:</td>
         <td><input name="publisher" value=${booksData.publisher}></td>	
	  </tr>
      <tr>
         <td>作者:</td>
         <td><input name="author" value=${booksData.author}></td>
	  </tr>
      <tr>
         <td>商品描述:</td>
         <td><textarea name="itemDescription" rows="4" cols="21">${booksData.itemDescription}</textarea></td>
<!--          <td><input id="itemDescription" name="itemDescription" type="text" /></td> -->
      </tr>
      <tr>
<!--          <td>日期:</td> -->
         <td><input type="hidden" name="addDate"  value="${booksData.addDate}" /></td>
      </tr>
      <tr>
         <td>數量:</td>
         <td><input name="qty" value=${booksData.qty}></td>
	  </tr>
      <tr>
         <td>價錢:</td>
         <td><input name="price" value=${booksData.price}></td>
	  </tr>
	  </table>
<button type="submit">"更新</button>
</form>
<form action= "<c:url value='/backend/deletebooks'/>" method="post">
<input type="hidden" name="itemId" value="${booksData.itemId}">
<input type="submit" value="刪除"><br>
<a href="<c:url value='/backend/books' />">回前頁</a>
</form>
<c:forEach var="itemImg" items="${itemImg}">
	<img src=<c:url value="/items/img/${itemImg.img}"/> />
</c:forEach>
</div>
</body>
</html>