<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Yarn</title>
<style>
#img {margin:left; width:20%}
table {border:2px solid black; border-collapse:collapse}
/*      background-color{rgb(208, 148, 234)} */
a {font-size:larger; margin: 50px auto; text-decoration:none}
/* #box { */
/*       width: 800px; */
/*       height: 454px; */
/*       padding: 8px; */
/*       border: 5px solid black; */
/*       margin: 100px auto; */
/*     } */
</style>
</head>
<body>
<div align='center'>
<h3>紗線商品資料</h3>
<hr>
<form method="post" action="<c:url value='/backend/updateyarns' />">

    <table>
    <tr>
    <td>編號:</td>
    <td><input readonly name="itemId" value=${yarnData.itemId}></td>
    </tr>
     <tr>
    <td>紗線名稱:</td>
    <td><input name="itemName" value=${yarnData.itemName}></td>
    </tr>
     <tr>
    <td>材質:</td>
    <td><input name="material" value=${yarnData.material}></td>
    </tr>
     <tr>
    <td>尺寸尺寸(直徑、規格):</td>
    <td><input name="size" value=${yarnData.size}></td>
    </tr>
     <tr>
    <td>顏色:</td>
    <td><input name="color" value=${yarnData.color}></td>
    </tr>
     <tr>
    <td>紗線描述:</td>
    <td><textarea name="itemDescription" rowa="4" cols="21">${yarnData.itemDescription}</textarea></td>
    </tr>
     <tr>
<!--     <td>日期</td> -->
    <td><input type="hidden" name="addDate" value=${yarnDate.addDate}></td>
    </tr>
     <tr>
    <td>庫存數量:</td>
    <td><input name="qty" value=${yarnData.qty}></td>
    </tr>
     <tr>
    <td>價格:</td>
    <td><input name="price" vlaue=${yarnData.price}></td>
    </tr>
    </table>
<button type="submit">更新</button>
</form>
<form action= "<c:url value='/backend/deleteyarn' />" method="post">
<input type="hidden" name="itemId" value="${yarnData.itemId}">
<input type="submit" value="刪除"><br>
<a href="<c:url value='/backend/yarn' />">回首頁</a>
</form>
<c:forEach var="itemImg" items="${itemImg}">
     <img id="img" src=<c:url value="/items/img/${itemImg.img}"/> />
</c:forEach>
</div>
</body>
</html>