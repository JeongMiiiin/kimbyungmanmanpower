let workView = {
	
	init : function(){
		this.IMP = window.IMP;
		this.IMP.init("imp78352600");
		
		this.registEvent();
	}
	,registEvent : function(){
		
	}
	
	,attemptApplyStatus : function(sn, workSn, status){
		let _this = this;
		let confirmMsg = '거절하시겠습니까?';
		if(status == 1) confirmMsg = '선택하시겠습니까?';
		
		if(confirm(confirmMsg)){
			if(status == 1){
				_this.requestPay(sn, workSn);
			} else {
				_this.changeApplyStatus(sn,workSn,2);
			}
		}
	}
	
	,changeApplyStatus : function(sn, workSn, status){
		
		let params = JSON.stringify({applySn : sn, workSn : workSn, status : status});
			if(status == 1){params = JSON.stringify({applySn : sn, workSn : workSn, status : status, memberSn : $('#workMemberSn').val(), recipientSn : $('#applyMemberSn' + sn).val(), payment : $('#workPayment').val(), impUid : $('#impUid').val(), merchantUid : $('#merchantUid').val()});}
			
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
	
	,requestPay : function(sn, workSn){
		let _this = this;
		
		let today = new Date();
		let year = today.getFullYear().toString();
		let month = today.getMonth() + 1 < 10 ? '0' + (today.getMonth() + 1).toString() : (today.getMonth() + 1).toString();
		let date = today.getDate() + 1 < 10 ? '0' + (today.getDate() + 1).toString() : (today.getDate() + 1).toString();
		let hours = today.getHours() + 1 < 10 ? '0' + (today.getHours() + 1).toString() : (today.getHours() + 1).toString();
		let minutes = today.getMinutes() + 1 < 10 ? '0' + (today.getMinutes() + 1).toString() : (today.getMinutes() + 1).toString();
		let seconds = today.getSeconds() + 1 < 10 ? '0' + (today.getSeconds() + 1).toString() : (today.getSeconds() + 1).toString();
		
		let todayStr = year + month + date + hours + minutes + seconds;
		
		let randomNum = Math.floor(Math.random() * 10).toString() + Math.floor(Math.random() * 10).toString() + Math.floor(Math.random() * 10).toString() + Math.floor(Math.random() * 10).toString();
		
		let merchantUid = "ORD" +  todayStr + '-' + randomNum;
		
		if(window.ReactNativeWebView != undefined){
			
			let tempParams = JSON.stringify({workSn : workSn, merchantUid: merchantUid, applySn : sn, recipientSn : $('#applyMemberSn' + sn).val()});
			
			$.ajax({
					url : "/work/updateTempMerchant"
					,contentType : 'application/json; charset=UTF-8'
					,dataType : "json"
					,data : tempParams
					,type : "post"
					,async : false
					,timeoutDelay : 90000
					,success : function(result){
						if(result.result){
							let params = {
				   			  pg: "html5_inicis",
							  pay_method: "card",
					          merchant_uid: merchantUid,
					          name: "구인 대금",
					          amount: $('[name="workPayment"]').val(),
					          buyer_email: $('[name="buyerEmail"]').val(),
					          buyer_name: $('[name="buyerName"]').val(),
					          buyer_tel: $('[name="buyerPhoneNum"]').val(),
					          buyer_addr: $('[name="buyerAddr"]').val(),
					          buyer_postcode: $('[name="buyerZipCode"]').val()}
							  
							window.ReactNativeWebView.postMessage(JSON.stringify({
								'userCode' : 'imp78352600',
								'data' : params
							}))
						} else {
							alert('선택에 실패했습니다. 잠시 후 다시 시도해주세요');
						}
					}
					,error:function(request,status,error){
				    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    }
				});
			  	
		} else {
			_this.IMP.request_pay({ // param
	          pg: "html5_inicis",
	          pay_method: "card",
	          merchant_uid: merchantUid,
	          name: "구인 대금",
	          amount: $('[name="workPayment"]').val(),
	          buyer_email: $('[name="buyerEmail"]').val(),
	          buyer_name: $('[name="buyerName"]').val(),
	          buyer_tel: $('[name="buyerPhoneNum"]').val(),
	          buyer_addr: $('[name="buyerAddr"]').val(),
	          buyer_postcode: $('[name="buyerZipCode"]').val()
	      }, function (rsp) { // callback
	          if (rsp.success) {
	              // 결제 성공 시 로직
	              $('#impUid').val(rsp.imp_uid);
	              $('#merchantUid').val(rsp.merchant_uid);
	              
	              _this.changeApplyStatus(sn, workSn, 1);
	              
	             paymentParams = JSON.stringify({applySn : sn, workSn : workSn, status : 1, memberSn : $('#workMemberSn').val(), recipientSn : $('#applyMemberSn' + sn).val(), payment : $('#workPayment').val(), impUid : $('#impUid').val(), merchantUid : $('#merchantUid').val()});
				
				$.ajax({
					url : "/work/changeApplyStatus"
					,contentType : 'application/json; charset=UTF-8'
					,dataType : "json"
					,data : paymentParams
					,type : "post"
					,async : false
					,timeoutDelay : 90000
					,success : function(result){
						if(result.result){
							alert("결제되었습니다.");
							window.location.reload();
						}
					}
					,error:function(request,status,error){
				    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    }
				});
	              
	          } else {
	              // 결제 실패 시 로직
	              alert("결제에 실패했습니다. 다시 시도해주세요");
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
	
	,contactMember : function(memberSn, memberName){
		let params = JSON.stringify({receiverSn : memberSn, receiverName : memberName});
		$.ajax({
				url : "/personal/insertChat"
				,contentType : 'application/json; charset=UTF-8'
				,dataType : "json"
				,data : params
				,type : "post"
				,async : false
				,timeoutDelay : 90000
				,success : function(result){
					if(result.result < 2){
						location.href="/personal/liveChat?chatSn=" + result.data;
					} else {
						alert('채팅방 생성에 실패했습니다. 잠시 후 다시 시도해주세요');
					}
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
		if(data.permissionFileNameList != null && data.permissionFileNameList.length > 0){
			for(let i=0; i < data.permissionFileNameList.length; i++){
				let permissionFile = '<a href="/file/download?fileSeq=' + data.permissionFileNameList[i].seq +'" target="_blank"><span>' + data.permissionFileNameList[i].name + '</span></a>';
				if(i > 0){
					$('#applyViewPermissionFile').append('<br/>' + permissionFile);
				} else {
					$('#applyViewPermissionFile').append(permissionFile);
				}
			}	
		} else {
			$('#applyViewPermissionFile').text('없음');
		}
		
		if(data.healthCertificateFileNameList != null && data.healthCertificateFileNameList.length > 0){
			for(let i=0; i < data.healthCertificateFileNameList.length; i++){
				let healthCertificateFile = '<a href="/file/download?fileSeq=' + data.healthCertificateFileNameList[i].seq +'" target="_blank"><span>' + data.healthCertificateFileNameList[i].name + '</span></a>';
				if(i > 0){
					$('#applyViewHealthCertificateFile').append('<br/>' + healthCertificateFile);
				} else {
					$('#applyViewHealthCertificateFile').append(healthCertificateFile);
				}
			}	
		} else {
			$('#applyViewHealthCertificateFile').text('없음');
		}
		
		if(data.etcFileNameList != null && data.etcFileNameList.length > 0){
			for(let i=0; i < data.etcFileNameList.length; i++){
				let etcFile = '<a href="/file/download?fileSeq=' + data.etcFileNameList[i].seq +'" target="_blank"><span>' + data.etcFileNameList[i].name + '</span></a>';
				if(i > 0){
					$('#applyViewEtcFile').append('<br/>' + etcFile);
				} else {
					$('#applyViewEtcFile').append(etcFile);
				}
			}	
		} else {
			$('#applyViewEtcFile').text('없음');
		}
		
		$('#applyMemberContactBtn').attr('onclick','workView.contactMember(' + data.sn + ',\'' + data.name + '\')');
		
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
	
	,completeDeal : function(sn){
		if(confirm('완료하시겠습니까?')){
			
			let params = JSON.stringify({workSn : sn, status : 1, recipientSn : $('#selectApplyMemberSn').val(), applySn : $('#selectApplySn').val()});
			$.ajax({
				url : "/work/updateDeal"
				,contentType : 'application/json; charset=UTF-8'
				,dataType : "json"
				,data : params
				,type : "post"
				,async : false
				,timeoutDelay : 90000
				,success : function(result){
					if(result.result){
						alert('공고 진행이 완료되었습니다.');
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