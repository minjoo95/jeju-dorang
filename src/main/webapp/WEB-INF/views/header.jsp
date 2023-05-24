<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href='<c:url value="/resources/css/header.css"/>'>
</head>
<body>
	<div class="wrap">
		<nav class="header-nav">
		  <div class="container-fluid">
		    <a href="./">
		    	<img class="navbar-brand" src="resources/img/logo.png" alt="로고"/>
		    </a>
		    <div class="header-cat" id="navbarNavDropdown">
		      <ul class="navbar-nav">
			        <li class="nav-item">
			          <a class="nav-link" href="./travel/list">여행</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="./mate/list">동행</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="./board/list">커뮤니티</a>
			        </li>
			        <li class="nav-item dropdown">
			         <c:choose>
			          	<c:when test="${sessionScope.id eq null }">	
			          <a class="nav-link dropdown-toggle" href="./loginForm" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            로그인
			          </a>
			          	</c:when>
			          	<c:otherwise>
			          		<a href="./myPage">${user_name }</a>
			          			<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
			            			<li><a class="dropdown-item" href="./myPage">마이페이지</a></li>
			            			<li><a class="dropdown-item" href="./logout">로그아웃</a></li>
			          			</ul>
			          	</c:otherwise>
			          </c:choose>
			        </li>
		      </ul>
		    </div>
		  </div>
		</nav>
	</div>
</body>
</html>