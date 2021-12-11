var myEditor;
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
	var article = {
		"title": title,
		"authorid": 1,
		"categoryid": categoryid,
		"content": myEditor.getData()
	}
	
	$.ajax({
		type: 'post',
		url: "/loop/forum/newPost/newArticleSuccess",
		dataType: 'JSON',
		contentType: 'application/json',
		data: JSON.stringify(article),
		success: function(data) {
		}
	});
	
	alert("已新增文章成功!!");
//	window.location.replace("/loop/forum");
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