var indexPage = 1;

$(document).ready(function() {
	load(indexPage);
})

function load(indexPage) {
	var table = $('#forum_table > tbody');
	table.empty("");
	
	console.log(indexPage);
	
	$.ajax({
		type: 'post',
		url: '/loop/backend/forum/' + indexPage,	//要連結的網址
		dataType: 'JSON',	//要下載的格式
		contentType: 'application.json',	//要上傳的格式
		success: function(data) {
			var json = JSON.stringify(data, null, 4);
			
			if (data == null) {
				$('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
			} else {
				$.each(data, function(i, n) {
					if (n.reply.length !== 0){
						reply_authorid = n.reply[0].users.userName;
						reply_replydate = n.reply[0].replydate;
					}else{
						reply_authorid = n.users.userName;
						reply_replydate = n.postdate;
					}
					
					var tr = "<tr align='center'>" +
						"<td>" + n.articleid + "</td>" +
						"<td style='text-align: center;'><a href='/loop/forum/article/" + n.articleid + "'>" + n.title + "</a></td>" +
						"<td>" + n.users.userName + "<br/><span style='font-size:8px; font-weight:lighter;'>" + n.postdate + "</span></td>" +
						"<td style='text-align: center;'><a onclick='checkDelete(" + n.articleid + ")'><i class='ti-trash'></i></a></td>" +
						"</tr>";
					table.append(tr);
				});
			}
		}
	});
}

function changePage(page) {
	indexPage = page;
	load(indexPage);
};

function checkDelete(articleid) {
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