let signUp4 = {

	zipCodeBtn : null
	,zipCodeWrap : null
	,passwordStatus : false
	,confirmPasswordStatus : false
	,emailDomainSelect : null
	,signaturePad : null
	,bankName : ""
	,bankNum : ""
	,bankStatus : true

	,init : function(){
		
		this.zipCodeBtn = $('.zip_code_popup_btn');
		this.zipCodeWrap = document.getElementById('zipCodeWrap');
		
		this.zipCodeWrap.style.display = 'none';
		
		this.emailDomainSelect = $('[name="emailDomain"]');
		
		let canvas = document.getElementById('signaturePad');
		if(canvas){
			canvas.height = canvas.offsetHeight;
			canvas.width = canvas.offsetWidth;
		}
		
		if($('#signaturePad').length > 0){
			this.signaturePad = new SignaturePad(document.getElementById('signaturePad'),{backgroundColor: 'rgb(255, 255, 255)', penColor : '#191919'});
			$('#signaturePad').on('click touchend', function(){
				$('a[onclick="signUp4.completeSign()"]').addClass('active');
			});
		}
		
		if(Number($('[name="category"]').val()) > 2) this.bankStatus = false;
		
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
		
		$('[name="password"]').on('keyup', function(){
			const regPass = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{6,15}$/;
			if(!regPass.test($(this).val())){
				_this.passwordStatus = false;
				$(this).next('.sign_up_assist_text').show();
			} else {
				_this.passwordStatus = true;
				$(this).next('.sign_up_assist_text').hide();
			}
		});
		
		$('[name="confirmPassword"]').on('keyup', function(){
			if($(this).val() != $('[name="password"]').val()){
				_this.confirmPasswordStatus = false;
				$(this).siblings('.sign_up_assist_text.correct').hide();
				$(this).siblings('.sign_up_assist_text.incorrect').show();
			} else {
				_this.confirmPasswordStatus = true;
				$(this).siblings('.sign_up_assist_text.incorrect').hide();
				$(this).siblings('.sign_up_assist_text.correct').show();
			}
		});
		
		$("[data-common-file-input]").on('change', function(){
			
			_this.fileAdd($(this));
		});
		
		if(Number($('[name="category"]').val()) > 2){
			let birthNowDate = new Date();
			birthNowDate.setFullYear(birthNowDate.getFullYear() - 19); 
			
			$('[name="birth0"]').on('change', function(){
				if($('[name="birth1"]').val() != "" && $('[name="birth2"]').val() != ""){
					let birthCompareDate = new Date($('[name="birth0"]').val() + '-' + $('[name="birth1"]').val() + '-' + $('[name="birth2"]').val());
					if(birthNowDate < birthCompareDate){
						alert('19세 이상만 일자리 지원이 가능합니다.');
						$('[name="birth0"]').val("").prop("selected", true);
						$('[name="birth1"]').val("").prop("selected", true);
						$('[name="birth2"]').val("").prop("selected", true);
					}
					
				}
			});
			
			$('[name="birth1"]').on('change', function(){
				if($('[name="birth0"]').val() != "" && $('[name="birth2"]').val() != ""){
					let birthCompareDate = new Date($('[name="birth0"]').val() + '-' + $('[name="birth1"]').val() + '-' + $('[name="birth2"]').val());
					if(birthNowDate < birthCompareDate){
						alert('19세 이상만 일자리 지원이 가능합니다.');
						$('[name="birth0"]').val("").prop("selected", true);
						$('[name="birth1"]').val("").prop("selected", true);
						$('[name="birth2"]').val("").prop("selected", true);
					}
					
				}
			});
			
			$('[name="birth2"]').on('change', function(){
				if($('[name="birth0"]').val() != "" && $('[name="birth1"]').val() != ""){
					let birthCompareDate = new Date($('[name="birth0"]').val() + '-' + $('[name="birth1"]').val() + '-' + $('[name="birth2"]').val());
					if(birthNowDate < birthCompareDate){
						alert('19세 이상만 일자리 지원이 가능합니다.');
						$('[name="birth0"]').val("").prop("selected", true);
						$('[name="birth1"]').val("").prop("selected", true);
						$('[name="birth2"]').val("").prop("selected", true);
					} else {
						$('a[onclick="signUp4.submitForm()"]').addClass('active');
					}
				}
			});
			
			$('[name="bankName"]').on('change', function(){
				if(_this.bankName != $(this).val() || _this.bankNum != $('[name="bankNum"]').val()){
					_this.bankStatus = false;
				} else {
					_this.bankStatus = true;
				}
			});
			
			$('[name="bankNum"]').on('keyup', function(){
				if(_this.bankNum != $(this).val() || _this.bankName != $('[name="bankName"]').val()){
					_this.bankStatus = false;
				} else {
					_this.bankStatus = true;
					$('a[onclick="signUp4.ceritifcateBankNum()"]').removeClass('active');
					$('a[onclick="signUp4.ceritifcateBankNum()"]').find('> span').text('인증완료');
				}
				
				if( !_this.bankStatus && $(this).val().length > 0){
					$('a[onclick="signUp4.ceritifcateBankNum()"]').addClass('active');
					$('a[onclick="signUp4.ceritifcateBankNum()"]').find('> span').text('인증');
				}
				
			});
			
		} else {
			$('[name="birth2"]').on('change', function(){
				if($(this).val() != ""){
					$('a[onclick="signUp4.submitForm()"]').addClass('active');	
				}
			});
		}
			
	}
	
	,fileAdd : function(target){
		let _this = this;
		
		let targetValue = $(target).val();
			
		let targetName = $(target).attr('name');
			
		let cnt = Number(targetName.substring(targetName.length - 1, targetName.length));;
		
		targetName = targetName.substring(0, targetName.length - 1); 
			
			if(targetValue.indexOf("C:\\fakepath\\") > -1){
				
				targetValue = targetValue.substr(targetValue.indexOf("C:\\fakepath\\") + 12, targetValue.length);
				
				if( !$(target).hasClass('active') ){
					$(target).siblings('ul').prepend('<li><a href="javascript:void(0)" data-file-insert-btn data-target-file="' + targetName + '"><span></span><span class="file_delete_btn" data-file-delete-btn data-target-file="' + targetName + '">파일삭제</span></a></li>');
					$(target).siblings('ul').find('> li').first().find('> a > span').not('.file_delete_btn').text(targetValue);
					
					$(target).siblings('ul').find('> li').first().find('> a').on('click', function(){
						let targetId = $(this).attr('data-target-file');
						$('#' + targetId).trigger('click');
					})
					
					$(target).siblings('ul').find('> li').first().find('> a > span.file_delete_btn').on('click', function(e){
						
						e.stopPropagation();
						e.preventDefault();
						
						let targetId = $(this).attr('data-target-file');
				
						let deleteTarget = $('#' + targetId);
						deleteTarget.val("");
						deleteTarget.trigger('change');
						$('[data-file-text-input][data-target-file="' + targetId + '"]').val("");
						if($(deleteTarget).attr("data-file-seq") != ""){
							commonFile.deleteFileSeq($(deleteTarget).attr("data-file-seq"));
							$(deleteTarget).attr("data-file-seq", "");
						}
					});
					
					$(target).addClass('active');
					
					if(cnt > 1){
						$('[name="'+ targetName + 'List"]').val($('[name="'+ targetName + 'List"]').val() + "," + targetName + cnt);
					} else {
						$('[name="'+ targetName + 'List"]').val($('[name="'+ targetName + 'List"]').val() + targetName + cnt);
					}
					
					$(target).after('<input type="file" id="' + targetName + (cnt + 1) +'" name="' + targetName + (cnt + 1) +'" data-common-file-input accept=".gif, .jpg, .png"/>');
					$(target).siblings('ul').find('> li').last().find('> a').attr('data-target-file', targetName + (cnt + 1));
					$(target).next('input').on('change', function(){
						_this.fileAdd($(this));
					})	
				} else {
					$('a[data-target-file="'+ targetName + '"]').find('> span').not('.file_delete_btn').text(targetValue);
				}
				
				
			} else {
				if($(target).hasClass('active') && targetValue == ''){
					$('a[data-target-file="'+ targetName + '"]').parent('li').remove();
					$(this).remove();
					
					let currentList = currentList = $('[name="'+ targetName.substring(0,targetName.length - 1) + 'List"]');  
					
					let curr0 = currentList.substring(0, currentList.indexOf(targetText));
					let curr1 = currentList.substring((currentList.indexOf(targetText) + targetText.length),(currentList.length));
					
					if(curr1.substring(0,1) == ",") curr1 = curr1.substring(1, curr1.length);
					
					currentList.val(curr0 + curr1);
					
				}
			}
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
	
	,resetSign : function(){
		this.signaturePad.clear();
		$('a[onclick="signUp4.completeSign()"]').removeClass('active');
	}
	
	,completeSign : function(){
		let data = this.signaturePad.toDataURL("image/png");
		$('#signData').val(data);
		
		$('#signatureClearBtn').hide();
		$('a[onclick="signUp4.completeSign()"]').removeClass('active');
		$('a[onclick="signUp4.completeSign()"]').find('> span').text('등록 완료');
		this.signaturePad.off();
	}
	
	,ceritifcateBankNum : function(){
		let _this = this;
		
		if($('[name="name"]').val() == null || $('[name="name"]').val() == ""){
			alert('이름을 입력해주세요');
			$('[name="name"]').focus();
			return false;
		}
		
		if($('[name="bankName"]').val() == null || $('[name="bankName"]').val() == ""){
			alert('은행명을 선택해주세요');
			return false;
		}
		
		if($('[name="bankNum"]').val() == null || $('[name="bankNum"]').val() == ""){
			alert('계좌번호를 입력해주세요');
			$('[name="bankNum"]').focus();
			return false;
		}
		
		let params = JSON.stringify({accountHolder : $('[name="name"]').val(), bankName : $('[name="bankName"]').val(), bankNum : $('[name="bankNum"]').val()});
		
		$.ajax({
			url : "/certificateBankNum"
			,contentType : 'application/json; charset=UTF-8'
			,dataType : "json"
			,data : params
			,type : "post"
			,async : false
			,timeoutDelay : 90000
			,success : function(result){
				if(result.result){
					let data = result.data.split("|")[1];
					switch(data){
						case "0000" : //정상인증
							_this.bankStatus = true;
							_this.bankName = $('[name="bankName"]').val();
							_this.bankNum = $('[name="bankNum"]').val();
							$('a[onclick="signUp4.ceritifcateBankNum()"]').removeClass('active');
							$('a[onclick="signUp4.ceritifcateBankNum()"]').find('> span').text('인증완료');							
							$('a[onclick="signUp4.submitForm()"]').addClass('active');

							alert('인증이 완료되었습니다.'); 
							break;
						case "D900" : //은행명 오류
							alert('은행명이 잘못되었습니다. 다시 확인해주세요');
							break;
						case "D103" : //계좌번호 오류
							alert('계좌번호가 잘못되었습니다. 다시 확인해주세요');
							$('[name="bankNum"]').focus();
							break;
						case "B102" :
							alert('은행명이나 계좌번호가 잘못되었습니다. 다시 확인해주세요');
							break;
						case "B004" :
							alert('이름이 잘못되었습니다. 다시 확인해주세요');
							$('[name="name"]').focus();
							break;
						case "B104" :
							alert('이름이 잘못되었습니다. 다시 확인해주세요');
							$('[name="name"]').focus();
							break;
						default :
							alert('인증에 실패했습니다. 잠시 후 다시 시도해주세요');
							break;
					}

				} else {
					alert('인증에 실패했습니다. 확인 후 다시 시도해주세요');
				}
			}
			,error:function(request,status,error){
    			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
		});
		
	}
	
	,submitForm : function(){
		let _this = this;
		
		if( !_this.passwordStatus ){
			alert('비밀번호를 양식에 맞게 입력해주세요');
			$('[name="password"]').focus();
			return false;
		}
		
		if( !_this.confirmPasswordStatus ){
			alert('비밀번호확인을 비밀번호와 일치하게 입력해주세요');
			$('[name="confirmPassword"]').focus();
			return false;
		}
		
		if( !_this.bankStatus ){
			alert('계좌번호 인증 후 다시 시도해주세요');
			return false;
		}
		
		if(confirm('회원가입하시겠습니까?')){
			commonUpdate.submitForm();	
		}
	}
	
	,removeEvent : function(){
		
	}
	,destroy : function(){
		
	}
}

$(document).ready(function(){
	signUp4.init();
})