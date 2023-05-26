<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주도랑 - 여행</title>
<%-- <link rel="stylesheet" href="<c:url value="resources/css/index.css"/>">
<script src="<c:url value="/resources/js/jquery-3.3.1.js"/>"></script>
<script src="<c:url value="/resources/js/index.js"/>"></script> --%>
</head>
<%@ include file="/WEB-INF/views/header.jsp"%>
<body>


<!-- 카드 아이템 -->
<c:forEach var="item" items="${list }">
	${item.getTitle()}
	<div class="travel-card-container">
		<div class="travel-card-top">	
			<div class="travel-card-img">
				<img src=${item.getThumbnail() } alt=${item.getTitle() }/>
			</div> 
			<div class="travel-card-info">	
				<div class="travel-card-location"> 
					아이콘
					<div class="card-city-code"> ${item.getCity_code() }</div>
					<div class="card-region-code"> ${item.getRegion_code() }</div>
				</div>
				<div class="travel-card-tag"> 해시태그 박스 </div>
			</div>
		</div>
		<div class="travel-card-bottom">
			<button type="button" value=${item.getTrip_id() }>${item.getTitle() }</button>
		</div>
	</div>
</c:forEach>

</body>
</html>