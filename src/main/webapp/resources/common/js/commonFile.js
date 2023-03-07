let commonFile = {
	
	deleteFileSeqListCon : null
	,deleteFileSeqList : []
	,fileInput : null
	,fileTextInput : null
	,fileInsertBtn : null
	,fileDeleteBtn : null
	
	,init : function(){
		
		this.deleteFileSeqListCon = $("#deleteFileSeqList");
		this.fileInput = $("[data-common-file-input]");
		this.fileTextInput = $("[data-file-text-input]");
		this.fileInsertBtn = $("[data-file-insert-btn]");
		this.fileDeleteBtn = $("[data-file-delete-btn]");
		
		this.registEvent();
	}
	
	,registEvent : function(){
		let _this = this;
		
		$(this.fileInput).on('change', function(){
			let targetId = $(this).attr('id');
			
			let targetValue = $(this).val();
			
			if(targetValue.indexOf("C:\\fakepath\\") > -1){
				targetValue = targetValue.substr(targetValue.indexOf("C:\\fakepath\\") + 12, targetValue.length);
			}
			
			$('[data-file-text-input][data-target-file="' + targetId + '"]').val(targetValue);
			
			if($(this).attr("data-file-seq") != ""){
				_this.deleteFileSeq($(this).attr("data-file-seq"));
				$(this).attr("data-file-seq", "");
			}
			
		});
		
		$(this.fileTextInput).on('click', function(){
			let targetId = $(this).attr('data-target-file');
			$('#' + targetId).trigger('click'); 
		});
		
		$(this.fileInsertBtn).on('click', function(){
			let targetId = $(this).attr('data-target-file');
			$('#' + targetId).trigger('click');
		});
		
		$(this.fileDeleteBtn).on('click', function(){
			let targetId = $(this).attr('data-target-file');
			
			let deleteTarget = $('#' + targetId);
			deleteTarget.val("");
			deleteTarget.trigger('change');
			$('[data-file-text-input][data-target-file="' + targetId + '"]').val("");
			if($(deleteTarget).attr("data-file-seq") != ""){
				_this.deleteFileSeq($(deleteTarget).attr("data-file-seq"));
				$(deleteTarget).attr("data-file-seq", "");
			}
			
		});
	}
	
	,deleteFileSeq : function(fileSeq){
		this.deleteFileSeqList.push(fileSeq);
		this.deleteFileSeqListCon.val(this.deleteFileSeqList);
	}
	
	,removeEvent : function(){
		
	}
	,destroy : function(){
		
	}
}