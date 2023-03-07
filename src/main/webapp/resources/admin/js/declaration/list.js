let declarationList = {
	
	keywordSelectVal : null
	
	,init : function(){
		this.keywordSelectVal = $('#keywordSelect').val();
		
		this.registEvent(); 	
	}
	
	,registEvent : function(){
		let _this = this;
		
		
		$('#keywordSelect').on('change', function(){
			if(_this.keywordSelectVal != $(this).val()){
				let target = $(this).attr('data-keyword-select');
				$('[data-keyword-input="' + target + '"]').attr('id', $(this).val());
				$('[data-keyword-input="' + target + '"]').attr('name', $(this).val());
				_this.keywordSelectVal = $(this).val();
			}
		});
	}
	
	,openPopup : function(category){
		popupManager.add('#declarationViewPopup');
		
		let reasonText;
		switch(category){
			case 1 : reasonText = "태도 불량"; break;
			case 2 : reasonText = "지각"; break;
			default : reasonText = "이행하지 않음"; break;
		}
		$('#declarationViewPopup').find('.popup_contents').text(reasonText);
		
	}
	
	,updateStatus : function(sn, workSn, recipientSn, status){
		
		let confirmMsg = '승인하시겠습니까?';
		
		if(status == 2){
			confirmMsg = '거절하시겠습니까?';
		}
		
		if(confirm(confirmMsg)){
			let params = JSON.stringify({sn : sn, workSn : workSn, recipientSn : recipientSn, status : status});

			$.ajax({
				url : "/adm/declaration/updateStatus"
				,contentType : 'application/json; charset=UTF-8'
				,dataType : "json"
				,data : params
				,type : "post"
				,async : false
				,timeoutDelay : 90000
				,success : function(result){
					if(result){
						alert('반영이 완료되었습니다.');
						window.location.reload();
					}
				}
				,error:function(request,status,error){
			    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			});
			
		}
		
	}
	
}

$(document).ready(function(){
	declarationList.init();
})