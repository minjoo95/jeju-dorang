<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>  
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<style type="text/css">
	  *:not(html), .wrap, header {
	    box-sizing: content-box !important;
	  }
	  .container, .container * {
	    box-sizing: border-box !important;
	  }
	  .btn{
	      font-size: 15px;
	      color: #ffffff;
	  }
	  
	  .matecommunityMove{
	  	font-size: 15px;
	  	color: #ffffff;
	  	background-color: #3CB728;
	  	display: block;
	  	margin-left:15px;
	  	padding: 5px;
	  	border-radius: 5px;
	  }
	 .card-body-right{
	  display: flex;
	  justify-content: end;
	  align-items: center;
	 }
	
	 .card-title{
	  white-space: nowrap; 
	  overflow: hidden; 
	  text-overflow: ellipsis; 
	 }
	</style>
  <script type="text/javascript">
  
  $(document).ready(function(){
	  var pageFrm = $("#pageFrm");
	  $(".paginate_button a").on("click",function(e){
	  	e.preventDefault(); 
	  	var page=$(this).attr("href");
	  	pageFrm.find("#page").val(page);
	  	pageFrm.submit();
	  });
	  
	  
	  var pageFrm = $("#pageFrm");
	  $(".matecommunityMove").on("click",function(e){
		  e.preventDefault();
	      var mate_code = $(this).attr("href");
	      var tag="<input type='hidden' name='mate_code' value='"+mate_code+"'/>";
	      pageFrm.append(tag);
	      pageFrm.attr("action","${contextPath}/mate/mateCommunity");
	      pageFrm.submit();
	  });
  });
  </script>
  

</head>
<body>
   <div class="container">
       <h3 style="padding:50px 0px 20px 0px">동행 목록</h3>
  		<div class="sort-btn-group mb-5" style="text-align: right;">
	 		<button type="button" class="btn" style="background: #FB7A51">내가 작성한 글 보기</button>
	  		<button type="button" id="cnt" class="btn" style="background: #D9D9D9">내가 신청한 글 보기</button>
	 	</div>
	 	<c:forEach var="mt" items="${mateWriteList}">
	 	<div class="card d-flex flex-row mb-3" >
		  <img src="${contextPath}/resources/upload/mate/${mt.image}" class="card-img-top" alt="도랑이미지" style="width: 30%;height:120px; display: block;">
		  <div class="card-body" style="width: 40%; overflow: hidden;">
		    <span>${mt.daterange}</span>
		    <div class="card-body-text" style="width:60%;">
		    	<h5 class="card-title">${mt.title}</h5>
		    </div>
		    <p class="card-text">${mt.status}</p>
		  </div>
		  <div class="card-body card-body-right " style="width: 40%;">
		    <div class="card-text status">${mt.join_count}&nbsp;명 참여중</div>
		    <div>
		      <a href="${mt.mate_code}" class="card-link matecommunityMove">커뮤니티방 go!</a>
		    </div>
		  </div>
		</div>
		</c:forEach>
		  <!-- 페이징 -->
 <div class="container d-flex justify-content-center">
  <div style="text-align: center;">
	 <nav aria-label="Page navigation example">
	  <ul class="pagination">
	  <c:if test="${pm.prev}">
	    <li class="page-item paginate_button">
	      <a class="page-link" href="${pm.startPage-1}" aria-label="Previous">
	        <span aria-hidden="true">
	        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-circle" viewBox="0 0 16 16">
				  <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-4.5-.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
				</svg>
	        </span>
	      </a>
	    </li>
	  </c:if>
	    <c:forEach var="pageNum" begin="${pm.startPage}" end="${pm.endPage}">
		    <c:if test="${pm.cri.page!=pageNum}">
		        <li class="page-item paginate_button">
		            <a class="page-link" href="${pageNum}">${pageNum}</a>
		        </li>
		    </c:if>
		    <c:if test="${pm.cri.page==pageNum}">
		        <li class="page-item active paginate_button">
		            <a class="page-link" href="${pageNum}">${pageNum}</a>
		        </li>
		    </c:if>
        </c:forEach>
	    <c:if test="${pm.next}">
		    <li class="page-item paginate_button">
		      <a class=" page-link" href="${pm.endPage+1}" aria-label="Next">
		        <span aria-hidden="true">
		        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
				  <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
				</svg>
		        </span>
		      </a>
		    </li>
	  </c:if>
	  </ul>
	</nav>
  </div>
  </div>
  <!-- end -->
  <form id="pageFrm" action="${contextPath}/mate/writelist"  method="get">
  		<input type="hidden" id="page" name="page" value="${pm.cri.page}" />
  		<input type="hidden" name="perPageNum" value="${pm.cri.perPageNum}" />
  </form>
   </div>
</body>
</html>