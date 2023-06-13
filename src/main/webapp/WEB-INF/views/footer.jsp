<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css"  href="<c:url value="/resources/css/footer.css"/>">

<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">

<div class="footerAllBox">
<div class="footerWrapper">
	<div class="footerInnerBox">
		<div class="leftBox">
			<div class="logoAndPolicyBox">
				<div class="footerLogoBox">
					<img class="footerLogo" src="<c:url value="/resources/img/icon_footerLogo.png"/>" alt="logo" />
				</div>
				<div class="infoPolicyArea">
					<a href="https://www.privacy.go.kr/front/contents/cntntsView.do?contsNo=267" class="infoPolicy">개인정보처리방침</a>
				</div>
			</div>
			<div class="centerAndCopyrightBox">
				<div class="jejuCenter">제주관광정보센터<span class="jejuNumber">064) 740-6000</span></div>
				<div class="copyright">Copyrightⓒ<b>제주도랑</b>, All rights reserved.</div>
			</div>
		</div>
		<div class="rightBox">
			<div class="addressAndJejuBox">
				<div class="jejuPublicAddress">
					(63122) 제주특별자치도 제주시 선덕로 23(연동) 제주웰컴센터<br/>
					관광문의:제주관광공사 Tel:064-740-6000~1<br/>
					FAX:064-740-6090<br/>
					사업자등록번호:616-82-21432<br/>
					관광불편신고:제주안내 120콜센터(국번없이 120번)
				</div>
				<div class="jejuPublicLogo">
					<div class="visitJeju">
						<a href="https://m.visitjeju.net/kr"><img class="visitJejuLogo" src="<c:url value="/resources/img/logo_visitJeju.png"/>" alt="logo" /></a>
					</div>
					<div class="jejuTripPublic">
						<a href="https://www.ijto.or.kr/"><img class="jejuTripPublicLogo" src="<c:url value="/resources/img/logo_jejeuTripPublic.png"/>" alt="logo" /></a>
					</div>
					<div class="jejuCity">
						<a href="https://www.jejusi.go.kr/"><img class="jejuCityLogo" src="<c:url value="/resources/img/logo_jejuCity.png"/>" alt="logo" /></a>
					</div>
				</div>
			</div>
		</div>	
	</div>	
</div>
</div>