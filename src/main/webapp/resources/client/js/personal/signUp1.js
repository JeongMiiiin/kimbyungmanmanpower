let signUp1 = {

	checkAllBtn : null

	,init : function(){
		
		this.checkAllBtn = $('#checkAll');
		
		this.registEvent();
	}
	,registEvent : function(){
		let _this = this;
		$('#termsOfService').on('click', function(){
			if($(this).prop('checked') && $('#privacyUsageAgree').prop('checked') ){
				$('a[onclick="signUp1.nextStep()"]').addClass('active');
				if($('#locationUsageAgree').prop('checked')) $(_this.checkAllBtn).prop('checked', true);
			} else {
				$('a[onclick="signUp1.nextStep()"]').removeClass('active');
				$(_this.checkAllBtn).prop('checked', false);
			}
		});
		
		$('#privacyUsageAgree').on('click', function(){
			if($(this).prop('checked') && $('#termsOfService').prop('checked') ){
				$('a[onclick="signUp1.nextStep()"]').addClass('active');
				if($('#locationUsageAgree').prop('checked')) $(_this.checkAllBtn).prop('checked', true);	
			} else {
				$('a[onclick="signUp1.nextStep()"]').removeClass('active');
				$(_this.checkAllBtn).prop('checked', false);	
			}
		});
		
		$('#locationUsageAgree').on('click', function(){
			if($(this).prop('checked') && $('#termsOfService').prop('checked') && $('#privacyUsageAgree').prop('checked')){
				$(_this.checkAllBtn).prop('checked', true);
			} else {
				$(_this.checkAllBtn).prop('checked', false);
			}
		});
		
		$(this.checkAllBtn).on('click', function(){
			_this.checkAllEvent($(this).prop('checked'));
		});
		
	}
	
	,checkAllEvent : function(checked){
		if(checked){
			$('#termsOfService').prop('checked', true);
			$('#privacyUsageAgree').prop('checked', true);
			$('#locationUsageAgree').prop('checked', true);
			$('a[onclick="signUp1.nextStep()"]').addClass('active');
		} else {
			$('#termsOfService').prop('checked', false);
			$('#privacyUsageAgree').prop('checked', false);
			$('#locationUsageAgree').prop('checked', false);
			$('a[onclick="signUp1.nextStep()"]').removeClass('active');
		}
	}
	
	,nextStep : function(){
		if( !$('#termsOfService').prop('checked') ){
			alert('이용약관에 동의해주세요');
			return false;
		}
		
		if( !$('#privacyUsageAgree').prop('checked') ){
			alert('개인정보 수집 이용에 동의해주세요');
			return false;
		}
		
		location.href="/personal/signUp?stepIdx=2";
		
	}
	
	,removeEvent : function(){
		
	}
	,destroy : function(){
		
	}
}

$(document).ready(function(){
	signUp1.init();
})