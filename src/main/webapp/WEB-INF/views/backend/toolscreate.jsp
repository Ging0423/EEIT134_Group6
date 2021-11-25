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
<form:form method="post" action="createtools" modelAttribute="toolsData">
   <table>
	  <tr>
         <td><form:label path="itemName">商品名:</form:label></td> 
         <td><form:input path="itemName"/></td>
      </tr>
       <tr>
         <td><form:label path="specification">種類:</form:label></td> 
         <td><form:input path="specification"/></td>
      </tr>
       <tr>
         <td><form:label path="itemDescription">商品描述:</form:label></td> 
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