$(ducument).ready(function(){
	$(".mate_reply_btn").click(function(){
		if(sessionScope.user_id=null){
			alert("로그인이 필요합니다");
			location.href="/login";
		}else{
			$.ajax({
				url:"/mymatepage",
				type:"POST",
				data:{
					
				},
				success:function(){
					console.log("댓글 달기 성공!");
					location.reload()
				},
			})
		}
	});
});
