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

#board-search-container{
	height: 800px;
}
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

p.board-search-btn {
	display: inline-block;
	float: right;
	padding-top: 4%;
	margin-right: 3%;
}

p.board-search-btn>button{
	background-color: #FB7A51;
	width: 195px;
	margin-bottom: 0;
}

#boardSearch{
    margin: 0 auto;
    width: 50%;
/*  border: none;
    border-bottom: 1px solid black; */
}

.go-list{
	float: right;
	width: 135px;
	height: 35px;
}
.search-table {
	height: 55%;
}

.pagination {
	justify-content: center;
}

</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/headerBoot.jsp" />
<div class = "container" id = "board-search-container">

	<div class="board-header">
		<p class="header-text">후기</p>
 		<p class="board-search-btn">
			<!-- <button type="button" class="btn text-white" onclick="goBoardWrite()">후기 작성</button> -->
			<button type="button" class="btn text-white" onclick="location.href='${pageContext.request.contextPath}/board/list'">목록</button>
			<%-- <button type="button" class="btn text-white go-list" style="background-color:#FB7A51;" onclick="location.href="${pageContext.request.contextPath}/board/list">목록</button> --%>
		</p>
	</div>
	
	<div class=search-table>
	<table class="table table-hover">
		<thead>
		    <tr class="text-center">
		      <th scope="col">분류</th>
		      <th scope="col">제목</th>
		      <th scope="col">작성자</th>
		      <th scope="col">날짜</th>
		      <th scope="col">추천</th>
		    </tr>
		</thead>
		<tbody>
		<c:forEach items = "${list}" var="board">
			<tr class="text-center" no = "${board.board_id}">
				<td>${board.board_category}</td>
				<td><a href="${pageContext.request.contextPath}/board/boardDetail?no=${board.board_id}">${board.board_title}</a></td>
				<td>${board.user_nickname}</td>
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
	</div>
	
	<%-- <button type="button" class="btn text-white go-list" style="background-color:#FB7A51;" onclick="location.href="${pageContext.request.contextPath}/board/list">목록</button> --%>
	
	<nav aria-label="Page navigation example">
		<ul class="btn-group pagination">
			<c:if test="${pageMaker.prev }">			
			<li class="page-item">
				<a class="page-link" href="<c:url value='/board/listSearch?page=${pageMaker.startPage-1 }'/>" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
			<li class="page-item">
				<a class="page-link" href="<c:url value='/board/listSearch?page=${pageNum }'/>">${pageNum }</a>
			</li>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
			<li class="page-item">
				<a class="page-link" href="<c:url value='/board/listSearch?page=${pageMaker.endPage+1 }'/>" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
			</c:if>
		</ul>
	</nav>
	
	<form name="boardSearchFrom" id="boardSearchFrom" class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/board/boardSearch">
		<div class="boardFooter">
			<!-- 일단은 제목만 검색하게 -->
			<input class="form-control" type="text" id="boardSearch" name="boardSearch" placeholder="${user.user_nickname}님 글 제목 검색" aria-label="Search">
			<!-- <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button> -->
		</div>
	</form>

<%-- 	<form name="boardSearchFrom" id="boardSearchFrom" class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/board/boardUserSearch">
		<div class="boardFooter">
			<!-- 일단은 제목만 검색하게 -->
			<input type="hidden" id="user_code" name="user_code" value="${userInfo.user_code}"/>
			<input class="form-control" type="text" id="boardSearch" name="boardSearch" placeholder="글 제목 검색" aria-label="Search">
			<!-- <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button> -->
		</div>
	</form> --%>


</div>
</body>
<jsp:include page="/WEB-INF/views/footerBoot.jsp" />
</html>