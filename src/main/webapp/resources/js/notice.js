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
	//1 - 동행신청 .
	//2- 여행 후기 댓글 .
	//3- 동행 후기 댓글 .
	//4- 마이 동행 게시글 댓글 .
	//5- 동행 신청 결과
	
	//동행 댓글이 달렸을 때 
	//후기 댓글이 달렸을 때 
	//동행 신청이 왔을 때 
	//동행 신청이 거절 됐을 때
	//동행 신청이 수락 됐을 때
	
	
	var user_code=$("#user_code").val();
	console.log(user_code);
	
	if(user_code != null){
        
		var lastNtcCode=0;  //마지막으로 받은 동행신청 알림의 id
        var timer;
	    timer=setInterval(mateReplyNewDataCheck,1000);
		
		function mateReplyNewDataCheck(){
			console.log("새로운 데이터 확인 시작");
			//showNotice(lastNtcCode);
			//console.log("lastNtcCode3 : "+lastNtcCode);
            $.ajax({
                url:"/dorang/notice",
				type:"POST",
				data:{
					lastNtcCode:lastNtcCode
				},
				success:function(result){
					console.log("새로운 댓글 알림 가져오기 성공");
					
				if (typeof result === "string") {
		    		result = JSON.parse(result);
		  		}
				if(result!=null){
					for(var i in result){
						(function(i){
							console.log("알람 result : "+result);
							var content=result[i].ntc_content
							console.log(content);
							var contentSplit=content.split(";");
							console.log(contentSplit);
							var ntc_code=result[i].ntc_code;
							console.log(ntc_code);
							
							if(result[i].ntc_cat==1){
								
								var $alarmStatus=$('<div class="alram_view_status">').text('NEW');
								var $subTitle=$('<div class="sub_title">');
								var $subTitleOpenSpan=$('<span>').text('내가 작성한 [');
								var $MateTitleSpan=$('<span class="sub_title_mate_title">').text(contentSplit[0]);
								var $subTitleCloseSpan=$('<sapn>').text(']게시글에 ');
								var $userIdOpenSpan=$('<sapn>').text(contentSplit[1]);
								var $userIdCloseSpan=$('<span>').text('님이 동행을 신청했습니다.');
								var $firstDIV=$('<div class="ask">');
								var $firstAskSpan=$('<span class="askSpan">').text('Q. '+contentSplit[2]);
								var $firstAnswerSpan=$('<div class="answer">').text('A. '+contentSplit[3]);
								var $secondDIV=$('<div class="ask">');
								var $secondAskSpan=$('<span class="askSpan">').text('Q. '+contentSplit[4]);
								var $secondAnswerSpan=$('<div class="answer">').text('A. '+contentSplit[5]);
								var $thirdDIV=$('<div class="ask">');
								var $thirdAskSpan=$('<span class="askSpan">').text('Q. '+contentSplit[6]);
								var $thirdAnswerSpan=$('<div class="answer">').text('A. '+contentSplit[7]);
								var $alarm_apply_btn=$('<div class="alarm_apply_btn">');
								var input=$("<input type='hidden' name='result[i].ntc_code' id='ntc_id' value=''>");
								
								//var $btn_mate_all=$('<button type="button" class="mate_call">').text('수락');
								//var $btn_mate_out=$('<button type="button" class="mate_out">').text('거절');
								
								var $btn_mate_all=$('<button>수락</button>');
								$btn_mate_all.click(function(){
									allLink(result[i].ntc_code);
								});
								var $btn_mate_out=$('<button>거절</button>');
								$btn_mate_out.click(function(){
									outLink(result[i].ntc_code);
								});
								
								$alarm_apply_btn.append($btn_mate_all).append($btn_mate_out);
								
								
								$subTitle.append(
									$subTitleOpenSpan,
									$MateTitleSpan,
									$subTitleCloseSpan,
									$userIdOpenSpan, 
									$userIdCloseSpan, 
									$firstDIV, 
									$firstAskSpan,
									$firstAnswerSpan, 
									$secondDIV, 
									$secondAskSpan, 
									$secondAnswerSpan,
									$thirdDIV, 
									$thirdAskSpan, 
									$thirdAnswerSpan,
									$alarm_apply_btn
								);
									
								$(".mateApply_area").append($alarmStatus).append($subTitle);
								
							}else{
						   		
						   		//var $alarmTop=$('<div class="alarm_area-comment-top"');
								var input=$("<div><input type='hidden' name='ntc_code' id='ntc_code' value=''>");
						   		var $alarmStatus=$('<div class="alram_view_status">').text('NEW');
								
								var $alarm_close=$('<button>x</button>');
								$alarm_close.click(function(){
									closeLink(result[i].ntc_code);
								})
								
								var $subTitle=$('<div class="sub_title" id="ntc_content">');
								var $subTitleOpenSpan=$('<span>').text('내가 작성한 [');
								var $MateTitleSpan=$('<span class="sub_title_mate_title">').text(contentSplit[0]);
								var $subTitleCloseSpan=$('<sapn>').text(']게시글에 ');
								var $userIdOpenSpan=$('<sapn>').text(contentSplit[1]);
								var $userIdCloseSpan=$('<span>').text('님이 댓글을 달았습니다.');
								var $reply_txt_container=$('<div class="reply_txt_container">');
								var $reply_txt=$('<span>').text(contentSplit[2]);
								
								$subTitle.append(
									$subTitleOpenSpan,
									$MateTitleSpan,
									$subTitleCloseSpan,
									$userIdOpenSpan,
									$userIdCloseSpan,
									$reply_txt_container,
									$reply_txt
								);
								
								$(".reply_area").append($alarmStatus).append($alarm_close).append($subTitle);
								
								
								$('#comment_alarm_close').click(function(ntc_code){
									//var ntc_code=$(this).data("ntc_code");
									console.log(ntc_code);
									
									$.ajax({
								        url:"/dorang/deletenotice",
										type:"POST",
										data:{
											ntc_code:ntc_code
										},
										success:function(){
											console.log("알림 삭제 성공");
											$("#ntc_"+ntc_code).addClass("hidden");
										},
										error:function(){
											console.log("알림 삭제 실패");
										}
									});//ajax
								})
								
							}//else
							
						})(i); 
					}//for
				}//if
  					
  					if (result.length > 0) {
               		var lastIndex = result.length - 1;
               		var lastNotice = result[lastIndex];
                		lastNtcCode = lastNotice.ntc_code;
           			 }
  					
				},
				error:function(){
					console.log("댓글 알림 불러오기 실패");
				}
			});//ajax
		};//mateReplyNewDataCheck()
	};//if문
	
	
});

