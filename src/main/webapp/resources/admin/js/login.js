let login = {
	init : function(){
		$('#userId').focus();

		this.registEvent();
	}
	
	,registEvent : function(){
		let _this = this;
		
		$('#userId, #userPw').on('keyup',function(key) {
			if(key.keyCode == 13) {
				_this.onLogin();
            } else {
            	if($(this).val()) {
            		$(this).next().addClass('hidden');
            	}
            }
    	});
	}
	
	,onLogin : function(){
		let id = $.trim($('#userId').val());
		let pw = $.trim($('#userPw').val());
		
		if(!id) {
			$('#userId').next().removeClass('hidden').text('아이디를 입력해 주세요.');
			$('#userId').val('').focus();
			return false;
		} else if(!pw) {
			$('#userPw').next().removeClass('hidden').text('비밀번호를 입력해 주세요.');
			$('#userPw').val('').focus();
			return false;
		}
		
		$('.login_form_con').submit();
	}
	
	,removeEvent : function(){
		
	}
	
	,destroy: function(){
		
	}
}

$(document).ready(function(){
	login.init();
})
