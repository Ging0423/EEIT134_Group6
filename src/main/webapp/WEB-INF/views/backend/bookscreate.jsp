<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
     table{border:2px solid black; border-collapse:collapse}
/*      background-color{rgb(208, 148, 234)} */
</style> 
</head>
<body>
<div align='center'>
<h3>書籍商品資料</h3>
<hr>
<form method="post" action="createbooks" enctype="multipart/form-data">
	<table>
      <tr>
         <td>書名:</td>
         <td><input id="itemName" name="itemName" type="text" /></td>
	  </tr>
      <tr>
         <td>出版社:</td>
         <td><input id="publisher" name="publisher" type="text" /></td>	
	  </tr>
      <tr>
         <td>作者:</td>
         <td><input id="author" name="author" type="text" /></td>
	  </tr>
      <tr>
         <td>商品描述:</td>
         <td><textarea id="itemDescription"name="itemDescription" rows="4" cols="21"></textarea><td>
<!--          <td><input id="itemDescription" name="itemDescription" type="text" /></td> -->
      </tr>
<!--       <tr> -->
<!--          <td>日期:</td> -->
<!--          <td><input id="addDate" name="addDate" type="date" /></td> -->
<!--       </tr> -->
      <tr>
         <td>數量:</td>
         <td><input id="qty" name="qty" type="number" /></td>
	  </tr>
      <tr>
         <td>價錢:</td>
         <td><input id="price" name="price" type="number" /></td>
	  </tr>
	  <tr>
	  </table>
	  照片
	  <input type="file" name="img" accept="image/*"/>
	  
	  
	  <div id="imgClass">
	  <div>
	  
	  <button type="button" onclick="addImg();">新增照片</button>	  
	    <button type="submit" value="send">送出</button>
	  </form>
	     <button onclick="magic();">一鍵輸入</button>
	     
	     
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
	  <script>	
		function magic() {	
			document.getElementById('itemName').value = "好簡單的棒針&鉤針可愛小童帽";
			document.getElementById('publisher').value = "Elegant-Boutique 新手作";
			document.getElementById('author').value = "Boutique-Sha";
			document.getElementById('itemDescription').value = "從頭開始裝可愛！ 22頂大人小孩都心動的加萌手織帽  無論是冬日寒風還是夏日烈陽，都需要一頂帽子來保護小寶貝免於風吹日曬。那麼就來親手織一頂最流行的栗子帽吧！本書收錄２２頂近年大人氣的各式栗子帽、尖帽，還有可愛的貓耳帽、小熊草帽、貝蕾帽與護耳毛帽等，根據使用線材的不同，可以依需求製作出冬日保暖，或是夏日涼爽透氣的可愛帽子。 大多使用棒針或鉤針的基礎針法就能完成，作法簡單，造型可愛。快翻開本書，為小寶貝編織一頂萌上加萌的可愛手織帽吧！";
			document.getElementById('qty').value = "100";
			document.getElementById('price').value = "315";
		}
		
		function addImg() {
			var text = $("#imgClass");
			var tr = '<input type="file" name="img" accept="image/*"/>';
			text.append(tr);
		}
	</script>
</body>
</html>