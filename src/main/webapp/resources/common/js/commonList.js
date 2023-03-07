var commonList = {
	
	filterForm : null
	,filterBtn : null
	
	,init : function(){
		this.filterForm = $('[data-common-filter-form]');
		this.filterBtn = $('[data-common-filter-btn]');
		
		if($(".admin_pagination_style_0").length > 0){
			$(".admin_pagination_style_0 li a").each(function(){
				var idx = $(this).parent().index();
				var thistitle = $(this).attr("title");
									
									
				if(thistitle == pagingActiveIndex){
					$(".admin_pagination_style_0").find("li").eq(idx).addClass("selected");
					}
			});	
		}
		
		if($(".pagination_style_0_con").length > 0){
			$(".pagination_style_0_con li a").each(function(){
				var idx = $(this).parent().index();
				var thistitle = $(this).attr("title");
									
									
				if(thistitle == pagingActiveIndex){
					$(".pagination_style_0_con").find("li").eq(idx).addClass("selected");
					}
			});	
		}
				
		this.registEvent(); 
	}
	,registEvent : function(){
		let _this = this;
		
		$(this.filterBtn).on('click', function(){
			$(_this.filterForm).submit();

		});
		
	}
	
	,fn_go_page : function(pageNo){
		let _this = this;
		
		$("#pageIndex").val(pageNo);
		$(_this.filterForm).submit();
		return false;
	}
	
	,removeEvent : function(){
		
	}
	,destroy : function(){
		
	}
}