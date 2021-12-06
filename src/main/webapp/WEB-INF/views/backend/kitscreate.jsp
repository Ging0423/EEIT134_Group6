<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kits Create</title>
<style>
     table{border:2px solid black; border-collapse:collapse}
/*      background-color{rgb(208, 148, 234)} */
</style> 
</head>
<body>
<div align='center'>
<h3>材料包商品資料</h3>
<hr>
<form method="post" action="createkits" enctype="multipart/form-data">

	<table>
      <tr>
         <td>商品名:</td> 
         <td><input id="itemName" name="itemName" type="text"/></td>
      </tr>
      <tr>
         <td>商品描述:</td>
         <td><textarea id="itemDescription" name="itemDescription" rows="4" cols="21"></textarea><td>
      </tr>
      <tr>
         <td>數量:</td> 
         <td><input id="qty" name="qty" type="number" min="0"/></td>
      </tr>
      <tr>
         <td>價錢:</td>
         <td><input id="price" name="price" type="number" min="0"/></td>
      </tr>
      </table>	
      <input type="file" name="img" accept="image/*" onchange="addImg();"/>
	  <div id="imgClass">  
	  </div>
	    <button type="submit" value="send">送出</button>
	  </form>
	     <button onclick="magic();">一鍵輸入</button>
	 
	  <script>	
		function magic() {	
			document.getElementById('itemName').value = "夏日網格托特包";
			document.getElementById('itemDescription').value = "材料包內容: 5球毛線， 2個圈環，作法說明書";
			document.getElementById('qty').value = "100";
			document.getElementById('price').value = "1800";
		}
		
		function addImg(){
			var text = $("#imgClass");
			var tr = '<input type="file" name="img" accept="image/*" onchange="addImg();"/><br>';
			text.append(tr);
		}
		</script>
		
		<script src="<c:url value='/js/jquery-1.12.1.min.js'/>"></script>
	    <!-- popper js -->
	    <script src="<c:url value='/js/popper.min.js'/>"></script>
	    <!-- bootstrap js -->
	    <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
	    <!-- magnific popup js -->
	    <script src="<c:url value='/js/jquery.magnific-popup.js'/>"></script>
	    <!-- carousel js -->
	    <script src="<c:url value='/js/owl.carousel.min.js'/>"></script>
	    <script src="<c:url value='/js/jquery.nice-select.min.js'/>"></script>
	    <!-- slick js -->
	    <script src="<c:url value='/js/slick.min.js'/>"></script>
	    <script src="<c:url value='/js/jquery.counterup.min.js'/>"></script>
	    <script src="<c:url value='/js/waypoints.min.js'/>"></script>
	    <script src="<c:url value='/js/contact.js'/>"></script>
	    <script src="<c:url value='/js/jquery.ajaxchimp.min.js'/>"></script>
	    <script src="<c:url value='/js/jquery.form.js'/>"></script>
	    <script src="<c:url value='/js/jquery.validate.min.js'/>"></script>
	    <script src="<c:url value='/js/mail-script.js'/>"></script>
	    <!-- custom js -->
	    <script src="<c:url value='/js/custom.js'/>"></script>   
</body>
</html>