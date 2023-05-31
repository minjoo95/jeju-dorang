
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />

<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css"  href="<c:url value="/resources/css/userModify.css"/>">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/5c78b43849.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>


<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<c:set var="id" value="${sessionScope.user }" />
<c:set var="user_pic" value="${sessionScope.userInfo.user_pic }" />

<c:set var="modifyUser" value="${sessionScope.userInfo }" />

<div class = "wholeModifyBox">
	<div class = "leftPicBox">
		<div class = "myPicBox">
			<div class = "myPicCircle" style="background: #D9D9D9">
			
				<c:choose>
					<c:when test="${sessionScope.userInfo.user_pic eq null} "> 
						<c:if test="${sessionScope.userInfo.user_pic_local eq null }">
							<img class="myPic" id="myPic" src="<c:url value="/resources/img/mangul2.png"/>" alt="profilePic" />
						</c:if>
						<c:if test="${sessionScope.userInfo.user_pic_local ne null }">
							<img class="myPic" id="myPic" src="<c:url value="${sessionScope.userInfo.user_pic_local }"/>" alt="profilePic" />
						</c:if>
					</c:when>
					
					<c:otherwise>
						<c:if test="${sessionScope.userInfo.user_pic_local eq null }">
							<img class="myPic" id="myPic" src="<c:url value="${sessionScope.userInfo.user_pic }"/>" alt="profilePic" />
						</c:if>
						<c:if test="${sessionScope.userInfo.user_pic_local ne null }">
							<img class="myPic" id="myPic" src="<c:url value="${sessionScope.userInfo.user_pic_local }"/>" alt="profilePic" />
						</c:if>
					</c:otherwise>
				</c:choose>	

			</div>
		</div>
		<div class="selectMyPic">
			<form action="${contextPath }/user/uploadUserPic" method="post" enctype="multipart/form-data">
				<div class="picButton">
					<label for="chooseFile" class="picLabel">
						<img class="cameraIcon" src="<c:url value="/resources/img/icon_pic.png"/>" alt="picIcon" />
					</label>
				</div>
				<input type="file" id="chooseFile" name="chooseFile" accept="image/*">
			</form>
		</div>
		<c:if test="${sessionScope.userInfo.user_pic eq null }">
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
					<c:if test="${sessionScope.userInfo.user_age_range eq null }">
						<div class="additionalAge additAgeGender">
							<a class="additionAge" href="https://kauth.kakao.com/oauth/authorize?client_id=a62a2c16a4182ec20a1185a3f707c2b1&redirect_uri=http://localhost:8080/dorang/user/kakaoAddition&response_type=code&scope=age_range">
								카카오 나이 연동
							</a>
						</div>
					</c:if>
					<c:if test="${sessionScope.userInfo.user_gender eq null }">
						<div class="additionalGender additAgeGender">
							<a class="additionGender" href="https://kauth.kakao.com/oauth/authorize?client_id=a62a2c16a4182ec20a1185a3f707c2b1&redirect_uri=http://localhost:8080/dorang/user/kakaoAddition&response_type=code&scope=gender">
								카카오 성별 연동
							</a>
						</div>
					</c:if>
				</div>
			</div>
			<div class = "nicknameBox">
			<div class = "myCodeBox">
				<div class = "myCode">#&nbsp;${sessionScope.userInfo.user_code.toString().substring(0,4) }</div>
			</div>
				<div class = "myNicknameBtnAndName">
					<div class = "myNickname">
						<c:if test="${sessionScope.userInfo.user_nickname_local eq null }">
							${sessionScope.userInfo.user_nickname.substring(0,7) }
						</c:if>
						<c:if test="${sessionScope.userInfo.user_nickname_local ne null }">
							${sessionScope.userInfo.user_nickname_local.substring(0,7) }
						</c:if>
					</div>
					<button class = "nicknameModifyOpenBtn">변경<i class="penIcon fa-solid fa-pencil"></i></button>
					<div class = "nicknameModifyModal hiddenNicknameModal">
						<p class = "nickModalNotice" id= "nickNoticeTitle">닉네임 변경</p>
						<p class = "nickModalNotice" id= "nickNoticeSub">사용하실 닉네임을 입력해주세요.	</p> 
						<div class = "nicknameTextBox nickModalNotice">
							<input type="text" name="modifyingNickname" class = "modifyingNickname" maxlength= "7" placeholder="최대 7글자" />
							<div class = "checkRestriction">닉네임에는 공백, 이모지, 특수문자를 사용할 수 없습니다.</div>
							<div class = "nicknameModalBottom">
								<button class="nickNameBottomBtn" id="nickModifyBtn">수정</button>
								<button class = "nicknameModalCloseBtn nickNameBottomBtn" id="nickCancleBtn">취소</button>
							</div>
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
	
	const open = document.querySelector(".nicknameModifyOpenBtn");
	const close = document.querySelector(".nicknameModalCloseBtn");
	const modal = document.querySelector(".nicknameModifyModal");
	
	function init() {
		open.addEventListener("click", function() {
			modal.classList.remove("hiddenNicknameModal"); // open버튼 누르면 display:none 적용되는 클래스 이름 없애주기 --> 열림
		});
		close.addEventListener("click", function() {
			modal.classList.add("hiddenNicknameModal"); // close버튼 누르면 display:none 적용되는 클래스 이름 추가하기 --> 닫힘
			$(".modifyingNickname").html("");
		});
	}
	init();
	

 	var defaultUserPic = "../resources/img/mangul2.png" // 프사 없으면 디폴트 
	var prevText = $(".checkRestriction").text(); // 닉네임 제한 요소 알림 문구
	
	var modifyNickname = "";
 	
$(document).ready(function(){
	$("#chooseFile").on("change", function(e){
		var formData = new FormData();
		var inputFile = $("input[name='chooseFile']");
		var files = inputFile[0].files;
		console.log(files);
	
		// 이미지 변경 : files에서는 URL을 가져올 수 없기 때문에 FileReader 객체 생성해서, 거기서 URL 불러와주기
		if(files && files[0]){
		var reader = new FileReader();
		reader.onload = function(e) {
			var fileURL = e.target.result;	
			$("#myPic").attr("src", fileURL);
			console.log(fileURL);
		};
		reader.readAsDataURL(files[0]);
		}	
	});
	
	$(".modifyingNickname").on('keyup', function(){
		modifyNickname = $(".modifyingNickname").val();
		console.log(prevText);
 		console.log(modifyNickname);

 		const regex = /^[가-힣|a-z|A-Z|0-9|]+$/;
 		 if (regex.test(modifyNickname) == false) {
  			$(".checkRestriction").text('특수문자나 공백이 입력되었습니다.');
 			$(".checkRestriction").attr("style","color:#E74747;");
 			$("#nickModifyBtn").attr("disabled", "disabled");
 		 } else if (regex.test(modifyNickname) == true && modifyNickname.length > 1) {
 			$(".checkRestriction").text('사용 가능한 닉네임입니다.');
 			$(".checkRestriction").attr("style","color:#3CB728;");
 			$("#nickModifyBtn").removeAttr("disabled");
 		 } 
	});
	
	// 닉네임 모달 수정버튼 -> 보여지는 닉네임 변경
	$("#nickModifyBtn").on("click", function(e){
		$(".myNickname").html(modifyNickname.substring(0,7));
		$(".modifyingNickname").val("");
		modal.classList.add("hiddenNicknameModal");
	});
	
}); 
</script>