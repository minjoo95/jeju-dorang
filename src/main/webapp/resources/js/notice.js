$(document).ready(function(){
	
	//모달 열기
	$(".alarm-btn").click(function(event){
		event.stopPropagation();
		
		if ($(".alarm_modal_content").is(":visible")) {
	    	$(".alarm_modal_content").hide();
	    	
	  	} else {
	    	$(".alarm_modal_content").show();
	  	}
	});
		
	//모달 닫기
	$(document).click(function(event){
		var targetElement=event.target;
		
		if(!$(targetElement).closest(".alarm-modal-container").length && !$(targetElement).hasClass("alarm-modal-container")){
			$(".alarm_modal_content").hide();
		}
	});
	
	// 모달 열기
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
	
	// 모달 닫기
	$(".myPage_btn").mouseleave(function(event){
	  event.stopPropagation();
	  $(".myPage_modal_container").hide();
	});
	
	$(".myPage_modal_container").mouseleave(function(event){
	  event.stopPropagation();
	  $(this).hide();
	});
	
		
});
