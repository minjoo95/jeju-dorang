<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<c:set var="contextPath" value="<%=request.getContextPath() %>" />

<div class="travel-tab-container">
	<div class="travel-tab-box">
		<ul class="travel-tab-list">
			<li class="travel-tab-item">
				<a class="travel-theme" id="tripMain" href="${contextPath }/travel/list" onclick="themeClick(event);"> 전체 </a>
				<img class="leaf" style="display:none;" src="<c:url value="/resources/img/icon_menuLeaf.png"/>" alt="leaf" />
			</li>
			
			<li class="travel-tab-item">
				<a class="travel-theme" id="c1" href="${contextPath }/travel/list/tour" onclick="themeClick(event);"> 관광 </a>
				<img class="leaf" style="display:none;" src="<c:url value="/resources/img/icon_menuLeaf.png"/>" alt="leaf" />
			</li>
			
			<li class="travel-tab-item">
				<a class="travel-theme" id="c2" href="${contextPath }/travel/list/shop" onclick="themeClick(event);"> 쇼핑 </a>
				<img class="leaf" style="display:none;" src="<c:url value="/resources/img/icon_menuLeaf.png"/>" alt="leaf" />
			</li>
			
			<li class="travel-tab-item">
				<a class="travel-theme" id="c4" href="${contextPath }/travel/list/food" onclick="themeClick(event);"> 푸드 </a>
				<img class="leaf" style="display:none;" src="<c:url value="/resources/img/icon_menuLeaf.png"/>" alt="leaf" />
			</li>
		</ul>
	</div>
</div>

<style>
	 .travel-tab-container {
		width: 100%;
		height: 50px;
		font-family: 'IBM Plex Sans KR', sans-serif;
	}
	
	.travel-tab-box{
		width: 1512px;
		margin-top:3%;
	}
	
	.travel-tab-list {
		width: 90%;
		height:60px;
		display:flex;
		align-items: center;
		justify-content: center;
		border-top: 1px solid #D9D9D9;
		border-bottom:1px solid #D9D9D9;
	}
	
	.travel-tab-item {
		width: 200px; 
		height: 100%;
		margin: 0 5%;
		display:flex;
		font-size: 17px;
		list-style: none;
		align-items:center;	
	}
	
	.travel-theme {
		color: #3F3D3A;
		text-decoration: none;
	}
	
	.travel-theme:hover {
		color: #FB7A51;
		font-weight: bold;
	}
	
	.leaf {
		width:15px;
		height:15px;
		margin-left:162px;
		position:absolute;
		margin-bottom:23px;
	}
</style>

<script>

	$(document).ready(function() {
		let prevTheme = localStorage.getItem('prevTheme');
		if(prevTheme != null){
			$("#"+prevTheme).css('color', '#FB7A51');
			$("#"+prevTheme).css('font-weight', 'bold');
			$("#"+prevTheme).next('.leaf').css('display', 'inline-block');
			$("#"+prevTheme).next('.leaf').addClass('visible');
		} else {
			prevTheme = 'tripMain';
			$("#"+prevTheme).css('color', '#FB7A51');
			$("#"+prevTheme).css('font-weight', 'bold');
			$("#"+prevTheme).next('.leaf').css('display', 'inline-block');
			$("#"+prevTheme).next('.leaf').addClass('visible');
		}
		
	});

	function themeClick(event){
		let theme = event.currentTarget;
		let leaf = theme.parentNode.querySelector('.leaf');
		console.log(theme);
		
		prevTheme = theme.id;
		localStorage.setItem('prevTheme', prevTheme);
		
		let menus = document.querySelectorAll('.travel-theme');
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
		theme.style.color ='#FB7A51';
		theme.style.fontWeight = 'bold';
		leaf.style.display = 'inline-block';
		leaf.classList.add('visible');
	}


</script>