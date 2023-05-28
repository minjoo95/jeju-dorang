<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/header.css"/>">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="<c:url value="/resources/js/notice.js"/>"></script>
<div class="wrap">
	<nav class="header-nav">
		<div class="header-wrap">
			<div class="header-logo">
				<a href="${contextPath }/"> <img class="navbar-brand"
					src="<c:url value="/resources/img/logo2.png"/>" alt="로고" />
				</a>
			</div>
			<div class="header-category">
				<div class="navbar-navi">
					<div class="navi-item">
						<a class="navi-link" href="${contextPath }/travel/list">여행</a>
					</div>
					<div class="navi-item">
						<a class="navi-link" href="${contextPath }/mate/list">동행</a>
					</div>
					<div class="navi-item">
						<a class="navi-link" href="${contextPath }/board/list">커뮤니티</a>
					</div>
					<div class="my-log">
						<div class="wrap_top_btns">
							<div class="wrap_my_layer">
								<div class="notice-btn">
									<button type="button" class="top_btn btn_alarm on" id="myAlarmBtn" onclick="onlyAlarm">
										<span class="blind">내 알림 레이어 버튼</span> 
										<img class="notice-img" src="<c:url value="/resources/img/notifications.png"/>">
									</button>
								</div>
								<div class="modal-overlay modal">
									<div class="top_layer_assist alarm_layer_content"
										id="alarm_content">
										<strong class="title">알림</strong> <span class="view_status">최근
											30일간 저장내역 노출</span>
										<div class="save_list_area alarm_area ScrollBar">
											<strong class="sub_title">TODAY</strong>
											<div class="alarm_list" id="today_list_content"
												style="display: none;"></div>
											<div class="empty_list alarm_area"
												id="empty_today_list_content">
												<img src="<c:url value="/resources/img/귤.png"/>">
												<div class="empty_txt">
													<strong>주요 일정이 없습니다</strong>
												</div>
											</div>
											<div class="my_activity" id="my-activity">
												<strong class="su_title">나의 활동</strong>
												<div class="alarm_list" id="today_list_content"
													style="display: none;"></div>
												<div class="empty_list alarm_area"
													id="empty_today_list_content">
													<img src="<c:url value="/resources/img/귤.png"/>">
													<div class="empty_txt">
														<strong>활동이 없습니다</strong>
													</div>
												</div>
											</div>

										</div>
									</div>

								</div>
							</div>
						</div>
						<div class="header-myPage-Container">
							<c:choose>
								<c:when test="${sessionScope.user eq null }">
									<a class="header-login"
										href="https://kauth.kakao.com/oauth/authorize?client_id=a62a2c16a4182ec20a1185a3f707c2b1&redirect_uri=http://localhost:8080/dorang/user/kakaoCallback&response_type=code&prompt=login">로그인</a>
								</c:when>
								<c:otherwise>
									<div class="userNav-item my member">
										<div class="mypage-btn">
											<a class="btnMyopen txt-button icon-cp" href="${contextPath }/user/mypage">
												<div class="my-btn">
													<div class="my-img-container">
														<img class="my-img" alt=""
															src="<c:url value="/resources/img/person_outline.png"/>">
													</div>
													<div class="my-name">
														<div class="user-nickname">응시미</div>
													</div>
												</div>
											</a>
										</div>
										<div class="lyMyArea myWorld">
											<div class="myInner">
												<div class="myLists">
													<div class="my-item">
														<a href="${contextPath }/user/mypage">프로필 수정</a>
													</div>
													<div class="my-item">
														<a href="">찜한 여행지</a>
													</div>
													<div class="my-item">
														<a href="">마이 동행</a>
													</div>
													<div class="my-item">
														<a href="">작성글 목록</a>
													</div>
													<div class="my-item">
														<a class="btnLogOut"  href="${contextPath }/user/logout">로그아웃</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>
</div>

