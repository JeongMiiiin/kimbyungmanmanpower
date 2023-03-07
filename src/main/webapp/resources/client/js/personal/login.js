let login = {

	init : function(){
		
		$('.header_x_icon').attr('onclick', '');
		$('.header_x_icon').attr('href','/personal/main');
		
		this.registEvent();
	}
	,registEvent : function(){
		let _this = this;
		
		$('#phoneNum').on('keyup', function(){
			if($(this).val().length > 11){
				$(this).val($(this).val().slice(0, 11));
			}
			
		});
		
		$('#userPw').on('keyup',function(key) {
			if($(this).val().length > 5){
				$('a[onclick="login.formSubmit()"]').addClass('active');
			} else {
				$('a[onclick="login.formSubmit()"]').removeClass('active');
			}
			
			if(key.keyCode == 13) {
				_this.formSubmit();
            }
    	});
		
	}
	
	,formSubmit : function(){
		if($('#phoneNum').val() == null || $('#phoneNum').val() == ""){
			alert("휴대전화번호를 입력해주세요");
			$('#phoneNum').focus();
			return false;
		}
		
		if($('#userPw').val() == null || $('#userPw').val() == ""){
			alert("비밀번호를 입력해주세요");
			$('#userPw').focus();
			return false;
		}
		
		$("#personalLoginForm").submit();
		
	}
	
	,removeEvent : function(){
		
	}
	,destroy : function(){
		
	}
}

$(document).ready(function(){
	login.init();
})