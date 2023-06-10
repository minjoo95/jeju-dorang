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
	
	<button type="button" class="btn text-white" style="background-color:#FB7A51;" onclick="location.href="${pageContext.request.contextPath}/board/list">목록</button>
	
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
	
	<!-- display: inline;
    width: 30%; -->
	<form name="boardSearchFrom" id="boardSearchFrom" class="form-inline my-2 my-lg-0">
		<div class="boardFooter">
			<button type="button" class="btn text-white dropdown-toggle" id="srcCateBtn" style="background-color:#FB7A51;" 
				data-bs-toggle="dropdown" aria-expanded="false" name="board_category">전체</button>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item" onclick="changeCateBtnName(this)">동행후기</a></li>
				<li><a class="dropdown-item" onClick="changeCateBtnName(this)">여행후기</a></li>
			</ul>
			<!-- <input class="form-control" type="search" placeholder="Search" aria-label="Search"> -->
			<input class="form-control" type="text" name="board_search" placeholder="Search for something..." aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</div>			
	</form>


</div>
</body>
</html>