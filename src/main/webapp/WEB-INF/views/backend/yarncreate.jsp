<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form:form method="post" action="createyarn" modelAttribute="yarnData">
<table>
      <tr>
         <td><form:label path="itemName">商品名:</form:label></td> 
         <td><form:input path="itemName"/></td>
      </tr>
      <tr>
         <td><form:label path="material">材質:</form:label></td> 
         <td><form:input path="material"/></td>
      </tr>
      <tr>
         <td><form:label path="size">尺寸:</form:label></td> 
         <td><form:input path="size"/></td>
      </tr>
      <tr>
         <td><form:label path="color">顏色:</form:label></td> 
         <td><form:input path="color"/></td>
      </tr>
      <tr>
         <td><form:label path="itemDescription"></form:label>產品敘述:</td> 
         <td><form:input path="itemDescription"/></td>
      </tr>
      <tr>
         <td><form:label path="qty">數量:</form:label></td> 
         <td><form:input path="qty"/></td>
      </tr>
      <tr>
         <td><form:label path="price">價錢:</form:label></td> 
         <td><form:input path="price"/></td>
      </tr>
      <tr>
	     <td colspan="2"><form:button value="send">送出</form:button></td>
	  </tr>
	</table>
	</form:form>
</body>
</html>