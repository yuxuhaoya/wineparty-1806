jQuery(function(){
	   
	   //导航一级菜单的展开和隐藏
	   
	    $("#a_sw_nav").mouseover(function(){
			$("#all_nav").show();
		});
		$("#a_sw_nav").mouseout(function(){
			$("#all_nav").hide();
		});
	   //导航二级菜单的展开和隐藏
	   /*
	   jQuery(".i_list").mouseover(function(){
	  var child_count = jQuery(this).attr("child_count");
	if(child_count>0){
     var id=jQuery(this).attr("id");
     jQuery("#child_"+id).show();
	}
  }).mouseleave(function(){
	  var child_count = jQuery(this).attr("child_count");
	if(child_count>0){
     var id=jQuery(this).attr("id");
     jQuery("#child_"+id).hide();
	}
  });  */
  });