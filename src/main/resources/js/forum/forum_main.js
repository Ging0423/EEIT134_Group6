var categoryid = 0;
var indexPage = 1;

$(document).ready(function() {
	load(categoryid, indexPage);
})

function load(categoryid, indexPage) {
	
	var table = $('#forum_table > tbody');
	table.empty("");

	$.ajax({
		type: 'post',
		url: '/loop/forum/' + categoryid +'/' + indexPage,	//要連結的網址
		dataType: 'JSON',	//要下載的格式
		contentType: 'application.json',	//要上傳的格式
		success: function(data) {
			var json = JSON.stringify(data, null, 4);
			
			if (data == null) {
				$('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
			} else {
				$.each(data, function(i, n) {
					var tr = "<tr align='center'>" +
						"<td>" + categoryName(n.categoryid) + "</td>" +
						"<td><a href='/loop/forum/article/" + n.articleid + "'>" + n.title + "</a></td>" +
						"<td>" + n.authorid + "</td>" +
						"<td>" + n.reply.length + "/" + n.clickNum + "</td>" +
						"<td>" + n.postdate + "</td>" +
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
			return '手作教學';
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

function searchArticle(){
	keyword = $('#keyword').val();
	var table = $('#forum_table > tbody');

	$.ajax({
		type: 'post',
		url: '/loop/forum/search/' + keyword +'/' + indexPage,	//要連結的網址
		dataType: 'JSON',	//要下載的格式
		contentType: 'application.json',	//要上傳的格式
		success: function(data) {
			table.empty("");
			var json = JSON.stringify(data, null, 4);
			
			if (data == null) {
				//$('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
			} else {
				$.each(data, function(i, n) {
					var tr = "<tr align='center'>" +
						"<td>" + categoryName(n.categoryid) + "</td>" +
						"<td><a href='/loop/forum/article/" + n.articleid + "'>" + n.title + "</a></td>" +
						"<td>" + n.authorid + "</td>" +
						"<td>" + n.reply.length + "/" + n.clickNum + "</td>" +
						"<td>" + n.postdate + "</td>" +
						"</tr>";
					table.append(tr);
				});
			}
		}
	});
}
