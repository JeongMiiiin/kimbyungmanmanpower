let memberUpdate = {
	
	zipCodeBtn : null
	,zipCodeWrap : null
	,emailDomainSelect : null
	
	,init : function(){
		this.zipCodeBtn = $('.zip_code_popup_btn');
		this.zipCodeWrap = document.getElementById('zipCodeWrap');
		
		this.zipCodeWrap.style.display = 'none';
		
		this.emailDomainSelect = $('[name="emailDomain"]');
		
		this.registEvent(); 	
	}
	,registEvent : function(){
		let _this = this;

		$('#zipCode').on('click', function(){
			_this.zipCodeBtn.trigger('click');
		});
		
		$(this.zipCodeBtn).on('click', function(){
			_this.findZipCode();	
		});
		
		$('[name="email1"]').on('focus', function(){
			if($(_this.emailDomainSelect).val() != '직접선택') $(_this.emailDomainSelect).focus();
		});
		
		
		$(this.emailDomainSelect).on('change', function(){
			if($(this).val() != '직접선택'){
				$('[name="email1"]').val($(this).val());
			}
		});
	}
	
	,findZipCode : function(){
		let _this = this;
		
		let currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
		new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            let roadAddr = data.roadAddress; // 도로명 주소 변수
	            let jibunAddr = data.jibunAddress; // 지번 주소 변수
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('zipCode').value = data.zonecode;
	            if(roadAddr !== ''){
	                document.getElementById("address0").value = roadAddr;
	            } 
	            else if(jibunAddr !== ''){
	                document.getElementById("address0").value = jibunAddr;
	            }

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                _this.zipCodeWrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                
                $('#address1').focus();
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
				if(size.width <= _this.zipCodeWrap.clientWidth){
					_this.zipCodeWrap.style.width = '100%';
				}
	
                _this.zipCodeWrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(_this.zipCodeWrap);
		
		
		 // iframe을 넣은 element를 보이게 한다.
        _this.zipCodeWrap.style.display = 'block';
	}
	
	,closeZipCode : function(){
		this.zipCodeWrap.style.display = 'none';
	}
	
	,removeEvent: function(){
		
	}
	,destroy: function(){
		
	}
}

$(document).ready(function(){
	memberUpdate.init();
})