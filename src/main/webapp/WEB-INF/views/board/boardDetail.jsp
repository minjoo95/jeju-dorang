<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%!
	Long currentUserCode = null;
	Long writerCode = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="/WEB-INF/views/header.jsp"%>

<!-- bootstrap-->
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<!-- Editor's Style -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<!-- <script src="https://uicdn.toast.com/editor/latest/i18n/ko-kr.min.js"></script> -->

<link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">

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
</script>

<script>
function likeBoard2(board_id){
	
	console.log(board_id);
	
//	const likeModalEl = document.getElementById('likeModal');


 	const likeModalEl = new bootstrap.Modal(document.querySelector("#likeModal"));
	//console.log(likeModalEl);
	//likeModalEl.show();
	
	const cancelLikeModalEl = new bootstrap.Modal(document.querySelector("#cancelLikeModal"));
	//console.log(cancelLikeModalEl);
	//cancelLikeModalEl.show();
	
	
	//console.log("${userInfo.user_code} : " + ${userInfo.user_code});
	//db에 이 user가 추천했는지 확인

	
	$.ajax({ 
			type: "post",
			url: "${pageContext.request.contextPath}/board/boardLike",
			data:{
				board_id: ${board.board_id},
				user_code : ${userInfo.user_code}
			},
			success: function(data) {

				console.log("data : " + data);
				
				//location.href = "${pageContext.request.contextPath}/board/list" //추천수 바뀌어야...

			},
			error : function(error) {
				//console.log("이미 db에 있음");
				//cancelLikeModalEl.show();

			},
		});
	

//modal event

/* var likeModal = document.getElementById('likeModal');
likeModal.addEventListener('shown.bs.modal', function (event) {
	console.log('ㅎㅋ');
})
 */

/* $('#likeModal').on('show.bs.modal', function () {
	console.log("show modal");
}); */

//$('#likeModal').modal();

$('#likeModal').modal(); //왜 이게 먹히는..


$('#likeModal').on('shown.bs.modal', function () {
	console.log("shown modal");
});


console.log("여기");
//var test=${board.board_content};
//let content= "\` ${board.board_content} \`";

/* let content = '${board.board_content}';
console.log(content);
document.getElementById("viewer-content").innerHTML = content; */

}

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
	작성자 ${board.user_code} | 작성일 ${board.board_reg_date} | <span class='like_count'>추천수 ${board.board_like}</span> </p>
	
	<!-- 작성자만 보이게 -->
	<%
		//header를 꼭 포함해야 함  - 아닌듯..?
		//Long currentUserCode = (Long)pageContext.getAttribute("currentUserCode");
		//Long writerCode = (Long)pageContext.getAttribute("writerCode");
		currentUserCode = (Long)pageContext.getAttribute("currentUserCode");
		writerCode = (Long)pageContext.getAttribute("writerCode");
		
		System.out.println("currentUserCode : " + currentUserCode);
		System.out.println("writerCode : " + writerCode);
		
		if(currentUserCode != null && currentUserCode.equals(writerCode)) {
		
	%>
 	<button type="button" class="btn text-white" style="background-color:#D9D9D9;" onclick="updateBoard()">수정</button>
	<button type="button" class="btn text-white" style="background-color:#FB7A51;" onclick="deleteBoard(${board.board_id})">삭제</button>
	<%		
		}
	%>
	
	<!-- <button type="button" class="btn "></button> -->

</div>

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
	
	
	<div id="comment_temp">
	<%
		System.out.println("currentUserCode : " + currentUserCode);
		System.out.println("writerCode : " + writerCode);
		
		if(currentUserCode != null) {
		
	%>
	
		<div class="comment_container">		
			<form name="boardCommentForm" action="${pageContext.request.contextPath}/board/boardCommentWrite" method="post">
				<input type="hidden" name="board_id" value="${board.board_id }">
				<!-- 로그인 처리 -->
				<input type="hidden" name="user_code" value="${userInfo.user_code}">
				<input type="hidden" name="comment_depth" value="0">
				<input type="hidden" name="parent_comment_no" value="0">
				<textarea name="comment_content"> </textarea>
				<button type="submit" >
					댓글등록
				</button>
			</form>	
		</div>
	<%		
		}
	%>
		
		<table>
			<!-- 대댓글 처리 어떻게... -->
			<c:forEach items="${commentsList}" var="comments">
			
			<%-- 이렇게 해서 작성자한테만 삭제 버튼 보여주고 싶었는데 계속 null이 담김ㅜ
			<c:set var="commentWriter" value="${comments.user_code}"/>
			<c:set var="commentWriter2" value="${comments.comment_content}"/> --%>
			
				<tr class="comments_">
					<td><span>${comments.user_code}</span> <span>${comments.comment_reg_date}</span>
						<br />
						<p>${comments.comment_content}
						<p></td>
					<td>
						<%
							System.out.println("댓글 currentUserCode : " + currentUserCode);
							System.out.println("댓글 writerCode : " + writerCode);
							
