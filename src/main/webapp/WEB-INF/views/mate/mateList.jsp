<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>  
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<title>동행 글 목록</title>
<style type="text/css">
	
	
		
	.card-tags{
		font-size: 13px;
		border-radius: 15px;
	}
	.card-top-tags .card-tags{
		border: 1px solid  #3CB728;
		padding: 0px 13px;
	}
	.card-bottom-tags .card-tags{
		padding: 0px 3px;
		color :  #FB7A51;
	}
	.insertMate-title:hover {
	text-shadow: 1px 1px 1px  #FB7A51;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
 <div class="container" >
  <div class="content-title" style="background-color: #FB7A51; height: 200px;" > section 타이틀 제주도 여행 같이 가요! (미정)</div>
 	<h3 style="padding:50px 0px">동행 목록</h3>
 		<div class="container-top d-flex justify-content-between mb-5">
	 		<div class="sort-btn-group">
	 			 <button type="button" class="btn btn-warning">날짜순</button>
	  			 <button type="button" class="btn btn-warning">조회순</button>
	 		</div>
	 		<div class="insertMate-btn d-flex align-items-center">
		 		<span>
		 			<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#FB7A51" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
		  				<path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
					</svg>
		 		</span>
		 	<c:choose>
		 		<c:when test="${sessionScope.user !=null}">
		 			<a href="${contextPath}/mate/writeform" class="insertMate-title hoverable" style="font-size: 32px; color: #FB7A51; text-decoration: none; margin-left: 10px">동행모집글쓰기</a>
		 		</c:when>
		 		<c:otherwise>
		 			<a href="javascript:void(0);" onclick="alert('로그인이 필요합니다');" class="insertMate-title" style="font-size: 32px; color:  #FB7A51;margin-left: 10px">동행모집글쓰기</a>
		 		</c:otherwise>
		 	</c:choose>
	 		</div>
 	    </div>
        <div class="container-content">
             <div class="row row-cols-1 row-cols-md-3 g-5">
            	  <c:forEach var="mt" items="${mateList}">
				  <div class="col">
				   <a href="${contextPath}/mate/selectMate?mate_code=${mt.mate_code}" class="card-link" style="text-decoration: none; outline: none; color: #000;" >
				   <div class="mate-status d-flex justify-content-end" style=" font-size: 12px;">
				    	<p style="color:  #FB7A51; margin-right:5px; margin-bottom:2px">${mt.status}</p>
				    	<p style="margin-bottom:2px">조회수&nbsp;${mt.count}</p>
				    </div>
				    <div class="card h-100 shadow p-2">
				     <h5 class="card-title">${mt.title}</h5>
				     <p class="createAt" style="text-align: right; font-size: 11px">작성일&nbsp;${mt.createdAt}</p>
				      <div class="card-top-tags d-flex flex-wrap align-items-center justify-content-around justify-content-md-between mb-3">
					      <label class="card-tags" >${mt.type}</label>
					      <label class="card-tags" >${mt.direction}</label>
					      <label class="card-tags" >${mt.number}</label>
					      <label class="card-tags">${mt.age}</label>
					      <label class="card-tags">${mt.gender}</label>
				      </div>
				      <img src="${contextPath}/resources/img/${mt.image}" class="card-img-top mt-2 mb-3" alt="제주도모집이미지" height="150px;">
					  <div class="card-bottom-tags d-flex flex-wrap justify-content-around justify-content-md-between mb-3">
					      <label class="card-tags">#태그split예정</label>
					      <label class="card-tags">#태그split예정</label>
					      <label class="card-tags">#태그split예정</label>
					      <label class="card-tags">#태그split예정</label>
				      </div>
					  <div class="card-footer d-flex align-items-center" style="background-color: #FFFFFF;">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#3CB728" class="bi bi-calendar2-heart" viewBox="0 0 16 16">
								  <path fill-rule="evenodd" d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v11a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4V.5ZM1 3a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v11a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V3Zm2 .5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h10a.5.5 0 0 0 .5-.5V4a.5.5 0 0 0-.5-.5H3Zm5 4.493c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z"/>
							</svg>
						    <small class="daterange" style="opacity: 0.8; padding: 0px 3px;">
						          여행기간&nbsp;${mt.daterange}
						    </small>
				     </div>
				   </div>
					</a>
					</div>
			</c:forEach>		
				</div>
  </div>
 </div>
 
</body>
</html>