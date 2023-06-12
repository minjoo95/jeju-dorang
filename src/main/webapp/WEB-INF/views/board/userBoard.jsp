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
#table-category{
	width: 10%;	
}
	
#table-title{
	width: 50%;
}
	
#table-writer {
	width: 20%;
}
	
#table-date {
	width: 10%;
}
	
#table-like {
	witdh: 10%;
}
	
#boardSearch{
    margin: 0 auto;
    width: 50%;
/*  border: none;
    border-bottom: 1px solid black; */
}
	
/* 	#table-text{
		float: none;
		margin: 0 auto;
	} */

.go-list-btn{
	float: right;
	background-color:#FB7A51;
	width: 135px;
	height: 35px;
}

.pagination {
	justify-content: center;
}

.page-link {
  color: #000; 
  background-color: #fff;
  border: 1px solid #ccc; 
}

.page-item.active .page-link {
 z-index: 1;
 color: #555;
 font-weight:bold;
 background-color: #f1f1f1;
 border-color: #ccc;
 
}

.page-link:focus, .page-link:hover {
  color: #000;
  background-color: #fafafa; 
  border-color: #ccc;
}

.boardFooter {
	margin-top: 50px;
	margin-bottom: 50px;
}

.pg {
	margin-top: 50px;
}

.comment_txt {
    width: 800px;
    height: 70%;
    resize: none;
    color: #D9D9D9;
    border: 1px solid #E3E3E3;
}
</style>
</head>

<body>
<jsp:include page="/WEB-INF/views/headerBoot.jsp" />
<div class = "container" id = "board-user-container">
	<div class="board-header">
		<p class="header-text"><span style="color: #FB7A51;">${user1.user_nickname}</span> 님의 작성글</p>
	</div>
	<table class="table table-hover">
		<thead>
		    <tr class="text-center align-self-center" id="table-text">
		      <th scope="col" id="table-category">분류</th>
		      <th scope="col" id="table-title">제목</th>
		      <th scope="col" id="table-writer">작성자</th>
		      <th scope="col" id="table-date">날짜</th>
		      <th scope="col" id="table-like">추천</th>
		    </tr>
		</thead>
		<tbody>
		<c:forEach items = "${list}" var="board">
			<tr class="text-center" no = "${board.board_id}">
				<td>${board.board_category}</td>
				<td><a href="${pageContext.request.contextPath}/board/boardDetail?no=${board.board_id}">${board.board_title}</a></td>
				<td style="color: #FB7A51;">${board.user_nickname}</td>
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

	<button type="button" class="btn text-white go-list-btn" onclick="location.href='${pageContext.request.contextPath}/board/list'">목록</button>
	<div>		
		<nav aria-label="Page navigation example">
			<ul class="btn-group pagination pg">
			<%-- ${pageMaker.prev } --%>
				<c:choose>
					<c:when test="${pageMaker.startPage-1 == 0}">
						<li class="page-item">
							<a class="page-link" href="<c:url value='/board/list?page=1'/>" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="<c:url value='/board/list?page=${pageMaker.startPage-1 }'/>" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:otherwise>
				</c:choose>			
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
				<li class="page-item">
					<a class="page-link" href="<c:url value='/board/list?page=${pageNum }'/>">${pageNum }</a>
				</li>
				</c:forEach>		
				<c:choose>
					<c:when test="${pageMaker.next && pageMaker.endPage >0 }">
						<li class="page-item">
							<a class="page-link" href="<c:url value='/board/list?page=${pageMaker.endPage+1 }'/>" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:when>
					<c:otherwise>
					<li class="page-item">
						<a class="page-link" href="<c:url value='/board/list?page=${pageMaker.endPage}'/>" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	</div>
	
<%-- 	<form name="boardSearchFrom" id="boardSearchFrom" class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/board/boardUserSearch">
		<div class="boardFooter">
			<!-- 일단은 제목만 검색하게 -->
			<input type="hidden" id="user_code" name="user_code" value="${userInfo.user_code}"/>
			<input class="form-control" type="text" id="boardSearch" name="boardSearch" placeholder="글 제목 검색" aria-label="Search">
			<!-- <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button> -->
		</div>
	</form> --%>
	
	<form name="boardSearchFrom" id="boardSearchFrom" class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/board/boardUserSearch">
		<div class="boardFooter">
			<!-- 일단은 제목만 검색하게 -->
			<input type="hidden" id="user_code" name="user_code" value="${user1.user_code}"/>
			<input class="form-control" type="text" id="boardSearch" name="boardSearch" placeholder="${user1.user_nickname}님 글 제목 검색" aria-label="Search">
			<!-- <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button> -->
		</div>
	</form>

</div>
</body>
<jsp:include page="/WEB-INF/views/footer.jsp" />
</html>