/* 							Long commentWriter = (Long)pageContext.getAttribute("commentWrtier");
							String commentWriter2 = (String)pageContext.getAttribute("commentWrtier2");
							
							System.out.println("commentWriter : " + commentWriter);
							System.out.println("commentWriter2 : " + commentWriter2); */
								
							if(currentUserCode != null) {
		
						%>
						
						<button class="btn-reply" value="${comments.comment_no}">대댓글 쓰기</button>
						
						<%
							}
							
							//else {
						%>
						
						
						<button class="btn-delete" value="${comments.comment_no}" onclick="commentDelete(${comments.comment_no}, ${comments.user_code})">댓글 삭제</button>
						
<%-- 						<%
							}
						%> --%>
					</td>
				</tr>
			</c:forEach>

		</table>
		
		<form name="boardDeleteCommentForm" action="${pageContext.request.contextPath}/board/boardDeleteComment" method="post">
			<input type="hidden" name="comment_no"/>
			<input type="hidden" name="board_id" value="${board.board_id}"/>
		</form>
		
	
<%-- 삭제		<textarea> </textarea>
		<button type="button" onClick="addComment(${board.board_id})">
			댓글등록
		</button> --%>
		
		<c:forEach var="boardComments" items="${boardComments}" varStatus="status">
			<div
				style="border: 1px solid gray; width: 600px; padding: 5px; margin-top: 5px;
          margin-left: <c:out value="${20*boardComments.comment_depth}"/>px; display: inline-block">
				<c:out value="${boardComments.user_code}" />
				<c:out value="${boardComments.comment_reg_date}" />
				<a href="#"
					onclick="fn_replyDelete('<c:out value="${boardComments.comment_no}"/>')">삭제</a>
				<a href="#"
					onclick="fn_replyUpdate('<c:out value="${boardComments.comment_no}"/>')">수정</a>
				<a href="#"
					onclick="fn_replyReply('<c:out value="${boardComments.comment_no}"/>')">댓글</a>
				<br />
				<div id="reply<c:out value="${boardComments.comment_no}"/>">
					<c:out value="${boardComments.comment_content}" />
				</div>
			</div>
			<br />
		</c:forEach>
		
	</div>
	<div id="footer-btn-div">
		<button type="button" class="btn" style="border-color:#FB7A51; color:#FB7A51;">댓글작성</button>

		<button type="button" id="likeBtn1" class="btn" style="border-color:#FB7A51; color:#FB7A51;" onclick="likeBoard(${board.board_id})">추천</button>
		
<!-- 		<button type="button" id="likeBtn2" class="btn" data-bs-toggle="modal" data-bs-target="#likeModal" style="border-color:#FB7A51; color:#FB7A51;">
  			추천2
		</button> -->
		
		<!-- Modal -->
		<div class="modal fade" id="likeModal" tabindex="-1"
			aria-labelledby="likeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body">
						<i class="em em-partying_face" aria-role="presentation" aria-label="FACE WITH PARTY HORN AND PARTY HAT"></i>
						<h5>추천 완료</h5>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">확인</button>
					</div>
	
				</div>
			</div>
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="cancelLikeModal" tabindex="-1"
			aria-labelledby="cancelLikeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body">
						<i class="em em-thinking_face" aria-role="presentation" aria-label="THINKING FACE"></i>
						<h5>이미 추천하셨습니다.</h5>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">확인</button>
					</div>
	
				</div>
			</div>
		</div>

		<button type="button" class="btn text-white" style="background-color:#FB7A51;" onclick="location.href='${pageContext.request.contextPath}/board/list'">목록</button>
	</div>
