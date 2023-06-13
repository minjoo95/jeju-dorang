<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>모집글수정</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>  
  	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js" defer></script>
	<link rel="stylesheet" type="text/css"  href="<c:url value="/resources/css/mateUpdateForm.css"/>">
	<script src="<c:url value="/resources/js/mateUpdateForm.js"/>"></script>
  </head>
  <body>
  <jsp:include page="../headerBoot.jsp"></jsp:include>
    <div class="container" >
     <h3>작성해주세요 :)</h3>
        <form name="mateForm" id="mateForm" action="${contextPath}/mate/update" method="post" enctype="multipart/form-data">
          <input type="hidden" name="user_code" id="user_code" value="${sessionScope.userInfo.user_code}"/> 
          <input type="hidden" name="mate_code" id="mate_code" value="${mt.mate_code}"/> 
       	  <input type="hidden" name="page" value="<c:out value='${cri.page}'/>"/>
       	  <input type="hidden" name="sortBy" id="sortBy" value="<c:out value='${cri.sortBy}'/>"/>
          <input type="hidden" name="perPageNum" value="<c:out value='${cri.perPageNum}'/>"/>
       	 <input type="hidden" name="backPageName" id="backPageName" value="${backPageName}"/>	
       		<div class="container" >
	          <div class="row">
			        <div class="col-md-6 container_left" >
				 		<div class="mb-4" >
							<label for="title" class="form-label">제목</label>
							<input type="text" class="form-control inputCount" id="title" name="title" value="${mt.title}">
							<div class="inputCountTxt">
	   			 	       	   <span id="inputCount">0</span>/30
	   			 	        </div>
				  		</div> 
						 <!-- 이미지 -->
							 <div class="card mb-3">
							  	<img  id="imageView" src="${contextPath}/resources/upload/mate/${mt.image}" class="card-img-top" alt="제주도모집이미지">
							 </div>	 
			         </div>
	         		<div class="col container_right" >
	          			<div class="row">
	          			<div class="col-md-6 container_right_left">
					  		  	<div class="mb-3">
								    <label class="form-label">동행타입</label>
								     <div  role="group" aria-label="Basic mixed styles example">
										 <input type="radio" class="btn-check" name="type" id="type_1" autocomplete="off" value="전체동행" 
										    <c:if test="${mt.type eq '전체동행'}">
										       checked 
										    </c:if>/>
										 <label class="btn btn-outline-warning mb-2" for="type_1">전체동행 </label>
									     <input type="radio" class="btn-check " name="type" id="type_2" autocomplete="off" value="부분동행"
									     	<c:if test="${mt.type eq '부분동행'}">
										       checked 
										    </c:if>/>
										 <label class="btn btn-outline-warning mb-2" for="type_2"> 부분동행</label>
										 <input type="radio" class="btn-check" name="type" id="type_3" autocomplete="off" value="밥한끼"
										    <c:if test="${mt.type eq '밥한끼'}">
										       checked 
										    </c:if>/>
										 <label class="btn btn-outline-warning mb-2" for="type_3">밥한끼</label>
								     </div>
					  			</div>
					  		   <div class="mb-3">
							  	    <label  class="form-label">
							  	    <span class="label_title">지역선택</span>
							  	    <span class="option_title">동서남북 중에 골라주세요</span></label>
									  <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" id="direction" name="direction">
					  					<option value="default" selected disabled>지역을 선택하세요</option>
					  					<option value="동부"<c:if test="${mt.direction eq '동부'}"> selected </c:if>/>동부</option>
					  					<option value="서부"<c:if test="${mt.direction eq '서부'}"> selected </c:if>/>서부</option>
					  					<option value="남부"<c:if test="${mt.direction eq '남부'}"> selected </c:if>/>남부</option>
					  					<option value="북부"<c:if test="${mt.direction eq '북부'}"> selected </c:if>/>북부</option>
								 	 </select>
					  		   </div>
					  		  <div class="mb-3">
							  	    <label class="form-label">
							  	    	<span class="label_title">인원수</span>
								  	    <span class="option_title">동행 인원수를 선택해세주세요</span>
								  	    <span class="option_smtitle">최대 5명</span>
							  	    </label>
								      <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" id="number" name="number">
					  					<option value="default" selected disabled>인원수를 선택하세요</option>
					  					<option value="2명"<c:if test="${mt.number eq '2명'}"> selected </c:if>/>2명</option>
					  					<option value="3명"<c:if test="${mt.number eq '3명'}"> selected </c:if>/>3명</option>
					  					<option value="4명"<c:if test="${mt.number eq '4명'}"> selected </c:if>/>4명</option>
					  					<option value="5명"<c:if test="${mt.number eq '5명'}"> selected </c:if>/>5명</option>
									 </select>
					     		</div>
							 <div class="mb-3">
							  	    <label class="form-label">
							  	     <span class="label_title">연령대</span>
							  	     <span class="option_title">원하는 연령대를 선택해세주세요</span></label>
								     <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" id="age" name="age">
					  					<option value="default" selected disabled>연령대를 선택해주세요</option>
					  					<option value="20대"<c:if test="${mt.age eq '20대'}"> selected </c:if>/>20대</option>
					  					<option value="30대"<c:if test="${mt.age eq '30대'}"> selected </c:if>/>30대</option>
					  					<option value="40대"<c:if test="${mt.age eq '40대'}"> selected </c:if>/>40대</option>
					  					<option value="50대"<c:if test="${mt.age eq '50대'}"> selected </c:if>/>50대</option>
									 </select>
					  		 </div>  		  
				  		    <div class="mb-3">
						  	    <label class="form-label">
						  	    <span class="label_title">성별</span>
						  	    <span class="option_title">원하는 성별을 선택해주세요</span></label>
							      <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" id="gender" name="gender">
				  					<option value="default" selected disabled>성별을 선택해주세요</option>
				  					<option value="여자만"<c:if test="${mt.gender eq '여자만'}"> selected </c:if>/>여자만</option>
					  				<option value="남자만"<c:if test="${mt.gender eq '남자만'}"> selected </c:if>/>남자만</option>
					  				<option value="혼성"<c:if test="${mt.gender eq '혼성'}"> selected </c:if>/>혼성</option>
								 </select>
				  			 </div>
				  	   </div> <!-- container container_2_left -->
	                <div class ="col-md-6 container_right_right">
				  		 	 <div class="mb-4">
							    <label class="form-label label_title">
							         기간
							    	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-check" viewBox="0 0 16 16">
									  <path d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
									  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
									</svg>
							    </label>
							    <input type="text" id="daterange" name="daterange" value="${mt.daterange}">
				  			 </div>
				  			 <div class="mb-4 tags_box" >        
				  			    <input type="hidden" id="tags" name="tags" value=""/>
						  	    <label class="form-label tag_title">
							  	    <span class="label_title">태그를 선택해주세요</span>
							  	    <span class="label_smtitle">둘 중 하나만 선택해주세요</span>
						  	    </label>
						  	       <c:set var="tagsString"  value="${mt.tags}" />
						  	       <c:set var="tagsValue" value="${fn:split(tagsString, '/')}" />
									    <div class="btn-group btn-group_1" role="group" aria-label="Basic mixed styles example">
										 <input type="radio" class="btn-check tagSelector" name="tag_1" id="tag_1_left" autocomplete="off"  value="조율불가" 	
										 	  <c:if test="${tagsValue[0] eq '조율불가'}"> checked </c:if>		
						                 />
										 <label class="btn  btn-outline-warning" for="tag_1_left">조율불가</label>
									     <input type="radio" class="btn-check tagSelector" name="tag_1" id="tag_1_right" autocomplete="off" value="조율가능"
										 	<c:if test="${tagsValue[0] eq '조율가능'}">checked</c:if>
										 />
										  <label class="btn  btn-outline-warning" for="tag_1_right" >조율가능</label>
										</div>
										 <!-- ---------------------------- -->	 
								      <div class="btn-group btn-group_2" role="group" aria-label="Basic mixed styles example">
										 <input type="radio" class="btn-check tagSelector" name="tag_3" id="tag_3_left" autocomplete="off" value="내향인"
										 	<c:if test="${tagsValue[1] eq '내향인'}"> checked </c:if>	
										 />
										 <label class="btn  btn-outline-warning" for="tag_3_left">내향인</label>
									     <input type="radio" class="btn-check tagSelector" name="tag_3" id="tag_3_right" autocomplete="off" value="외향인" 
										 	<c:if test="${tagsValue[1] eq '외향인'}"> checked </c:if>	
										 />
										 <label class="btn  btn-outline-warning" for="tag_3_right" >외향인</label>
									     </div>
										 <!-- ---------------------------- -->	 
								      <div class="btn-group btn-group_3" role="group" aria-label="Basic mixed styles example">
										 <input type="radio" class="btn-check tagSelector" name="tag_4" id="tag_4_left" autocomplete="off" value="뚜벅이" 
										 	<c:if test="${tagsValue[2] eq '뚜벅이'}"> checked </c:if>	
										 />
										 <label class="btn  btn-outline-warning" for="tag_4_left">뚜벅이</label>
									     <input type="radio" class="btn-check tagSelector" tag name="tag_4" id="tag_4_right" autocomplete="off" value="차있음" 
										 	<c:if test="${tagsValue[2] eq '차있음'}"> checked </c:if>		
										 />
										 <label class="btn  btn-outline-warning" for="tag_4_right" >차있음</label>
								     </div>	    
				  			 </div>
				  			 <div class="mb-3 mt-3">
						  	    <label>
						  	    <span class="label_title">진행여부</span>
						  	    <span class="status_smtitle">추후 동행이 다 모이면 모집 완료로 변경해주세요</span></label>
							      <div class="btn-group" role="group" aria-label="Basic mixed styles example">
									   <input class="form-check-input" type="radio" name="status" id="status1" value="진행중" 
									    <c:if test="${mt.status eq '진행중'}">checked</c:if>
									   /> 
				                       <label class="form-check-label" for="status1" style="margin-right: 20px;">진행 중</label>
				  					   <input class="form-check-input" type="radio" name="status" id="status2" value="모집완료"
				  					   <c:if test="${mt.status eq '모집완료'}">checked</c:if>
				  					   />
				                       <label class="form-check-label" for="status2">모집 완료</label>
							     </div>
				  			 </div>
				  		 </div> <!-- right 끝 -->
				  		  <div class="mb-3">
				  		   <input type="file" name="image" id="imageFile" style="display: none">
				  			 <label for="imageFile" class="mb-3">
								  <div class="btn-upload btn mt-2">사진 업로드
								  	 <span>
									  	 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-camera-fill" viewBox="0 0 16 16">
										  <path d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
										  <path d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2zm.5 2a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0z"/>
										</svg>
								  	 </span>
								  </div>
							</label>
							<span style="font-size: 12px;">파일크기는 2MB를 넘을 수 없습니다!</span>
				  			</div>
					  </div>
			  </div>
			  </div> 
			   <div class ="container_content">
				    <div class="mb-3">
					  	    <label for="content" class="form-label label_title">내용</label>
						    <textarea class="form-control" id="content" name="content">${mt.content}</textarea>
			  		        <div class="inputCountTxt">
	   			 	         	 <span id="charCount">0</span>/150
	   			 	        </div>
			  		</div>
			   </div>
			  <div class="container_ask">
	  	    	 <h3>
	  	    	 	<span class="label_title">동행에게 하는 질문</span>
	  	    	  </h3>
	  	    	 <div class="mb-3" >
	  	    		<label for="first_ask" class="w-100">
	   			 	    <input type="text" class="form-control inputCount" id="first_ask" name="first_ask" placeholder="질문1." value="${mt.first_ask}">
	   			 	    <div class="inputCountTxt">
	   			 	       	<span id="inputCount">0</span>/30
	   			 	     </div>
	    	    	</label>
	             </div>
	              <div class="mb-3">
	                <label for="second_ask" class="w-100">
	   			 	    <input type="text" class="form-control inputCount" id="second_ask" name="second_ask" placeholder="질문2." value="${mt.second_ask}">
	   			 	    <div class="inputCountTxt">
	   			 	       	<span id="inputCount">0</span>/30
	   			 	     </div>
	    	    	</label>
	             </div>
	              <div class="mb-5">
	              	<label for="third_ask" class="w-100">
	   			 	    <input type="text" class="form-control inputCount" id="third_ask" name="third_ask" placeholder="질문3." value="${mt.third_ask}">
	   			 	    <div class="inputCountTxt">
	   			 	       	<span id="inputCount">0</span>/30
	   			 	     </div>
	    	    	</label>
	             </div>
			  </div>
		
          </div><!--container 끝-->
  	        
      <div class="form_btn mb-5 update_btn">
      		<button type="button" class="btn btn-primary px-5" onclick="updateMate()">수정완료</button>
      </div>
        </form>
    </div>

 <jsp:include page="../footerBoot.jsp"></jsp:include>
  </body>
</html>