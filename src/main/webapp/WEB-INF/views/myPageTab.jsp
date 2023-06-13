<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css"  href="<c:url value="/resources/css/myPageTab.css"/>">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/5c78b43849.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>


<c:set var="contextPath" value="<%=request.getContextPath() %>" />

<div class = "wholeContainer">
	<div class = "myPageTabListBox">
		<ul class = "myPageTabList">
			<li class = "tabList">
				<a class="myTab" id="userModify1" href="${contextPath }/user/mypage?page=userModify.jsp" onclick="menuClick(event);"><i class="tabIcon fa-regular fa-circle-user"></i>프로필 수정</a>
				<img class="leaf" style="display:none;" src="<c:url value="/resources/img/icon_menuLeaf.png"/>" alt="leaf" />
			</li>
			<li class = "tabList">
				<a class="myTab" id="likedMyTrip1" href="#"><i class="tabIcon fa-solid fa-heart"></i>찜한 여행지</a>
				<img class="leaf" style="display:none;" src="<c:url value="/resources/img/icon_menuLeaf.png"/>" alt="leaf" />
			</li>
			<li class = "tabList">
				<a class="myTab" id="writelist1" href="#" onclick="menuClick(event);"><i class="tabIcon fa-solid fa-user-group"></i>MY 동행</a>
				<img class="leaf" id="leaf" style="display:none; margin-left:105px;" src="<c:url value="/resources/img/icon_menuLeaf.png"/>" alt="leaf" />
			</li>
			<li class = "tabList">
				<a class="myTab" id="myBoard1" href="#" onclick="menuClick(event);"><i class="tabIcon fa-regular fa-pen-to-square"></i>작성글 목록</a>
				<img class="leaf" style="display:none;" src="<c:url value="/resources/img/icon_menuLeaf.png"/>" alt="leaf" />
			</li>
		</ul>
	</div>
</div>

<script>

$(document).ready(function() {

	/*  마이페이지 모달에서 넘어오는 경우  */
 	var myModalClicked = sessionStorage.getItem('myModalClicked');
	
	if (myModalClicked !== null) {
	  var myModalClickedMenu = document.querySelector('#' + myModalClicked +"1");
	  
 	  if (myModalClickedMenu !== null) {
	    myModalClickedMenu.click(); // 해당 메뉴 강제 클릭 발생
	    sessionStorage.setItem('myModalClicked', null); // 선택했던 메뉴 초기화
	  } 
	} 
	
	/* 직전에 클릭했던 메뉴 id 로컬에서 가져와서 css 적용 */
	let lastClicked = localStorage.getItem('lastClicked')+"1";
	if(lastClicked != null){
		$("#"+lastClicked).css('color', '#FB7A51');
		$("#"+lastClicked).css('font-weight', 'bold');
		$("#"+lastClicked).next('.leaf').css('display', 'inline-block');
		$("#"+lastClicked).next('.leaf').addClass('visible');
	} else {
		lastClicked = 'userModify';
		$("#"+lastClicked).css('color', '#FB7A51');
		$("#"+lastClicked).css('font-weight', 'bold');
		$("#"+lastClicked).next('.leaf').css('display', 'inline-block');
		$("#"+lastClicked).next('.leaf').addClass('visible');
	}
});

	function menuClick(event){
		
		let clicked = event.currentTarget; // 이벤트 발생한 태그
		console.log(clicked);
		let clickedImage = clicked.parentNode.querySelector('.leaf');
		
		// 클릭한 메뉴 id저장하고 로컬에 저장! - 페이지 이동하면서 변수까지 리셋되므로
		lastClicked = clicked.id;
		localStorage.setItem('lastClicked', lastClicked);
		
		// 이전 클릭 메뉴에 적용했던 효과 삭제
		let menus = document.querySelectorAll('.myTab');
		for(let i=0; i<menus.length; i++){
			menus[i].style.color = '';
			menus[i].style.fontWeight = '';
		}
		let prevLeaf = document.querySelector('.leaf.visible');
		if (prevLeaf != null) {
			prevLeaf.style.display= 'none';
			prevLeaf.classList.remove('visible');
		}

		// 클릭했을 때, 잎사귀 + 색깔 + 글자 굵기 적용
		clicked.style.color ='#FB7A51';
		clicked.style.fontWeight = 'bold';
		clickedImage.style.display = 'inline-block';
		clickedImage.classList.add('visible');
		
		
		
		// My동행은 컨트롤러 거쳐서 jsp로 반환 필요 ajax
 		if(lastClicked.indexOf('writelist') > -1) {
			$.ajax({
				url : "${contextPath}/mate/writelist",
				type : "GET",
				// 반환되는 data가 html문서이므로, page를 감싼 태그의 html에 통째로 넣어주기
				success : function(data){
				      $('#myPageContentWrapper').html(data);
				}
			}); 
		}
		
		// 내 작성글보기
 		if(lastClicked.indexOf('myBoard') > -1) {
			$.ajax({
				url : "${contextPath }/board/myBoardList?user=${sessionScope.userInfo.user_code }",
				type : "GET",
				// 반환되는 data가 html문서이므로, page를 감싼 태그의 html에 통째로 넣어주기
				success : function(data){
				      $('#myPageContentWrapper').html(data);
				}
			}); 
		}

	}

</script>