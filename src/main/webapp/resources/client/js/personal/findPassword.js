let findPassword = {

	findPasswordBtn : null
	,timerStatus : false

	,init : function(){
		this.findPasswordBtn = $('#findPasswordBtn');	
		this.registEvent();
	}
	,registEvent : function(){
		let _this = this;
		
		$(this.findPasswordBtn).on('click', function(){
			if(_this.sendStatus){
				_this.submitCertificationCode();
			} else {
				_this.certificateMsgSend();
			}
		})
		
	}
	
	,certificateMsgSend : function(){
		let _this = this;
		
		if($('#userName').val() == null || $('#userName').val() == ""){
			alert('이름을 입력해주세요');
			$('#userName').focus();
			return false;
		}
		
		if($('#phoneNum').val() == null || $('#phoneNum').val() == ""){
			alert('휴대전화번호를 입력해주세요');
			$('#phoneNum').focus();
			return false;
		}
		
		let params = JSON.stringify({userName : $('#userName').val(), phoneNum : $('#phoneNum').val()});
		$.ajax({
			url : "/passwordCertificationCodeSend"
			,contentType : 'application/json; charset=UTF-8'
			,dataType : "json"
			,data : params
			,type : "post"
			,async : false
			,timeoutDelay : 90000
			,success : function(result){
				
				if(result.result){
					_this.sendStatus = true;
					$('#certificationCodeCon').show();
					$(_this.findPasswordBtn).addClass('certificate')
					$(_this.findPasswordBtn).find("> span").text("확인");
					_this.startTimer();
					_this.timerStatus = true;	
				} else {
					alert('일치하는 정보가 없습니다. 확인 후 다시 시도해주세요');
				}
				
			}
			,error:function(request,status,error){
    			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
		});
		
	}
	
	,certificateMsgReSend : function(){
		let _this = this;
		
		if($('#userName').val() == null || $('#userName').val() == ""){
			alert('이름을 입력해주세요');
			$('#userName').focus();
			return false;
		}
		
		if($('#phoneNum').val() == null || $('#phoneNum').val() == ""){
			alert('휴대전화번호를 입력해주세요');
			$('#phoneNum').focus();
			return false;
		}
		
		let params = JSON.stringify({userName : $('#userName').val(), phoneNum : $('#phoneNum').val()});
		$.ajax({
			url : "/passwordCertificationCodeSend"
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
	
	        if (--timer < 0) {
	            clearInterval(_this.start);
	            _this.timerStatus = false;
	        }
	    }, 1000);
	}
	
	,submitCertificationCode : function(){
		let _this = this;
		
		if($('#userName').val() == null || $('#userName').val() == ""){
			alert('이름을 입력해주세요');
			$('#userName').focus();
			return false;
		}
		
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
			url : "/passwordSubmitCertificationCode"
			,contentType : 'application/json; charset=UTF-8'
			,dataType : "json"
			,data : params
			,type : "post"
			,async : false
			,timeoutDelay : 90000
			,success : function(result){
				if(result.result){
					clearInterval(_this.start);
					_this.settingTempPassword();
				} else {
					alert('인증번호가 다릅니다')
				}
			}
			,error:function(request,status,error){
    			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
		});
		
	}
	
	,settingTempPassword : function(){
		let params = JSON.stringify({userName : $('#userName').val(), phoneNum : $('#phoneNum').val()});
		$.ajax({
			url : "/settingTempPassword"
			,contentType : 'application/json; charset=UTF-8'
			,dataType : "json"
			,data : params
			,type : "post"
			,async : false
			,timeoutDelay : 90000
			,success : function(result){
				if(result.result){
					$('.find_pass_toast_con').addClass('active');
					setTimeout(function(){
						$('.find_pass_toast_con').removeClass('active');
					},1000);
					setTimeout(function(){
						location.href="/personal/login";
					},1000);
				} else {
					
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
	findPassword.init();
})