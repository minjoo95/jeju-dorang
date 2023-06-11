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
	
	
	// 반응형 헤더바 햄버거 메뉴 열고닫기
	const burgerBtn = document.querySelector('#hidden-burger-menu');
	const burgerMenu = document.querySelector('.header-category');
	
	burgerBtn.addEventListener('click', () => {
		burgerMenu.classList.toggle('active');
		
		if(burgerMenu.classList.contains('active') == true) {
			document.addEventListener('click', (e) => {
				const targetE = e.target;
				if(!targetE.closest('.header-wrap')){
					burgerMenu.classList.remove('active');
				}
			});
		}
	});
	
});











