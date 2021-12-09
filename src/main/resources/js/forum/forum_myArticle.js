var categoryid = 0;
var indexPage = 1;
var authorid = 1;

$(document).ready(function() {
	load(authorid, categoryid, indexPage);
})

function load(authorid, categoryid) {
	var table = $('#forum_table > tbody');
	
	$.ajax({
		type: 'post',
		url: '/loop/forum/myforum/' + authorid + '/' + categoryid +'/' + indexPage,	//要連結的網址
		dataType: 'JSON',	//要下載的格式
		contentType: 'application.json',	//要上傳的格式
		success: function(data) {
			table.empty("");
			var json = JSON.stringify(data, null, 4);
			
			if (data == null) {
				$('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
			} else {
				$.each(data, function(i, n) {
					var tr = "<tr align='center'>" +
						"<td>" + categoryName(n.categoryid) + "</td>" +
						"<td><a href='/loop/forum/article/" + n.articleid + "'>" + n.title + "</a></td>" +
						"<td>" + n.reply.length + "/" + n.clickNum + "</td>" +
						"<td>" + n.postdate + "</td>" +
						"<td><a href='/loop/forum/myforum/update/" + n.articleid + "'><i class='ti-pencil'></i></a>" + "/" +
						"<a onclick='checkDelete(" + n.articleid + ")'><i class='ti-trash'></i></a></td>" +
						"</tr>";
					table.append(tr);
				});
			}
		}
	});
}

function change(page) {
	indexPage = page;
	load(categoryid, indexPage);
};

function categoryName(categoryid) {
	switch (categoryid) {
		case 1:
			return '成品分享';
			break;
		case 2:
			return '成品分享';
			break;
		case 3:
			return '材料心得';
			break;
		case 4:
			return '店家評點';
			break;
		case 5:
			return '活動分享';
			break;
		case 6:
			return '二手交易';
	}
}

function checkDelete(articleid){
	var deleteArticle = confirm("確定刪除文章嗎?");
	
	if (deleteArticle == true) {
	 $.ajax({
		type: 'post',
		url: '/loop/forum/myforum/delete/' + articleid,	//要連結的網址
		dataType: 'JSON',	//要下載的格式
		contentType: 'application.json',	//要上傳的格式
		success: function(data) {
			window.alert("已成功刪除文章!!");
		}
		});
	}
	
	window.location.reload();
}

//function searchArticle() {
//	keyword = $('#keyword').val();
//	var table = $('#forum_table > tbody');
//
//	$.ajax({
//		type: 'post',
//		url: '/loop/forum/search/' + keyword + '/' + indexPage,	//要連結的網址
//		dataType: 'JSON',	//要下載的格式
//		contentType: 'application.json',	//要上傳的格式
//		success: function(data) {
//			table.empty("");
//			var json = JSON.stringify(data, null, 4);
//
//			if (data == null) {
//				//$('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
//			} else {
//				$.each(data, function(i, n) {
//					var tr = "<tr align='center'>" +
//						"<td>" + categoryName(n.categoryid) + "</td>" +
//						"<td><a href='/loop/forum/article/" + n.articleid + "'>" + n.title + "</a></td>" +
//						"<td>" + n.authorid + "</td>" +
//						"<td>" + n.replyNum + "/" + n.clickNum + "</td>" +
//						"<td>" + n.postDate + "</td>" +
//						"</tr>";
//					table.append(tr);
//				});
//			}
//		}
//	});
//}
