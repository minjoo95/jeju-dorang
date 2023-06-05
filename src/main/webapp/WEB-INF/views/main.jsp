<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/main.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">
<html>
<head>
<title>main</title>
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="main_wrap">
	<!-- BEST 여행 -->
		<div class="main_category">
				<p class="cat_bestMate">BEST 여행</p>
		</div>
		<div class="travel-card-wrap">
			<c:forEach items="${place}" var="trip">
					<a href="${contextPath }/travel/detail/${trip.trip_id}">
						<div class="travel_card_container" style="background:url('<c:url value="${trip.image}" />')">
								
						</div>
					</a>
			</c:forEach>
		</div>
		<!-- MY 동행 -->
		<c:if test="${sessionScope.user ne null }">
			<div class="main_category">
				<p class="cat_bestMate">My 동행</p>
			</div>
			<div class="mate-card-wrap">
				<c:forEach items="${mateB}" var="mate">
					<a href="${contextPath }/mate/select?mate_code=${mate.mate_code}">
						<div class="mate_card_container">
							<!-- 카드 헤더 -->
							<div class="card-header" style="background:url('<c:url value="/resources/img/jejudoimage.png" />')">
								<div class="card-header-is-closed">
									<div class="card-header-text">모집중</div>
									<div class="card-header-number">${mate.join_count}/${mate.number}</div>
								</div>
							</div>
							<!-- 카드 바디 -->
							<div class="card-body">
								<div class="card-body-background">
									<div class="card-body-header">
										<p class="card-body-title">${mate.title}</p>
										<p class="card-body-hashtag">${mate.tags}</p>
										<p class="card-body-nickname">작성자: ${mate.user_nickname }</p>
										<!-- 바디 본문 -->
										<p class="card-body-description">${mate.content }</p>
									</div>
								</div>
								<!-- 카드 바디 푸터 -->
								<div class="card-body-footer">
									<hr
										style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
									<i class="icon icon-view_count"></i>조회 ${mate.count } <i
										class="icon icon-comments_count"></i>댓글 8개 <i class="reg_date">${mate.createdAt}</i>
								</div>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
		</c:if>
		<!-- HOT 동행 -->
		<div class="main_category">
			<p class="cat_bestMate">HOT 동행</p>
		</div>
		<div class="mate-card-wrap">
			<c:forEach items="${mateA}" var="mate">
				<a href="${contextPath }/mate/select?mate_code=${mate.mate_code}">
					<div class="mate_card_container">
						<!-- 카드 헤더 -->
						<div class="card-header" style="background:url('<c:url value="/resources/img/jejudoimage.png" />')">
							<div class="card-header-is-closed">
								<div class="card-header-text">모집중</div>
								<div class="card-header-number">${mate.join_count}/${mate.number}</div>
							</div>
						</div>
						<!-- 카드 바디 -->
						<div class="card-body">
							<div class="card-body-background">
								<div class="card-body-header">
									<p class="card-body-title">${mate.title}</p>
									<p class="card-body-hashtag">${mate.tags}</p>
									<p class="card-body-nickname">작성자: ${mate.user_nickname }</p>
									<!-- 바디 본문 -->
									<p class="card-body-description">${mate.content }</p>
								</div>
							</div>
							<!-- 카드 바디 푸터 -->
							<div class="card-body-footer">
								<hr
									style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
								<i class="icon icon-view_count"></i>조회 ${mate.count } <i
									class="icon icon-comments_count"></i>댓글 8개 <i class="reg_date">${mate.createdAt}</i>
							</div>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
	</div>
</body>
</html>