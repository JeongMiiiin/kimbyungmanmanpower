let commonUpdate = {
	
	updateForm : null
	,updateEssentialInput : null
	,cancelBtn : null
	,completeBtn : null
	,deleteBtn : null
	
	,init : function(){
		
		this.updateForm = $('[data-common-update-form]');
		this.updateEssentialInput = $('[data-common-update-essential-input]');
		this.cancelBtn = $('[data-common-update-cancel-btn]');
		this.insertCompleteBtn = $('[data-common-insert-complete-btn]');
		this.updateCompleteBtn = $('[data-common-update-complete-btn]');
		this.deleteCompleteBtn = $('[data-common-update-delete-btn]');
		
		this.registEvent();
	}
	
	,registEvent : function(){
		let _this = this;
		
		$(this.cancelBtn).on('click', function(e){
			e.preventDefault();
			e.stopPropagation();
			
			if(confirm('취소하시겠습니까?')){
				window.location.href= $(this).attr('href');
			}
		})
		
		$(this.insertCompleteBtn).on('click', function(e){
			e.preventDefault();
			e.stopPropagation();
			
			let alertMsg = $(this).attr('alert-msg') != null ? $(this).attr('alert-msg') : '등록하시겠습니까?';  
			
			if(confirm(alertMsg)){
				_this.submitForm();
			}
			
		})
		
		$(this.updateCompleteBtn).on('click', function(e){
			e.preventDefault();
			e.stopPropagation();
			
			let alertMsg = $(this).attr('alert-msg') != null ? $(this).attr('alert-msg') : '수정하시겠습니까?';
			
			if(confirm(alertMsg)){
				_this.submitForm();
			}
			
		});
		
		$(this.deleteCompleteBtn).on('click', function(e){
			e.preventDefault();
			e.stopPropagation();
			
			if(confirm('삭제하시겠습니까?')){
				window.location.href= $(this).attr('href');
			}
		})
		
	}
	
	,checkUpdateForm : function(){
		return true;
	}
	
	,checkEssentialInput : function(){
		let _this = this;
		
		let checkResult = false;
		
		if( $(_this.updateEssentialInput).length > 0 ){
			
			$(_this.updateEssentialInput).each(function(){
				if($(this).val() == null || $(this).val() == ""){					
					
					let msg = $(this).attr('data-common-update-essential-input');
					
					if( typeof($(this).attr("data-common-file-input")) != 'undefined' ){
						if($(this).attr('data-file-seq') != ""){
							checkResult = true;	
						} else {
							alert(msg);
							checkResult = false;
							return false;	
						}
						
					} else {
					
						alert(msg);
						
						$(this).focus();
						checkResult = false;
						return false;	
					}
				} else {
					checkResult = true;
				}
			})
			
		} else {
			checkResult = true;
		}
		
		return checkResult;
	}
	
	,submitForm : function(){
		let _this = this;
		
		if(_this.checkUpdateForm()){
			if(_this.checkEssentialInput()){
				$(_this.updateForm).submit();
			}	
		}
	}
	
	,removeEvent : function(){
		
	}
	,destroy : function(){
		
	}
}