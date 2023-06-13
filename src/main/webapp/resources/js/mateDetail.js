 $(function(){
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
	 			formData.submit(); 
	 		}else if (btn=='list') {
	 			formData.find("#mate_code").remove();
	 			formData.find("#user_code").remove();
				formData.attr("action", "/dorang/mate/list");
				formData.submit(); 
			}else if(btn=='delete'){
				  formData.attr("action", "/dorang/mate/delete");
				  formData.submit(); 
			}
	 		
	 		
	 	});    	
	});	 
	  
	  function mateApply(event) {
		      event.preventDefault();
		    
			 var frist_answer = $('#frist_answer').val();
		  	 var second_answer = $('#second_answer').val();
		  	 var third_answer = $('#third_answer').val();
		  	 var mate_code = $('#mate_code').val(); 
		  	 var user_code =$('#user_code').val(); 
		  	 
		  	 
		  	  var send_data = {
		  			"mate_code": mate_code,
		  			"user_code": user_code,
		  	  		"frist_answer": frist_answer,
		  	   		"second_answer": second_answer,
		  	    	"third_answer": third_answer 			 
		  	 };
		  	  
		  	 console.log(send_data);
		  	 if( frist_answer == null || frist_answer.trim() === "" || 
		  		 second_answer == null || second_answer.trim() === "" ||
		  		 third_answer == null || third_answer.trim() === ""){
		  		 
		  		      alert("모든 내용을 입력해주세요");
		  		      
		  	 }else{
		  		$.ajax({
		  		    url: "/dorang/mate/apply",
		  		    type: "POST",
		  		    contentType:"application/json",
		  		    data: JSON.stringify(send_data),//JSON문자열 생성
		  		    dataType: "text",
		  		    success: function(response) {
		  		        if (response === "success") {
		  		        	
		  		            $("#liveAlert").css("display", "block");
		  		            $("#liveAlertText").html("신청되었습니다! :)");
		  		        }else if (response === "already") {
		  		            $("#liveAlert").css("display", "block");
		  		             $(".alert-warning").removeClass("alert-warning").addClass("alert-danger");
		  		            $("#liveAlertText").html("이미 신청된 게시글입니다!");
		  		        }else{
		  		        	 $(".alert-warning").removeClass("alert-warning").addClass("alert-danger");
		  		            $("#liveAlert").css("display", "block");
				            $("#liveAlertText").html("오류가 발생했습니다.");
		  		        }
		  		    },
		  		  error : function(xhr,status,error) {
		  			console.log(status + ", " + error);
		  		  }
		  		}); 
		  	 }
		
		}   //mateApply
	  
	  function alertClose() {
		  $("#liveAlert").css("display", "none");
		  
	}
	