function allLink(ntc_code){
	console.log("allLink : "+ntc_code);
	
	//mateapply 테이블에 update - result : 수락
	//알림 테이블 insert
	
	$.ajajx({
		url:"/dorang/",
	}) 
};

function outLink(ntc_code){
	console.log("outLink : "+ntc_code);
};

function closeLink(ntc_code){
	console.log("closeLink : "+ntc_code);
	$.ajax({
        url:"/dorang/deletenotice",
		type:"POST",
		data:{
			ntc_code:ntc_code
		},
		success:function(){
			$("#ntc_"+ntc_code).addClass("hidden");
			 //$(".mateApply_area").empty();
      		//$(".reply_area").empty();
      		 $("#ntc_" + ntc_code).remove(); // 해당 알림 영역을 삭제
			mateReplyNewDataCheck();
			console.log("알림 삭제 성공");
			
		},
		error:function(){
			console.log("알림 삭제 실패");
		}
	});//ajax
};


function deleteAlarm(ntc_code){
	console.log(ntc_code);
	
	$.ajax({
        url:"/dorang/deletenotice",
		type:"POST",
		data:{
			ntc_code:ntc_code
		},
		success:function(){
			console.log("알림 삭제 성공");
			$("#ntc_"+ntc_code).addClass("hidden");
		},
		error:function(){
			console.log("알림 삭제 실패");
		}
	});//ajax
	
};

function createAlarmElement(result){
	var $deleteBtn=$("<button>")
		.text("X")
		.click(function(){
			var ntc_code=result[i].ntc_code;
			deleteAlarm(ntc_code);
		});
}


