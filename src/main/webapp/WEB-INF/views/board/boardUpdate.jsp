<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <%@ include file="/WEB-INF/views/header.jsp"%> --%>

<!-- bootstrap-->
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<!-- Editor's Style -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script src="https://uicdn.toast.com/editor/latest/i18n/ko-kr.min.js"></script>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	
function goBack(){
		window.history.back();
	}
	
$(document).ready(function(){
	
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

<style>

/* a {
	text-decoration: none;
	color: #3F3D3A;
} */

div.board-write-header {
	height : 100px;
	border-bottom-style: solid;
	border-width: 1px;
	/* background-color: red; */
}

p.header-text {
	/* background-color: yellow; */
	display: inline-block;
	/* border: solid 1px; */
	margin-top: 4%;
	margin-left: 3%;
/* 	margin-bottom: 1% solid 1px; */
	font-size: 200%;
}

.board_content_div{

	
}

#board_category{
	border: none;
	text-align: center;
	width: 10%;
	height: 45px;
    margin-right: 2%;
}

#board_title{
	border: none;
	border-bottom: 1px solid #BEB9B9;
	width: 87%;
	
}

.board_write_btn{
	height: 50px;
	text-align: center;
}

#board_write_submit{
	background-color:#FB7A51;
	/* width: 10%; */
	width: 135px;
	height: 35px;
	margin-right: 80px;
	margin-top: 0.5%;
	
}

#board_wrtie_cancel{
	border-color:#FB7A51;
	color:#FB7A51;
	/* width: 10%; */
	width: 135px;
	height: 35px;
	margin-top: 0.5%;

}

</style>

</head>

<body>
<jsp:include page="/WEB-INF/views/headerBoot.jsp" />
<div class="container" id="board-write-container">

	<form name="boardWriteForm" id="boardWriteForm" action="" method="post">
		<!-- <form name="boardWriteForm" id="boardWriteForm" action="" method="post" onsubmit="return chkSum()"> -->
	
			<div class="board-write-header">
				<p class="header-text">후기</p>
			</div>
			
			<input type="hidden" name="user_code" value="${userInfo.user_code}"/>
		
			<div class="board_write_block">
				<div class="board_header">
					<select id= "board_category" name="board_category">
					<!-- 선택이 선택되면 넘어가지 못하게 장치 -->
						<option value="" selected disabled >선택</option>
						<option value="동행후기">동행후기</option>
						<option value="여행후기">여행후기</option>
					</select>
					<input type="text" id="title" name="board_title" style="width: 80%; border:none; border-bottom: 1px solid #BEB9B9;"value="${board.board_title }"/>

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
					<!-- <button type="button" class="btn text-white" style="background-color:#FB7A51; margin-left: 450px" onclick="boardUpdate()">수정완료</button>
					<button type="button" class="btn text-white" style="background-color:#D9D9D9;" onclick="goBack()">취소</button -->
					
					<button type="button" id="board_write_submit" class="btn text-white" onclick="boardUpdate()">수정완료</button>
					<button type="button" id="board_wrtie_cancel" class="btn btn-outline-primary" onclick="goBack()">취소</button>

				</div>
				
				<!-- <div class="board_write_btn">
					<input type="submit" value="등록">
					<button type="button" id="board_write_submit" class="btn text-white" style="background-color:#FB7A51;" onclick="boardSubmit()">등록</button>
					<button type="button" id="board_wrtie_cancel" class="btn btn-outline-primary" style="border-color:#FB7A51; color:#FB7A51;" onclick="goBack()">취소</button>
					<button type="button" id="board_write_submit" class="btn text-white" onclick="boardSubmit()">등록</button>
					<button type="button" id="board_wrtie_cancel" class="btn btn-outline-primary" onclick="goBack()">취소</button>
				</div> -->

				
			</div>
		</form>
</div>
</body>

<jsp:include page="/WEB-INF/views/footer.jsp" />
</html>