<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 작성</title>
<!-- 뭔가 어그러짐... -->
<%-- <%@ include file="/WEB-INF/views/header.jsp"%> --%>


<!-- 로그인 안 한 상태에서는 글을 쓸 수 없음 -->

<!-- Editor's Style -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script src="https://uicdn.toast.com/editor/latest/i18n/ko-kr.min.js"></script>

<script>
	function goBack(){
		window.history.back();
	}
</script>
</head>
<body>
<div id = "board-container">

		<form name="boardWriteForm" action="${pageContext.request.contextPath}/board/boardWrite" method="post">
			
			<div class="boardWriteHeader">
				<h2>후기</h2>
			</div>
			
			<input type="hidden" name="user_code" value="${userInfo.user_code}"/>
			<input type="hidden" name="user_nickname" value="${userInfo.user_nickname}"/>
			
			<h2>${userInfo.user_code}</h2>
			<h2>${userInfo.user_nickname }</h2>
		
			<div class="board_write_block">
				<div class="board_header">
					<select name="board_category">
					<!-- 선택이 선택되면 넘어가지 못하게 장치 -->
						<option value="">선택</option>
						<option value="동행후기">동행후기</option>
						<option value="여행후기">여행후기</option>
					</select>
					<input type="text" id="title" name="board_title" placeholder="제목"/>
				</div>
				
				<div class="board_content">
					<div id="editor"></div>
					<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
					<script>
			        const editor = new toastui.Editor({
			            el: document.querySelector('#editor'),
			            language: "ko-KR",
			            height: '500px',
			            initialEditType: "wysiwyg",
			            placeholder: '내용을 입력해주세요.',
			            hooks: {
							addImageBlobHook : function (blob, callback){
								const formData = new FormData();
								formData.append("image", blob);
								formData.append("uri", window.location.pathname);
								const imageURL = imageUpload(formData);
								callback(imageURL, "image");
							}
			            }
			        });
			
			        function imageUpload(formData){
						let imageURL;
			
						$.ajax({
							type: "post",
							url: "/board/boardWrite",
							async: false,
							data: formData,
							processData: false,
							contentType: false,
							success: function(data){
								imageURL = data;
								console.log(imageURL);
							},
							error : function (request, status, error){
								alert(request + ", " + status + ", " + error);
							},
			
						});
						
						return imageURL;
			
			        }
			    	</script>
				</div>
				<div class="board_write_btn">
					<input type="submit" value="등록">
					<button type="button" onclick="goBack()">취소</button>
				</div>
			
			
			</div>
		</form>
</div>
</body>
</html>