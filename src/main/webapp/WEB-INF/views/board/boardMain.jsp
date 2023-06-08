<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<%@ include file="/WEB-INF/views/header.jsp"%>

<!-- bootstrap-->
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<script>
function goBoardWrite(){
	location.href="${pageContext.request.contextPath}/board/boardWrite";
}

</script>

<script>
function changeCateBtnName(ths){
	var text = $(ths).text();
	const btnElement = document.getElementById('srcCateBtn');
	btnElement.innerText = text;
}
</script>

</head>
<body>
<div class = "container" id = "board-container">
	
	<span>후기</span>
	<button type="button" class="btn text-white" style="background-color:#FB7A51;" onclick="goBoardWrite()">후기 작성</button>
		
	<table class="table table-hover">
		<thead>
		    <tr>
		      <th scope="col">분류</th>
		      <th scope="col">제목</th>
		      <th scope="col">작성자</th>
		      <th scope="col">날짜</th>
		      <th scope="col">추천</th>
		    </tr>
		</thead>
		<tbody>
		<c:forEach items = "${list}" var="board">
			<tr no = "${board.board_id}">
				<td>${board.board_category}</td>
				<td><a href="${pageContext.request.contextPath}/board/boardDetail?no=${board.board_id}">${board.board_title}</a></td>
				
				<td>
					<%-- <select name="userInfo">
						<option>${board.user_code}</option>
						<option onchange="showWriterInfo(${board.user_code})">프로필보기
						<option onchange="">작성글보기
					</select> --%>
					<a onclick="showWriterInfo(this)">${board.user_code}</a>
				</td>
				
				<td>
					<%-- <fmt:parseDate value="${board.board_reg_date}" var="parsedDateTime" pattern = "yyyy-mm-ddThh:mm:ss"/>
					<fmt:formatDate value="${parsedDateTime}" pattern="yy-MM-dd"/> --%>
					${board.board_reg_date}
				</td>
				<td>${board.board_like}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

	<nav aria-label="Page navigation example">
		<ul class="btn-group pagination">
			<c:if test="${pageMaker.prev }">			
			<li class="page-item">
				<a class="page-link" href="<c:url value='/board/list?page=${pageMaker.startPage-1 }'/>" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
			<li class="page-item">
				<a class="page-link" href="<c:url value='/board/list?page=${pageNum }'/>">${pageNum }</a>
			</li>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
			<li class="page-item">
				<a class="page-link" href="<c:url value='/board/list?page=${pageMaker.endPage+1 }'/>" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
			</c:if>
		</ul>
	</nav>
	
	<!-- display: inline;
    width: 30%; -->
	<form name="boardSearchFrom" id="boardSearchFrom" class="form-inline my-2 my-lg-0"
		action="${pageContext.request.contextPath}/board/boardSearch">
		<div class="boardFooter">
			<button type="button" class="btn text-white dropdown-toggle" id="srcCateBtn" style="background-color:#FB7A51;" 
				data-bs-toggle="dropdown" aria-expanded="false" name="board_category">전체</button>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item" onclick="changeCateBtnName(this)">동행후기</a></li>
				<li><a class="dropdown-item" onClick="changeCateBtnName(this)">여행후기</a></li>
			</ul>
			<!-- <input class="form-control" type="search" placeholder="Search" aria-label="Search"> -->
			<input class="form-control" type="text" name="boardSearch" placeholder="Search for something..." aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</div>
		
	</form>
	
	<!-- Modal -->
		<div class="modal fade" id="userInfoModal" tabindex="-1"
			aria-labelledby="userInfoModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body">
						<div class="userPic">
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




		<%-- <table>
		<tr>
			<th>분류</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>추천</th>
		</tr>
		<c:forEach items = "${list}" var="board">
		<tr>
			<td>${board.board_category}</td>
			<td>${board.board_title}</td>
			<td>${board.board_content}</td>
			<td><fmt:formatDate value = "${board.board_reg_date}" pattern = "yy-MM-dd" /> </td>
			<td>${board.board_like}</td>
		</tr>
		</c:forEach>
	</table> --%>
<script>
function showWriterInfo(ths){
	
	console.log(ths);
	var user_code = $(ths).text();

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
				
			$('#userAge').empty();
			$('#userGender').empty();
			$('#userNickname').empty();
			$('#userTag').empty();
					
			
			//이미지 수정
			let img = $("<img>").attr({'src':user.user_pic});

			$("userPic").append(img);
			//$("#userImg").append(user.user_pic);

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
<script>
function goWriterPage(code){
	
	console.log(code);
	
}
</script>

</div>
</body>
</html>