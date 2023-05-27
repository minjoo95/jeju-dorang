<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:set var="contextPath" value="<%=request.getContextPath() %>" />

<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css"  href="<c:url value="/resources/css/myPageTab.css"/>">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/5c78b43849.js" crossorigin="anonymous"></script>


<div class = "wholeContainer">
	<div class = "myPageTabListBox">
		<ul class = "myPageTabList">
			<li class = "tabList">
				<a class="myTab" href="${contextPath }/user/mypage?page=userModify.jsp" onclick="menuClick(event);"><i class="tabIcon fa-regular fa-circle-user"></i>프로필 수정</a>
				<img class="leaf" style="display:none;" src="<c:url value="/resources/img/icon_menuLeaf.png"/>" alt="leaf" />
			</li>
			<li class = "tabList">
				<a class="myTab" href="#" onclick="menuClick(event);"><i class="tabIcon fa-solid fa-heart"></i>찜한 여행지</a>
				<img class="leaf" style="display:none;" src="<c:url value="/resources/img/icon_menuLeaf.png"/>" alt="leaf" />
			</li>
			<li class = "tabList">
				<a class="myTab" href="#" onclick="menuClick(event);"><i class="tabIcon fa-solid fa-user-group"></i>MY 동행</a>
				<img class="leaf" style="display:none;" src="<c:url value="/resources/img/icon_menuLeaf.png"/>" alt="leaf" />
			</li>
			<li class = "tabList">
				<a class="myTab" href="#" onclick="menuClick(event);"><i class="tabIcon fa-regular fa-pen-to-square"></i>작성글 목록</a>
				<img class="leaf" style="display:none;" src="<c:url value="/resources/img/icon_menuLeaf.png"/>" alt="leaf" />
			</li>
		</ul>
	</div>
</div>

<script type = "text/javascript">
	function menuClick(event){
		
		let clicked = event.currentTarget; // 이벤트 발생한 태그
		let clickedImage = clicked.parentNode.querySelector('.leaf');
		
		let pageUrl = clicked.getAttribute('href');
		
		// 이전 클릭 메뉴에 적용했던 효과 삭제
		let menus = document.querySelectorAll('.myTab');
		for(let i=0; i<menus.length; i++){
			menus[i].style.color='';
			menus[i].style.fontWeight='';
		}
		let prevLeaf = document.querySelector('.leaf.visible');
		if (prevLeaf != null) {
			prevLeaf.style.display='none';
			prevLeaf.classList.remove('visible');
		}

		// 클릭했을 때, 잎사귀 + 색깔 + 글자 굵기 적용
		clicked.style.color='#FB7A51';
		clicked.style.fontWeight='bold';
		clickedImage.style.display = 'inline-block';
		clickedImage.classList.add('visible');
		
		// include jsp 이동하면서 메뉴 선택 효과 사라지는 중.. ㄱ- 해결해야 함
	}
</script>