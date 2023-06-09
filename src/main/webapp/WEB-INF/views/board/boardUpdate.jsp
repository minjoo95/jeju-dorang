<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/header.jsp"%>

<!-- Editor's Style -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script src="https://uicdn.toast.com/editor/latest/i18n/ko-kr.min.js"></script>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	
function goBack(){
		window.history.back();
	}
	
$(document).ready(function(){
	
	alert("먼데");
	const el = document.getElementById('board_category');	
	const len = el.options.length;
	const str = '${board.board_category}';
	
	for(let i = 0; i < len; i++){
		if(el.options[i].value == str){
			el.options[i].selected = true;
		}
	}
	
	
	console.log(${userInfo.user_code});
	
	console.log("category : " + $("select[name=board_category]").val());
	console.log("title : " + $('input[name=board_title]').val());
	console.log("content : " + $('input[name=board_content]').val());
	
	
});

	
function boardUpdate(){
 		
		alert("zg");
		
		//지금날짜 - java에서 할까?
 		let today = new Date();
		
		let year = today.getFullYear();
		let month = today.getMonth() + 1;
		let date = today.getDate();
		
		let hours = today.getHours();
		let minutes = today.getMinutes();
		let seconds = today.getSeconds();
		
		let now = year + "-" + month + "-" + date + " " + hours + ":" + minutes + ":" + seconds;
		console.log(now);
		
		const board_reg_date = now;

		let content= editor.getHTML();
		console.log(content);

 		$('input[name=board_content]').attr('value', content);

 		$('input[name=user_code]').attr('value',${board.user_code});
 		$('input[name=board_id]').attr('value',${board.board_id});
 		$('input[name=board_reg_date]').attr('value', now);
 		$('input[name=board_like]').attr('value',${board.board_like});
 		//다시 한번 보기
	
		$('#boardWriteForm').attr("action", "${pageContext.request.contextPath}/board/boardUpdate").submit();
			
	}
	
</script>

</head>
<body>
<div id="board-write-container">
	
		<form name="boardWriteForm" id="boardWriteForm" action="" method="post">		
	
			<div class="boardWriteHeader">
				<h2>후기</h2>
			</div>
		
			<div class="board_write_block">
				<div class="board_header">
					<select id= "board_category" name="board_category">
					<!-- 선택이 선택되면 넘어가지 못하게 장치 -->
						<option value="" selected disabled>선택</option>
						<option value="동행후기">동행후기</option>
						<option value="여행후기">여행후기</option>
					</select>
					<input type="text" id="title" name="board_title" value="${board.board_title }"/>
				</div>
				
				<div class="board_content_div">
					<div id="editor">
					${board.board_content}
					</div>
					<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
					<script>
					const editor = new toastui.Editor({
						  el: document.querySelector("#editor"),
						  height: "500px",
						  initialEditType: "wysiwyg",	  
						  hooks: {
						    addImageBlobHook: function (blob, callback) {
						      const formData = new FormData();
						      formData.append("image", blob);
						      formData.append("uri", window.location.pathname);
						      const imageURL = imageUpload(formData);
						      console.log(imageURL);
						      callback(imageURL, "image");
						    }
						  }
						});

						function imageUpload(formData) {		
						  let imageURL;
						  
						  $.ajax({
							type: "post",
							url: "${pageContext.request.contextPath}/board/image_upload.do",
							async: false,
							data: formData,
							processData: false,
							contentType: false,
						    success: function (data) {
						    imageURL = data;

						  },
						    error: function(request, status, error) {
						    	alert("오류 : " + error);
						  	}
						  });
						  
						  return imageURL;
						}
					</script>
					
					<input type="hidden" name="user_code" value=""/>
					<input type="hidden" name="board_id" value=""/>
					<input type="hidden" name="board_content" value=""/>
					<input type="hidden" name="board_reg_date" value=""/>
					<input type="hidden" name="board_like" value=""/>
					
				</div>
				
				<div class="board_write_btn">
					<button onclick="boardUpdate()">수정완료</button>
					<button type="button" onclick="goBack()">취소</button>
				</div>
			
			
			</div>
		</form>

</div>
</body>
</html>