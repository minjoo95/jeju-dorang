$(document).ready(function(){
	
	//모달 열기
	$(".top_btn").click(function(event){
		event.stopPropagation();
		
		if ($(".alarm_layer_content").is(":visible")) {
	    	$(".alarm_layer_content").hide();
	    	
	  	} else {
	    	$(".alarm_layer_content").show();
	  	}
	});
		
	//모달 닫기
	$(document).click(function(event){
		var targetElement=event.target;
		
		if(!$(targetElement).closest(".modal").length && !$(targetElement).hasClass("modal")){
			$(".alarm_layer_content").hide();
		}
	});
	
	// 모달 열기
	$(".mypage-btn").mouseenter(function(event){
	  event.stopPropagation();
	  if($(".alarm_layer_content").is(":visible")){
	  	$(".lyMyArea").hide();
	  } else {
	  	$(".lyMyArea").show();
	  }
	});
	
	$(".lyMyArea").mouseenter(function(event){
	  event.stopPropagation();
	   if($(".alarm_layer_content").is(":visible")){
	  	$(this).hide();
	  } else {
	  	$(this).show();
	  }
	});
	
	// 모달 닫기
	$(".mypage-btn").mouseleave(function(event){
	  event.stopPropagation();
	  $(".lyMyArea").hide();
	});
	
	$(".lyMyArea").mouseleave(function(event){
	  event.stopPropagation();
	  $(this).hide();
	});
	
		
});
