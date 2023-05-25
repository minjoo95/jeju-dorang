<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주도랑 - 여행 상세</title>
<%-- <link rel="stylesheet" href="<c:url value="resources/css/index.css"/>">
<script src="<c:url value="/resources/js/jquery-3.3.1.js"/>"></script>
<script src="<c:url value="/resources/js/index.js"/>"></script> --%>

<!-- css -->
<style>

	body{
		color:white;
	}
	
	.travel-detail-container{
		background-position:center;
		background-size:cover;
		height:856px;
	}
	
	.travel-detail-left{
		float :left;
		height : 100%;
		width :30%;
		background :rgba(0,0,0,0.5);
	}
	
	.travel-detail-left > div {
		margin-left : 160px;
		margin-right : 10%;
		padding: 50px 0 20px 0;
	}
	
	.travel-detail-right {
		float :right;
		margin-right :160px;	
		
	}
	
	/* bookmark button */
	.travel-detail-like{
		margin-top : 50px;
		
		width : 68px;
		height: 32px;
		border-radius:10px;
		background :rgba(0,0,0,0.8);
		text-align : center;
		line-height: 32px;
	}
	
	a{
		text-decoration : none;
		color:white;
	}
	
	.travel-detail-like a:hover {
		color:orange;
		font-weight : bold;
	}
	
</style>

<!-- js -->
<script>
	function bookmark(){
		//let isLike = false; //default false
		
		
		//ajax -> controller 호출 -> 조회 있음? 삭제하고 업데이트, 없음? 추가하고 업데이트 -> 리턴 boolean
		//option : null(찜한적 없음) = false, !null(이미찜함) = true;
		
		
		
	}

	$(document).ready(function)(){
		
		
	}
</script>

</head>
<body>

<div class="travel-detail-container" style="background-image:url(${place.getImage() });">
	<div class="travel-detail-left">
		<div class="travel-detail-location">
			<i>아이콘</i>
			<div> ${place.getTitle() } </div>
			<div> ${place.getAddress() } </div>
		</div>
		
		<div class="travel-detail-tag">
			${place.getHashtag() }
		</div>
		
		<div class="travel-detail-intro">
			${place.getIntroduction() }
		</div>
		
		<div class="travel-detail-info">
			<div class="travel-info-title">
				<i> 아이콘 </i> INFORMATION
			</div>
			
			<div class="travel-info-tel">
				<label>
					<i> 아이콘 </i> 전화번호
				</label>
				<span> ${place.getTel() } </span>
			</div>
			
			<div class="travel-info-loc">
				<label>
					<i> 아이콘 </i> 위도.
					<span> ${place.getLatitude() } </span>
				</label>
				<label>
					경도.
					<span> ${place.getLongitude() } </span>
				</label>
			</div>
			
			<div class="travel-info-etc">
				<label>
					<i> 아이콘 </i> 기타.
				</label>
				<span> ${place.getInfo() } </span>
			</div>
		</div>
	</div>
	
	<div class="travel-detail-right">
		<div class="travel-detail-like" onclick="bookmark()">
			<a href='/travel/bookmark'>
				<c:choose>
					<c:when test="${isLike eq false }">
						<img src="<c:url value="/resources/img/icon-unlike.png"/>" alt="bookmark"/>
					</c:when>
					<c:when test="${isLike eq true }">
						<img src="<c:url value="/resources/img/icon-like.png"/>" alt="bookmark"/>
					</c:when>
					<c:otherwise>
						<img src="<c:url value="/resources/img/icon-unlike.png"/>" alt="bookmark"/>
					</c:otherwise>
				</c:choose> 
				LIKE
			</a>
		</div>
	</div>
</div>

</body>
</html>