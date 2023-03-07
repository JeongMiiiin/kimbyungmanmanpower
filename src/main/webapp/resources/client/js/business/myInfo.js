let myInfo = {
	
	phoneStatus : true
	,phoneVal : ""
	,businessStatus : true
	,businessNameVal : ""
	,representativeNameVal : ""
	,businessNumVal : ""
	
	,init : function(){
		this.phoneVal = $('[name="phoneNum"]').val();
		this.businessNameVal = $('[name="name"]').val();
		this.representativeVal = $('[name="representativeName"]').val();
		this.businessNumVal = $('[name="businessNum"]').val();
		
		this.registEvent();
	}
	,registEvent : function(){
		let _this = this;
		
		$('[name="phoneNum"]').on('keyup', function(){
			$(this).val($(this).val().replace(/[^0-9]/g,""));
			
			if(_this.phoneVal != $(this).val()){
				_this.phoneStatus = false;
			} else {
				_this.phoneStatus = true;
			}
			
		});
		
		$('[name="name"]').on('keyup', function(){
			
			if(_this.businessNameVal != $(this).val()){
				_this.businessStatus = false;
			} else {
				_this.businessStatus = true;
			}
			
		});
		
		$('[name="representativeName"]').on('keyup', function(){
			
			if(_this.representativeNameVal != $(this).val()){
				_this.businessStatus = false;
			} else {
				_this.businessStatus = true;
			}
			
		});
		
		$('[name="businessNum"]').on('keyup', function(){
			$(this).val($(this).val().replace(/[^0123456789]/g,""));
			
			if(_this.businessNumVal != $(this).val()){
				_this.businessStatus = false;
			} else {
				_this.businessStatus = true;
			}
			
		});

	}
	
	,certificatePhoneNum : function(){
		let _this = this;
		
		if(confirm('재인증하시겠습니까?')){
			_this.phoneStatus = true;
			alert('인증이 완료되었습니다.');	
		}
		
		/*let params = JSON.stringify({"phoneNum": $('#phoneNum').val()});
		
		$.ajax({
			url : "/business/myInfo/certificatePhoneNum"
			,contentType : 'application/json; charset=UTF-8'
			,dataType : "json"
			,data : params
			,type : "post"
			,async : false
			,timeoutDelay : 90000
			,success : function(result){
				if(result.result){
					_this.phoneStatus = true;
					alert('인증이 완료되었습니다.');
				} else {
					alert('인증에 실패했습니다. 확인 후 다시 시도해주세요');
				}
			}
			,error:function(request,status,error){
    			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
		});*/
		
	}
	
	
	,certificateBusinessNum : function(){
		let _this = this;
		
		if(confirm('재인증하시겠습니까?')){
			
			// 사업자번호 "xxxxxxx" 로 조회 시
			let params = JSON.stringify({"businessName": $('[name="name"]').val(), "businessNum": $('#businessNum').val(), "representativeName": $('[name="representativeName"]').val()});
			
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
							_this.businessStatus = true;
							_this.businessNumVal = $('#businessNum').val();
							_this.businessNameVal = $('[name="name"]').val();
							_this.representativeVal = $('[name="representativeName"]').val();
							alert('인증이 완료되었습니다.');
							break;
						case "02" :
							alert('상호명이 일치하지 않습니다. 확인 후 다시 시도해주세요');
							$('[name="name"]').focus();
							break;
						case "03" :
							alert('상호명이 일치하지 않습니다. 확인 후 다시 시도해주세요');
							$('[name="name"]').focus();
							break;
						case "05" :
							alert('사업자 등록번호가 일치하지 않습니다. 확인 후 다시 시도해주세요');
							$('#businessNum').focus();
							break;
						case "12" :
							alert('대표자명이 일치하지 않습니다. 확인 후 다시 시도해주세요');
							$('#[name="representativeName"]').focus();
							break;
						case "13" :
							alert('대표자명이 일치하지 않습니다. 확인 후 다시 시도해주세요');
							$('[name="representativeName"]').focus();
							break;
						case "22" :
							alert('대표자명이 일치하지 않습니다. 확인 후 다시 시도해주세요');
							$('[name="representativeName"]').focus();
							break;
						case "23" :
							alert('대표자명이 일치하지 않습니다. 확인 후 다시 시도해주세요');
							$('[name="representativeName"]').focus();
							break;
						case "32" :
							alert('대표자명이 일치하지 않습니다. 확인 후 다시 시도해주세요');
							$('#representativeName').focus();
							break;
						case "33" :
							alert('대표자명이 일치하지 않습니다. 확인 후 다시 시도해주세요');
							$('[name="representativeName"]').focus();
							break;
						case "42" :
							alert('대표자명이 일치하지 않습니다. 확인 후 다시 시도해주세요');
							$('[name="representativeName"]').focus();
							break;
						case "43" :
							alert('대표자명이 일치하지 않습니다. 확인 후 다시 시도해주세요');
							$('[name="representativeName"]').focus();
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
		
	}
	
	,updateMyInfo : function(){
		let _this = this;
		if(confirm('변경하시겠습니까?')){
			if(!_this.phoneStatus){
				alert('휴대전화 재인증 진행해주시기 바랍니다.');
				return false;
			}
			
			if(!_this.businessStatus){
				alert('사업자 등록번호 인증 진행해주시기 바랍니다.');
				return false;
			}
			
			$('#updateMyInfoForm').submit();
		}
	}
	
	,removeEvent : function(){
		
	}
	,destroy : function(){
		
	}
}

$(document).ready(function(){
	myInfo.init();
	moveActiveRowScroll($('.my_info_tab_list_con'), $('.my_info_tab_list_con > li.active'))
	
})