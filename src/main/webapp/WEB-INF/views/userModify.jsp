<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css"  href="<c:url value="/resources/css/userModify.css"/>">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/5c78b43849.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<c:set var="user_pic" value="${sessionScope.userInfo.user_pic }" />

<div class = "wholeModifyBox">

	<div class = "nicknameModalBox">
		<div class = "nicknameModifyModal dialog_appear hiddenNicknameModal">
			<p class = "nickModalNotice" id= "nickNoticeTitle">닉네임 변경</p>
			<p class = "nickModalNotice" id= "nickNoticeSub">사용하실 닉네임을 입력해주세요.	</p> 
			<div class = "nicknameTextBox nickModalNotice">
				<c:if test="${sessionScope.userInfo.user_nickname_local ne null}" >
					<input type="text" name="modifyingNickname" class = "modifyingNickname" maxlength= "7" placeholder="최소 2글자, 최대 7글자" />
				</c:if>	
				<c:if test="${sessionScope.userInfo.user_nickname_local eq null}" >
					<input type="text" name="modifyingNickname" class = "modifyingNickname" maxlength= "7" placeholder="최소 2글자, 최대 7글자" />
				</c:if>	
					<div class = "checkRestriction">닉네임에는 공백, 이모지, 특수문자를 사용할 수 없습니다.</div>
					<div class = "nicknameModalBottom">
						<button class="nickNameBottomBtn" id="nickModifyBtn" disabled>확인</button>
						<button class = "nicknameModalCloseBtn nickNameBottomBtn" id="nickCancleBtn">취소</button>
					</div>
			</div>
			<div class = "deleteUserBtn">
				<button type="button" class="deleteUser">회원 탈퇴</button>
			</div>
		</div>
	</div>
	
	<div class = "leftPicBox">
		<div class = "myPicBox">
			<div class = "myPicCircle" style="background: #D9D9D9">
				<c:if test="${sessionScope.userInfo.user_pic == null}">
					<img class="myPic" id="myPic" src="<c:url value="/resources/img/img_profileDefault.jpg"/>" alt="profilePic" />
				</c:if>
				<c:if test="${sessionScope.userInfo.user_pic.indexOf('kakao') == -1}" >
					<img class="myPic" id="myPic" src="<c:url value="/resources/uploadProfilePic/${sessionScope.userInfo.user_pic }"/>" alt="profilePic" />
				</c:if>
				<c:if test="${sessionScope.userInfo.user_pic.indexOf('kakao') > -1}" >
					<img class="myPic" id="myPic" src="<c:url value="${sessionScope.userInfo.user_pic }"/>" alt="profilePic" />
				</c:if>
			</div>
		</div>
		<div class="selectMyPic">
			<form method="post" action="${contextPath }/user/uploadUserLocalProfile" enctype="multipart/form-data" id="userLocalProfileloadForm">
				<div class="picButton">
					<label for="pic_local" class="picLabel">
						<img class="cameraIcon" src="<c:url value="/resources/img/icon_pic.png"/>" alt="picIcon"/>
					</label>
				</div>
				<input type="file" value="pic_local" id="pic_local" name="pic_local" accept="image/*">
				<input type="hidden" id="bindedUserCode" name="bindedUserCode" value="${sessionScope.userInfo.user_code }">
				<input type="hidden" id="changingNickname" name="changingNickname"/>
				<input type="hidden" id="changingTags" name="changingTags" />
			</form>
		</div>
		<div class="profilePicBtnBox">
			<div class="deletePicLocal">
				<div class="deletePicLocalRequest">프로필 사진 삭제</div>
			</div>
			<c:if test="${sessionScope.userInfo.user_pic_kakao eq null }">
				<div class="additionalPic">
					<a class="additionPic" href="https://kauth.kakao.com/oauth/authorize?client_id=a62a2c16a4182ec20a1185a3f707c2b1&redirect_uri=http://localhost:8080/dorang/user/kakaoAddition&response_type=code&scope=profile_image">
						카카오 프로필 사진 연동
					</a>
				</div>
			</c:if>
		</div>
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
				<div class = "nickAndCodeBox">
					<div class = "myCodeBox">
						<div class = "myCode">#&nbsp;${sessionScope.userInfo.user_code.toString().substring(0,4) }</div>
					</div>
					<div class = "myNicknameBtnAndName">
						<div class = "myNickname">
							${sessionScope.userInfo.user_nickname }
						</div>
						<button class = "nicknameModifyOpenBtn">변경<i class="penIcon fa-solid fa-pencil"></i></button>
						<button class = "nicknameDeleteBtn">삭제<i class="eraserIcon fa-solid fa-eraser"></i></button>
					</div>
				</div>
			</div>
		</div>
		<div class = "tagBox">
			<div class = "tagTitleBox">
				<span id="myTagTitle">나의 선호태그</span>
			</div>
			<div class = "allTagsBox">
				<div class = "pTags drinkPreferTags">
					<div class = "eachTag">차</div>
					<div class = "eachTag">술</div>
					<div class = "eachTag">커피</div>
					<div class = "eachTag">주스</div>
				</div>
				<div class = "pTags personalityTags">
					<div class = "eachTag">외향적</div>
					<div class = "eachTag">내향적</div>
					<div class = "eachTag">계획적</div>
					<div class = "eachTag">즉흥적</div>
				</div>
				<div class = "pTags tripPreferTags">
					<div class = "eachTag">버스</div>
					<div class = "eachTag">택시</div>
					<div class = "eachTag">뚜벅이</div>
					<div class = "eachTag">렌트/자차</div>
				</div>
				<div class = "pTags activityPreferTags">
					<div class = "eachTag">관광</div>
					<div class = "eachTag">맛집</div>
					<div class = "eachTag">휴양</div>
					<div class = "eachTag">액티비티</div>
				</div>
			</div>
		</div>		
	</div>
	
	<div class = "bottomBtnBox">
		<div class = "bottomBtns">
			<button class = "profileBottomBtns" id="profileModifyInsertBtn">수정</button>
			<button class = "profileBottomBtns" id="profileModifyCancleBtn" onClick="window.location.reload()">취소</button>
		</div>
	</div>
	
