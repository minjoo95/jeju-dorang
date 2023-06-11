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
	    margin-left :10px;
	  }
	  .matecommunityMove:hover{
	  background-color: #FB7A51;
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
	
	
	 
	 
	  sortMateList($("#sortBy").val(),${pm.cri.page});
		  
	//버튼 정렬 
	    $(".sort-btn-group button").on("click",function(e){
	    
	    	
	    	e.preventDefault(); 
	    	 $(".sort-btn-group button").removeClass("active");
	    	 $(this).addClass("active");
	    	 
	    	 sortBy = $(this).data("btn");
	    	 $("#sortBy").val(sortBy);
	    	
	    	 var page = $("#page").val();
	    	 
	    	 if (sortBy === "acceptedList") { 
	    	        page = ${pm.startPage};
	    	        $("#page").val(page);
	    	       
	    	    }
	    	 
	         sortMateList(sortBy, page);
	        
	         
	    });

	
	

	  
  });
  
  
  var contextPath = "${pageContext.request.contextPath}";
  
  function sortMateList(sortBy,page) {
    
  	 
	    $.ajax({
		    url: "${contextPath}/mate/myPageListSort",
		    method: "GET",
		    data:{
		        sortBy: sortBy,
		        page: page,
		      },
		    dataType : "json",
		    success:function(data) {
		        displayMateList(data.myPageListSortby,sortBy,data.applyResult); 
		        var pm = data.pm;
		        var endPage = pm.endPage;
		        var startPage = pm.startPage;
		        var currentPage = pm.cri.page;
		        var hasNext = pm.next;
		        updatePagination(endPage, sortBy, startPage, currentPage, hasNext); 
		       
		       
		      },
		    error: function() {
		      console.log("데이터 요청 실패");
		    }
		  }); 
 }//sortMateList
  
  function displayMateList(data,sortBy,applyResult) {
	    
	     $("#viewContent").empty();
	     
	     var itemHtml = ""; 
		   $.each(data, function(index,mt) {
			    var createdAt = new Date(mt.createdAt);  
		    	var formattedDate = createdAt.toLocaleDateString();
			    
			   itemHtml += "<div class='card d-flex flex-row mb-3'>"
			   itemHtml += "<img src='" + contextPath + "/resources/upload/mate/" + mt.image + "' class='card-img-top' alt='제주도모집이미지' style='width: 30%;height:120px; display: block;'>";
			   itemHtml += "<div class='card-body' style='width: 40%; overflow: hidden;'>"
			   itemHtml +="<span>"+mt.daterange+"</span>"
			   itemHtml += "<div class='card-body-text' style='width:60%;'>"
			   itemHtml +=  "<h5 class='card-title'>"+mt.title+"</h5>"
			   itemHtml += "</div>"
			   itemHtml += "<p class='card-text'>"+mt.status+"</p>"
			   itemHtml += "</div>"
			   itemHtml += "<div class='card-body card-body-right' style='width: 40%;'>"
			   if (sortBy === "acceptedList") {
				   itemHtml += "<div class='card-text status' class='btn card-link matecommunityMove'>"+applyResult+"</div>";  //mate테이블이 아니라 mateApply테이블의 result값을 받아야함 
				   if(applyResult === "수락거절")
				  itemHtml += "<button disabled id='"+mt.mate_code+"' class='btn card-link matecommunityMove'  style='background-color: #D9D9D9'";	   
			   } else {
				  itemHtml += "<div class='card-text status'>"+mt.join_count+"&nbsp;명 참여중</div>";
					}  
			   itemHtml += "<button id='"+mt.mate_code+"' class='btn card-link matecommunityMove' ";
			   itemHtml += ">커뮤니티방 go!</button>"; 
			   itemHtml += "</div>"	  
			   itemHtml += "</div>"
			   itemHtml += "</div>"
			   itemHtml += "</div>"
			
		   }); 
			$("#viewContent").append(itemHtml);

	   }//displayMateList
  
	   
	   function updatePagination(endPage, sortBy, startPage, currentPage, hasNext) {
		   var pageButtonsContainer = $(".pagination");

		   
		   var pageButtonsHtml = "";
		

		   // 이전 페이지 버튼
		   if (${pm.startPage} > 1) {
		     pageButtonsHtml += "<li class='page-item paginate_button'>";
		     pageButtonsHtml += "<a  class='page-link' id='" + (startPage - 1) + "' aria-label='Previous'>";
		     pageButtonsHtml += "<span aria-hidden='true'>&laquo;</span>";
		     pageButtonsHtml += "</a>";
		    pageButtonsHtml += "</li>";
		   }
		   // 페이지 번호 버튼
		   for (var pageNum = startPage; pageNum <= endPage; pageNum++) {
			   
		     if (pageNum == currentPage) {
		      pageButtonsHtml += "<li class='page-item active paginate_button'>";
		     } else {
		       pageButtonsHtml += "<li class='page-item paginate_button'>";
		     }
		     pageButtonsHtml += "<a  class='page-link' id='"+pageNum+"'>" + pageNum + "</a>";
		     pageButtonsHtml += "</li>";
		   }

		   //다음 페이지 버튼
		   if (hasNext) {
		     pageButtonsHtml += "<li class='page-item paginate_button'>";
		     pageButtonsHtml += "<a  class='page-link' id='" + (endPage + 1) + "' aria-label='Next' >";
		     pageButtonsHtml += "<span aria-hidden='true'>&raquo;</span>";
		     pageButtonsHtml += "</a>";
		     pageButtonsHtml += "</li>";
		   }

		   // 페이지 버튼을 갱신
		   pageButtonsContainer.html(pageButtonsHtml);
		   
		 
		 
		   
		   
		   $(".pagination a").on("click", function (e) {
			    e.preventDefault();
			    
			    var page = $(this).attr("id");
			    var sortBy = $("#sortBy").val();
			    
			    $.ajax({
				    url: "${contextPath}/mate/myPageListSort",
				    method: "GET",
				    data:{
				        sortBy: sortBy,
				        page: page,
				      },
				    dataType : "json",
				    success:function(data) {
				    	displayMateList(data.myPageListSortby, sortBy, data.applyResult);
				        var pm = data.pm;
				        var endPage = pm.endPage;
				        var startPage = pm.startPage;
				        var currentPage = pm.cri.page;
				        var hasNext = pm.next;
				        updatePagination(endPage, sortBy, startPage, currentPage, hasNext); 
				        $("#page").val(currentPage);
				      
				      },
				    error: function() {
				      console.log("데이터 요청 실패");
				    }
				  }); 
			
			    
			  }); 
		   
		   

	       //커뮤니티방 가기!
		    $(".matecommunityMove").on("click", function (e) {
				     e.preventDefault();
				     var mate_code = $(this).attr("id");
				     var pageFrm = $("#pageFrm");
					 var tag="<input type='hidden' name='mate_code' value='"+mate_code+"'/>";
				     pageFrm.append(tag);
				     pageFrm.submit()
				
				    
				  }); 
		   
	   }
	   
	  
 
  
  
  
  </script>
  

</head>
<body>
   <div class="container">
       <h3 style="padding:50px 0px 20px 0px">동행 목록</h3>
  		<div class="sort-btn-group mb-5" style="text-align: right;">
	 		<button type="button" class="btn" style="background: #FB7A51" data-btn="getmyMateWriteList">내가 작성한 글 보기</button>
	  		<button type="button" class="btn" style="background: #D9D9D9" data-btn="acceptedList">내가 신청한 글 보기</button>
	 	</div>
	 	 <div  id="viewContent">
             <!-- 동행리스트 -->
		 </div>	  
 <div class="container d-flex justify-content-center">
  <div style="text-align: center;">
	 <nav aria-label="Page navigation example">
	  <ul class="pagination">
	     <!-- 페이징 -->
	  </ul>
	</nav>
  </div>
  </div>
  <!-- end -->
  <form id="pageFrm" action="${contextPath}/mate/mateCommunity"  method="get">
  		<input type="hidden" id="page" name="page" value="${pm.cri.page}" />
  		<input type="hidden" name="perPageNum" value="${pm.cri.perPageNum}" />
  		<input type="hidden" id="sortBy" name="sortBy" value="${pm.cri.sortBy}" />
  </form>
   </div>
</body>
</html>