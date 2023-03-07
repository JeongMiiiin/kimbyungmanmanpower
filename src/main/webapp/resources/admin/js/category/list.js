let categoryList = {
	
	
	init : function(){
		this.registEvent(); 	
	}
	
	,registEvent : function(){
		let _this = this;
		
	}
	
	,updateStatus : function(sn, status){
		
		if(confirm('상태 변경하시겠습니까?')){
			let params = JSON.stringify({sn : sn, status : status});

			$.ajax({
				url : "/adm/category/updateStatus"
				,contentType : 'application/json; charset=UTF-8'
				,dataType : "json"
				,data : params
				,type : "post"
				,async : false
				,timeoutDelay : 90000
				,success : function(result){
					if(result){
						alert('변경되었습니다.');
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
	categoryList.init();
})