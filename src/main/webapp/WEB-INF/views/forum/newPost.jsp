<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="zxx">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Loop 討論區</title>
<link rel="icon" href="<c:url value='/img/favicon.png'/>">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>">
<!-- animate CSS -->
<link rel="stylesheet" href="<c:url value='/css/animate.css'/>">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="<c:url value='/css/owl.carousel.min.css'/>">
<!-- font awesome CSS -->
<link rel="stylesheet" href="<c:url value='/css/all.css'/>">
<!-- flaticon CSS -->
<link rel="stylesheet" href="<c:url value='/css/flaticon.css'/>">
<link rel="stylesheet" href="<c:url value='/css/themify-icons.css'/>">
<!-- font awesome CSS -->
<link rel="stylesheet" href="<c:url value='/css/magnific-popup.css'/>">
<!-- swiper CSS -->
<link rel="stylesheet" href="<c:url value='/css/slick.css'/>">
<!-- style CSS -->
<link rel="stylesheet" href="<c:url value='/css/style.css'/>">
<!-- forum CSS -->
<link rel="stylesheet" href="<c:url value='/css/forumstyle.css'/>">
</head>

<body>
	<!--::header part start::-->
	<jsp:include page="/fragment/header.jsp" />
	<!-- Header part end-->

	<!-- Forum content start here -->
	<section class="forum">
		<div class="banner">
			<h2>討論區</h2>
			<span>你，與世界的對話</span>
		</div>

		<div class="forum_container">
			<div class="title">
				<div class="dropdown">
				  <input type="button" id="category_btn" onclick="selectCategory()" class="dropbtn" value="請選擇主題類別">
				  <div id="category" class="dropdown-content">
					    <a onclick="changeCategoryid(0)">請選擇主題類別</a>
					    <a onclick="changeCategoryid(1)">成品分享</a>
					    <a onclick="changeCategoryid(2)">手作教學</a>
					    <a onclick="changeCategoryid(3)">材料心得</a>
					    <a onclick="changeCategoryid(4)">店家評點</a>
					    <a onclick="changeCategoryid(5)">活動分享</a>
					    <a onclick="changeCategoryid(6)">二手交易</a>
				  </div>
				</div>
				<input type="text" size="25" id="title" onkeyup="titlecheck()">
				<span id="titlecheck">尚可輸入25個字元</span>
			</div>

			<div id="editor1" class="editor_container">
				<div id="editor"></div>
			</div>
			<div id="editor2" class="editor_container">
				<div id="editor_auto"></div>
			</div>

			<span id="contenttest"></span>

			<div class="newPost">
				<input type="submit" value="發表新文章" onclick="sendArticle()">
				<input type="button" value="一鍵輸入" onclick="autoInput()">
			</div>
		</div>
	</section>
	<!-- Forum content end -->

	

	<!--::footer_part start::-->
	<jsp:include page="/fragment/footer.jsp" />
	<!--::footer_part end::-->

	<!-- jquery plugins here-->
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
	<script src="<c:url value='/js/ckeditor.js'/>"></script>
	<script src="<c:url value='/js/translations/zh.js'/>"></script>
	<script type="text/javascript">
var myEditor;
var myEditor2;
var categoryid = 0;

ClassicEditor.create( document.querySelector( '#editor' ), {
		extraPlugins: [ MyCustomUploadAdapterPlugin ],
		toolbar: ["heading", "|", "alignment:left", "alignment:center", "alignment:right", "alignment:adjust", "|", "bold", "italic", "blockQuote", "link", "|", "bulletedList", "numberedList", "imageUpload", "|", "undo", "redo"],
		language: 'zh'
	})
	.then( editor => {
		myEditor = editor;
	 })
	 .catch( err => {
		console.error( err.stack );
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
	var obj = new Object();
	obj.title = title;
	obj.categoryid = categoryid;
	if(document.getElementById('editor1').style.display == "none"){
		obj.content = myEditor2.getData();
		
	}else{
		obj.content = myEditor2.getData();
		console.log(myEditor.getData());
	}
	
	$.ajax({
		type: 'post',
		url: '/loop/forum/newPost/newArticleSuccess',
		dataType: 'JSON',
		contentType: 'application/json',
		data: JSON.stringify(obj),
		success: function(data) {
		}
	});
	
	alert("已新增文章成功!!");
	window.location.replace("/loop/forum");
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
	}
	
	document.getElementById("category_btn").value = category_name;
}


