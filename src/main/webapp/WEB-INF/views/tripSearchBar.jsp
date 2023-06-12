<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="<c:url value="/resources/css/travel.css"/>">

<c:set var="contextPath" value="<%=request.getContextPath() %>" />

<form action="/travel/list/search" method="get" class="search">
	<div class="search-box">
		<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요."> 
		<button type="submit"> 검색 </button>
	</div>
</form>

<style>
.search {
    height: 100%;
    display: flex;
    align-items: center;
    position: absolute;
    right: 50px;
}

.search-box {
    /* margin: 0 auto; */
    width: 230px;
    border-bottom: #FB7A51 2px solid;
    position: relative;
    right: 0;
}

.search-box>input {
    display: inline-block;
    height: 30px;
    width: 80%;
    padding: 20px;
    border-radius: 7px;
    border : transparent;
    outline: none;
    font-size: 12px;
}

.search-box>button {
    display: inline-block;
    height: 100%;
    line-height: 0;
    padding: 20px;
    font-size: 16px;
    font-weight: bold;
    position: absolute;
    right: 0;
    background-color: white;
    color: #FB7A51;
    border: transparent;
    border-radius: 10px 0 0 10px;
}
</style>