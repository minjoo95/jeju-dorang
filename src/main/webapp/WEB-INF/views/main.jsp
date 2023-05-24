<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<html>
<head>
	<title>main</title>
</head>
<body>
<P>여행 베스트</p>
	<c:forEach items="place" var="tirp">
		<a href="./travel/detail/{place_id}">
			<img src="{$trip.image}" />
		</a>
	</c:forEach>
<p>나의 동행</p>
	<c:forEach items="mate" var="mate">
		<a href="./mate/detail">
			<img src="{$mate}" />
		</a>
	</c:forEach>
<p>HOT 동행</p>
	<c:forEach items="mate" var="mate">
		<a href="./mate/detail">
			<img src="{$mate}" />
		</a>
	</c:forEach>
</body>
</html>