<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/header.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="<c:url value="/resources/js/notice.js"/>"></script>
<div class="wrap">
	<nav class="header-nav">
		<div class="header-wrap">
		<input type="hidden" name="user_cdoe" id="user_code" value="<c:out value='${user_code}'/>"/>
			<!-- 헤더 로고 -->
			<div class="header-logo">
				<a href="${contextPath }/"> 
					<img class="navbar-brand" src="<c:url value="/resources/img/logo2.png"/>" alt="로고" />
				</a>
			</div>
			<!-- 헤더 카테고리 -->
			<div class="header-category">
				<div class="navi-item">
					<a class="navi-link navi-link-travel" href="${contextPath }/travel/list">여행</a>
				</div>
				<div class="navi-item">
					<a class="navi-link navi-link-mate" href="${contextPath }/mate/list">동행</a>
				</div>
				<div class="navi-item">
					<a class="navi-link navi-link-community" href="${contextPath }/board/list">커뮤니티</a>
				</div>
				<!-- 로그린 or 로그아웃 시 알림 and 마이페이지-->
				<div class="navi-item">
					<div class="header-alarm-myPage-Container">
						<c:choose>
							<c:when test="${sessionScope.user eq null }">
								<div class="login-container">
									<img src="<c:url value="/resources/img/gyul.png"/>">
									<a class="navi-link" href="https://kauth.kakao.com/oauth/authorize?client_id=a62a2c16a4182ec20a1185a3f707c2b1&redirect_uri=http://localhost:8080/dorang/user/kakaoCallback&response_type=code&prompt=login">로그인</a>
								</div>
							</c:when>
						<c:otherwise>
							<!-- 알람 -->
							<div class="alarm-container">
								<!-- 알람 버튼 -->
								<div class="alarm-btn-container">
									<button type="button" class="alarm-btn"><!-- on -->
										<span class="blind">내 알림 레이어 버튼</span> 
										<img class="alarm-img" src="<c:url value="/resources/img/notifications.png"/>">
									</button>
								</div>
								<!-- 알람 모달 -->
								<%-- <div class="alarm-modal-container">
									<div class="alarm_modal_content">
										<strong class="alarm_modal_title">알림</strong> 
										<span class="alram_view_status">최근 30일간 저장내역 노출</span>
										<div class="alarm_area">
											<strong class="sub_title">동행 신청</strong>
											<div class="empty_list alarm_area"><!-- 클래스 수정 -->
												<img src="<c:url value="/resources/img/gyul.png"/>">
												<div class="empty_alarm_txt">
													<strong>주요 일정이 없습니다</strong>
												</div>
											</div>
											<strong class="su_title">나의 활동</strong>
											<div class="empty_list alarm_area"><!-- 클래스 수정 -->
												<img src="<c:url value="/resources/img/gyul.png"/>">
												<div class="empty_alarm_txt">
													<strong>활동이 없습니다</strong>
												</div>
											</div>
										</div>
									</div>
								</div> --%>
								<!--새 알람 모달 -->
                         <div class="alarm-modal-container">
                           <div class="alarm_modal_content">
                              <!-- --------동행신청알람 앞단 예시 alarm_area가 한쌍--------- -->
                              <div class="alarm_area"> 
                              <div class="empty_list alarm_area">
                                      <div class="alram_view_status">new</div>
                                      <div class="sub_title"> <!-- 타이틀 -->
                                         <span>내가 작성한 [</span>
                                         <span class="sub_title_mate_title">
                                           동행게시판타이틀동행게시판타이틀동행게시판 타이틀 
                                         </span>
                                         <span>]에</span>
                                         <span class="sub_title_user_id">동행 신청 유저아이디</span>
                                         <span>님이 동행을 신청했습니다.</span>
                                      </div>
                                    <div class="empty_alarm_txt"><!-- 내용 -->
                                     <div class="first_ask">
                                           <span>Q . 이 구역 맛잘알 이신가요?</span>
                                           <div class="answer">그게 바로 나예요^^</div>
                                     </div>
                                    </div>
                                    <div class="alarm_apply_btn">
                                      <button type="button" class="mate_out">거절</button>
                                      <button type="button" class="mate_call">수락</button>
                                    </div>
                                 </div>
                              </div>
                              <!-- --------댓글앞단 예시 alarm_area가 한쌍----------->
                                <div class="alarm_area"> 
                              <div class="empty_list alarm_area">
                                  <div class="alarm_area-comment-top">
                                      <div class="alram_view_status">new</div> 
                                      <button  type="button" class="comment_alarm_close">&times;</button>
                                  </div>    
                                      <div class="sub_title"> <!-- 타이틀 -->
                                         <span>내가 작성한 [</span>
                                         <span class="sub_title_mate_title">
                                           동행게시판타이틀동행게시판타이틀동행게시판 타이틀 
                                         </span>
                                         <span>]에</span>
                                         <span class="sub_title_user_id">동행 신청 유저아이디</span>
                                         <span>님이 댓글을 달았습니다.</span>
                                      </div>
                                    <div class="empty_alarm_txt"><!-- 내용 -->
                                     <div class="first_ask">
                                           <span>댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용</span>
                                     </div>
                                    </div>
                                 </div>
                              </div>         
                           </div>
                        </div>
							</div>
							<!-- 마이페이지 -->
							<div class=" myPage_container">
								<!-- 마이페이지 버튼 -->
								<div class="myPage_btn_container">
									<a class="navi-link navi-link-mypage" href="${contextPath }/user/mypage">
										<div class="myPage_btn">
											<div class="myPage_img_container">
												<img class="myPage_img" alt="에러" src="<c:url value="/resources/img/person_outline.png"/>">
											</div>
											<div class="myPage_name">
												<div class="user_nickname">${sessionScope.userInfo.user_nickname}</div>
											</div>
										</div>
									</a>
								</div>
								<!-- 마이페이지 모달 -->
								<div class="myPage_modal_container">
									<div class="myPage_List">
										<div class="myPage_item">
											<a href="${contextPath }/user/mypage">프로필 수정</a>
										</div>
										<div class="myPage_item">
											<a href="">찜한 여행지</a>
										</div>
										<div class="myPage_item">
											<a href="${contextPath }/mate/writelist">마이 동행</a>
										</div>
										<div class="myPage_item">
											<a href="">작성글 목록</a>
										</div>
										<div class="myPage_item">
											<a href="${contextPath }/user/logout">로그아웃</a>
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
	</nav>
</div>