<script>
function commentDelete(comment_no, user_code){
	
	console.log("comment_no : " + comment_no);
	console.log("user_code : " + user_code);
	
	//이게 아니더라도 로그인 안 하면 오류로 인해 삭제 안됨ㅎ;
	if(${userInfo.user_code} == null) {
		console.log("null임");
		alert("로그인 해주세요.");
	}
	
	console.log(${userInfo.user_code});
	
	if(${userInfo.user_code} != user_code) {
		
		alert("삭제 권한이 없습니다.");
		return false;
		
	}

		
		if(confirm("댓글을 삭제하시겠습니까?")){
			var $deleteComment = $(document.boardDeleteCommentForm);
			
			//var commentNo = $(this).val();
			
			$deleteComment.find("[name=comment_no]").val(comment_no);
			$deleteComment.submit();
		}
}

</script>
<script>
function likeBoard(board_id){
	
	console.log(board_id);
	
//	const likeModalEl = document.getElementById('likeModal');


 	const likeModalEl = new bootstrap.Modal(document.querySelector("#likeModal"));
	//console.log(likeModalEl);
	//likeModalEl.show();
	
	const cancelLikeModalEl = new bootstrap.Modal(document.querySelector("#cancelLikeModal"));
	//console.log(cancelLikeModalEl);
	//cancelLikeModalEl.show();
	
	
	//console.log("${userInfo.user_code} : " + ${userInfo.user_code});
	//db에 이 user가 추천했는지 확인

	
	$.ajax({ 
			type: "post",
			url: "${pageContext.request.contextPath}/board/boardLike",
			data:{
				board_id: ${board.board_id},
				user_code : ${userInfo.user_code}
			},
			success: function(data) {

				console.log("data : " + data);
				if(data == 0){
					cancelLikeModalEl.show();
					
				} else {
					likeModalEl.show();
					$('.like_count').text('추천수 ' + data);
					console.log("크크");
				}
				
				//location.href = "${pageContext.request.contextPath}/board/list" //추천수 바뀌어야...

			}
		});
}

</script>
<script>
/* ajax로? */
$(".btn-reply").click(function(){
	
	var html = "<tr>";
	html += "<td colspan='2' style='display:none; text-align:left;'>";
	html += '<form name="boardCommentForm" action="${pageContext.request.contextPath}/board/boardCommentWrite" method="post">';
	html += '<input type="hidden" name="board_id" value="${board.board_id }"/>';
	html += '<input type="hidden" name="user_code" value="${userInfo.user_code}"/>';
	html += '<input type="hidden" name="comment_depth" value="1"/>';
	html += '<input type="hidden" name="parent_comment_no" value="' + $(this).val() + '"/>';
	html += '<textarea name="comment_content"> </textarea>';
	html += '<button type="submit" >댓글등록</button>';
	html += '</form>';
	html += "</td>";
	html += "</tr>";

	var $reply_btn = $(this).parent().parent();
	$(html).insertAfter($reply_btn).children("td").slideDown(800);

	$(this).off("click");
});


//No
/* $(".btn-delete").click(function(){

	console.log("zz");
	console.log($(this).val());
	
	if(confirm("댓글을 삭제하시겠습니까?")){
		var $deleteComment = $(document.boardDeleteCommentForm);
		var commentNo = $(this).val();
		$deleteComment.find("[name=comment_no]").val(commentNo);
		$deleteComment.submit();
	}
	

}); */

$(".btn_comment_delete").click(function(){

	console.log("gg");
	console.log($('input[name=btn_comment_delete]').attr("value1"));
	console.log($('input[name=btn_comment_delete]').attr("value2"));
	console.log("gg");
	
	$('input[name=btn_comment_delete]').each(function(index, item){
		console.log($(item).attr("value1"));
		console.log($(item).attr("value2"))
	});
	
	if(confirm("댓글을 삭제하시겠습니까?")){
		var $deleteComment = $(document.boardDeleteCommentForm);
		var commentNo = $(this).val();
		$deleteComment.find("[name=comment_no]").val(commentNo);
		$deleteComment.submit();
	}
	

});

</script>
</body>
</html>