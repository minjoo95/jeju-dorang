<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%!
	Long currentUserCode = null;
	Long writerCode = null;
%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css"  href="<c:url value="/resources/css/mateComment.css"/>">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%-- <%@ include file="/WEB-INF/views/header.jsp"%> --%>
<jsp:include page="/WEB-INF/views/headerBoot.jsp" />

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

<style>
div.board-header {
	height : 100px;
	border-bottom-style: solid;
	border-width: 1px;
	/* background-color: red; */
}

p.header-text {
	display: inline-block;
	font-size: 200%;
	padding-top: 4%;
    padding-left: 3%;
}

.board-header-detail{
	border-bottom-style: solid;
	border-width: 1px;
	margin-left: 4%;
	margin-right: 4%;
	/* display: inline-block; */

}
#board-detail-category{
	align: left;
	/* width: 129px; */
/* 	height: 29.34px; */
	font-size: 25px;
	color: #FB7A51;
	/* margin-left: 4%; */
}

#board-detail-title{
	font-size: 41.56px;
	/* margin-left: 4%; */
}

.board-detail-etc {
	font-size: 20px;
	color: #696969;
}

#viewer {
	margin-left: 4%;
	height: 880px;
}

.board-detail-btn-top{
 	
    margin-bottom: 10px;
    text-align: right;
    margin-right: 3px;
}

.btn-reply{
	border: none;
	background-color: white;
	color: #FB7A51;
}

.btn-delete{
	border: none;
	background-color: white;
}

div>.comment_text{
	background-color:red;
}
</style>

</head>

<body>

<div class = "container" id = "board-detail-container">

	<c:set var="currentUserCode" value="${sessionScope.userInfo.user_code}"/>
	<c:set var="writerCode" value="${board.user_code}"/>
<%-- 	${userInfo.user_code}
	${board.user_code} --%>
	
	<div class="board-header">
		<p class="header-text">후기</p>
	</div>
			
	<!-- <br> -->
	<div class="board-header-detail">
		<p id="board-detail-category">${board.board_category}</p>
		<p id="board-detail-title">${board.board_title}</p>
		<span class="board-detail-etc" >작성자 ${board.user_nickname} | </span>
		<span class="board-detail-etc">작성일 ${board.board_reg_date} | </span>
		<span class='board-detail-etc like_count'>추천수 ${board.board_like}</span>
		
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
		<!-- margin-left 수정필요 -->
		<div class="board-detail-btn-top">
		 	<button type="button" class="btn text-white" style="background-color:#D9D9D9; margin-left: 450px" onclick="updateBoard()">수정</button>
			<button type="button" class="btn text-white" style="background-color:#FB7A51;" onclick="deleteBoard(${board.board_id})">삭제</button>
		
		</div>
		<%		
			}
		%>
		
	</div>
	
	<!-- <br> -->
	<%-- <div>
		<p id="board-detail-writer">작성자 ${board.user_nickname} | </p> <p> 작성일 ${board.board_reg_date} | </p> <span class='like_count'>추천수 ${board.board_like}</span> </p>
	</div>
	<p id="board-detail-writer">작성자 ${board.user_nickname} | 작성일 ${board.board_reg_date} | <span class='like_count'>추천수 ${board.board_like}</span> </p> --%>
	
	<!-- 작성자만 보이게 -->
	<%-- <%
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
	%> --%>
	
	<!-- <button type="button" class="btn "></button> -->


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
	
	<div class = "mate_reply_whole_box">
	
<%-- 	<table>
		<c:forEach items="${commentsList}" var="comments">	
			이렇게 해서 작성자한테만 삭제 버튼 보여주고 싶었는데 계속 null이 담김ㅜ
			<c:set var="commentWriter" value="${comments.user_code}"/>
			<c:set var="commentWriter2" value="${comments.comment_content}"/>
			<tr class="comments_">
				<td><span><a onclick="showWriterInfo(${comments.user_code})">${comments.user_nickname}</a></span> <span>${comments.comment_reg_date}</span>
					<br />
					<p>${comments.comment_content}
					<p></td>
				<td>
					<%
						System.out.println("댓글 currentUserCode : " + currentUserCode);
						System.out.println("댓글 writerCode : " + writerCode);
							
