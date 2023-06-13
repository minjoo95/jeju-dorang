 $(function(){

		  var textarea = $('#content');
		  var inputCount =$('.inputCount');

		  textarea.on('input', function() {
		    var maxLength = 150;
		    var remainingChars = maxLength - textarea.val().length;  

		    if (remainingChars <= 0) {
		      textarea.val(textarea.val().substring(0, maxLength)); 
		      remainingChars = 0;
		    }

		    $('#charCount').text(textarea.val().length);
		  });

		  textarea.on('keypress', function(e) {
		    if (textarea.val().length >= maxLength) {
		      e.preventDefault();
		    }
		  });
		  
		  inputCount.on('input',function(){
			  var maxLength = 30;
			  var remainingChars = maxLength - $(this).val().length;
			  if (remainingChars <= 0) {
				  $(this).val($(this).val().substring(0, maxLength)); 
			      remainingChars = 0;
			    }
			  $(this).next().find('#inputCount').text($(this).val().length); 
		  });
		  
		  
		
		  
		    /*datarange*/
	 		$('input[name="daterange"]').daterangepicker({
	 			    opens: 'left'
	 		}, function(start, end, label) {
	 			 console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
	 		});
		    
	 		/*사진 업로드*/
			$("#imageFile").on("change", function(event){
				var file = event.target.files[0];
				var reader = new FileReader();
				var fileMaxSize = 2 * 1024 * 1024;
				reader.onload = function(e) {
					
					
					if(file.size>fileMaxSize){
						alert("사진 사이즈는 2MB 이내로 등록 가능합니다.");
						$("#imageView").attr("src",defultImage);
					}else{
						$("#imageView").attr("src",e.target.result);
					}
				}
				reader.readAsDataURL(file);
			})
	    	
			
	    });
	  
function updateMate() {
			
			var tagSelectorAll = document.querySelectorAll('.tagSelector');
			var tagResult = "";
			tagSelectorAll.forEach(function(tag) {
				 var isChecked  = $(tag).is(":checked");
				 if(isChecked){
					 tagResult +=  $(tag).val() + "/";
				 }
			});
			tagResult = tagResult.replace(/\/$/, "");
			$("#tags").val(tagResult);
			
			
			var title = $("#title").val();
			var content = $("#content").val();
			var type = $('input:radio[name=type]:checked').val();
			var direction = $("select[name=direction]").val();
			var number = $("select[name=number]").val();
			var age =  $("select[name=age]").val();
			var gender =  $("select[name=gender]").val();
			var daterange = $('input[name="daterange"]').val();
			var tags = 	$("#tags").val();
			var status =  $('input:radio[name=status]:checked').val();
			var imageViewSrc = $("#imageView").attr("src");
			var first_ask = $('#first_ask').val();
			var second_ask = $('#second_ask').val();
			var third_ask = $('#third_ask').val();
		
			if(title ==null ||title.trim() === "" || content==null || content.trim() === ""||
			   type==null || direction==null || number ==null || age ==null|| gender==null ||
			   daterange == null || tags == null || status == null || 
			   first_ask == null || first_ask.trim() === "" || 
			   second_ask == null || second_ask.trim() === "" ||
			   third_ask == null || third_ask.trim() === ""
			){
				alert("모든 내용을 입력해주세요!");
			}else{
				document.mateForm.submit(); // 전송
			}

		}
	