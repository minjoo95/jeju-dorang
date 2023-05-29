<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css"  href="<c:url value="/resources/css/userModify.css"/>">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/5c78b43849.js" crossorigin="anonymous"></script>

<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<c:set var="id" value="${sessionScope.user }" />
<c:set var="user_pic" value="${sessionScope.userInfo.user_pic }" />

<c:set var="modifyUser" value="${sessionScope.userInfo }" />

<div class = "wholeModifyBox">
	<div class = "leftPicBox">
		<div class = "myPicBox">
			<div class = "myPicCircle" style="background: #D9D9D9">
				<c:choose>
					<c:when test="${user_pic eq null} ">
						<img class="myPic" id="myPic" src="<c:url value="/resources/img/mangul2.png"/>" alt="profilePic" />
					</c:when>
					<c:otherwise>
						<img class="myPic" id="myPic" src="<c:url value="${user_pic }"/>" alt="profilePic" />
					</c:otherwise>
				</c:choose>	
			</div>
		</div>
		<div class="selectMyPic">
			<form method="post" enctype="multipart/form-data">
				<div class="picButton">
					<label for="chooseFile" class="picLabel">
						<img class="cameraIcon" src="<c:url value="/resources/img/icon_pic.png"/>" alt="picIcon" />
					</label>
				</div>
				<input type="file" id="chooseFile" name="chooseFile" accept="image/*"
					onchange="loadFile(this)">
			</form>
		</div>
		<c:if test="${sessionScope.userFix.user_pic eq null }">
				<div class="additionalPic">
					<a class="additionPic" href="https://kauth.kakao.com/oauth/authorize?client_id=a62a2c16a4182ec20a1185a3f707c2b1&redirect_uri=http://localhost:8080/dorang/user/kakaoAddition&response_type=code&scope=profile_image">
						카카오 프로필 사진 연동
					</a>
				</div>
		</c:if>
	</div>
	
	<div class = "rightTextBox">
				
		<div class = "ageAndGenderAndNicknameBox">
			<div class = "ageAndGenderBox">
				<div class = "ageBox">
					<c:choose>
						<c:when test="${sessionScope.userInfo.user_age_range eq '10~14' } || ${sessionScope.userInfo.user_age_range eq '15~19' }">
							10대
						</c:when>
						<c:when test="${sessionScope.userInfo.user_age_range eq '20~29' }">
							20대
						</c:when>
						<c:when test="${sessionScope.userInfo.user_age_range eq '30~39' }">
							30대
						</c:when>
						<c:when test="${sessionScope.userInfo.user_age_range eq '40~49' }">
							40대
						</c:when>
						<c:when test="${sessionScope.userInfo.user_age_range eq '50~59' }">
							50대
						</c:when>
						<c:when test="${sessionScope.userInfo.user_age_range eq '60~69' }">
							60대
						</c:when>
						<c:when test="${sessionScope.userInfo.user_age_range eq '70~79' }">
							70대
						</c:when>
						<c:when test="${sessionScope.userInfo.user_age_range eq '80~89' }">
							80대
						</c:when>
						<c:when test="${sessionScope.userInfo.user_age_range eq '90~' }">
							90대~
						</c:when>
						<c:otherwise>
							-
						</c:otherwise>
					</c:choose>
				</div>
				<div class = "genderBox">
					<c:choose>
						<c:when test="${sessionScope.userInfo.user_gender  eq 'female' }">
							여
						</c:when>
						<c:when test="${sessionScope.userInfo.user_gender  eq 'male' }">
							남
						</c:when>
						<c:otherwise>
							-
						</c:otherwise>
					</c:choose>
				</div>
				<div class = "additionalAgeAndGender">
					<c:if test="${sessionScope.userFix.user_age_range eq null }">
						<div class="additionalAge additAgeGender">
							<a class="additionAge" href="https://kauth.kakao.com/oauth/authorize?client_id=a62a2c16a4182ec20a1185a3f707c2b1&redirect_uri=http://localhost:8080/dorang/user/kakaoAddition&response_type=code&scope=user_range">
								카카오 나이 연동
							</a>
						</div>
					</c:if>
					<c:if test="${sessionScope.userFix.user_gender eq null }">
						<div class="additionalGender additAgeGender">
							<a class="additionGender" href="https://kauth.kakao.com/oauth/authorize?client_id=a62a2c16a4182ec20a1185a3f707c2b1&redirect_uri=http://localhost:8080/dorang/user/kakaoAddition&response_type=code&scope=user_gender">
								카카오 성별 연동
							</a>
						</div>
					</c:if>
				</div>
			</div>
			<div class = "nicknameBox">
				<div class = "myNickname">
					${sessionScope.userInfo.user_nickname }
				</div>
				<button class = "nicknameModifyOpenBtn">수정<i class="penIcon fa-solid fa-pencil"></i></button>
				<div class = "nicknameModifyModal hiddenNicknameModal">
					<p class = "nickModalNotice" id= "nickNoticeTitle">닉네임 수정</p>
					<p class = "nickModalNotice">사용하실 닉네임을 입력해주세요.</p> 
					<p class = "nickModalNotice" id="nickNoticeLimit">(최대 20자, 닉네임에는 이모지, <, >, \, '를 사용할 수 없습니다.)</span></p>
					<div class = "nicknameTextBox nickModalNotice">
						<input type="text" name="modifingNickname" class = "modifingNickname" /><a href="${contextPath }/user/checkDuplicated">중복확인</a>
						<div class = "nicknameModalBottom">
							<a href="${contextPath }/user/nicknameModifyConfirm">수정</a>
							<button class = "nicknameModalCloseBtn">완료</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class = "tagBox"></div>		
	</div>
	
	<div class = "bottomBtnBox">
	</div>
</div>




<script>

	// ** 이미지 선택하면 보여지는 이미지 변경해주는 함수 -- 나중에 프로필 수정버튼 눌렀을 때 확정해주기
	function loadFile(input){
		// 선택된 파일 가져옴
		let file = input.files[0];
		
		
		let name = file.name; // 파일 이름: mangul2.png
		let newImg = URL.createObjectURL(file); // 선택한 파일 url : blob:http://localhost:8080/55f926e1-0d1b-47fd-b6e3-1f2a40b7abb8
		
		console.log(name);
		console.log(newImg);
		console.log("${sessionScope.userInfo.user_gender}");
		console.log("${sessionScope.userInfo.user_age_range}");

		console.log(document.getElementById('myPic').src); // myPic클래스의 src값
		document.getElementById('myPic').src = newImg; // 업로드한 파일 url로 바꿔주기
		console.log("${sessionScope.userFix.user_pic}");
	}
	
	const open = document.querySelector(".nicknameModifyOpenBtn");
	const close = document.querySelector(".nicknameModalCloseBtn");
	const modal = document.querySelector(".nicknameModifyModal");
	
	function init() {
		open.addEventListener("click", function() {
			modal.classList.remove("hiddenNicknameModal"); // open버튼 누르면 display:none 적용되는 클래스 이름 없애주기 --> 열림
		});
		close.addEventListener("click", function() {
			modal.classList.add("hiddenNicknameModal"); // close버튼 누르면 display:none 적용되는 클래스 이름 추가하기 --> 닫힘
		});
	}
	
	init();
	
</script>