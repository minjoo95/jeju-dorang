<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>

<!-- bootstrap -->

<script>
function goBoardWrite(){
	location.href="${pageContext.request.contextPath}/board/boardWrite";
}
</script>
</head>
<body>
<div id = "container">
	<div id= "header-container">
		<span>후기</span>
		<input type="button" value="후기 작성" id="btn-write" onclick="goBoardWrite()"/>
	
	</div>

</div>
</body>
</html>