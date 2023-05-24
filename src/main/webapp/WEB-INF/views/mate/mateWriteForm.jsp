<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>모집글등록하기</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>  
  	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	<script>
	$(function() {
		
		//달력라이브러리
 		 $('input[name="daterange"]').daterangepicker({
  				 opens: 'left'
  		}, function(start, end, label) {
    	console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
 		 });
		
		//엔터방지 
 		document.mateForm.addEventListener("keydown", evt => {
 			  if (evt.code === "Enter") evt.preventDefault();
 		});
});
</script>

  </head>
  <body>
  <div style="height: 100px; background-color: orange;">헤더</div>
    <div class="container" >
     <h2 style="color: var(--color-accent); padding-bottom: 50px;">작성해주세요 :)</h2>
        <form name="mateForm" action="/mate/writeform" method="post" enctype="multipart/form-data">
       		 <div class="container" >
        <div class="row">
         <div class="col-md-6 container container_1">
	 			 <div class="mb-5" >
				    <label for="title" class="form-label">제목</label>
				    <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요">
	  			 </div>
			  	 <div class="mb-3">
			  	    <label for="content" class="form-label">내용</label>
				    <textarea class="form-control" placeholder="내용을 입력해주세요" id="content" name="content" style="height:400px; resize: none"></textarea>
	  			 </div>
          </div>
          <div class="col-md-6 container container_2">
          	<div class="row">
          	<div class="container container_2_left col">
			  		  	<div class="mb-3">
						    <label class="form-label">동행타입</label>
						     <div class="btn-group" role="group" aria-label="Basic mixed styles example">
								 <input type="radio" class="btn-check" name="type" id="type_1" autocomplete="off" checked >
								 <label class="btn" for="type_1" style="margin-right: 10px; border-radius:15px">전체동행 </label>
							     <input type="radio" class="btn-check" name="type" id="type_2" autocomplete="off">
								 <label class="btn" for="type_2" style="margin-right: 10px; border-radius:15px"> 부분동행</label>
								 <input type="radio" class="btn-check" name="type" id="type_3" autocomplete="off">
								 <label class="btn" for="type_3" style="border-radius:15px">밥한끼</label>
						     </div>
			  			</div>
			  		   <div class="mb-3">
					  	    <label  class="form-label">지역선택<span style="padding-left:10px; font-size: 12px">동서남북 중에 골라주세요</span></label>
							  <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="direction" style="font-size: 13px; width: 70%;" >
			  					<option selected>지역을 선택하세요</option>
			  					<option value="1">동부</option>
			  					<option value="2">서부</option>
			  					<option value="3">남부</option>
			  					<option value="3">북부</option>
						 	 </select>
			  		  </div>
			  		  <div class="mb-3">
					  	    <label class="form-label">인원수
						  	    <span style="padding-left:10px; font-size: 12px;">동행 인원수를 선택해세주세요</span>
						  	    <span style="padding-left:5px; font-size: 12px; font-weight: 800">최대 5명</span>
					  	    </label>
						      <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="number" style="font-size: 13px; width: 70%;">
			  					<option selected>인원수를 선택하세요</option>
			  					<option value="1">2명</option>
			  					<option value="2">3명</option>
			  					<option value="3">4명</option>
			  					<option value="3">5명</option>
							 </select>
			     		</div>
						<div class="mb-3">
					  	    <label class="form-label">연령대<span style="padding-left:10px; font-size: 12px">원하는 연령대를 선택해세주세요</span></label>
						     <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="age" style="font-size: 13px;  width: 70%;">
			  					<option selected>연령대를 선택해주세요</option>
			  					<option value="1">20대</option>
			  					<option value="2">30대</option>
			  					<option value="3">40대</option>
			  					<option value="3">50대</option>
							 </select>
			  			  </div>  		  
			  		    <div class="mb-3">
					  	    <label class="form-label">성별<span style="padding-left:10px; font-size: 12px">원하는 성별을 선택해주세요</span></label>
						      <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="gender" style="font-size: 13px;  width: 70%;">
			  					<option selected>성별을 선택해주세요</option>
			  					<option value="1">여자만</option>
			  					<option value="2">남자만</option>
			  					<option value="3">혼성</option>
							 </select>
			  			 </div>
			  	</div> <!-- container container_2_left -->
                <div class ="container container_2_right col">
			  		 	 <div class="mb-3">
						    <label class="form-label">기간</label>
						    <input type="text" name="daterange"/ style="font-size: 13px">
			  			 </div>
			  			 <div class="mb-3" >
					  	    <label class="form-label">태그를 선택해주세요<span style="font-size: 12px;display: block;">둘 중 하나만 선택해주세요</span></label>
						      <div class="btn-group" role="group" aria-label="Basic mixed styles example" style="padding-bottom: 10px">
								 <input type="radio" class="btn-check" name="tag_1" id="tag_1_left" autocomplete="off" checked>
								 <label class="btn" for="tag_1_left" style="font-size: 13px;margin-right: 10px; border-radius:15px">조율안돼요</label>
							     <input type="radio" class="btn-check" name="tag_1" id="tag_1_right" autocomplete="off">
								 <label class="btn" for="tag_1_right" style="font-size: 13px ;border-radius:15px">조율가능해요</label>
						      </div>
						      <div class="btn-group" role="group" aria-label="Basic mixed styles example"  style="padding-bottom: 10px" >
								 <input type="radio" class="btn-check" name="tag_2" id="tag_2_left" autocomplete="off" checked>
								 <label class="btn" for="tag_2_left" style="font-size: 13px ;margin-right: 10px; border-radius:15px">밥 따로 먹어요 </label>
							     <input type="radio" class="btn-check" name="tag_2" id="tag_2_right" autocomplete="off">
								 <label class="btn" for="tag_2_right" style="font-size: 13px ;border-radius:15px">밥 같이 먹어요</label>
						     </div>
						      <div class="btn-group" role="group" aria-label="Basic mixed styles example"  style="padding-bottom: 10px">
								 <input type="radio" class="btn-check" name="tag_3" id="tag_3_left" autocomplete="off" checked>
								 <label class="btn" for="tag_3_left" style="font-size: 13px;margin-right: 10px; border-radius:15px">내향인이예요</label>
							     <input type="radio" class="btn-check" name="tag_3" id="tag_3_right" autocomplete="off">
								 <label class="btn" for="tag_3_right" style="font-size: 13px; border-radius:15px">외향인이예요</label>
						      </div>
						      <div class="btn-group" role="group" aria-label="Basic mixed styles example">
								 <input type="radio" class="btn-check" name="tag_4" id="tag_4_left" autocomplete="off" checked>
								 <label class="btn" for="tag_4_left" style="font-size: 13px ;margin-right: 10px; border-radius:15px">차 있어요</label>
							     <input type="radio" class="btn-check" name="tag_4" id="tag_4_right" autocomplete="off">
								 <label class="btn" for="tag_4_right" style="font-size: 13px; border-radius:15px">뚜벅이랍니다</label>
						     </div>
			  			 </div>
			  			 <div class="mb-3">
					  	    <label>진행여부 <span style="display:block; font-size: 12px; margin-bottom: 10px">추후 동행이 다 모이면 모집 완료로 변경해주세요</span></label>
						      <div class="btn-group" role="group" aria-label="Basic mixed styles example">
								   <input class="form-check-input" type="radio" name="status" id="exampleRadios1" value="option1" checked>
			                       <label class="form-check-label" for="exampleRadios1">
			   						진행 중
			  						</label>
			  						  <input class="form-check-input" type="radio" name="status" id="exampleRadios1" value="option1" checked>
			                       <label class="form-check-label" for="exampleRadios1">
			   						모집 완료
			  					  </label>
						     </div>
			  			 </div>
			  			 <div class="mb-3">
			  			 <label for="file">
							  <div class="btn-upload btn btn-warning" >사진 업로드
							  	 <span>
								  	 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-camera-fill" viewBox="0 0 16 16">
									  <path d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
									  <path d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2zm.5 2a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0z"/>
									</svg>
							  	 </span>
							  </div>
						</label>
						<input type="file" name="image" id="file" style="display: none">
			  			 </div>
			  		 </div> <!-- right 끝 -->
			  		 <div class="container container_2_right_bottom">
			     		<div class="card mb-3"><img src="..." class="card-img-top" alt="..." style="height: 120px"></div>
			     	</div> <!-- bottom 끝 -->
				  </div><!-- col-md-6끝 -->
				  </div>
		 </div> <!-- row끝 --> 
          </div>	
  	    </div>
  	    <div class="container">
  	    	 <h2>동행에게 하는 질문 <span>최대 3개</span></h2>
  	    	 <div class="mb-3" >
  	    		<label for="frist_ask" class="w-75">
   			 	    <input type="text" class="form-control" id="frist_ask" name="frist_ask" placeholder="질문1.">
    	    	</label>
             </div>
              <div class="mb-3">
                <label for="second_ask" class="w-75">
   			 	    <input type="text" class="form-control" id="second_ask" name="second_ask" placeholder="질문2." >
    	    	</label>
             </div>
              <div class="mb-5">
              	<label for="third_ask" class="w-75">
   			 	    <input type="text" class="form-control" id="third_ask" name="third_ask" placeholder="질문3.">
    	    	</label>
             </div>
  	    </div>	    
      <div class="form_btn" style="width: 100%;text-align: center">
      		<button type="submit" class="btn btn-primary px-5">등록</button><i class="fa-solid fa-camera"></i>
      </div>
  </form>
    </div>
    <div style="height: 100px; background-color: orange;">푸터</div>
  </body>
</html>