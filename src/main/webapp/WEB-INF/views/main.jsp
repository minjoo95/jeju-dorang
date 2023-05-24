<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<html>
<head>
<title>main</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
	<P>여행 베스트</p>
	<c:forEach items="${place}" var="trip">
		<div class="card" style="width: 18rem;">
			<a href="./travel/detail/${trip.trip_id}"> 
				<img src="${trip.image}" class="card-img-top" alt="여행">
			</a>
		</div>
	</c:forEach>
	<%-- <p>나의 동행</p>
	<c:forEach items="${mateB }" var="mate">
		<div class="card" style="width: 18rem;">
			<a href="./mate/detail">
				<img src="${mate.image }" class="card-img-top" alt="여행">
			</a>
			<div class="card-body">
				<p class="card-text">Some quick example text to build on the
					card title and make up the bulk of the card's content.</p>
			</div>
		</div>
	</c:forEach>
	<p>HOT 동행</p>
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
</body>
</html>