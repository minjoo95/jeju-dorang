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
</head>
<body>
<section id = "board-container">
	
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
				<td>${board.user_code}</td>
				<td><fmt:formatDate value = "${board.board_reg_date}" pattern = "yy-MM-dd" /> </td>
				<td>${board.board_like}</td>
			</tr>
		</c:forEach>
		</tbody>
</table>
		
	
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

</section>
</body>
</html>