class MyUploadAdapter {
    constructor( loader ) {
        // The file loader instance to use during the upload.
        this.loader = loader;
    }

    // Starts the upload process.
    upload() {
        return this.loader.file
            .then( file => new Promise( ( resolve, reject ) => {
                this._initRequest();
                this._initListeners( resolve, reject, file );
                this._sendRequest( file );
            } ) );
    }

    // Aborts the upload process.
    abort() {
        if ( this.xhr ) {
            this.xhr.abort();
        }
    }

    // Initializes the XMLHttpRequest object using the URL passed to the constructor.
    _initRequest() {
        const xhr = this.xhr = new XMLHttpRequest();

        // Note that your request may look different. It is up to you and your editor
        // integration to choose the right communication channel. This example uses
        // a POST request with JSON as a data structure but your configuration
        // could be different.
        xhr.open( 'POST', '/loop/forum/newPost/uploadimg', true );
        xhr.responseType = 'json';
    }

    // Initializes XMLHttpRequest listeners.
    _initListeners( resolve, reject, file ) {
        const xhr = this.xhr;
        const loader = this.loader;
        const genericErrorText = `Couldn't upload file: ${ file.name }.`;

        xhr.addEventListener( 'error', () => reject( genericErrorText ) );
        xhr.addEventListener( 'abort', () => reject() );
        xhr.addEventListener( 'load', () => {
            const response = xhr.response;
			console.log(xhr);

            // This example assumes the XHR server's "response" object will come with
            // an "error" which has its own "message" that can be passed to reject()
            // in the upload promise.
            //
            // Your integration may handle upload errors in a different way so make sure
            // it is done properly. The reject() function must be called when the upload fails.
            if ( !response || response.error ) {
                return reject( response && response.error ? response.error.message : genericErrorText );
            }

            // If the upload is successful, resolve the upload promise with an object containing
            // at least the "default" URL, pointing to the image on the server.
            // This URL will be used to display the image in the content. Learn more in the
            // UploadAdapter#upload documentation.
            resolve( {
                default: response.url
            } );
        } );

        // Upload progress when it is supported. The file loader has the #uploadTotal and #uploaded
        // properties which are used e.g. to display the upload progress bar in the editor
        // user interface.
        if ( xhr.upload ) {
            xhr.upload.addEventListener( 'progress', evt => {
                if ( evt.lengthComputable ) {
                    loader.uploadTotal = evt.total;
                    loader.uploaded = evt.loaded;
                }
            } );
        }
    }

    // Prepares the data and sends the request.
    _sendRequest( file ) {
        // Prepare the form data.
        const data = new FormData();

        data.append( 'upload', file );

        // Important note: This is the right place to implement security mechanisms
        // like authentication and CSRF protection. For instance, you can use
        // XMLHttpRequest.setRequestHeader() to set the request headers containing
        // the CSRF token generated earlier by your application.

        // Send the request.
        this.xhr.send( data );
    }
}

function MyCustomUploadAdapterPlugin( editor ) {
    editor.plugins.get( 'FileRepository' ).createUploadAdapter = ( loader ) => {
        // Configure the URL to the upload script in your back-end here!
        return new MyUploadAdapter( loader );
    };
}

function autoInput(){
	changeCategoryid(1);
	document.getElementById('title').value = "我做了一隻針織熊熊";
	titlecheck();
	document.getElementById('editor1').style.display="none";
	ClassicEditor.create( document.querySelector( '#editor_auto' ), {
		extraPlugins: [ MyCustomUploadAdapterPlugin ],
		toolbar: ["heading", "|", "alignment:left", "alignment:center", "alignment:right", "alignment:adjust", "|", "bold", "italic", "blockQuote", "link", "|", "bulletedList", "numberedList", "imageUpload", "|", "undo", "redo"],
		language: 'zh'
	})
	.then( editor => {
		myEditor2 = editor;
		myEditor2.setData("<p>我做了一隻熊熊</p><img src='https://tshop.r10s.com/251ef580-ec8c-11e4-8128-005056b73023/New/202102/6983164-118511a.jpg?_ex=486x486'>");
	 })
	 .catch( err => {
		console.error( err.stack );
	 });
}
	</script>
</body>

</html>