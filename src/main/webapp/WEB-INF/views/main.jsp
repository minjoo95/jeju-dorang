<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<link rel="stylesheet" type="text/css"  href="<c:url value="/resources/css/main.css"/>">
<html>
<head>
<title>main</title>
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<button class="test">알림</button>
	<P>여행 베스트</p>
	<c:forEach items="${place}" var="trip">
		<div class="card">
			<a href="./travel/detail/${trip.trip_id}"> 
				<img src="${trip.image}" class="card-img-top" alt="여행">
			</a>
		</div>
	</c:forEach>
	<%-- <p>나의 동행</p>
	<c:forEach items="${mateB }" var="mate">
		<div class="card">
			<a href="./mate/detail">
				<img src="${mate.image }" class="card-img-top" alt="여행">
			</a>
			<div class="card-body">
				<p class="card-text">Some quick example text to build on the
					card title and make up the bulk of the card's content.</p>
			</div>
		</div>
	</c:forEach> --%>
	<%-- <p>HOT 동행</p>
	<c:forEach items="mateA" var="mate">
		<!-- <a href="./mate/detail">
			<img src="{$mate}" />
		</a> -->
		<div class="card" style="width: 18rem;">
		<a href="./mate/detail">
			<img src="${mate.image }" class="card-img-top" alt="여행">
		</a>
			<div class="card-body">
				<p class="card-text">Some quick example text to build on the
					card title and make up the bulk of the card's content.</p>
			</div>
		</div>
	</c:forEach> --%>
	
	
	<p>왜 안됑</p>
</body>
</html>