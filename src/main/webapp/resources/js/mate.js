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
						var tr=$("<tr id='mate_reply_tr'>");
						if(result[i].user_pic.indexOf('kakao') > -1) {
							var Pic = $("<span class='mate_reply_top'><td>").append("<img src=" + result[i].user_pic + " id='mate-reply-profile-pic'>");
						} else {
							var Pic = $("<span class='mate_reply_top'><td>").append("<img src=/dorang/resources/uploadProfilePic/" + result[i].user_pic + " id='mate-reply-profile-pic'>");
						}
						var Writer=$("<span class='mate_reply_top' id='mate-reply-profile-writer'><td>").text(result[i].user_nickname);
						var Content=$("<div class='contentID'><td id='contentID"+ result[i].comment_code +"'>").text(result[i].content);
						var CreateDate=$("<span class='mate_reply_top' id='mate-reply-profile-date'><td>").text(new Date(result[i].createAt).toLocaleDateString());
						var btnArea = $("<span class='mate_reply_top mate_reply_bttn'><td><div class='mate_reply_dropdown'> <i id='mate_reply_menu_icon' class='mate_reply_menu_icon fa-solid fa-ellipsis-vertical' onclick='dropdown(event)'></i>");
						var input=$("<div><input type='hidden' name='result[i].comment_code' id='comment_id' value=''>");
						
						// 드롭다운 영역 한꺼번에 추가( 컨테이너{수정버튼+삭제버튼) }
						var modify_dropdown_contents = $("<div class='reply_dropdown_background'><div class='reply_dropdown_content'><button class='reply_dropdown_btns' id='reply_dropdown_modifyBtn' onclick='modifyMateReplyFunction(event)'>수정</button><button class='reply_dropdown_btns' id='reply_dropdown_deleteBtn' onclick='deleteMateReplyFunction(event)'>삭제</button><input type='hidden' id='hiddenMateReplyCode' value='" + result[i].comment_code + "'></div></div>");
						
						btnArea.append(modify_dropdown_contents);
							
							tr.append(Pic);
							tr.append(Writer);
							tr.append(CreateDate);
							tr.append(btnArea);
							tr.append(Content);
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
		
		
		// 댓글 수정
		function modifyMateReplyFunction(e) {
			console.log($(e.target).closest('.reply_dropdown_content').find('#hiddenMateReplyCode').val());
			var hiddenReplyCommentCode = $(e.target).closest('.reply_dropdown_content').find('#hiddenMateReplyCode').val();
			modifyLink(hiddenReplyCommentCode);
		}
		
		// 댓글 삭제
		function deleteMateReplyFunction(e) {
			console.log($(e.target).closest('.reply_dropdown_content').find('#hiddenMateReplyCode').val());
			var hiddenReplyCommentCode = $(e.target).closest('.reply_dropdown_content').find('#hiddenMateReplyCode').val();
			deleteLink(hiddenReplyCommentCode);
		}
		
		// dropdown open
		function dropdown(e) {
			event.stopPropagation();
			if ($(e.target).closest('.mate_reply_top').find('.reply_dropdown_content').is(':visible')) {
				$(e.target).closest('.mate_reply_top').find('.reply_dropdown_content').hide();
			} else {
				$(e.target).closest('.mate_reply_top').find('.reply_dropdown_content').show();
			}
		}
		
		// dropdown close
		$(document).click(function(e) {
			var targetE = e.target;
			if(!$(targetE).closest('.reply_dropdown_content').length && !$(targetE).hasClass('reply_dropdown_content')) {
				$('.reply_dropdown_content').hide();
			}
		});
		

		//수정 할 댓글 하나 가져오기
		function modifyLink(comment_code) {
			//alert("댓글 수정 시작");
			$('.reply_dropdown_content').hide();
			
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
			$('.reply_dropdown_content').hide();
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