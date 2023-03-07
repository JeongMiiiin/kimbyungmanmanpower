let main = {

	init : function(){
		this.registEvent();
		
	}
	,registEvent : function(){
		let _this = this;
		
		this.settingFavorite();
		
		let bannerSwiper = new Swiper ('.banner_swiper_wrap.swiper-container', {
				direction: 'horizontal',
				slidesPerView: 1,
				loop : true,
				pagination : {
					el : '.banner_swiper_pagination_con',
					type : 'fraction'
				}
				,navigation : {
					nextEl : '.banner_swiper_btn.next',
					prevEl : '.banner_swiper_btn.prev'
				}
				
				,breakpoints : {
					992 : {
						pagination : {
							clickable: true,
							type : 'bullets'
						}
					}
				}
				
			});
		
		$('.footer_list > li.active > a').on('click', function(){
			_this.resetMain();
		});
			
	}
	
	,resetMain : function(){
		$('[name="filterClass"]').prop('checked', false);
		$('[name="filterPcClass"]').prop('checked', false);
		$('[name="regionFilterList"]').val('[]');
		$('[name="regionFilterPcList"]').val('[]');
		$('#regionList').empty();
		$('#regionPcList').empty();
		$('[name="categoryFilterList"]').val('[]');
		$('[name="categoryFilterPcList"]').val('[]');
		$('#categoryList').empty();
		$('#categoryPcList').empty();
			$('[name="dateFileterSelect"]').prop('checked', false);
			$('[name="dateFileterPcSelect"]').prop('checked', false);
			$('[name="filterSex"]').prop('checked', false);
			$('[name="filterPcSex"]').prop('checked', false);
			$('[name="filterStartPayment"]').val('');
			$('[name="filterPcStartPayment"]').val('');
			$('[name="filterEndPayment"]').val('');
			$('[name="filterPcEndPayment"]').val('');
			mainFilter.submitSearchFilter();
			
			pageScrollTop();
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
						
						_this.settingFavorite();
						
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
	
	,settingFavorite : function(){
		$('[data-favorite-sn]').removeClass('active');
		
		for(let i=0; i < favoriteList.length; i++){
			let targetSn = favoriteList[i];
			$('[data-favorite-sn="' + targetSn + '"]').addClass('active');
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
		if(favoriteList.includes(data.sn)) $('.popup_favorite_icon').addClass('active'); 
		
		$('.popup_favorite_icon').attr('onclick', 'main.updateFavorite(' + data.sn + ', true)');
		
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
			$('#workApplyBtn').attr('onclick', 'main.insertApply(' + data.sn + ',' + data.member_sn + ')');
			$('#workApplyBtn').find('> span').text('지원하기');		
		} else {
			$('#workApplyBtn').attr('onclick', 'main.insertChat(' + data.member_sn + ',"' + data.mem_name + '")');
			$('#workApplyBtn').find('> span').text('연락하기');
		}
		
	}
	
	,openWorkWritePopup : function(memCategory){
		switch(memCategory){
			case -1 : alert('로그인 후 진행해주시기 바랍니다'); location.replace("/personal/login"); break;
			case 2 : popupManager.add("#workWritePopup"); break;
			default :  popupManager.add("#workWritePopup"); break;
		}
		
		$('#workPayment').on('keyup', function(e){
			let value = e.target.value != '' ? Number(e.target.value.replaceAll(',','')) : '';
			if(isNaN(value)){
				if(value != ''){
					$(this).val(0);	
				}
			} else {
				if(value > 1000000){
					alert('금액은 100만원을 넘을 수 없습니다.'); value = 1000000;	
				}
				$(this).val(value);
			}
				
		});
	}
	
	,insertApply : function(workSn, memberSn){
		
		if(memCategory > -1){
			if(memberSn == memSn ){
				alert('본인의 게시물에는 지원할 수 없습니다'); return false;
			}
			
			if(memCategory == 2){
				alert('구직회원만 가능합니다.'); return false;
			}
			
			popupManager.add('#applySelectPopup');
			$('#appealContents').val('');
			$('#confirmApplyBtn').attr('onclick', 'main.confirmApply(' + workSn + ')');	
		} else {
			alert('로그인을 진행해주시기 바랍니다');
		}
		
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
	
	,confirmApply : function(workSn){
		
		if($('#appealContents').val() == null || $('#appealContents').val() == ''){
			alert('어필정보를 입력해주세요');
			return false;
		}
		
		popupManager.add('#workApplyConfirmPopup');
		
		$('#completeApplyBtn').attr('onclick', 'main.completeApply(' + workSn + ')')
		
	}
	
	,completeApply : function(workSn){
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
	
	,insertChat : function(memberSn, memberName){
		if(memCategory > -1){
			
			if(memberSn == memSn ){
				alert('본인의 게시물에는 연락할 수 없습니다'); return false;
			}
			
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
		} else {
			alert('로그인을 진행해주시기 바랍니다');
		}
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
	main.init();
})