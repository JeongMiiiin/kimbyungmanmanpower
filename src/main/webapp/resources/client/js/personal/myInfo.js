let myInfo = {

	phoneStatus : true
	,phoneVal : ""
	,bankStatus : true
	,bankNameVal : ""
	,bankVal : ""

	,init : function(){
		this.phoneVal = $('[name="phoneNum"]').val();
		this.bankNameVal = $('[name="bankName"]').val();
		this.bankVal = $('[name="bankNum"]').val();
		
		if($("[data-common-file-input]").length > 0){
			$("[data-common-file-input]").each(function(){
				
				if($(this).attr('data-file-seq') != null){
					let targetName = $(this).attr('name').substring(0, $(this).attr('name').length - 1);
				
					let targetList = $('[name="' + targetName + 'List"]');
					let targetListVal = $(targetList).val() + "," + $(this).attr('name');
					
					if(targetListVal.substring(0,1) == ",") targetListVal = targetListVal.substring(1, targetListVal.length);
					
					targetList.val(targetListVal);					
				}
				
			});
		}
		
		this.registEvent();
	}
	,registEvent : function(){
		let _this = this;
		
		$("[data-common-file-input]").on('change', function(){
			
			_this.fileAdd($(this));
			
		});
		
		$("[data-file-delete-btn]").on('click', function(){
			let targetId = $(this).attr('data-target-file');
			
			let deleteTarget = $('#' + targetId);
			deleteTarget.val("");
			$(this).parent().hide();
			
			$('[data-file-insert-btn][data-target-file="' + targetId + '"]').find('> span').text('파일등록');
			
		});
		
		$('[name="phoneNum"]').on('keyup', function(){
			$(this).val($(this).val().replace(/[^0-9]/g,""));
			
			if(_this.phoneVal != $(this).val()){
				_this.phoneStatus = false;
			} else {
				_this.phoneStatus = true;
			}
			
		});
		
		$('[name="bankName"]').on('change', function(){
			if(_this.bankNameVal != $(this).val() || _this.bankVal != $('[name="bankNum"]').val()){
				_this.bankStatus = false;
			} else {
				_this.bankStatus = true;
			}
		});
		
		$('[name="bankNum"]').on('keyup', function(){
			$(this).val($(this).val().replace(/[^0123456789-]/g,""));
			
			if(_this.bankNameVal != $('[name="bankName"]').val() || _this.bankVal != $(this).val()){
				_this.bankStatus = false;
			} else {
				_this.bankStatus = true;
			}
			
		});
		
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
	
	,certificatePhoneNum : function(){
		let _this = this;
		
		if($('[name="name"]').val() == null || $('[name="name"]').val() == ""){
			alert('이름을 입력해주세요');
			$('[name="name"]').focus();
			return false;
		}
		
		if($('#phoneNum').val() == null || $('#phoneNum').val() == ""){
			alert('휴대전화번호를 입력해주세요');
			$('#phoneNum').focus();
			return false;
		}
		
		if(confirm('재인증하시겠습니까?')){
			let params = JSON.stringify({userName : $('[name="name"]').val(), phoneNum : $('#phoneNum').val()});
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
		
		
		/*let params = JSON.stringify({"phoneNum": $('#phoneNum').val()});
		
			$.ajax({
				url : "/personal/myInfo/certificatePhoneNum"
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
	
	,submitCertificateNum : function(){
		
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
					_this.phoneStatus = true;
					alert('인증이 완료되었습니다.');
				} else {
					alert('인증번호가 다릅니다.')
				}
			}
			,error:function(request,status,error){
    			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
		});
	}
	
	,certificateBankNum : function(){
		let _this = this;
		
		if(confirm('재인증하시겠습니까?')){
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
						_this.bankStatus = true;
						alert('인증이 완료되었습니다.');
					} else {
						alert('인증에 실패했습니다. 확인 후 다시 시도해주세요');
					}
				}
				,error:function(request,status,error){
	    			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
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
			
			if(!_this.bankStatus){
				alert('계좌 재인증 진행해주시기 바랍니다.');
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