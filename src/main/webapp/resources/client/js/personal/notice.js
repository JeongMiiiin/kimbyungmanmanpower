let notice = {

	init : function(){
		
		this.registEvent();
	}
	,registEvent : function(){
		
		$('.notice_list_con').find(' > div').on('click',function(e){
				var clickList = $(this);
				var activeList = $('.notice_list_con').find(' > div.active');
				
				if(activeList.length > 0){
					activeList.find('.notice_list_contents_con').animate({height: 0}, {duration: 500, complete: function () {
						activeList.removeClass('active');
					}
					});
				}
				
				if(clickList.get(0) != activeList.get(0)){
					var autoHeight = clickList.find('.notice_list_contents_con').css('height', 'auto').height();
					clickList.addClass('active');
					clickList.find('.notice_list_contents_con').height(0).animate({height: autoHeight}, {duration: 500, complete: function () {
						clickList.find('.notice_list_contents_con').css('height','auto');
					}
					});
				}

			});
			
		$('.table_style_0').find('.table_link').on('click',function(e){
				var clickList = $(this);
				var activeList = $('.table_style_0').find('td.active');
				
				if(activeList.length > 0){
					activeList.find('.notice_list_contents_con').animate({height: 0}, {duration: 500, complete: function () {
						activeList.removeClass('active');
					}
					});
				}
				
				if(clickList.get(0) != activeList.get(0)){
					var autoHeight = clickList.find('.notice_list_contents_con').css('height', 'auto').height();
					clickList.addClass('active');
					clickList.find('.notice_list_contents_con').height(0).animate({height: autoHeight}, {duration: 500, complete: function () {
						clickList.find('.notice_list_contents_con').css('height','auto');
					}
					});
				}

			});
			
	}
	
	,removeEvent : function(){
		
	}
	,destroy : function(){
		
	}
}

$(document).ready(function(){
	notice.init();
})