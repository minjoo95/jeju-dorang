<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 작성</title>
<!-- 뭔가 어그러짐... -->
<%-- <%@ include file="/WEB-INF/views/header.jsp"%> --%>
<%-- <jsp:include page="/WEB-INF/views/header.jsp" /> --%>



<!-- 로그인 안 한 상태에서는 글을 쓸 수 없음 -->

<!-- Editor's Style -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script src="https://uicdn.toast.com/editor/latest/i18n/ko-kr.min.js"></script>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>

	//var chkSum = false;
	
	function goBack(){
		window.history.back();
	}
	
	function boardSubmit(){
		
		console.log("board_submit() 들어옴");
		//ES6이상은 백틱 가능
		
		//let content= "\`" + editor.getHTML() + "\`";
		//console.log(content);
		
		let content= editor.getHTML();
		console.log(content);
		
		//document.boardWriteForm.board_content
 		$('input[name=board_content]').attr('value', content);
		
		console.log("category : " + $("select[name=board_category]").val());
		console.log("title : " + $('input[name=board_title]').val());
		console.log("content : " + $('input[name=board_content]').val());

 		if($('select[name=board_category]').val() === "" || $('select[name=board_category]').val() === undefined || $('select[name=board_category]').val() === null){

			//console.log("chkSum : " + chkSum);
			alert('분류를 선택해주세요.');
		
		} else if ($('input[name=board_title]').val() === "" || $('input[name=board_title]').val() === undefined || $('input[name=board_title]').val() === null){

			alert('제목을 입력해주세요.');
			//console.log("chkSum : " + chkSum);
		
		} else {
	
			//chkSum = true;
			//console.log("chkSum : " + chkSum);

			$('#boardWriteForm').attr("action", "${pageContext.request.contextPath}/board/boardWrite").submit();

		}	
	}
	
/* 	function chkSum(){
		console.log("chkSum : " + chkSum);
		
		if(chkSum == true){
			$('#boardWriteForm').attr("action", "${pageContext.request.contextPath}/board/boardWrite").submit();
		}
	} */
</script>

</head>
<body>
<div id="board-write-container">

<button onclick='board_submit()'>등록2</button>

	<%--
		<form name="boardWriteForm" action="${pageContext.request.contextPath}/board/boardWrite" method="post">
	--%>
	
	<form name="boardWriteForm" id="boardWriteForm" action="" method="post">
		<!-- <form name="boardWriteForm" id="boardWriteForm" action="" method="post" onsubmit="return chkSum()"> -->
	
			<div class="boardWriteHeader">
				<h2>후기</h2>
			</div>
			
			<input type="hidden" name="user_code" value="${userInfo.user_code}"/>
			<h2>${userInfo.user_code}</h2>
			
			<%-- <input type="hidden" name="user_nickname" value="${userInfo.user_nickname}"/> --%>
			<%-- <h2>${userInfo.user_nickname }</h2> --%>
		
			<div class="board_write_block">
				<div class="board_header">
					<select id= "board_category" name="board_category">
					<!-- 선택이 선택되면 넘어가지 못하게 장치 -->
						<option value="" selected disabled >선택</option>
						<option value="동행후기">동행후기</option>
						<option value="여행후기">여행후기</option>
					</select>
					<input type="text" id="title" name="board_title" placeholder="제목"/>
				</div>
				
				<div class="board_content_div">
					<div id="editor"></div>
					<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
					<script>
					const editor = new toastui.Editor({
						  el: document.querySelector("#editor"),
						  height: "500px",
						  initialEditType: "wysiwyg",
						  placeholder: "내용을 입력해주세요",
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
					
					<input type="hidden" name="board_content" value=""/>
			    	
				</div>
				
				<div class="board_write_btn">
					<!-- <input type="submit" value="등록"> -->
					<button onclick="boardSubmit()">등록2</button>
					<button type="button" onclick="goBack()">취소</button>
				</div>
			
			
			</div>
		</form>
		<%--
		</form>
		--%>
</div>
</body>
</html>