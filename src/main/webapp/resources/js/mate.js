$(document).ready(function(){
	//alert("js에 들옹기 성공");
	
	//바로 list 보여주기
	getReplyList();
		
	 var tags=$("#tags_strings").html();
	 var tagList = tags.split('/');
	 var tags_label = $("#tags_list label"); 
	 
	
	 for(var i=0; i<tagList.length;i++){
		tags_label.eq(i).text("#" + tagList[i]); 
		console.log(tags_label.eq(i).text());
	 }
	 
	 $("button").on("click", function(e){
		 
 		var formData=$("#frm");
 		
 		var btn=$(this).data("btn"); // data-btn="list"
 		
 		if(btn=='update'){
 			formData.attr("action", "/dorang/mate/updateForm");
 		}else if (btn=='list') {
 			formData.find("#mate_code").remove();
 			formData.find("#user_code").remove();
			formData.attr("action", "/dorang/mate/writelist");
		}else if(btn=='delete'){
			formData.attr("action", "/dorang/mate/delete");
		 	formData.submit(); 
		}
 		
 		
 	});    
 	//-------------------------------------------------------------------------------------------------
	

	//댓글 insert
	$(".mate_reply_btn").click(function(){
		//alert("insert 들어오기 성공");
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
			})//ajax
	});//click함수

});//전체

	//댓글 목록 select
	function getReplyList(){
		//alert("select 들어오기 성공");
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
						(function(i){
						var tr=$("<tr>");
						console.log(result[i].user_pic);
						if(result[i].user_pic.indexOf('kakao') > -1) {
							var Pic = $("<td width='100'>").append("<img src=" + result[i].user_pic + ">");
						} else {
							var Pic = $("<td width='100'>").append("<img src=/dorang/resources/uploadProfilePic/" + result[i].user_pic + ">");
						}
						var Writer=$("<td width='100'>").text(result[i].user_nickname);
						var Content=$("<td id='contentID"+ result[i].comment_code +"'>").text(result[i].content);
						var CreateDate=$("<td width='100'>").text(new Date(result[i].createAt).toLocaleDateString());
						var btnArea = $("<td width='80'>");
						var input=$("<input type='hidden' name='result[i].comment_code' id='comment_id' value=''>");
						
						var modifyLinkBtn=$("<button>수정</button>");
						modifyLinkBtn.click(function(){
							modifyLink(result[i].comment_code);
						});//modifyLinkBtn
						
						var deleteLinkBtn=$("<button>삭제</button>");
						deleteLinkBtn.click(function(){
							deleteLink(result[i].comment_code);
						});//deleteLink
						
						btnArea.append(modifyLinkBtn).append(deleteLinkBtn);
							
							tr.append(Pic);
							tr.append(Writer);
							tr.append(Content);
							tr.append(CreateDate);
							tr.append(btnArea);
							tableBody.append(tr);
							})(i);
						}//for
					}//if
			},
			error:function(){
				console.log("댓글 목록 로드 실패!");
			}
		})//ajax
		
		};//getReplyList함수

		//수정 할 댓글 하나 가져오기
		function modifyLink(comment_code) {
			//alert("댓글 수정 시작");
			console.log("댓글 수정 시작 : "+comment_code);
			var contentElement=$('#contentID'+comment_code);
			var originalContent=contentElement.text().trim();
			var inputField=$("<input type='text'>");
			inputField.val(originalContent);
			console.log(inputField);
			
			var saveButton=$("<button>저장</button>");
			saveButton.click(function(){
				var newContent=inputField.val().trim();
				if(newContent!=originalContent){
					modifyDo(comment_code,newContent);
				}else{
					console.log("업데이트 실패");
				}
				});
				contentElement.empty();
				contentElement.append(inputField).append(saveButton);
		}//modifyLink 함수
		
		//댓글 수정
		function modifyDo(comment_code, newContent){
			//alert("찐으로 수정");
			console.log(comment_code);
			console.log(newContent);
			$.ajax({
				url:"/dorang/mate/mateReplyUdate",
				type:"POST",
				data:{
					comment_code:comment_code,
					content:newContent
				},
				success:function(){
					getReplyList();
					console.log("수정 성공");
				},
				error: function(){
					concole.log("수정 실패");
				}
			})
		};
			
		//댓글 삭제
		function deleteLink(comment_code){
			//alert("delete 들어오기 성공");
			//alert("찐으로 삭제");
			console.log(comment_code);
			$.ajax({
				url:"/dorang/mate/mateReplyDelete",
				type:"POST",
				data:{
					comment_code:comment_code,
				},
				success:function(){
					getReplyList();
					console.log("삭제 성공");
				},
				error: function(){
					concole.log("삭제 실패");
				}
			})//ajax
		};//deleteReply함수
