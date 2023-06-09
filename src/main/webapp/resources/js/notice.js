$(document).ready(function(){
	
	//알람 모달 열기
	$(".alarm-btn").click(function(event){
		event.stopPropagation();
		
		if ($(".alarm_modal_content").is(":visible")) {
	    	$(".alarm_modal_content").hide();
	    	
	  	} else {
	    	$(".alarm_modal_content").show();
	  	}
	});
		
	//알람 모달 닫기
	$(document).click(function(event){
		var targetElement=event.target;
		
		if(!$(targetElement).closest(".alarm-modal-container").length && !$(targetElement).hasClass("alarm-modal-container")){
			$(".alarm_modal_content").hide();
		}
	});
	
	//마이페이지 모달 열기
	$(".myPage_btn").mouseenter(function(event){
	  event.stopPropagation();
	  if($(".alarm_modal_content").is(":visible")){
	  	$(".myPage_modal_container").hide();
	  } else {
	  	$(".myPage_modal_container").show();
	  }
	});
	
	$(".myPage_modal_container").mouseenter(function(event){
	  event.stopPropagation();
	   if($(".alarm_modal_content").is(":visible")){
	  	$(this).hide();
	  } else {
	  	$(this).show();
	  }
	});
	
	//마이페이지 모달 닫기
	$(".myPage_btn").mouseleave(function(event){
	  event.stopPropagation();
	  $(".myPage_modal_container").hide();
	});
	
	$(".myPage_modal_container").mouseleave(function(event){
	  event.stopPropagation();
	  $(this).hide();
	});
	
	
	//-----------------------------------------------------
	
	//알림분류 :
	//1 - 동행신청
	//2- 여행 후기 댓글
	//3- 동행 후기 댓글
	//4- 마이 동행 게시글 댓글
	
	//동행 댓글이 달렸을 때 
	//후기 댓글이 달렸을 때
	//동행 신청이 왔을 때 
	//동행 신청이 거절 됐을 때
	//동행 신청이 수락 됐을 때
	var user_code=$("#user_code").val();
	console.log(user_code);
	if(user_code != null){
		var lastNotificationID=0;  // 마지막으로 받은 알림의 id
        var timer;
	    timer=setInterval(mateReplyNewDataCheck,5000);
		
		function mateReplyNewDataCheck(){
			console.log("동행 댓글 새로운 데이터 확인 시작");
			
			
            $.ajax({
                url:"/dorang/mate/notice",
				type:"POST",
				data:{
					lastNotificationID:lastNotificationID
				},
				success:function(result){
					console.log("마지막 알림 식별 번호 가져오기 성공");
					console.log(JSON.stringify(result));
					//showNotice(result);
					
					//var mateTitle=result.
					
					
					
					
			        if (result.length > 0) {
						var lastIndex = result.length - 1;
			            var lastNotice = result[lastIndex];
			            lastNotificationID = lastNotice.ntc_code;
			        }
				},
				error:function(){
					console.log("알림 불러오기 실패");
				}
			});//ajax
		};
	};
	
	
});

	
function showNotice(){
	
};









