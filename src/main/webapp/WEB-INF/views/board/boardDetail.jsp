<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<!-- <script src="https://uicdn.toast.com/editor/latest/i18n/ko-kr.min.js"></script> -->

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
function updateBoard(){
	location.href="${pageContext.request.contextPath}/board/boardUpdate?no=${board.board_id}";
}

function deleteBoard(board_id){
	console.log(board_id);
	
	if(confirm("정말 삭제하시겠습니까?")){
		
		$.ajax({ 
			type: "post",
			url: "${pageContext.request.contextPath}/board/boardDelete",
			data:{
				board_id: ${board.board_id}
			},
			success: function(data) {
				
				location.href = "${pageContext.request.contextPath}/board/list"
			}
		})
		
	} else {
		
	}
	
}

console.log("여기");
//var test=${board.board_content};
//let content= "\` ${board.board_content} \`";

/* let content = '${board.board_content}';
console.log(content);
document.getElementById("viewer-content").innerHTML = content; */


</script>

</head>

<body>

<h2>후기</h2>

<div>
	
	<!-- header를 꼭 포함해야 함 -->
	<c:set var="currentUserCode" value="${sessionScope.userInfo.user_code}"/>
	<c:set var="writerCode" value="${board.user_code}"/>
	
	
	${userInfo.user_code}
	${board.user_code}
	
	${board.board_category}
	<br>
	${board.board_title}
	<br>
	작성자 ${board.user_code} | 작성일 ${board.board_reg_date} | 추천수 ${board.board_like}
	
	<!-- 작성자만 보이게 -->
	<%
		//header를 꼭 포함해야 함  - 아닌듯..?
		Long currentUserCode = (Long)pageContext.getAttribute("currentUserCode");
		Long writerCode = (Long)pageContext.getAttribute("writerCode");
		
		System.out.println("currentUserCode : " + currentUserCode);
		System.out.println("writerCode : " + writerCode);
		
		if(currentUserCode != null && currentUserCode.equals(writerCode)) {
		
	%>
 	<button type="button" class="btn text-white" style="background-color:#D9D9D9;" onclick="updateBoard()">수정</button>
	<button type="button" class="btn text-white" style="background-color:#FB7A51;" onclick="deleteBoard(${board.board_id})">삭제</button>
	<%		
		}
	%>
	
	<button type="button" class="btn "></button>

</div>

	

		<!-- 띄어쓰기가 잘 안되는데 db입력시 &nbsp로 변환해서 넣어줘야하는지 -->
	<div id="viewer">
		${board.getBoard_content()}
		<%--<p id = "viewer-content"><%-- ${board.board_content} </p> --%>
	</div>

	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
		
	<script>
		const editor = toastui.Editor.factory({
			el : document.querySelector("#viewer"),
			viewer : true,
			height : '500px',
			
		});
		
	</script>
	
<!--  	<script>
	let content = `${board.board_content}`;
	console.log("before : " + content);
	//content = content.replace(' ', '&nsbp;');
	content = content.replace(' ', '\u00A0');
	console.log("after : " + content);
	document.getElementById("viewer-content").innerHTML = content;
	</script>  -->



</body>
</html>