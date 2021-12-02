<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Yarn Create</title>
<style>
.single_product_img {margin:auto; width:70%}
table{border:2px solid black; border-collapse:collapse}
/*      background-color{rgb(208, 148, 234)} */
</style> 
</head>
<body>
<div align='center'>
<h3>紗線商品資料</h3>
<hr>

<form method="post" action="createyarn" enctype="multipart/form-data">

    <table>
      <tr>
         <td>紗線名稱:</td> 
         <td><input id="itemName" name="itemName" type="text" /></td>
      </tr>
      <tr>
         <td>材質:</td> 
         <td><input id="material" name="material" type="text"/></td>
      </tr>
      <tr>
         <td>尺寸(直徑、規格):</td>
         <td><input id="size" name="size" type="text"></td>
      </tr>
      <tr>
         <td>顏色:</td> 
         <td><input id="color" name="color" type="text"/></td>
      </tr>
      <tr>
         <td>紗線描述:</td>
         <td><textarea id="itemDescription" name="itemDescription" rows="4" cols="21"></textarea></td>
      </tr>
      <tr>
         <td>庫存數量:</td> 
         <td><input id="qty" name="qty" type="number" min="0"/></td>
      </tr>
      <tr>
         <td>價格:</td> 
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
		  document.getElementById('itemName').value = "拉菲草繩"
		  document.getElementById('material').value = ""
		  document.getElementById('size').value = "公分、碼、公克"
		  document.getElementById('color').value = ""
		  document.getElementById('itemDescription').value = ""
		  document.getElementById('qty').value = "100"
		  document.getElementById('price').value = ""  
	  }
	  
	  function addImg(){
		  var text = $("#imgClass");
		  var tr = '<input type="file" name="img" accept="image/*" onchange=""addImg();"/><br>';
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