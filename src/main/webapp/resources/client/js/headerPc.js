let headerPc = {

	init : function(){
		
		if(typeof(headerPcIdx) != 'undefined' && headerPcIdx != null){
			$('.header_pc_con .menu_list').find('> li').eq(headerPcIdx).addClass('active');
			$('.header_pc_con .menu_list').find('> li').eq(headerPcIdx).find('> a').attr('href', 'javascript:void(0)')
		}
		
		this.registEvent();
	}
	,registEvent : function(){
		
	}
	
	,removeEvent : function(){
		
	}
	,destroy : function(){
		
	}
}

$(document).ready(function(){
	headerPc.init();
})