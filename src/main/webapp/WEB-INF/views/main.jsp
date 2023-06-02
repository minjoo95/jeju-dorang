<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<link rel="stylesheet" type="text/css"  href="<c:url value="/resources/css/main.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">
<html>
<head>
<title>main</title>
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="main_wrap">
		<div class="main_category">
			<p class="cat_bestMate">베스트 동행</p>
		</div>
	<%-- <c:forEach items="${mate}" var="mate"> --%>
		<a href="">
			<div class="main_card_container">
				<!-- 카드 헤더 -->
				<div class="card-header" style="background:url('<c:url value="/resources/img/jejudoimage.png" />')">
					<div class="card-header-is-closed">
						<div class="card-header-text">모집중</div>
						<div class="card-header-number">2/5</div>
					</div>
				</div>
				<!-- 카드 바디 -->
				<div class="card-body">
					<div class="card-body-background">
						<div class="card-body-header">
							<p class="card-body-title">동행모집중~~</p>
							<p class="card-body-hashtag">#혼자#여자#20대</p>
							<p class="card-body-nickname">작성자:응시미</p>
						    <!-- 바디 본문 -->
						    <p class="card-body-description">
							안뇽 난 응시미
							제주도 여행을 함께 할 여행동지를 구한당~
							많이들 신청 바람~
						    </p>
						</div>
					</div>
					<!-- 카드 바디 푸터 -->
					<div class="card-body-footer">
						<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
						<i class="icon icon-view_count"></i>조회 86회
						<i class="icon icon-comments_count"></i>댓글 8개
						<i class="reg_date">2023/06/01</i>
					</div>
				</div>	
			</div>
		</a>
	<%-- </c:forEach> --%>
		<%-- <div class="main_sub_title">
			<P>여행 베스트</p>
		</div>
		<div class="travel_card_container">
			<c:forEach items="${place}" var="trip">
					<div class="travel_card_item">
						<a href="./travel/detail/${trip.trip_id}"> 
							<img src="${trip.image}" class="travel_card_img" alt="여행">
						</a>
					</div>
			</c:forEach>
		</div> --%>
	<%-- </div>
	<p>나의 동행</p>
	<c:forEach items="${mateB }" var="mate">
		<div class="card">
			<a href="./mate/detail">
				<img src="<c:url value="/resources/img/gyul.png"/>">
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
			<img src="<c:url value="/resources/img/gyul.png"/>">
		</a>
			<div class="card-body">
				<p class="card-text">Some quick example text to build on the
					card title and make up the bulk of the card's content.</p>
			</div>
		</div>
	</c:forEach> --%>
	</div>
</body>
</html>