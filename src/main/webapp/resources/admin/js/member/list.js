let memberList = {
	
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
	
	,updateApprove : function(sn, isApproved){
		
		let confirmMsg = '승인하시겠습니까?';
		
		if(status == -1){
			confirmMsg = '거절하시겠습니까?';
		}
		
		if(confirm(confirmMsg)){
			let params = JSON.stringify({memberSn : sn, isApproved : isApproved});

			$.ajax({
				url : "/adm/member/updateApprove"
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
					} else {
						alert('오류가 발생했습니다. 잠시 후 다시 시도해주세요');
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
	memberList.init();
})