let signUp5 = {

	init : function(){
		
		popupManager.add('#noticeAgreePopup');
		
		this.registEvent();
	}
	,registEvent : function(){
		let _this = this;
		
		$('#noticeDisagreeBtn').on('click', function(){
			_this.updateNoticeAgree();
		});
		
		$('#noticeAgreeBtn').on('click', function(){
			_this.goLinkInfo();
		});
		
	}
	
	,updateNoticeAgree : function(){
		let _this = this;
		
		let params = JSON.stringify({});
		
		$.ajax({
				url : "/updateNoticeAgree"
				,contentType : 'application/json; charset=UTF-8'
				,dataType : "json"
				,data : params
				,type : "post"
				,async : false
				,timeoutDelay : 90000
				,success : function(result){
					if(result.result){
						_this.goLinkInfo();
					}
				}
				,error:function(request,status,error){
	    			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    		}
			});
		
	}
	
	,goLinkInfo : function(){
		window.location.href = "/personal/signUpComplete";
	}
	
	,removeEvent : function(){
		
	}
	,destroy : function(){
		
	}
}

$(document).ready(function(){
	signUp5.init();
})