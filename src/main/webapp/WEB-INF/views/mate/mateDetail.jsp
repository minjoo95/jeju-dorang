<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>모집글등록하기</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>  
  	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js" defer></script>
  </head>
  <style>
  	 *:not(html), .wrap, header {
    box-sizing: content-box !important;
  }
  .container, .container * {
    box-sizing: border-box !important;
    position: relative;
  }
  .custom-bg {
 	 background-color: red; /* 원하는 배경색 지정 */
   }
	.custom-bg:disabled {
     background: #FFFFFF;
    }
    .card-tags{
	font-size: 13px;
	border-radius: 15px;
	padding-right: 10px; 
	font-weight: bold;
  }
   .card-top-tags .card-tags{
	border: 1px solid  #3CB728;
	padding: 0px 13px;
	margin-right: 10px;
  }
  .card-bottom-tags .card-tags{
  	color:#FB7A51;
  }
  .writer-btn> .btn{
  	color:#ffffff;
  	background-color:#3CB728;
	padding: 0px 7px;
	font-size: 15px;
	border-radius: 5px;
  }
  .status-tags{
    color:#ffffff;
  	background-color:#FB7A51;
  }
  .number-tags, .status-tags{
     font-size: 13px;
     padding: 0px 13px;
  }
  
  .ask {
  	color:#FB7A51;
  }
  
  .applyAlert{
  	position: absolute;
  	bottom: 32px;
  	left: 50%;
  	margin-left: calc(-258px / 2);
  	width: 259px;
  	box-sizing: border-box;
  }
  </style>
  <script type="text/javascript">

 $(document).ready(function(){
	
	
	 var tags=$("#tags_strings").html();
	 var tagList = tags.split('/');
	 var tags_label = $("#tags_list label"); 
	 
	
	 for(var i=0; i<tagList.length;i++){
		tags_label.eq(i).text("#" + tagList[i]); 
		console.log(tags_label.eq(i).text());
	 }
	 
	 $("button").on("click", function(e){
 		var formData=$("#frm");
 		
 		var btn=$(this).data("btn"); // data-btn="list"
 		
 		if(btn=='update'){
 			formData.attr("action", "${contextPath}/mate/updateForm");
 		}else if (btn=='list') {
 			formData.find("#mate_code").remove();
 			formData.find("#user_code").remove();
			formData.attr("action", "${contextPath}/mate/list");
		}else if(btn=='delete'){
			 
			  formData.attr("action", "${contextPath}/mate/delete");
		}
 		
 		
 		formData.submit(); 
 	});    	
	 

	 
  });//document끝
  

  
  function mateApply() {
		 
		 var frist_answer = $('#frist_answer').val();
	  	 var second_answer = $('#second_answer').val();
	  	 var third_answer = $('#third_answer').val();
	  	 var mate_code = $('#mate_code').val(); 
	  	 var user_code =$('#user_code').val(); 
	  	 
	  	 
	  	 
	  	  var send_data = {
	  			"mate_code": mate_code,
	  			"user_code": user_code,
	  	  		"frist_answer": frist_answer,
	  	   		"second_answer": second_answer,
	  	    	"third_answer": third_answer 			 
	  	 };
	  	  
	  	 console.log(send_data);
	  	 if( frist_answer == null || frist_answer.trim() === "" || 
	  		 second_answer == null || second_answer.trim() === "" ||
	  		 third_answer == null || third_answer.trim() === ""){
	  		 
	  		      alert("모든 내용을 입력해주세요");
	  		      
	  	 }else{
	  		$.ajax({
	  		    url: "/dorang/mate/apply",
	  		    type: "POST",
	  		    contentType:"application/json",
	  		    data: JSON.stringify(send_data),//JSON문자열 생성
	  		    dataType: "text",
	  		    success: function(response) {
	  		        if (response === "success") {
	  		        	
	  		            $("#liveAlert").css("display", "block");
	  		            $("#liveAlertText").html("신청되었습니다! :)");
	  		        }else if (response === "already") {
	  		            $("#liveAlert").css("display", "block");
	  		             $(".alert-warning").removeClass("alert-warning").addClass("alert-danger");
	  		            $("#liveAlertText").html("이미 신청된 게시글입니다!");
	  		        }else{
	  		        	 $(".alert-warning").removeClass("alert-warning").addClass("alert-danger");
	  		            $("#liveAlert").css("display", "block");
			            $("#liveAlertText").html("오류가 발생했습니다.");
	  		        }
	  		    },
	  		  error : function(xhr,status,error) {
	  			console.log(status + ", " + error);
	  		}
	  		});
	  	 }
	  			 
	  		
	}   
  
  function alertClose() {
	  $("#liveAlert").css("display", "none");
	  
	  
}
 
 
</script>
  <body>

  <jsp:include page="../header.jsp"></jsp:include>
    <form id="frm"  method="get">
          <input type="hidden" name="mate_code" id="mate_code" value="<c:out value='${mt.mate_code}'/>"/>
          <input type="hidden" name="user_code" id="user_code" value="<c:out value='${sessionScope.userInfo.user_code}'/>"/>
          <input type="hidden" name="page" id="page" value="<c:out value='${cri.page}'/>"/>
          <input type="hidden" name="perPageNum" id="perPageNum" value="<c:out value='${cri.perPageNum}'/>"/>
    </form>
    <div class="container" style="padding:50px 0px" >
     <div class="d-flex" >
		  <button data-btn="list" class="btn" style="background: #FB7A51; color:#ffffff; display: block;" >
					목록가기
		  </button>
	</div>
     <c:set var="sessionUserCode" value="${sessionScope.userInfo.user_code}" />
	 <c:set var="boardUserCode" value="${mt.user_code}" />
     <c:if test="${sessionUserCode ne null and sessionUserCode eq boardUserCode}">
        <div class="writer-btn d-flex justify-content-end" style="padding-bottom: 50px">
	    	<button class="update_btn btn" data-btn="update" >수정하기</button>
	    	<button class="delete_btn btn" data-btn="delete" style="margin-left: 5px;">삭제하기</button>
	    </div>
     </c:if>
       		<div class="container" >
	       		<div class="mate-createdAt d-flex justify-content-end" style=" font-size: 12px;">
					    	<p style="font-size: 15px">작성일&nbsp;${mt.createdAt}</p>
		        </div>
          <div class="row">
	          <div class="col-md-6  container_1" >
		 			 <div class="mb-5" >
					    <label  class="form-label" style="color: #FB7A51;">${mt.title}</label>
		  			 </div> 
		  			  <!-- 이미지 --> 
					<div class="mb-5">
					  	 <div class="card" style="padding: 0px;">
						    <img src="${contextPath}/resources/upload/mate/${mt.image}" class="card-img-top" alt="제주도모집이미지" style="height: 370px; border-radius: 0px;">
		  				</div>
	  				</div>
	          </div>
	          <div class="col container_2">
	          	<div class="container_taggroup1" >
				  		  <div class="card-top-tags d-flex flex-wrap align-items-center  mb-5">
						      <label class="card-tags" >${mt.type}</label>
						      <label class="card-tags" >${mt.direction}</label>
						      <label class="number-tags" style="font-weight: bold;" >
						        <span>
						        	<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
									  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
									</svg>
						        </span>
						        ${mt.number.replace('명', '')}
						      </label>
						      <label class="status-tags">${mt.status}</label>
					      </div>
				  </div> 
				  <div class="d-flex flex-column" style="height: 370px;">
	                <div class="tag_groups-box" style="height: 40%">
		                <div class="container_2_daterange d-flex align-items-center">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#3CB728" class="bi bi-calendar2-heart" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v11a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4V.5ZM1 3a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v11a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V3Zm2 .5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h10a.5.5 0 0 0 .5-.5V4a.5.5 0 0 0-.5-.5H3Zm5 4.493c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z"/>
									</svg>
								    <small class="daterange" style="opacity: 0.8; padding: 0px 3px;">
								          여행기간&nbsp;${mt.daterange}
								    </small>
					  	</div>
					  	<div class="container_2_taggroup2 mt-3">
					  			    <label class="card-tags">${mt.gender}</label>
							        <label class="card-tags">${mt.age}</label>
					  	</div>
					  	<div class="container_2_taggroup3  mt-3" >
					  	 <div  class="tags_strings" id="tags_strings" style="display: none;">${mt.tags}</div>
					  		   <div class="card-bottom-tags d-flex flex-wrap  mb-3" id="tags_list">
							      <label class="card-tags">tag1</label>
							      <label class="card-tags">tag2</label>
							      <label class="card-tags">tag3</label>
				              </div>
					  	</div>
				  	</div>
				  	<div class="content-box" style="height: 60%">
					    <textarea  class="form-control custom-bg" id="content" name="content" style="height:100%; resize: none; overflow-y:hidden;" disabled="disabled">${mt.content}</textarea>
		  			 </div>
			      </div> 
			  </div>
		  <div class="container_3 mt-2">
  	    	 <h3 class="mb-3" style="font-size: 23px">
  	    	 	동행 신청하기
  	    	  </h3>
  	    	 <div style=" border: 2px solid #D9D9D9; border-radius: 15px; padding:50px 40px; margin-bottom: 50px"> 
	  	    	 <div class="mb-3" >
	  	    		<label for="frist_answer" class="w-100 ask">Q&nbsp;.&nbsp;${mt.first_ask}
	  	    			   <input type="text" class="form-control" id="frist_answer" name="frist_answer" placeholder="답변을 입력해주세요." >
	  	    		</label>
	             </div>
	              <div class="mb-3">
	                <label for="second_answer" class="w-100 ask">Q&nbsp;.&nbsp;${mt.second_ask}
	   			 	    <input type="text" class="form-control" id="second_answer" name="second_answer" placeholder="답변을 입력해주세요." >
	    	    	</label>
	             </div>
	              <div class="mb-3">
	              	<label for="third_answer" class="w-100 ask">Q&nbsp;.&nbsp;${mt.third_ask}
	   			 	    <input type="text" class="form-control" id="third_answer" name="third_answer" placeholder="답변을 입력해주세요.">
	    	    	</label>
	             </div>
	            </div>
		  </div>
		 </div> 
          </div> 
		   <div class="alert alert-warning alert-dismissible fade show applyAlert" style="display: none"  role="alert" id="liveAlert">
			     <p id="liveAlertText"></p>
			     <button type="button" class="btn-close"  onclick="alertClose()"></button>
	       </div>
      <div class="form_btn mb-2" style="width: 100%;text-align: center;">
      		 <c:choose>
               <c:when test="${sessionScope.user !=null}">
		 		   <c:choose>
			 		   <c:when test="${sessionUserCode ne boardUserCode}">
			 		      <c:choose>
			 		        <c:when test="${mt.status eq '모집완료'}">
			 		       		 <button id="liveAlertBtn" type="button" disabled  class="btn btn-secondary px-5">동행신청</button>
			 		        </c:when>
			 		        <c:otherwise>
		                        <button id="liveAlertBtn" type="button" class="btn btn-primary px-5" onclick="mateApply()">동행신청</button>
		                    </c:otherwise>
			 		      </c:choose>
			 		   </c:when>
			 		   <c:otherwise>
			 		        <button id="liveAlertBtn" type="button" disabled  class="btn btn-secondary px-5">동행신청</button>
			 		     </c:otherwise>
		 	    </c:choose>
		 		</c:when>
		 		<c:otherwise>
		 			<button type="button" class="btn btn-primary px-5" onclick="alert('로그인이 필요합니다'); window.location.href = 'https://kauth.kakao.com/oauth/authorize?client_id=a62a2c16a4182ec20a1185a3f707c2b1&redirect_uri=http://localhost:8080/dorang/user/kakaoCallback&response_type=code&prompt=login&state=${pageURL}';">동행신청</button>
		 		</c:otherwise>
	        </c:choose> 
	 
      </div>
    </div>
    <div style="height: 100px; background-color: orange;">푸터</div>

  </body>
</html>