</div>








<script>

$(document).ready(function(){	
	
	// modal open
	$(".nicknameModifyOpenBtn").click(function(e) {
		  event.stopPropagation();
		  // modal display:none이면(:visible false) 모달 열고, 아니면(true) 모달 닫음
		  if ($(".nicknameModifyModal").is(":visible")) {
		    $(".nicknameModifyModal").hide();
		  } else {
		    $(".nicknameModifyModal").show();
		  }
		});
	
	// modal close - 모달 외 영역 클릭(선택요소 부모가 모달인 경우/선택요소가 모달클래스를 가질 경우 제외) 
	$(document).click(function(e) {
	  var targetE = e.target;
	  if (!$(targetE).closest(".nicknameModifyModal").length && !$(targetE).hasClass("nicknameModifyModal")) {
	    closeModal();
	  }
	});
	// modal close - 모달 취소버튼 
	$(".nicknameModalCloseBtn").click(function(e) {
	  closeModal();
	});
	
	// modal close function <- animation
	function closeModal() {
	  $(".nicknameModifyModal").addClass("modalAnimationOut"); // 닫는 애니메이션 적용(클래스 추가)
	  setTimeout(function() { // 클래스 추가한 뒤 타이머함수 호출-0.1초 후에 실행됨 (시간 간격 안두면 클래스 추가제거가 충돌나서 실행 안되는듯)
	    $(".nicknameModifyModal").hide(); // 모달 닫음
	    $(".nicknameModifyModal").removeClass("modalAnimationOut"); // 애니메이션클래스 제거
	  }, 800);
	}


	/* DB에 저장돼있는 유저의 선택했던 태그 불러와서 css 적용 */
	getTags();
	function getTags(){
		$.ajax({
			url : "${contextPath}/user/getSelectedTags",
			type : "GET",
			dataType : 'json',
			success : function(data){ // Controller에서 data로 db에 저장된 user_tag를 넘겨줌
				var tags = data.tags.split(','); // 받은 값을 ,으로 쪼개서 배열로 저장 <object>
				var tagsString = JSON.stringify(tags); // <String>
				
				let reg = /[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/ ]/gim;
				
				// ,로 쪼갠 값이 null이거나 비어있지 않을 때만 addClass
				if(tagsString.replaceAll(reg, "").length > 0) { // sring으로 바뀌면서 [, , ,] 다 없애주기
					$(".eachTag").each(function(){
							// 지금 이 .eachTag
				            var nowT = $(this);  // 다음 forEach문 가면 this 쓸 수 없으니까 변수에 $(this)를 할당해줌
				            // 넘어온 태그 하나하나 비교해서
							tags.forEach(function(t){
								// 이미 선택했던 태그면 미리 선택클래스 추가해주기
								// - .eachTag.html()에 태그내용이 포함돼있으면 addClass
								if(nowT.html().trim().indexOf(t) > -1){
									nowT.addClass("selectedTag");
								}
							});
					});
				} 
			}	
		});	
	}

	
	/* 로컬 프사 삭제 */
	$(".deletePicLocalRequest").on("click", function(){
		var input = confirm("프로필 사진을 삭제하시겠습니까?");
		if(input == true){
			if('<%= ((Map)request.getSession().getAttribute("userInfo")).get("user_pic_kakao") %>' == null){
				$("#myPic").attr("src","<c:url value='/resources/img/img_profileDefault.jpg'/>");
			} else {
				$("#myPic").attr("src","<c:url value='${sessionScope.userInfo.user_pic_kakao }'/>");
			}
			$.ajax({
				url : "${contextPath}/user/deletePicLocal",
				type : "POST",
				success : function(data){
					alert("^^/");
				} 
			});
		}
	});
	
	
	/* 로컬 프사 변경 */
	$("#pic_local").on("change", function(e){
		var formData = new FormData();
		var inputFile = $("input[name='pic_local']");
		var files = inputFile[0].files;
		var maxSize = 5 * 1024 * 1024; // 5mb제한
		
		// 이미지 변경 : files에서는 URL을 가져올 수 없기 때문에 FileReader 객체 생성해서, 거기서 URL 불러와주기
		if(files && files[0]){
			var reader = new FileReader();
			
			reader.onload = function(e) {
				var fileURL = e.target.result;	
				$("#myPic").attr("src", fileURL);
				if(files[0].size > maxSize){
					alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.");
					$("#myPic").attr("src", "");
					return false;
			}
		}
		reader.readAsDataURL(files[0]);
		}
	});


	
	/* 닉네임 변경: 특수문자, 공백, 한글모음 필터 */
	var prevText = $(".checkRestriction").text(); // 닉네임 제한 요소 알림 문구
	var modifyNickname = "";
	
	$(".modifyingNickname").on('keyup', function(){
		modifyNickname = $(".modifyingNickname").val();

 		const regex = /^[가-힣|a-z|A-Z|0-9|]+$/;
 		 if (regex.test(modifyNickname) == false) {
  			$(".checkRestriction").text('사용 불가능한 닉네임입니다.');
 			$(".checkRestriction").attr("style","color:#E74747;");
 			$(".modifyingNickname").attr("style", "border-bottom:1px solid #E74747;");
 			$("#nickModifyBtn").attr("disabled", "disabled");
 		 } else if (regex.test(modifyNickname) == true && modifyNickname.length > 1) {
 			$(".checkRestriction").text('사용 가능한 닉네임입니다.');
 			$(".checkRestriction").attr("style","color:#3CB728;");
 			$(".modifyingNickname").attr("style", "border-bottom:1px solid #3CB728;");
 			$("#nickModifyBtn").removeAttr("disabled");
 		 } 
	});

	
	/* 닉네임 모달 수정버튼 -> 보여지는 닉네임 변경 */
	$("#nickModifyBtn").on("click", function(e){
		$(".myNickname").html(modifyNickname.substring(0,7));
		$(".modifyingNickname").val("");
		closeModal();
	});
	
	
	/* 닉네임 삭제 버튼 -> 로컬 닉네임 삭제 */
	$(".nicknameDeleteBtn").on("click", function(e){
		$.ajax({
			url : "${contextPath}/user/deleteNicknameLocal",
			type : "POST",
			success : function(data){
				$(".myNickname").html('<%= ((Map)request.getSession().getAttribute("userInfo")).get("user_nickname_kakao") %>');
			} 
		});
	})
	
	
	/* 태그 클릭하면 색깔 고정, 클래스 추가 - 다시 클릭하면 색깔 이전으로, 클래스 삭제 */
	$(".eachTag").on("click", function(e){
		let clicked = event.currentTarget; 
		if (clicked.classList.contains("selectedTag")) {
	        clicked.classList.remove("selectedTag");
	    } else {
	        clicked.classList.add("selectedTag");
	    }
		
		if($('.eachTag.selectedTag').length>4){
			alert("태그 선택은 최대 4개까지 가능합니다.");
			$(".eachTag.selectedTag").removeClass("selectedTag");
		}
	});	
		
	
	/* 프로필 수정사항 DB 반영 */
	$("#profileModifyInsertBtn").on("click", function(){
		
		$("#changingNickname").val(modifyNickname.toString());
		let changingMyTags = [];
		$(".selectedTag").each(function(index, item){
			changingMyTags.push($(this).text());
		});
		$("#changingTags").val(changingMyTags);
		// submit form
	  	$("#userLocalProfileloadForm").submit();   
	});
	
	
	/* 회원 탈퇴 버튼 */
	$(".deleteUser").on("click", function(){
		var input = confirm("탈퇴하시겠습니까?");
		if(input == true){
			window.location.href = "${contextPath}/user/disconnectKakao";
		}
	});
	

}); 
</script>