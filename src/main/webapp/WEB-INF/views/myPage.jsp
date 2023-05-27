<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="id" value="${sessionScope.user }" />
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

<jsp:include page="/WEB-INF/views/header.jsp" />
<jsp:include page="/WEB-INF/views/myPageTab.jsp" />

<body>
	<jsp:include page="${myPageContentPage }" />
</body>
</html>
