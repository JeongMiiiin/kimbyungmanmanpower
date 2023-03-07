let favorite = {

	init : function(){
		
		this.registEvent();
	}
	,registEvent : function(){
		let _this = this;
			
	}
	
	,updateFavorite : function(workSn, popupStatus){
		event.stopPropagation();
		let _this = this;
		if(memCategory > -1){
			let status = true;
			if(favoriteList.includes(workSn)) status = false; 
			
			let params = JSON.stringify({workSn : workSn, status : status});
			$.ajax({
				url : "/favorite/updateFavorite"
				,contentType : 'application/json; charset=UTF-8'
				,dataType : "json"
				,data : params
				,type : "post"
				,async : false
				,timeoutDelay : 90000
				,success : function(result){
					if(result.result){
						if(!status){
							favoriteList = _this.removeItem(favoriteList, workSn);
						} else {
							favoriteList.push(workSn);
						}
						
						window.location.reload();
						
						if(popupStatus){
							if(!status){
								$('.popup_favorite_icon').removeClass('active');
							} else {
								$('.popup_favorite_icon').addClass('active');
							}
						}
											
						alert('즐겨찾기 상태가 변경되었습니다.');
	
					}
				}
				,error:function(request,status,error){
			    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			});
		} else {
			alert('로그인 후 진행해주시기 바랍니다.');
		}
	}
	
	
	,openWorkViewPopup : function(workSn){
		let _this = this;
		let params = JSON.stringify({workSn : workSn});
		$.ajax({
			url : "/work/viewPopupData"
			,contentType : 'application/json; charset=UTF-8'
			,dataType : "json"
			,data : params
			,type : "post"
			,async : false
			,timeoutDelay : 90000
			,success : function(result){
				if(result.result){
					_this.settingViewPopup(result.data);
				}
			}
			,error:function(request,status,error){
		    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
	}
	
	,settingViewPopup : function(data){
		popupManager.add('#workViewPopup');
		
		$('.popup_favorite_icon').removeClass('active');
		$('.popup_favorite_icon').addClass('active'); 
		
		$('.popup_favorite_icon').attr('onclick', 'favorite.updateFavorite(' + data.sn + ', true)');
		
		$('#workViewTitle').text(data.title);
		
		let sexText = '무관';
		switch(data.sex){
			case 0 : sexText = '남'; break;
			case 1 : sexText = '여'; break;
			default : break;
		}
		
		$('#workViewSex').text(sexText);
		
		$('#workViewRegion').text(data.region);
		$('#workViewCategory').text(data.category);
		$('#workViewContents').text(data.contents);
		
		let startAMPM = parseInt((data.start_time).substring(0,2)) > 12 ? 'PM' : 'AM';
		let startDate = (data.start_date_str).substring(2, data.start_date_str.length) + '<br/>' + startAMPM + data.start_time;
		
		let endAMPM = parseInt((data.end_time).substring(0,2)) > 12 ? 'PM' : 'AM';
		let endDate = (data.end_date_str).substring(2, data.end_date_str.length) + '<br/>' + endAMPM + data.end_time;
		
		$('#workViewDate').find('> span').first().html(startDate);
		$('#workViewDate').find('> span').last().html(endDate);
		
		let payment = data.payment.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		
		$('#workViewPayment').text(payment + '원');

		if(data.class_type == 0){
			$('#workApplyBtn').attr('onclick', 'favorite.insertApply(' + data.sn + ',' + data.class_type + ')');		
		} else {
			$('#workApplyBtn').attr('onclick', 'favorite.contactMember(' + data.member_sn + ',"' + data.mem_name + '")');
			$('#workApplyBtn').find('> span').text('연락하기');
		}
		
	}
	
	,insertApply : function(workSn, classType){
		if(memCategory == classType){
			alert('구인회원은 지원할 수 없습니다.'); return false;
		}
		
		popupManager.add('#applySelectPopup');
		$('#appealContents').val('');
		$('#completeApplyBtn').attr('onclick', 'favorite.completeApply(' + workSn + ')');
		
	}
	
	,openAppealInfo : function(){
		let _this = this;
		$.ajax({
			url : "/appeal/getMyAppeal"
			,contentType : 'application/json; charset=UTF-8'
			,dataType : "json"
			,type : "post"
			,async : false
			,timeoutDelay : 90000
			,success : function(result){
				popupManager.add('#appealTemplateSelectPopup');
				_this.settingAppealInfo(result);
				
			}
			,error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	,settingAppealInfo(result){
		$('.appeal_template_select_con').empty();
		if(result.length > 0){
			for(let i=0; i < result.length; i++){
				let target = result[i];
				
				$('.appeal_template_select_con').append('<li><div class="col-0 checkbox_style_0_con appeal_template_checkbox">' +
						'<input type="radio" class="checkbox_style_0" name="appealTemplateSelect" id="appealTemplateSelect' + target.sn + '"/>' +
						'<label for="appealTemplateSelect' + target.sn + '"></label></div>' +
						'<div class="col-12 appeal_template_date">' + target.createDateStr + '</div>' +
						'<div class="col-12 appeal_template_title">' + target.title + '</div>' +
						'<div class="col-12 appeal_template_contents">' + target.contents + '</div>' +
					'<a href="javascript:void(0)" class="appeal_template_view_btn" onclick="main.openAppealTemplateView($(this))"><span>상세</span></a></li>');
			}
		} else {
			$('.appeal_template_select_con').append('<li class="no_data"><span>등록된 어필정보가 없습니다</span></li>');	
		}
	}
	
	,openAppealTemplateView : function(target){
		popupManager.add('#appealTemplateViewPopup');
		let targetTitle = $(target).siblings('.appeal_template_title').text();
		let targetContents = $(target).siblings('.appeal_template_contents').text();
		
		$('#appealTemplateViewTitle').text(targetTitle);
		$('#appealTemplateViewContents').text(targetContents);
		
	}
	
	,selectAppealTemplate : function(){
		if($('input[name="appealTemplateSelect"]:checked').length == 0){
			alert('적용할 템플릿을 선택해주세요');
			return false;
		}
		
		let targetContents = $('input[name="appealTemplateSelect"]:checked').parent().siblings('.appeal_template_contents').text();
		$('#appealContents').val(targetContents);
		popupManager.removePopLatest(true);
	}
	
	,completeApply : function(workSn){
		
		if($('#appealContents').val() == null || $('#appealContents').val() == ''){
			alert('어필정보를 입력해주세요');
			return false;
		}
		
		if(confirm('지원하시겠습니까?')){
			let params = JSON.stringify({workSn : workSn, appealContents : $('#appealContents').val()});
				$.ajax({
					url : "/work/insertApply"
					,contentType : 'application/json; charset=UTF-8'
					,dataType : "json"
					,data : params
					,type : "post"
					,async : false
					,timeoutDelay : 90000
					,success : function(result){
						if(result.result){
							
							if(result.status == 0){
								alert('지원이 완료되었습니다.');
								popupManager.removePopAll(true);
							} else {
								alert('이미 지원한 공고입니다');
								popupManager.removePopLatest(true);
							}
						} else {
							alert('지원에 실패했습니다. 잠시 후 다시 시도해주세요');
						}
					}
					,error:function(request,status,error){
				    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    }
				});
		}
	}
	
	,contactMember : function(memberSn, memberName){
		let params = JSON.stringify({receiverSn : memberSn, receiverName : memberName})
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
	
	//아이템 값이 처음 나오는 배열 아이템 삭제
	,removeItem : function(arr, value) {
	  var index = arr.indexOf(value);
	  if (index > -1) {
	    arr.splice(index, 1);
	  }
	  return arr;
	}
	
	,removeEvent : function(){
		
	}
	,destroy : function(){
		
	}
}

$(document).ready(function(){
	favorite.init();
})