<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css"  href="<c:url value="/resources/css/userModify.css"/>">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/5c78b43849.js" crossorigin="anonymous"></script>

<c:set var="id" value="${sessionScope.user }" />
<c:set var="user_pic" value="${sessionScope.userInfo.user_pic }" />

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
				<div class="button">
					<label for="chooseFile">
						<img class="cameraIcon" src="<c:url value="/resources/img/icon_pic.png"/>" alt="picIcon" />
					</label>
				</div>
				<input type="file" id="chooseFile" name="chooseFile" accept="image/*"
					onchange="loadFile(this)">
			</form>
		</div>
	</div>
	
	<div class = "rightTextBox">
		<div class = "ageAndGenderAndNicknameBox">
			<div class = "ageAndGenderBox">
				<div class = "ageBox">
					<c:choose>
						<c:when test="${sessionScope.userInfo.user_age_range eq '10~19' }">
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
						<c:when test="${sessionScope.userInfo.user_age_range eq null }">
							-
						</c:when>
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
			</div>
			<div class = "nicknameBox"></div>
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
	}
	
</script>