/* 						Long commentWriter = (Long)pageContext.getAttribute("commentWrtier");
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
						
										<%
							}
						%>
				</td>
			</tr>
		</c:forEach>
		</table> --%>

        <!--댓글쓰기  -->
        <div class="board_reply_wrap">
        	<form name="boardCommentForm" action="${pageContext.request.contextPath}/board/boardCommentWrite" method="post">
                	<input type="hidden" name="board_id" value="${board.board_id }">
					<!-- 로그인 처리 -->
					<input type="hidden" name="user_code" value="${userInfo.user_code}">
					<input type="hidden" name="comment_depth" value="0">
					<input type="hidden" name="parent_comment_no" value="0">
                    <textarea class="comment_txt" name="comment_content" placeholder="댓글 입력..."></textarea>
                    <div class="mate_reply_btn_container">
                    	<button type="submit" class="mate_reply_btn" >
							입력
						</button>
					</div>
              </form>
        </div>
        
        <div class="mate_reply_wrap">
            <div class="mate_reply_box">
                <div class="mate_reply_container">
                	<form name="boardCommentForm" action="${pageContext.request.contextPath}/board/boardCommentWrite" method="post">
                		<input type="hidden" name="board_id" value="${board.board_id }">
						<!-- 로그인 처리 -->
						<input type="hidden" name="user_code" value="${userInfo.user_code}">
						<input type="hidden" name="comment_depth" value="0">
						<input type="hidden" name="parent_comment_no" value="0">
                    	<textarea class="comment_txt" name="comment_content" placeholder="댓글 입력..."></textarea>
                    	<div class="mate_reply_btn_container">
                    		<button type="submit" class="mate_reply_btn" >
							입력
						</button>
						</div>
                    </form>
                </div>
                
                <!-- <div class="mate_reply_btn_container">
                    <button class="mate_reply_btn">입력2</button>
                </div> -->
            </div>
        </div>
       <div class="mate_reply_list_table_box">
              <table align="center" width="500" border="1" id="rtb">
	           		<thead id="rCount_head">
	                    <td colspan="4"><b id="rCount">댓글목록</b></td>
	                </thead>
	                <c:forEach items="${commentsList}" var="comments">
	                <tbody id="mate_reply_body">
	                	<tr class="comments_">
							<td><span><a onclick="showWriterInfo(${comments.user_code})">${comments.user_nickname}</a></span> <span>${comments.comment_reg_date}</span>
							<br />
							<p>${comments.comment_content}<p>
							</td>
							<td>
							<%
								System.out.println("댓글 currentUserCode : " + currentUserCode);
								System.out.println("댓글 writerCode : " + writerCode);
									
		/* 						Long commentWriter = (Long)pageContext.getAttribute("commentWrtier");
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

						</td>
					</tr>
				</c:forEach>
	                </tbody>
            </table>
       </div>

       <%-- <input type="hidden" name="mate_code" id="mate_code" value="${mt.mate_code}"/> --%>
        <div class="mate_reply_wrap">
            <div class="mate_reply_box">
                <div class="mate_reply_container">
                	<form name="boardCommentForm" action="${pageContext.request.contextPath}/board/boardCommentWrite" method="post">
                		<input type="hidden" name="board_id" value="${board.board_id }">
						<!-- 로그인 처리 -->
						<input type="hidden" name="user_code" value="${userInfo.user_code}">
						<input type="hidden" name="comment_depth" value="0">
						<input type="hidden" name="parent_comment_no" value="0">
                    	<textarea class="comment_txt" name="comment_content" placeholder="댓글 입력..."></textarea>
                    	<div class="mate_reply_btn_container">
                    		<button type="submit" class="mate_reply_btn" >
							입력
						</button>
						</div>
                    </form>
                </div>
                
                <!-- <div class="mate_reply_btn_container">
                    <button class="mate_reply_btn">입력2</button>
                </div> -->
            </div>
        </div>
    </div>
	
<%-- 		<div class="comment_container">		
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
		</div> --%>
	<%		
		}
	%>
		
<%-- 		<table>
		<c:forEach items="${commentsList}" var="comments">	
			이렇게 해서 작성자한테만 삭제 버튼 보여주고 싶었는데 계속 null이 담김ㅜ
			<c:set var="commentWriter" value="${comments.user_code}"/>
			<c:set var="commentWriter2" value="${comments.comment_content}"/>
			<tr class="comments_">
				<td><span><a onclick="showWriterInfo(${comments.user_code})">${comments.user_nickname}</a></span> <span>${comments.comment_reg_date}</span>
					<br />
					<p>${comments.comment_content}
					<p></td>
				<td>
					<%
						System.out.println("댓글 currentUserCode : " + currentUserCode);
						System.out.println("댓글 writerCode : " + writerCode);
							
/* 						Long commentWriter = (Long)pageContext.getAttribute("commentWrtier");
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
						<button class="btn-delete" value="${comments.comment_no}" onclick="commentDelete(${comments.comment_no}, ${comments.user_code})">삭제</button>
						
						<%
							}
						%>
				</td>
			</tr>
		</c:forEach>
		</table> --%>
		
		<form name="boardDeleteCommentForm" action="${pageContext.request.contextPath}/board/boardDeleteComment" method="post">
			<input type="hidden" name="comment_no"/>
			<input type="hidden" name="board_id" value="${board.board_id}"/>
		</form>		
	</div>
	
		<!-- Modal -->
		<div class="modal fade" id="userInfoModal" tabindex="-1"
			aria-labelledby="userInfoModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body">
						<div class="userPic" id="userPic">
							<!-- <img id="userImg" class="profile"> -->
						</div>
						<form name="userBoardForm" id="userBoardForm" action="${pageContext.request.contextPath}/board/userBoard" method="post">
						<div>
							<!-- 이름 통일... -->
							<span id="userAge"></span>
							<span id="userGender"></span>
							<p id="userNickname"></p>
							<p id="userTag"></p>
							<input type="hidden" id="user_code" name="user_code" value=""/>
						</div>
						
							<button type="button" class="btn btn-secondary" name="goWriterPage" data-bs-dismiss="modal" onclick="">작성글보기</button>
							<button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">(form)작성글보기</button>
						</form>
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						
				
					</div>
	
				</div>
			</div>
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
<script>
function showWriterInfo(ths){
	
	console.log(ths);
	var user_code = ths;
	console.log("user_code : " + user_code);

	const userInfoModalEl = new bootstrap.Modal(document.querySelector("#userInfoModal"));

	$.ajax({ 
		type: "post",
		url: "${pageContext.request.contextPath}/board/writerInfo",
		data:{
			user_code
		},
		success: function(user) {

			console.log("user : " + user);
			console.log(user.user_id);
			console.log(user.user_code);
				
			$("#userPic").empty();
			$('#userAge').empty();
			$('#userGender').empty();
			$('#userNickname').empty();
			$('#userTag').empty();
			
			//이미지		
			let img;
			
			if((user.user_pic).indexOf('kakaocdn') == -1){
				
				img = $("<img>").attr({'src':"${contextPath }/resources/uploadProfilePic/${sessionScope.userInfo.user_pic }"});
				
			} else{
				
				img = $("<img>").attr({'src':user.user_pic});
				
			}
			
			
			console.log("img : " + img.src);

			$("#userPic").append(img);
			$('#userAge').append(user.user_age_range);
			$('#userGender').append(user.user_gender);
			$('#userNickname').append(user.user_nickname);
			$('#userTag').append(user.user_tag);

			$('input[name=user_code]').attr('value', user.user_code);

			//음..굳이?
			$('button[name=goWriterPage]').attr('onclick', "goWriterPage("+ user.user_code + ")");

			//$('#btn').append('<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="goWriterPage(' + user.user_code + ')">작성글보기</button>')
			
			userInfoModalEl.show();

		}
	});
}

</script>

</body>
<jsp:include page="/WEB-INF/views/footerBoot.jsp" />
<%-- <jsp:include page="/WEB-INF/views/footer.jsp" /> --%>
</html>