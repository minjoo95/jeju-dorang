<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css"  href="<c:url value="/resources/css/header.css"/>">
<link rel="stylesheet" type="text/css"  href="<c:url value="/resources/js/notice.js"/>">
<%-- <link rel="stylesheet" type="text/css"  href="<c:url value="/resources/css/notice.css"/>"> --%>
<!-- <script src="/resources/js/notice.js"></script> -->
	<div class="wrap">
	<nav class="header-nav">
		<div class="header-wrap">
			<div class="header-logo">
	    		<a  href="./">
			    	<img class="navbar-brand" src="<c:url value="/resources/img/logo2.png"/>" alt="로고"/>
			    </a>
			 </div>
			 <div class="header-category">
			 	 <ul class="navbar-navi">
					<li  class="navi-item">
				   		<a class="navi-link" href="${contextPath }/travel/list">여행</a>
					</li>
					<li class="navi-item">
				   		<a class="navi-link" href="${contextPath }/mate/writeform">동행</a>
				  	</li>
				    <li class="navi-item">
				        <a class="navi-link" href="${contextPath }/board/list">커뮤니티</a>
				    </li>
				    <li>
				  	<c:choose>
				  		<c:when test="${sessionScope.id eq null }">
					  		<a class="" href="https://kauth.kakao.com/oauth/authorize?client_id=a62a2c16a4182ec20a1185a3f707c2b1&redirect_uri=http://localhost:8080/dorang/user/kakaoCallback&response_type=code&prompt=login">로그인</a>
				  		</c:when>
				  		<c:otherwise>
				  			<a href="${contextPath }/user/logout">로그아웃</a>
				  		</c:otherwise>
				  	</c:choose>
				  	</li>
 				  	<div class="wrap_top_btns">
				  		<div class="wrap_my_layer">
				    	<button type="button" class="top_btn btn_alarm on" id="myAlarmBlt">
				    		<span class="blind">내 알림 레이어 버튼</span>
				    		<img src="resources/img/notifications.png">
				    	</button>
				    	<div class="top_layer_assist alarm_layer_content">
				    		<strong class="title">알림</strong>
				    		<span class="view_status">최근 30일간 저장내역 노출</span>
					      <div class="save_list_area alarm_area ScrollBar">
					      	<strong class="sub_title">TODAY</strong>
					      	<div class="alarm_list" id="today_list_content" style="display:none;">
					      	</div>
					       <div class="empty_list alarm_area" id="empty_today_list_content" style>
					       	<img src="">
					       	<div class="empty_txt">
					       		<strong>주요 일정이 없습니다</strong>
					       	</div>
					       	<script type="text/javascript">
					       		function todayMoreButton(elem){
					       			if (!$j(elem).hasClass('on')){
					       				$j('#today_list_content').find('ul').find('li').show();
					       				$j('.today_more_button').hide();
					       			}
					       		}
					       	</script>
					       </div>
					       <div class="my_activity" id="my-activity">
					       	<strong class="su_title">나의 활동</strong>
					       	<div class="alarm_list">
					       		<div class="save_list">
					       			<span class="date">05/26 00:00</span>
					       		</div>
					       		<ul>
					       			<li class="activity">
					       			</li>
					       		</ul>
					       	</div>
					       </div>
					      </div>
					    </div>
					   </div>
					   </div> 
				 </ul>
			 </div>
		</div>
	</nav>
	</div>
