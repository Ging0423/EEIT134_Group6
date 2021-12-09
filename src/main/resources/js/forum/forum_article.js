var indexPage = 1;
var replyEditor;
var articleid = $("#articleid").val()

ClassicEditor
	.create(document.querySelector('#replyEditor'))
	.then(editor => {
		replyEditor = editor;
	})
	.catch(error => {
		console.error(error);
	});

$(document).ready(function() {
	load(indexPage);
})

function load(indexPage) {
	var table = $('#reply_table > tbody');

	$.ajax({
		type: 'post',
		url: '/loop/forum/reply/' + articleid + '/' + indexPage,	//要連結的網址
		dataType: 'JSON',	//要下載的格式
		contentType: 'application.json',	//要上傳的格式
		success: function(data) {
			table.empty("");
			var json = JSON.stringify(data);

			if (data == null) {
				//$('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
			} else {
				$.each(data, function(i, n) {
					var tr = "<tr align='center'>" +
						"<td style='width: 300px;'>" + 
						"<img src='/img/author/author_2.png'>" +
						"<br/>" + n.authorid + 
						"<hr/>" + "發表於:" + n.replydate + "</td>" +
						"<td>" + n.content + "</td>" +
						"</tr>";
					table.append(tr);
				});
			}
		}
	});
}

function addPage(page) {
	if (indexPage == 1) {
		window.alert("當前已是第一頁!!");
	}
}

function addLikeNum() {

}

function addShareNum() {
	//console.log($(fb-share-button).data('href'));
}

function replyArticle() {
	var reply = {
		"articleid": articleid,
		"authorid": 2,
		"content": replyEditor.getData()
	}

	$.ajax({
		type: 'post',
		url: "/loop/forum/newReply",
		dataType: 'JSON',
		contentType: 'application/json',
		data: JSON.stringify(reply),
		success: function(data) {
			window.alert("回覆新增成功!!");
			load(1);
		}
	});
}

function gotoReply() {
	window.location.hash = $('replyEditor_container');
}
