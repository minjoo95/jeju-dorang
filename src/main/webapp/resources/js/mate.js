$(document).ready(function(){
	alert("js에 들옹기 성공");
	
	//댓글 insert
	$(".mate_reply_btn").click(function(){
		alert("insert 들어오기 성공");
		var mateCode=$("#mate_code").val();
		console.log(mateCode);
			$.ajax({
				url:"/dorang/mate/mateReplyInsert",
				type:"POST",
				data:{
					mate_code:mateCode,
					mateReplyContent:$(".comment_txt").val()
					},
				success:function(){
					console.log("댓글 달기 성공!");
					//댓글 등록 시 댓글 등록창 초기화
					$(".comment_txt").val('')
					getReplyList();
				},
				error:function(){
					console.log("댓글 등록 실패!");
				}
			})
	});
	
	//댓글 목록 select
	function getReplyList(){
		alert("select 들어오기 성공");
		var mateCode=$("#mate_code").val();
		$.ajax({
			url:"/dorang/mate/mateReplySelect",
			data:{
				mate_code: mateCode
			},
			type:"GET",
			success:function(result){ //댓글 목록 불러오기
			var tableBody=$("#rtb tbody");
			tableBody.html('');
			$("#rCount").text("댓글("+result.length+")")
				if(result!=null){
						console.log(result);
						for(var i in result){
						var tr=$("<tr>");
						var Writer=$("<td width='100'>").text(result[i].user_code);
						var Content=$("<td>").text(result[i].content);
						var CreateDate=$("<td width='100'>").text(new Date(result[i].createAt).toLocaleDateString());
						var btnArea=$("<td width='80'>").append(
							"<a herf='modifyreply(mateCode)'>수정</a>").append(
							"<a href='#'>삭제</a>");
							
							tr.append(Writer);
							tr.append(Content);
							tr.append(CreateDate);
							tr.append(btnArea);
							tableBody.append(tr);
						}
					}
				},
			error:function(){
				console.log("댓글 목록 로드 실패!");
			}
		})
	}
	
});
