let signUp3 = {

	completeBtn : null

	,init : function(){
		
		this.completeBtn = $('#signUp3CompleteBtn');
		
		this.registEvent();
	}
	,registEvent : function(){
		let _this = this;
		
		$('[name="businessName"]').on('keyup', function(key){
			if(key.keyCode == 13){
				_this.checkBusinessNum();
			}
		});
		
		$('[name="businessNum"]').on('keyup', function(key){
			$(this).val($(this).val().replace(/[^0123456789]/g,""));
			
			if(key.keyCode == 13){
				_this.checkBusinessNum();
			}
						
		});
		
		$('[name="representativeName"]').on('keyup', function(key){
			if(key.keyCode == 13){
				_this.checkBusinessNum();
			}
		});
		
		$(this.completeBtn).on('click', function(){
				_this.checkBusinessNum();
		})
		
	}
	
	,checkBusinessNum : function (){
		
		if($('#businessName').val() == null || $('#businessName').val() == ""){
			alert('상호명을 입력해주세요');
			$('#businessName').focus();
			return false;
		}
		
		if($('#businessNum').val() == null || $('#businessNum').val() == ""){
			alert('사업자 등록번호를 입력해주세요');
			$('#businessNum').focus();
			return false;
		}
		
		if($('#representativeName').val() == null || $('#representativeName').val() == ""){
			alert('대표자명을 입력해주세요');
			$('#representativeName').focus();
			return false;
		}
		
		// 사업자번호 "xxxxxxx" 로 조회 시
		let params = JSON.stringify({"businessName": $('#businessName').val(), "businessNum": $('#businessNum').val(), "representativeName": $('#representativeName').val()}); 
			   
			$.ajax({
			  url: "/business/certificateBusinessNum",
			  type: "POST",
			  data: params,
			  dataType: "JSON",
			  contentType: "application/json",
			  accept: "application/json",
			  success: function(result) {
			      console.log(result);
			      if(result.result){
					let data = result.data;
					switch(data){
						case "01" :
							location.href="/business/signUp?stepIdx=4";
							break;
						case "02" :
							alert('상호명이 일치하지 않습니다. 확인 후 다시 시도해주세요');
							$('#businessName').focus();
							break;
						case "03" :
							alert('상호명이 일치하지 않습니다. 확인 후 다시 시도해주세요');
							$('#businessName').focus();
							break;
						case "05" :
							alert('사업자 등록번호가 일치하지 않습니다. 확인 후 다시 시도해주세요');
							$('#businessNum').focus();
							break;
						case "12" :
							alert('대표자명이 일치하지 않습니다. 확인 후 다시 시도해주세요');
							$('#representativeName').focus();
							break;
						case "13" :
							alert('대표자명이 일치하지 않습니다. 확인 후 다시 시도해주세요');
							$('#representativeName').focus();
							break;
						case "22" :
							alert('대표자명이 일치하지 않습니다. 확인 후 다시 시도해주세요');
							$('#representativeName').focus();
							break;
						case "23" :
							alert('대표자명이 일치하지 않습니다. 확인 후 다시 시도해주세요');
							$('#representativeName').focus();
							break;
						case "32" :
							alert('대표자명이 일치하지 않습니다. 확인 후 다시 시도해주세요');
							$('#representativeName').focus();
							break;
						case "33" :
							alert('대표자명이 일치하지 않습니다. 확인 후 다시 시도해주세요');
							$('#representativeName').focus();
							break;
						case "42" :
							alert('대표자명이 일치하지 않습니다. 확인 후 다시 시도해주세요');
							$('#representativeName').focus();
							break;
						case "43" :
							alert('대표자명이 일치하지 않습니다. 확인 후 다시 시도해주세요');
							$('#representativeName').focus();
							break;
						default : 
							alert('인증에 실패했습니다. 잠시 후 다시 시도해주세요');
							break;
					}
				
					
			      } else {
					alert('인증에 실패했습니다. 확인 후 다시 시도해주세요');	
				  }
			      
			  },
			  error: function(result) {
			      console.log(result.responseText); //responseText의 에러메세지 확인
			  }
			});
	}
	
	,removeEvent : function(){
		
	}
	,destroy : function(){
		
	}
}

$(document).ready(function(){
	signUp3.init();
})