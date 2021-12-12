var categoryid = 0;
var indexPage = 1;
var sortType = "articleid"

$(document).ready(function() {
	load(sortType, categoryid, indexPage);
})

function load(sortType, categoryid, indexPage) {
	if (indexPage == '1') {
		$('#minusPage').hide();
	} else {
		$('#minusPage').show();
	}

	if (indexPage == $('#totalPages').val()) {
		$('#plusPage').hide();
	} else {
		$('#plusPage').show();
	}

	var table = $('#forum_table > tbody');
	table.empty("");

	$.ajax({
		type: 'post',
		url: '/loop/forum/sortType=' + sortType + '/' + categoryid + '/' + indexPage,	//要連結的網址
		dataType: 'JSON',	//要下載的格式
		contentType: 'application.json',	//要上傳的格式
		success: function(data) {
			var json = JSON.stringify(data, null, 4);

			if (data == null) {
				$('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
			} else {
				$.each(data, function(i, n) {
					let reply_authorid, reply_replydate;
					if (n.reply.length !== 0) {
						reply_replydate = n.reply[0].replydate;
					} else {
						reply_authorid = n.users.userName;
						reply_replydate = n.postdate;
					}

					var tr = "<tr align='center'>" +
						"<td>" + categoryName(n.categoryid) + "</td>" +
						"<td><a href='/loop/forum/article/" + n.articleid + "'>" + n.title + "</a></td>" +
						"<td>" + n.users.userName + "<br/><span style='font-size:8px; font-weight:lighter;'>" + n.postdate + "</span></td>" +
						"<td>" + n.reply.length + "/" + n.clickNum + "</td>" +
						"<td>" + reply_authorid + "<br/><span style='font-size:8px; font-weight:lighter;'>" + reply_replydate + "</span></td>" +
						"</tr>";
					table.append(tr);
				});
			}
		}
	});
	
	document.getElementById('myPage' + indexPage).style.backgroundColor = "#B08EAD";
	document.getElementById('myPage' + indexPage).style.color = "#fff";
}

function searchArticle() {
	keyword = $('#keyword').val();
	var table = $('#forum_table > tbody');

	$.ajax({
		type: 'post',
		url: '/loop/forum/search/' + categoryid + '/' + keyword + '/' + indexPage,	//要連結的網址
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
						"<td>" + n.authorid + "<br/><span style='font-size:8px; font-weight:lighter;'>" + n.postdate + "</span></td>" +
						"<td>" + n.reply.length + "/" + n.clickNum + "</td>" +
						"<td>" + reply_authorid + "<br/><span style='font-size:8px; font-weight:lighter;'>" + reply_replydate + "</span></td>" +
						"</tr>";
					table.append(tr);
				});
			}
		}
	});


}

function changePage(page) {
	document.getElementById('myPage' + indexPage).style.backgroundColor = "#fff";
	document.getElementById('myPage' + indexPage).style.color = "black";

	indexPage = page;
	load(sortType, categoryid, indexPage);
};

function addPage(page) {
	document.getElementById('myPage' + indexPage).style.backgroundColor = "#fff";
	document.getElementById('myPage' + indexPage).style.color = "black";

	if (page > 0) {
		indexPage = indexPage + 1;
	} else if (page < 0) {
		indexPage = indexPage - 1;
	}
	load(sortType, categoryid, indexPage);
}

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

/* 點擊下拉式選單後，出現下拉式選單*/
function selectSortType() {
	document.getElementById("sortType").classList.toggle("show");
}

// 點擊下拉式選單外後，關閉選單
window.onclick = function(event) {
	if (!event.target.matches('.dropbtn')) {
		var dropdowns = document.getElementsByClassName("dropdown-content");
		var i;
		for (i = 0; i < dropdowns.length; i++) {
			var openDropdown = dropdowns[i];
			if (openDropdown.classList.contains('show')) {
				openDropdown.classList.remove('show');
			}
		}
	}
}

function changeSortType(sortType) {
	switch (sortType) {
		case 1:
			$('#sortType_btn').html("最新發佈 <i class='ti-angle-down'></i>");
			sortType = "articleid";
			load(sortType, categoryid, indexPage);
			break;
		case 2:
			$('#sortType_btn').html("最多瀏覽 <i class='ti-angle-down'></i>");
			sortType = "clickNum";
			load(sortType, categoryid, indexPage);
			break;
		case 3:
			$('#sortType_btn').html("最新回覆 <i class='ti-angle-down'></i>");
			sortType = "replyid";
			load(sortType, categoryid, indexPage);
			break;
		case 4:
			$('#sortType_btn').html("最多按讚 <i class='ti-angle-down'></i>");
			sortType = "likeNum";
			load(sortType, categoryid, indexPage);
			break;
	}
}

function changeCategoryid(newid) {
	categoryid = newid;
	load(sortType, categoryid, indexPage);
}
