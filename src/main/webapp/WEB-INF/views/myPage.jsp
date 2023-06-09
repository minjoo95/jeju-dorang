<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="id" value="${sessionScope.user }" />
<c:set var="user" value="${sessionScope.userInfo }" />
<c:set var="myPageContentPage" value="${param.page }" />

<c:if test="${myPageContentPage eq null }">
	<c:set var="myPageContentPage" value="userModify.jsp" />
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>제주도랑 - 마이페이지</title>
</head>

<body>
	<jsp:include page="/WEB-INF/views/NewFile.jsp" />
 	<jsp:include page="/WEB-INF/views/myPageTab.jsp"/>
	
 <%-- <div id="myPageContentWrapper">
    <jsp:include page="${myPageContentPage }"/>
  </div>

	<jsp:include page="/WEB-INF/views/footer.jsp" /> --%>
</body>

</html>

<script>
	/* 메뉴 선택 초기화, 고정 */
	if(location.href.indexOf('userModify') > -1) {
		localStorage.setItem('lastClicked', 'userModify');
	} else if (location.href.indexOf('likedMyTrip') > -1) {
		localStorage.setItem('lastClicked', 'likedMyTrip');
	} else if (location.href.indexOf('mateMypage') > -1) {
		localStorage.setItem('lastClicked', 'mateMypage');
	} else if (location.href.indexOf('myBoard') > -1) {
		localStorage.setItem('lastClicked', 'myBoard');
	} else {
		localStorage.setItem('lastClicked', 'userModify');
	}
	
</script>
