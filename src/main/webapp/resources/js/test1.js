$(document).ready(function(){
	
	//알람 모달 열기
	$(".alarm-btn").click(function(event){
		event.stopPropagation();
		
		if ($(".alarm-modal-container").is(":visible")) {
	    	$(".alarm-modal-container").hide();
	    	
	  	} else {
	    	$(".alarm-modal-container").show();
	  	}
	});
		
	//알람 모달 닫기
	$(document).click(function(event){
		var targetElement=event.target;
		
		if(!$(targetElement).closest(".alarm-modal-container").length && !$(targetElement).hasClass("alarm-modal-container")){
			$(".alarm-modal-container").hide();
		}
	});
	
	//마이페이지 모달 열기
	$(".myPage-btn").mouseenter(function(event){
	  event.stopPropagation();
	  if($(".alarm-modal-container").is(":visible")){
	  	$(".myPage-modal-container").hide();
	  } else {
	  	$(".myPage-modal-container").show();
	  }
	});
	
	$(".myPage-modal-container").mouseenter(function(event){
	  event.stopPropagation();
	   if($(".alarm-modal-container").is(":visible")){
	  	$(this).hide();
	  } else {
	  	$(this).show();
	  }
	});
	
	//마이페이지 모달 닫기
	$(".myPage-btn").mouseleave(function(event){
	  event.stopPropagation();
	  $(".myPage-modal-container").hide();
	});
	
	$(".myPage-modal-container").mouseleave(function(event){
	  event.stopPropagation();
	  $(this).hide();
	});
	
	
	function getNotice(){
	//동행 댓글이 달렸을 때
	//후기 댓글이 달렸을 때
	//동행 신청이 왔을 때
	//동행 신청이 거절 됐을 때
	//동행 신청이 수락 됐을 때
	
	
		console.log("알림 함수 들어왔다~");	
	}
	//setInteval(getNotice,5000);
	
	//var currentUrl=window.location.href;
	//$(".navi-link").click(function(e){
	//	if(currentUrl==="http://localhost:8080/dorang/travel/list"){
	//		$(".navi-link-travel").style.color="#FB7A51";
	//	}else if(currentUrl==="http://localhost:8080/dorang/mate/list"){
	//		alert("나와~!~!~");
	//		$(".navi-link-mate").style.color="#FB7A51";
	//	}else if(currentUrl==="http://localhost:8080/dorang/board/list"){
	//		$(".navi-link-community").style.color="#FB7A51";
	//	}else if(currentUrl==="http://localhost:8080/dorang/user/mypage"){
	//		$(".navi-link-mypage").style.color="#FB7A51";
	//	}else{
	//		$(".navi-link").style.color="#3F3D3A";
	//	}
	//});
	
	
});











