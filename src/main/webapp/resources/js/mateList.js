 $(function(){
	
	  $(".tags_strings").each(function() {
      var tags = $(this).html();
      var tagList = tags.split('/');
      var tags_label = $(this).closest(".card").find("#tags_list label");
      for (var i = 0; i < tagList.length; i++) {
        tags_label.eq(i).text("#" + tagList[i]);
      }
    });
 
  });