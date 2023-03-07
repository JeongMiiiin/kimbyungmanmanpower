let recentPost = {
	
	init : function(){
		
		this.registEvent();
	}
	,registEvent : function(){
	}
	
	,openView : function(sn){
		let _this = this;
		let params = JSON.stringify({workSn : sn});
		$.ajax({
			url : "/work/viewData"
			,contentType : 'application/json; charset=UTF-8'
			,dataType : "json"
			,data : params
			,type : "post"
			,async : false
			,timeoutDelay : 90000
			,success : function(result){
				if(result.result){
					_this.settingView(result.data);
				}
			}
			,error:function(request,status,error){
		    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
	}
	
	,settingView : function(data){
		$('.my_info_work_list_wrap').hide();
		$('.my_info_work_view_wrap').show();
		
		
		/*$('.popup_favorite_icon').removeClass('active');
		if(favoriteList.includes(data.sn)) $('.popup_favorite_icon').addClass('active'); 
		
		$('.popup_favorite_icon').attr('onclick', 'main.updateFavorite(' + data.sn + ', true)');
		
		$('#workViewTitle').text(data.title);
		
		let sexText = '무관';
		switch(data.sex){
			case 0 : sexText = '남'; break;
			case 1 : sexText = '여'; break;
			default : break;
		}
		
		$('#workViewSex').text(sexText);
		
		$('#workViewRegion').text(data.region);
		$('#workViewCategory').text(data.category);
		$('#workViewContents').text(data.contents);
		
		let startAMPM = parseInt((data.start_time).substring(0,2)) > 12 ? 'PM' : 'AM';
		let startDate = (data.start_date_str).substring(2, data.start_date_str.length) + '<br/>' + startAMPM + data.start_time;
		
		let endAMPM = parseInt((data.end_time).substring(0,2)) > 12 ? 'PM' : 'AM';
		let endDate = (data.end_date_str).substring(2, data.end_date_str.length) + '<br/>' + endAMPM + data.end_time;
		
		$('#workViewDate').find('> span').first().html(startDate);
		$('#workViewDate').find('> span').last().html(endDate);
		
		let payment = data.payment.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		
		$('#workViewPayment').text(payment);

		if(data.class_type == 0){
			$('#workApplyBtn').attr('onclick', 'main.insertApply(' + data.sn + ',' + data.class_type + ')');		
		} else {
			$('#workApplyBtn').attr('onclick', 'main.insertChat(' + data.sn + ',' + data.class_type + ')');
			$('#workApplyBtn').find('> span').text('연락하기');
		}*/
		
	}
	
	,removeEvent : function(){
		
	}
	,destroy : function(){
		
	}
}

$(document).ready(function(){
	recentPost.init();
})