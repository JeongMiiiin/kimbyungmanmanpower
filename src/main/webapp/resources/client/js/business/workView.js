let workView = {
	
	init : function(){
		
		this.registEvent();
	}
	,registEvent : function(){
		
	}
	
	,changeApplyStatus : function(sn, workSn, status){
		
		let confirmMsg = '선택하시겠습니까?';
		if(status == 2){
			confirmMsg = '거절하시겠습니까?';
		}
		
		if(confirm(confirmMsg)){
			let params = JSON.stringify({applySn : sn, workSn : workSn, status : status})
			$.ajax({
				url : "/work/changeApplyStatus"
				,contentType : 'application/json; charset=UTF-8'
				,dataType : "json"
				,data : params
				,type : "post"
				,async : false
				,timeoutDelay : 90000
				,success : function(result){
					if(result.result){
						alert("변경되었습니다.");
						window.location.reload();
					}
				}
				,error:function(request,status,error){
			    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			});
		}
		
	}
	
	,viewApplyMember : function(sn){
		let _this = this;
		
		popupManager.add('#applyViewPopup');
		
		let params = JSON.stringify({sn : sn})
		$.ajax({
				url : "/work/viewApplyMember"
				,contentType : 'application/json; charset=UTF-8'
				,dataType : "json"
				,data : params
				,type : "post"
				,async : false
				,timeoutDelay : 90000
				,success : function(result){
					_this.settingView(result);
				}
				,error:function(request,status,error){
			    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			});
	}
	
	,contactMember : function(memberSn){
		let params = JSON.stringify({receiverSn : memberSn})
		$.ajax({
				url : "/personal/insertChat"
				,contentType : 'application/json; charset=UTF-8'
				,dataType : "json"
				,data : params
				,type : "post"
				,async : false
				,timeoutDelay : 90000
				,success : function(result){
					console.log(result);
				}
				,error:function(request,status,error){
			    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			});
	}
	
	,settingView : function(data){
		
		$('#applyViewName').text('');
		$('#applyViewAppeal').text('');
		$('#applyViewPermissionFile').empty();
		$('#applyViewHealthCertificateFile').empty();
		$('#applyViewEtcFile').empty();
		
		let name = data.name;
		$('#applyViewName').text(name);
		
		let appealContents = $('[data-apply-member-sn="'+ data.sn + '"]').text();
		$('#applyViewAppeal').text(appealContents);
		if(data.permissionFileSeq > 0){
			let permissionFile = '<a href="/file/download?fileSeq=' + data.permissionFileSeq +'" target="_blank"><span>' + data.permissionFileName + '</span></a>';
			$('#applyViewPermissionFile').append(permissionFile);	
		} else {
			$('#applyViewPermissionFile').text('없음');
		}
		
		if(data.healthCertificateFileSeq > 0){
			let healthCertificateFile = '<a href="/file/download?fileSeq=' + data.healthCertificateFileSeq +'" target="_blank"><span>' + data.healthCertificateFileName + '</span></a>';
			$('#applyViewHealthCertificateFile').append(healthCertificateFile);
		} else {
			$('#applyViewHealthCertificateFile').text('없음');
		}
		
		if(data.etcFileSeq > 0){
			let etcFile = '<a href="/file/download?fileSeq=' + data.etcFileSeq +'" target="_blank"><span>' + data.etcFileName + '</span></a>';
			$('#applyViewEtcFile').append(etcFile);	
		} else {
			$('#applyViewEtcFile').text('없음');
		}
		
	}
	
	,openDeclarationPopup : function(){
		popupManager.add('#selectDeclarationPopup');
	}
	
	,completeDeclaration : function(){
		
		if($('[name="selectDeclarationReason"]').val() == null || $('[name="selectDeclarationReason"]').val() == ''){
			alert('사유를 선택해주세요');
			return false;
		}
		
		if(confirm('신고하시겠습니까?')){
			let params = JSON.stringify({workSn : $('#workSn').val(), category : $('[name="selectDeclarationReason"]').val(), recipientSn : $('#selectApplyMemberSn').val(), applySn : $('#selectApplySn').val()})
			
			$.ajax({
				url : "/declaration/insertData"
				,contentType : 'application/json; charset=UTF-8'
				,dataType : "json"
				,data : params
				,type : "post"
				,async : false
				,timeoutDelay : 90000
				,success : function(result){
					if(result.result){
						alert('신고가 완료되었습니다. 관리자 확인 후 처리됩니다.');
						window.location.reload();
					}
				}
				,error:function(request,status,error){
			    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			});
			
		}
	}
	
	,cancelDeclaration : function(){
		if(confirm('취소하시겠습니까?')){
			let params = JSON.stringify({workSn : $('#workSn').val(), memberSn : $('#selectApplyMemberSn').val(), applySn : $('#selectApplySn').val()})
			
			$.ajax({
				url : "/declaration/cancelData"
				,contentType : 'application/json; charset=UTF-8'
				,dataType : "json"
				,data : params
				,type : "post"
				,async : false
				,timeoutDelay : 90000
				,success : function(result){
					if(result.result){
						alert('신고가 취소되었습니다.');
						window.location.reload();
					}
				}
				,error:function(request,status,error){
			    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			});
		}
	}
	
	,completeWorkApply : function(){
		
	}
	
	,removeEvent : function(){
		
	}
	,destroy : function(){
		
	}
}

$(document).ready(function(){
	workView.init();
})