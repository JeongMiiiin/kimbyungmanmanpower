let appealManage = {
	
	updateStatus : false
	,updateSn : -1
	
	,init : function(){
		
		this.registEvent();
	}
	,registEvent : function(){
	}
	
	,openPopup : function(target){
		this.updateSn = -1;
		this.updateStatus = false;
		popupManager.add('#appealManageUpdatePopup');
		$('#title').val('');
		$('#contents').val('');
		if(target != null){
			this.settingUpdateContent(target);
		}
	}
	
	,settingUpdateContent : function(target){
		this.updateStatus = true;
		this.updateSn = $(target).attr('data-appeal-sn');
		$('#title').val($(target).find('.appeal_list_title').text());
		$('#contents').val($(target).find('.appeal_list_contents').text());
	}
	
	,submitPopup : function(){
		let _this = this;
		
		
		if($('#title').val() == null || $('#title').val() == ""){
			alert('제목을 입력해주세요');
			$('#title').focus();
			return false;
		}
		
		if($('#contents').val() == null || $('#contents').val() == ""){
			alert('내용을 입력해주세요');
			$('#contents').focus();
			return false;
		}
		
		
		if(confirm('반영하시겠습니까?')){
			let params = JSON.stringify({title : $('#title').val(), contents : $('#contents').val()});
			if(_this.updateStatus){
				params = JSON.stringify({sn : _this.updateSn, title : $('#title').val(), contents : $('#contents').val()});	
			}
			
			$.ajax({
				url : "/appeal/updateAppeal"
				,contentType : 'application/json; charset=UTF-8'
				,dataType : "json"
				,data : params
				,type : "post"
				,async : false
				,timeoutDelay : 90000
				,success : function(result){
					if(result.result){
						if(_this.updateStatus){
							alert('변경되었습니다.');
						} else {
							alert('등록되었습니다.');
						}
						
						popupManager.removePopLatest(true);
						window.location.reload();
					}
				}
				,error:function(request,status,error){
	    			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    		}
			});			
		}

	}
	
	,deleteData : function(sn){
		if(confirm('삭제하시겠습니까?')){
			let params = JSON.stringify({sn : sn});
			
			$.ajax({
				url : "/appeal/deleteAppeal"
				,contentType : 'application/json; charset=UTF-8'
				,dataType : "json"
				,data : params
				,type : "post"
				,async : false
				,timeoutDelay : 90000
				,success : function(result){
					if(result.result){
						alert('삭제되었습니다.');
						
						popupManager.removePopLatest(true);
						window.location.reload();
					}
				}
				,error:function(request,status,error){
	    			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    		}
			});
		}
	}
	
	,removeEvent : function(){
		
	}
	,destroy : function(){
		
	}
}

$(document).ready(function(){
	appealManage.init();
	moveActiveRowScroll($('.my_info_tab_list_con'), $('.my_info_tab_list_con > li.active'))
	
})