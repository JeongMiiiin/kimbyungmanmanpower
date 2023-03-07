const serviceCenter = {

	init : function(){
		
		let headerPcTabActiveTarget = $('.header_pc_list > ul > li').eq(headerPcTabIdx);
		$('.header_pc_list > ul > li').removeClass('active');
		headerPcTabActiveTarget.addClass('active');
		
		$('.header_pc_list > a').attr('href','javascript:void(0)');
		$('.header_pc_list > a > span').text($(headerPcTabActiveTarget).find('> a > span').text());
		
		this.registEvent();
	}
	,registEvent : function(){
		let _this = this;
			
	}
	
	,removeEvent : function(){
		
	}
	,destroy : function(){
		
	}
}

$(document).ready(function(){
	serviceCenter.init();
})