let intro = {

	init : function(){
		
		if(window.innerWidth > 992){
			popupManager.add('#introPcPopup');
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
	intro.init();
})