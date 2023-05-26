<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/notice.css"/>">
</head>
<body>
	 <button class="open">👉 Click
	 	<img alt="알림" src="resources/img/notifications.png">
	 </button>

    <div class="container">
      <div class="modal">
        <h2>Lorem, ipsum dolor.</h2>
        <p>
          Lorem, ipsum dolor sit amet consectetur adipisicing elit. Reiciendis,
          excepturi?
        </p>
        <button class="close">Close</button>
      </div>
    </div>

    <script src="/resources/js/noticeMedal.js"></script>
</body>
</html>