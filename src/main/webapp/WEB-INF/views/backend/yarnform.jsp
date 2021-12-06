<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Yarn Form</title>
<style>
     table,th,td{border:2px solid black; border-collapse:collapse}
/*      background-color{rgb(208, 148, 234)} */
</style>
</head>
<body>
<div align='certer'>
<h3>紗線商品資料</h3>
<hr>
<a href="<c:url value='/backend/yarn/create'/>">新增紗線</a>

<table border='1'>
    <thead>
        <th>編號</th>
        <th>紗線名稱</th>
        <th>材質</th>
        <th>尺寸(直徑、規格)</th>
        <th>顏色</th>
        <th>紗線描述</th>
        <th>庫存數量</th>
        <th>價格</th>
     </thead>
        <c:forEach var="item" items='${allItem}'>
            <tr>
               <td><a href= "<c:url value='/backend/yarn/${item.itemId}'/>">${item.itemId}</a></td>
               <td>${item.itemName}</td>
               <td>${item.material}</td>
               <td>${item.size}</td>
               <td>${item.color}</td>
               <td>${item.itemDescription}</td>
               <td>${item.qty}</td>
               <td>${item.price}</td>
           </tr>
        </c:forEach>
     </table>
     <a href="/backend">回首頁</a>
     </div>
</body>
</html>