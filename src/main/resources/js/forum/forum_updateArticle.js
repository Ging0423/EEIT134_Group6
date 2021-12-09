var myEditor;
var categoryid;

$(document).ready(function() {
	categoryid = $('#categoryid').val();
	console.log(categoryid);
	
	if (categoryid == 1){
		document.getElementById("category_btn").value = "成品分享";
	} else if (categoryid == 2){
		document.getElementById("category_btn").value = "手作教學";
	} else if (categoryid == 3){
		document.getElementById("category_btn").value = "材料心得";
	} else if (categoryid == 4){
		document.getElementById("category_btn").value = "店家評點";
	} else if (categoryid == 5){
		document.getElementById("category_btn").value = "活動分享";
	} else if (categoryid == 6){
		document.getElementById("category_btn").value = "二手交易";
	}
})

ClassicEditor
	.create(document.querySelector('#editor'))
	.then(editor => {
		myEditor = editor;
	})
	.catch(error => {
		console.error(error);
	});

//檢查標題字數
function titlecheck() {
	var title = $("#title").val();
	var textleft = 25 - title.length;

	if (textleft >= 0)
		$("#titlecheck").html("尚可輸入" + textleft + "個字元");
	else
		$("#titlecheck").html("已超過標題輸入上限");
}

//檢查文章資料是否錯誤並送出資料到後台
function sendArticle() {
	var title = $("#title").val();
	var errorMessage = [];

	// check文章類別 標題是否空白或標題是否超過字數
	if (categoryid == '0') {
		errorMessage.push('需要選擇文章類別');
	}
	if ($.trim(title) == '') {
		errorMessage.push('\n請加入文章標題');
	}
	if ($.trim(title).length > 25) {
		errorMessage.push('\n標題字數超過上限，請修改標題');
	}
	if (errorMessage.length) {
		alert(errorMessage);
		return;
	}

	//確認資料ok，送出資料到後端
	var article = {
		"title": title,
		"authorid": 1,
		"categoryid": categoryid,
		"content": myEditor.getData()
	}

	$.ajax({
		type: 'post',
		url: "/loop/forum/updateArticleSuccess",
		dataType: 'JSON',
		contentType: 'application/json',
		data: JSON.stringify(article),
		success: function(data) {
		}
	});
	
	window.alert("已成功修改文章!!");
	window.location.replace("/loop/forum/myforum");
}

/* 點擊下拉式選單後，出現下拉式選單*/
function selectCategory() {
  document.getElementById("category").classList.toggle("show");
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

// 點擊下拉式選單選項，修改categoryid的值
function changeCategoryid(selected){
	categoryid = selected;
	var category_name;
	
	switch (categoryid){
		case 0:
			category_name = "請選擇主題類別";
			break;
		case 1:
			category_name = "成品分享";
			break;
		case 2:
			category_name = "手作教學";
			break;
		case 3:
			category_name = "材料心得";
			break;
		case 4:
			category_name = "店家評點";
			break;
		case 5:
			category_name = "活動分享";
			break;
		case 6:
			category_name = "二手交易";
			break;
		case 7:
			category_name = "請選擇主題類別";
			break;
	}
	
	document.getElementById("category_btn").value = category_name;
	return category_name;
}