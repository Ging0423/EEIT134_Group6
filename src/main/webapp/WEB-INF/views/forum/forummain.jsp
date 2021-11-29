<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>討論區</title>
<script src="<c:url value='/js/jquery-1.12.1.min.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/css/forumstyle.css'/>">
</head>
<body>
	<section class="forum_content">
		<div>
			<a href="<c:url value='/forum/newArticle'/>">
				<input type="button" value="發文">
			</a>
		</div>
		
		<div id="category_list">
			
		</div>
		
		<table class="forum_table" id="forum_table">
			<thead>
				<tr>
					<td>分類</td>
					<td>文章標題</td>
					<td>作者</td>
					<td>回覆/查看</td>
					<td>最後發表</td>					
				</tr>
			</thead>
			<tbody></tbody>
		</table>	
	</section>
	
	<script>
		var indexPage = 1;
		var categoryid = 0;
		
		$(document).ready(function () {
			load(indexPage);
		})
		
		function load(indexPage, categoryid){
			$.ajax({
				type:'post',
				url:'/loop/forum/' + categoryid + '/' + indexPage,	//要連結的網址
				dataType:'JSON',	//要下載的格式
				contentType:'application.json',	//要上傳的格式
				success:function(data){
					console.log('success:' + data);
					var json = JSON.stringify(data, null, 4);
					
					if(data==null){
						$('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
					}else{
						var table = $('#forum_table > tbody');
						
						$.each(data,function(i,n){
							var tr = "<tr align='center'>" + 
									 "<td>" + n.categoryid + "</td>" +
									 "<td><a href='/forum/article?articleid=" + n.articleid + "''>" + n.title + "</a></td>" +
									 "<td>" + n.authorid + "</td>" +
									 "<td>" + n.clickNum + "</td>" +
									 "<td>" + n.postDate + "</td>" +
									 "</tr>";
							table.append(tr);
						});
						
					}
					
				}
			});
		}
	
	</script>
</body>
</html>