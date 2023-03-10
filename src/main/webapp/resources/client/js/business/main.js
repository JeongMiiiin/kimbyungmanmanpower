let main = {

	workData : null

	,init : function(){
		
		this.registEvent();
	}
	,registEvent : function(){
		let _this = this;
		
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
					
					_this.workData = result.data;		
					_this.openWorkConfirmPasswordPopup();
				}
			}
			,error:function(request,status,error){
		    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
	}
	
	,openWorkConfirmPasswordPopup : function(){
		let _this = this;
		popupManager.add('#workConfirmPasswordPopup');
		$('#workInputPassword').val('');
		$('#workInputPassword').off('keyup');
		$('#workInputPassword').on('keyup',function(key){
			if(key.keyCode == 13){
				_this.completePassword();
			}
		});
	}
	
	,completePassword : function(){
		if($('#workInputPassword').val() == null || $('#workInputPassword').val() == ''){alert('??????????????? ??????????????????'); return false;}
		
		if(this.workData.password == $('#workInputPassword').val()){
			popupManager.removePopLatest(true);
			this.settingViewPopup();
		} else {
			alert('??????????????? ???????????? ????????????');
		}
		
	}
	
	,settingViewPopup : function(){
		popupManager.add('#workViewPopup');
		
		$('#workViewTitle').text(this.workData.title);
		
		let sexText = '??????';
		switch(this.workData.sex){
			case 0 : sexText = '???'; break;
			case 1 : sexText = '???'; break;
			default : break;
		}
		
		$('#workViewSex').text(sexText);
		
		$('#workViewRegion').text(this.workData.region);
		$('#workViewCategory').text(this.workData.category);
		$('#workViewContents').text(this.workData.contents);
		
		let startAMPM = parseInt((this.workData.start_time).substring(0,2)) > 12 ? 'PM' : 'AM';
		let startDate = (this.workData.start_date_str).substring(2, this.workData.start_date_str.length) + '<br/>' + startAMPM + this.workData.start_time;
		
		let endAMPM = parseInt((this.workData.end_time).substring(0,2)) > 12 ? 'PM' : 'AM';
		let endDate = (this.workData.end_date_str).substring(2, this.workData.end_date_str.length) + '<br/>' + endAMPM + this.workData.end_time;
		
		if(this.workData.start_date_str == "0000-00-00" && this.workData.end_date_str == "0000-00-00"){
			$('#workViewDate').find('> span').first().text('??????');
		} else {
			$('#workViewDate').find('> span').first().html(startDate);
			$('#workViewDate').find('> span').last().html(endDate);	
		}
		
		let numbers = "";
		switch(this.workData.numbers){
			case 0 :
				numbers = "1 ~ 50???";
				break;
			case 1 :
				numbers = "51 ~ 100???";
				break;
			case 2 :
				numbers = "101 ~ 150???";
				break;
			default :
				numbers = "150??? ??????";
				break;
		}
		
		$('#workViewNumbers').text(numbers);
		
		let payment = this.workData.payment.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		
		if(payment > -1){
			$('#workViewPayment').text(payment + '???');			
		} else {
			$('#workViewPayment').text('??????');
		}
		
		
		
	}
	
	,openWorkWritePopup : function(memCategory){
		switch(memCategory){
			case -1 : alert('????????? ??? ?????????????????? ????????????'); location.replace("/business/login"); break;
			default :  popupManager.add("#workWritePopup"); break;
		}
		
		$('#workPayment').on('keyup', function(e){
			let value = e.target.value != '' ? Number(e.target.value.replaceAll(',','')) : '';
			if(isNaN(value)){
				if(value != ''){
					$(this).val(0);	
				}
			} else {
				/*if(value > 1000000){
					alert('????????? 100????????? ?????? ??? ????????????.'); value = 1000000;	
				}*/
				$(this).val(value);
			}
			
		});
		
	}
	
	,insertApply : function(workSn, classType){
		if(memCategory == classType){
			alert('??????????????? ????????? ??? ????????????.'); return false;
		}
		
		popupManager.add('#applySelectPopup');
		$('#appealContents').val('');
		$('#completeApplyBtn').attr('onclick', 'main.completeApply(' + workSn + ')');
		
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
					'<a href="javascript:void(0)" class="appeal_template_view_btn" onclick="main.openAppealTemplateView($(this))"><span>??????</span></a></li>');
			}
		} else {
			$('.appeal_template_select_con').append('<li class="no_data"><span>????????? ??????????????? ????????????</span></li>');	
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
			alert('????????? ???????????? ??????????????????');
			return false;
		}
		
		let targetContents = $('input[name="appealTemplateSelect"]:checked').parent().siblings('.appeal_template_contents').text();
		$('#appealContents').val(targetContents);
		popupManager.removePopLatest(true);
	}
	
	,completeApply : function(workSn){
		
		if($('#appealContents').val() == null || $('#appealContents').val() == ''){
			alert('??????????????? ??????????????????');
			return false;
		}
		
		if(confirm('?????????????????????????')){
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
								alert('????????? ?????????????????????.');
								popupManager.removePopAll(true);
							} else {
								alert('?????? ????????? ???????????????');
								popupManager.removePopLatest(true);
							}
						} else {
							alert('????????? ??????????????????. ?????? ??? ?????? ??????????????????');
						}
					}
					,error:function(request,status,error){
				    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    }
				});
		}
	}
	
	,insertChat : function(workSn){
		
	}
	
	//????????? ?????? ?????? ????????? ?????? ????????? ??????
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