<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>main</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/main2.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<body>
	<jsp:include page="headerBoot.jsp"></jsp:include>
	
	
	 <div class="main_wrap">
	<!-- BEST 여행 -->
		<div class="main_category">
			<p class="cat_bestMate">BEST 여행</p>
		</div>
		<div class="travel-card-wrap">
				<div class="section">
					<input type="radio" name="slide" id="slide01" checked> 
					<input type="radio" name="slide" id="slide02"> 
					<input type="radio" name="slide" id="slide03"> 
					
					<div class="slidewrap">
						<ul class="slidelist">
							<li>
								<div class="trip_title">
									<p>#${tripTitle.trip_title1}</p>
								</div>
								<a href="${contextPath }/travel/list/id/${tripID.trip_id1}">
									<label for="slide03" class="left"></label>
									<img src="<c:url value="/resources/img/배너1.png"/>">
									<label for="slide02" class="right"></label>
								</a>
							</li>
							<li>
								<div class="trip_title">
									<p>#${tripTitle.trip_title2}</p>
								</div>
								<a href="${contextPath }/travel/list/id/${tripID.trip_id2}">
									<label for="slide01" class="left"></label>
									<img src="<c:url value="/resources/img/배너6.png"/>">
									<label for="slide03" class="right"></label>
								</a>
							</li>
							<li>
								<div class="trip_title">
									<p>#${tripTitle.trip_title3}</p>
								</div>
								<a href="${contextPath }/travel/list/id/${tripID.trip_id3}">
									<label for="slide02" class="left"></label>
									<img src="<c:url value="/resources/img/배너7.png"/>">
									<label for="slide01" class="right"></label>
								</a>
							</li>
						</ul>
					</div>
				</div>
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
						<%-- <div class="card-header" style="background:url('<c:url value="${mate.image }" />')"> --%>
							<div class="card-header-is-closed">
								<div>
									<i class="fa-regular fa-eye" style="color: #fb7a51;"></i>${mate.count }
									<!-- <i class="fa-solid fa-comment-dots" style="color: #fb7a51;"></i>댓글 -->
								</div>
								<div class="join_count">
									<div class="card-header-text">모집중</div>
									<div class="card-header-number">${mate.join_count}/${mate.number}</div>
								</div>
							</div>
						</div>
						<!-- 카드 바디 -->
						<div class="card-body">
							<div class="card-body-background">
								<div class="card-body-header">
									<div class="title_top">
										<div class="card-body-nickname">@${mate.user_nickname }</div>
										<div class="reg_date">${mate.daterange}</div>
									</div>
									<p class="card-body-title">${mate.title}</p>
									<p class="card-body-hashtag">${mate.tags}</p>
									<!-- 바디 본문 -->
									<p class="card-body-description">${mate.content }</p>
								</div>
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
						<%-- <div class="card-header" style="background:url('<c:url value="${mate.image }" />')"> --%>
							<div class="card-header-is-closed">
								<div>
									<i class="fa-regular fa-eye" style="color: #fb7a51;"></i>${mate.count }
									<!-- <i class="fa-solid fa-comment-dots" style="color: #fb7a51;"></i>댓글 -->
								</div>
								<div class="join_count">
									<div class="card-header-text">모집중</div>
									<div class="card-header-number">${mate.join_count}/${mate.number}</div>
								</div>
							</div>
						</div>
						<!-- 카드 바디 -->
						<div class="card-body">
							<div class="card-body-background">
								<div class="card-body-header">
									<div class="title_top">
										<div class="card-body-nickname">@${mate.user_nickname }</div>
										<div class="reg_date">${mate.daterange}</div>
									</div>
									<p class="card-body-title">${mate.title}</p>
									<p class="card-body-hashtag">${mate.tags}</p>
									<!-- 바디 본문 -->
									<p class="card-body-description">${mate.content }</p>
								</div>
							</div>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="footerBoot.jsp"></jsp:include>
</body>
</html>