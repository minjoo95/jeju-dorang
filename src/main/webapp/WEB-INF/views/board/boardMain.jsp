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
<!-- bootstrap 작성하기-->

<script>
function goBoardWrite(){
	location.href="${pageContext.request.contextPath}/board/boardWrite";
}
</script>
</head>
<body>
<section id = "board-container">

		<span>후기</span>
		<input type="button" value="후기 작성" id="btn-write" onclick="goBoardWrite()"/>
	
	<table>
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
	</table>

</section>
</body>
</html>