let signUp2 = {

	completeBtn : null
	,sendStatus : false
	,timerStatus : false
	,certificateStatus : false

	,init : function(){
		
		this.completeBtn = $('#signUp2CompleteBtn');
		
		this.registEvent();
	}
	,registEvent : function(){
		let _this = this;
		
		$('#phoneNum').on('keyup', function(key){
			$(this).val($(this).val().replace(/[^0-9]/g,""));
			
			if($(this).val() != '' && !_this.sendStatus){
				$('#signUp2CompleteBtn').addClass('active');
				$('.sign_up_phone_num_delete_btn').show();	
			} else {
				$('.sign_up_phone_num_delete_btn').hide();
			}
			
			if(key.keyCode == 13){
				if(_this.sendStatus){
					_this.submitCertificationCode();
				} else {
					_this.sendMsg();
				}
			}
			
		})
		
		$('.sign_up_phone_num_delete_btn').on('click', function(){
			$('#phoneNum').val('');
			$(this).hide();
		});
		
		$('[name="submitCode"]').on('keyup',function(key){
			if(key.keyCode == 13){
				_this.submitCertificationCode();
			}
		});
		
		$(this.completeBtn).on('click', function(){
			if(_this.sendStatus){
				_this.submitCertificationCode();
			} else {
				_this.sendMsg();
			}
		});
		
	}
	
	,sendMsg : function(){
		let _this = this;
		
		if($('#phoneNum').val() == null || $('#phoneNum').val() == "" || $('#phoneNum').val().length < 10){
			alert('휴대전화번호를 입력해주세요');
			$('#phoneNum').focus();
			return false;
		}
		
		let params = JSON.stringify({userName : "회원가입자", phoneNum : $('#phoneNum').val()});
		$.ajax({
			url : "/certificationCodeSend"
			,contentType : 'application/json; charset=UTF-8'
			,dataType : "json"
			,data : params
			,type : "post"
			,async : false
			,timeoutDelay : 90000
			,success : function(result){
				if(result.result == 1){
					$('#certificationCodeCon').show();
					_this.startTimer();
					_this.sendStatus = true;
					$('.sign_up_phone_num_delete_btn').hide();
					_this.timerStatus = true;
					$(_this.completeBtn).find('> span').text('확인');	
				} else if(result.result == 2){
					alert('해당 번호의 계정이 있습니다. 다시 한번 확인해주세요.');
				} else {
					alert('오류가 발생했습니다. 잠시 후 다시 시도해주세요.');
				}
			}
			,error:function(request,status,error){
    			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
		});
		
	}
	
	,reSendMsg : function(){
		let _this = this;
		
		if($('#phoneNum').val() == null || $('#phoneNum').val() == ""){
			alert('휴대전화번호를 입력해주세요');
			$('#phoneNum').focus();
			return false;
		}
		
		let params = JSON.stringify({userName : "회원가입자", phoneNum : $('#phoneNum').val()});
		$.ajax({
			url : "/certificationCodeSend"
			,contentType : 'application/json; charset=UTF-8'
			,dataType : "json"
			,data : params
			,type : "post"
			,async : false
			,timeoutDelay : 90000
			,success : function(result){
				clearInterval(_this.start);
				_this.startTimer();
				_this.sendStatus = true;
				$('.sign_up_phone_num_delete_btn').hide();
				_this.timerStatus = true;
			}
			,error:function(request,status,error){
    			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
		});
		
	}
	
	,startTimer : function(){
		let _this = this;
		
		let timer = 180;
		this.start = setInterval(function () {
	        minutes = parseInt(timer / 60, 10);
	        seconds = parseInt(timer % 60, 10);
	
	        minutes = minutes < 10 ? "0" + minutes : minutes;
	        seconds = seconds < 10 ? "0" + seconds : seconds;
	
	        document.querySelector('#timerText').textContent = minutes + ":" + seconds;
	
	        if (--timer < 0 || !_this.timerStatus) {
	            clearInterval(_this.start);
	            _this.timerStatus = false;
	        }
	    }, 1000);
	}
	
	,submitCertificationCode : function(){
		
		let _this = this;
		
		if($('#phoneNum').val() == null || $('#phoneNum').val() == ""){
			alert('휴대전화번호를 입력해주세요');
			$('#phoneNum').focus();
			return false;
		}
		
		if($('#submitCode').val() == null || $('#submitCode').val() == ""){
			alert('인증번호를 입력해주세요');
			$('#submitCode').focus();
			return false;
		}
		
		let params = JSON.stringify({phoneNum : $('#phoneNum').val(), submitCode : $('#submitCode').val()});
		$.ajax({
			url : "/submitCertificationCode"
			,contentType : 'application/json; charset=UTF-8'
			,dataType : "json"
			,data : params
			,type : "post"
			,async : false
			,timeoutDelay : 90000
			,success : function(result){
				if(result.result){
					location.href="/personal/signUp?stepIdx=3";
				} else {
					alert('인증번호가 다릅니다.')
				}
			}
			,error:function(request,status,error){
    			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
		});
	}
	
	,removeEvent : function(){
		
	}
	,destroy : function(){
		
	}
}

$(document).ready(function(){
	signUp2.init();
})