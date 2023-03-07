let mainWrite = {

	region0Select : null
	,region1Select : null
	,region2Select : null
	,regionStatusVal : 0
	,category0Select : null
	,category1Select : null
	,categoryStatusVal : 0

	,init : function(){
		this.region0Select = $('#regionWrite0Select');
		this.region1Select = $('#regionWrite1Select');
		this.region2Select = $('#regionWrite2Select');
		this.category0Select = $('#categoryWrite0Select');
		this.category1Select = $('#categoryWrite1Select');
		this.registEvent();
	}
	,registEvent : function(){
		let _this = this;
		
		//권역선택 이벤트
		this.region0Select.find('> li > a').on('click', function(){
			_this.select2DepthRegionWrite(0,$(this));		
		});
		
		//대분류선택 이벤트
		this.category0Select.find('> li > a').on('click', function(){
			_this.select2DepthCategoryWrite(0,$(this));		
		});
		$('[name="dateWriteEnd0Day"]').on('change', function(){
			if($(this).val() != ''){
				$('a[onclick="mainWrite.complete2DepthDateWrite()"]').addClass('active');
			} else {
				$('a[onclick="mainWrite.complete2DepthDateWrite()"]').removeClass('active');
			}
		});
	}
	
	,openWritePopup : function(category){
		let _this = this;
		switch(category){
			case 0 : popupManager.add("#regionWriteSelectPopup"); _this.settingRegionPopup(); break;
			case 1 : popupManager.add("#categoryWriteSelectPopup");_this.settingCategoryPopup(); break;
			default : popupManager.add("#dateWriteSelectPopup"); _this.settingDatePopup(); break;
		}
		
	}
	
	,settingRegionPopup : function(){
		if($('#regionWriteList').val() != '[]'){
			$('#regionWriteSelectPopList').val($('#regionWriteList').val());
			let currentList = $('#regionWriteList').val().substring(1, $('#regionWriteList').val().length - 1).split(',');
			currentList.forEach(function(value){
				$('#regionWriteSelectPopListCon').append('<li><div><span>' + value + '</span><a href="javascript:void(0)" class="main_filter_popup_select_result_delete_btn" onclick="mainWrite.deleteRegionWrite(\'' + value + '\', $(this), 1)"></a></div></li>');	
			})
		} else {
			$('a[onclick="mainWrite.complete2DepthRegionWrite()"]').removeClass('active');
			$('#regionWriteSelectPopList').val('[]');
			$('#regionWriteSelectPopListCon').empty();
		}
		this.resetRegionWrite();
	}
	
	,settingCategoryPopup : function(){
		if($('#categoryWriteList').val() != '[]'){
			$('#categoryWriteSelectPopList').val($('#categoryWriteList').val());
			let currentList = $('#categoryWriteList').val().substring(1, $('#categoryWriteList').val().length - 1).split(',');
			currentList.forEach(function(value){
				$('#categoryWriteSelectPopListCon').append('<li><div><span>' + value + '</span><a href="javascript:void(0)" class="main_filter_popup_select_result_delete_btn" onclick="mainWrite.deleteCategoryWrite(\'' + value + '\', $(this), 1)"></a></div></li>');	
			})
		} else {
			$('a[onclick="mainWrite.complete2DepthCategoryWrite()"]').removeClass('active');
			$('#categoryWriteSelectPopList').val('[]');
			$('#categoryWriteSelectPopListCon').empty();
		}
		this.resetCategoryWrite();
	}
	
	,settingDatePopup : function(){
		if($('[name="dateWriteStartDate"]').val() != null && $('[name="dateWriteStartDate"]').val() != "" && $('[name="dateWriteEndDate"]').val() != null && $('[name="dateWriteEndDate"]').val() != ""){
			$('a[onclick="mainWrite.complete2DepthDateWrite()"]').addClass('active');
		} else {
			$('a[onclick="mainWrite.complete2DepthDateWrite()"]').removeClass('active');
			this.resetDateWrite();
		}
	}
	
	,open2DepthWritePopup : function(category, depth){
		if(category == 0){
			this.open2DepthRegionWritePopup(depth);
		} else {
			this.open2DepthCategoryWritePopup(depth);
		}
	}
	
	,open2DepthRegionWritePopup : function(depth){
		let _this = this;
		switch(depth){
			case 1 :
				if($('#regionWrite0').val() == ''){
					alert('권역을 선택해주세요');
				} else {
					_this.change2DepthRegionWrite(1, $('#regionWrite0').val());
				}
				break;
			case 2 :
				if($('#regionWrite0').val() == ''){
					alert('권역을 선택해주세요');
				} else if($('#regionWrite1').val() == ''){
					alert('도시를 선택해주세요');
				} else {
					_this.change2DepthRegionWrite(2, $('#regionWrite0').val(), $('#regionWrite1').val());
				}
				break;
			default : popupManager.add("#regionWrite2DepthSelectPopup0"); break;
		}
	}
	
	,select2DepthRegionWrite : function(depth, target){
		let _this = this;
		let targetVal = $(target).text();
		let selectInput = '';
		_this.regionStatusVal = Number(depth);
		switch(depth){
			case 1 :
				selectInput = $('#regionWrite1');			
				break;
			case 2 :
				selectInput = $('#regionWrite2');
				break;
			default :
				selectInput = $('#regionWrite0');	 
				break;
		}
		
		selectInput.val(targetVal);
		selectInput.siblings('a').addClass('active');
		selectInput.siblings('a').find('> span').text(targetVal);
		switch(depth){
			case 1 :
				$('a[onclick="mainWrite.complete2DepthRegionWrite()"]').addClass('active');
				$('#regionWrite2').val('');
				$('#regionWrite2').siblings('a').removeClass('active');
				$('#regionWrite2').siblings('a').find('> span').text('지역을 선택해주세요.');
				break;
			case 2 :
				_this.addRegionWrite();
				break;
			default :
				$('#regionWrite1').val('');
				$('#regionWrite1').siblings('a').removeClass('active');
				$('#regionWrite1').siblings('a').find('> span').text('도시를 선택해주세요.');
				$('#regionWrite2').val('');
				$('#regionWrite2').siblings('a').removeClass('active');
				$('#regionWrite2').siblings('a').find('> span').text('지역을 선택해주세요.');
				break;
		}
		popupManager.removePopLatest(true);
	}
	
	,change2DepthRegionWrite(depth, region0, region1){
		let _this = this;
		if(depth == 1){
			let region1List = Object.keys(regionValue[region0]);
			_this.region1Select.empty();
			region1List.forEach(function(value){
				_this.region1Select.append('<li><a href="javascript:void(0)">' + value + '</a></li');
			})
			
			//도시선택 이벤트
			_this.region1Select.find('> li > a').on('click', function(){
				_this.select2DepthRegionWrite(1,$(this));		
			});
			
			popupManager.add('#regionWrite2DepthSelectPopup1');
			
		} else {
			let region2List = regionValue[region0][region1];
			_this.region2Select.empty();
			region2List.forEach(function(value){
				_this.region2Select.append('<li><a href="javascript:void(0)">' + value + '</a></li');
			})
			
			//지역선택 이벤트
			_this.region2Select.find('> li > a').on('click', function(){
				_this.select2DepthRegionWrite(2,$(this));		
			});
			
			popupManager.add('#regionWrite2DepthSelectPopup2');
		}
	}
	
	,resetRegionWrite : function(){
		$('#regionWrite0').val('');
		$('#regionWrite0').siblings('a').removeClass('active');
		$('#regionWrite0').siblings('a').find('> span').text('권역을 선택해주세요.');
		$('#regionWrite1').val('');
		$('#regionWrite1').siblings('a').removeClass('active');
		$('#regionWrite1').siblings('a').find('> span').text('도시를 선택해주세요.');
		$('#regionWrite2').val('');
		$('#regionWrite2').siblings('a').removeClass('active');
		$('#regionWrite2').siblings('a').find('> span').text('지역을 선택해주세요.');
		
		if(this.regionStatusVal == 0) $('a[onclick="mainWrite.complete2DepthRegionWrite()"]').removeClass('active');
		
		this.regionStatusVal = 0;
	}
	
	,addRegionWrite : function(){
		let _this = this;
		
		let addTarget = "";
		if(_this.regionStatusVal == 2){
			addTarget = $('#regionWrite1').val() + " " + $('#regionWrite2').val();	
		} else {
			addTarget = $('#regionWrite1').val();
		}
		
		let currentVal = $('#regionWriteSelectPopList').val();
		
		let currentList = currentVal.substring(0,currentVal.indexOf(']'));
		
		if(currentVal == '[]'){
			currentList += addTarget;
		} else {
			
			if(_this.regionStatusVal == 2){
				if(currentVal.indexOf(addTarget) > -1){
					alert('중복된 지역입니다.');
					$('#regionWrite2').val('');
					$('#regionWrite2').siblings('a').removeClass('active');
					$('#regionWrite2').siblings('a').find('> span').text('지역을 선택해주세요.');
					return false;
				} else {
					currentList += "," + addTarget;	
				}	
			} else {
				if(currentVal.indexOf(addTarget + ",") > -1 || currentVal.indexOf(addTarget + "]") > -1 || (currentVal.indexOf(addTarget) > -1 && currentVal.length == addTarget.length + 2)){
					alert('중복된 지역입니다.');
					return false;
				} else {
					currentList += "," + addTarget;	
				}
			}

		}
		currentList += ']';
		
		$('#regionWriteSelectPopList').val(currentList);
		
		$('#regionWriteSelectPopListCon').prepend('<li><div><span>' + addTarget + '</span><a href="javascript:void(0)" class="main_filter_popup_select_result_delete_btn" onclick="mainWrite.deleteRegionWrite(\'' + addTarget + '\', $(this), 1)"></a></div></li>');
		$('a[onclick="mainWrite.complete2DepthRegionWrite()"]').addClass('active');
		this.resetRegionWrite();
	}
	
	,deleteRegionWrite : function(targetText, target, depth){
		
		let currentList = '';
		if(depth == 0){
			currentList = $('#regionWriteList').val();
		} else {
			currentList = $('#regionWriteSelectPopList').val();
		}
		let curr0 = currentList.substring(0, currentList.indexOf(targetText));
		let curr1 = currentList.substring((currentList.indexOf(targetText) + targetText.length),(currentList.length));
		
		if(curr1.substring(0,1) ==" "){
			curr0 = currentList.substring(0, currentList.indexOf("," + targetText));
			curr1 = currentList.substring((currentList.indexOf("," + targetText) + targetText.length + 1),(currentList.length));
		}
		
		if(curr0.substring(curr0.length - 1, curr0.length) == ",") curr0 = curr0.substring(0, curr0.length - 1);
		if(curr1.substring(0,1) == ",") curr1 = curr1.substring(1, curr1.length);
		
		if(curr0.length > 1 && curr1.length > 1){
			curr0 = curr0 + ",";
		}
		
		if(depth == 0){
			$('#regionWriteList').val(curr0 + curr1);				
		} else {
			$('#regionWriteSelectPopList').val(curr0 + curr1);
		}
		
		$(target).parent().parent().remove();
	}
	
	,complete2DepthRegionWrite : function(){
		let _this = this;
		
		switch(_this.regionStatusVal){
			case 1 :
				_this.addRegionWrite();
				break;
			default :
			if(confirm('적용하시겠습니까?')){
				$('#regionWriteList').val($('#regionWriteSelectPopList').val());
				$('#workWriteRegionList').empty();
				
				if($('#regionWriteSelectPopList').val() != '[]'){
					let currentList = $('#regionWriteList').val().substring(1, $('#regionWriteList').val().length - 1).split(",");
					currentList.forEach(function(value){
						$('#workWriteRegionList').append('<li><div><span>' + value + '</span><a href="javascript:void(0)" class="popup_work_select_list_delete_btn" onclick="mainWrite.deleteRegionWrite(\'' + value + '\', $(this), 0)"></a></div></li>')
					});	
				}
				
				$('#regionWriteSelectPopList').val('[]');
				$('#regionWriteSelectPopListCon').empty();
				popupManager.removePopLatest(true);
			}
			break;
		}
	}
	
	,open2DepthCategoryWritePopup : function(depth){
		let _this = this;
		if(depth == 1){
			_this.change2DepthCategoryWrite($('#categoryWrite0').val());
		} else {
			popupManager.add("#categoryWrite2DepthSelectPopup0");
		}
	}
	
	,select2DepthCategoryWrite : function(depth, target){
		let _this = this;
		let targetVal = $(target).text();
		let selectInput = '';
		_this.categoryStatusVal = Number(depth) + 1;
		
		if(depth != 1){
			selectInput = $('#categoryWrite0');
		} else {
			selectInput = $('#categoryWrite1');
		}
		
		selectInput.val(targetVal);
		selectInput.siblings('a').addClass('active');
		selectInput.siblings('a').find('> span').text(targetVal);
		if(depth == 0){
			$('a[onclick="mainWrite.complete2DepthCategoryWrite()"]').addClass('active');
			$('#categoryWrite1').val('');
			$('#categoryWrite1').siblings('a').removeClass('active');
			$('#categoryWrite1').siblings('a').find('> span').text('소분류를 선택해주세요.');
		}
		if(depth == 1) 	_this.addCategoryWrite();
		popupManager.removePopLatest(true);
	}
	
	,change2DepthCategoryWrite(category0){
		let _this = this;
		let category1List = categoryValue[category0];
			_this.category1Select.empty();
			category1List.forEach(function(value){
				_this.category1Select.append('<li><a href="javascript:void(0)">' + value + '</a></li');
			})
			
			//대분류선택 이벤트
			_this.category1Select.find('> li > a').on('click', function(){
				_this.select2DepthCategoryWrite(1,$(this));		
			});
			
			popupManager.add('#categoryWrite2DepthSelectPopup1');
	}
	
	,resetCategoryWrite : function(){
		$('#categoryWrite0').val('');
		$('#categoryWrite0').siblings('a').removeClass('active');
		$('#categoryWrite0').siblings('a').find('> span').text('대분류를 선택해주세요.');
		$('#categoryWrite1').val('');
		$('#categoryWrite1').siblings('a').removeClass('active');
		$('#categoryWrite1').siblings('a').find('> span').text('소분류를 선택해주세요.');
		
		this.categoryStatusVal = 0;
	}
	
	,addCategoryWrite : function(){
		let _this = this;
		
		let currentVal = $('#categoryWriteSelectPopList').val();
		let currentList = currentVal.substring(0,currentVal.indexOf(']'));
		
		let addTarget = "";
		if(_this.categoryStatusVal > 1){
			addTarget = $('#categoryWrite1').val();
		} else {
			addTarget = $('#categoryWrite0').val();	
		}
		
		if(currentVal == '[]'){
			currentList += addTarget;
		} else {
			if(_this.categoryStatusVal > 1){
				if(currentVal.indexOf(addTarget) > -1){
					alert('중복된 카테고리입니다.');
					$('#categoryWrite1').val('');
					$('#categoryWrite1').siblings('a').removeClass('active');
					$('#categoryWrite1').siblings('a').find('> span').text('소분류를 선택해주세요.');
					return false;
				} else {
					currentList += "," + addTarget;	
				}
			} else {
				if(currentVal.indexOf(addTarget + ",") > -1 || currentVal.indexOf(addTarget + "]") > -1 || (currentVal.indexOf(addTarget) > -1 && currentVal.length == addTarget.length + 2)){
					alert('중복된 카테고리입니다.');
					return false;
				} else {
					currentList += "," + addTarget;	
				}	
			}

		}
		currentList += ']';
		
		$('#categoryWriteSelectPopList').val(currentList);
		
		$('#categoryWriteSelectPopListCon').prepend('<li><div><span>' + addTarget + '</span><a href="javascript:void(0)" class="main_filter_popup_select_result_delete_btn" onclick="mainWrite.deleteCategoryWrite(\'' + addTarget + '\', $(this), 1)"></a></div></li>');
		this.resetCategoryWrite();
	}
	
	,deleteCategoryWrite : function(targetText, target, depth){
		
		let currentList = '';
		if(depth == 0){
			currentList = $('#categoryWriteList').val();
		} else {
			currentList = $('#categoryWriteSelectPopList').val();
		}
		let curr0 = currentList.substring(0, currentList.indexOf(targetText));
		let curr1 = currentList.substring((currentList.indexOf(targetText) + targetText.length),(currentList.length));
		
		if(curr1.substring(0,1) ==" "){
			curr0 = currentList.substring(0, currentList.indexOf("," + targetText));
			curr1 = currentList.substring((currentList.indexOf("," + targetText) + targetText.length + 1),(currentList.length));
		}
		
		if(curr0.substring(curr0.length - 1, curr0.length) == ",") curr0 = curr0.substring(0, curr0.length - 1);
		if(curr1.substring(0,1) == ",") curr1 = curr1.substring(1, curr1.length);
		if(curr0.length > 1 && curr1.length > 1){
			curr0 = curr0 + ",";
		}
		
		if(depth == 0){
			$('#categoryWriteList').val(curr0 + curr1);				
		} else {
			$('#categoryWriteSelectPopList').val(curr0 + curr1);
		}
		
		$(target).parent().parent().remove();
	}
	
	,complete2DepthCategoryWrite : function(){
		let _this = this;
		if(_this.categoryStatusVal == 0){
			if(confirm('적용하시겠습니까?')){
				$('#categoryWriteList').val($('#categoryWriteSelectPopList').val());
				$('#workWriteCategoryList').empty();
				
				if($('#categoryWriteSelectPopList').val() != '[]'){
					let currentList = $('#categoryWriteList').val().substring(1, $('#categoryWriteList').val().length - 1).split(",");
					currentList.forEach(function(value){
						$('#workWriteCategoryList').append('<li><div><span>' + value + '</span><a href="javascript:void(0)" class="popup_work_select_list_delete_btn" onclick="mainWrite.deleteCategoryWrite(\'' + value + '\', $(this), 0)"></a></div></li>')
					});	
				}
				
				$('#categoryWriteSelectPopList').val('[]');
				$('#categoryWriteSelectPopListCon').empty();
				popupManager.removePopLatest(true);
			}
		} else {
			_this.addCategoryWrite();
		}
		
	}
	
	,complete2DepthDateWrite : function(){
		if(confirm('적용하시겠습니까?')){
			if($('#dateWriteStart0Year').val() == null){alert('시작날짜 년도를 설정해주세요'); return false;} 
			if($('#dateWriteStart0Month').val() == null){alert('시작날짜 월을 설정해주세요'); return false;}
			if($('#dateWriteStart0Day').val() == null){alert('시작날짜 일을 설정해주세요'); return false;}
			if($('#dateWriteStart0Hour').val() == null){alert('시작날짜 시간을 설정해주세요'); return false;}
			if($('#dateWriteStart0Min').val() == null){alert('시작날짜 분을 설정해주세요'); return false;}
			if($('#dateWriteEnd0Year').val() == null){alert('종료날짜 년도를 설정해주세요'); return false;}
			if($('#dateWriteEnd0Month').val() == null){alert('종료날짜 월을 설정해주세요'); return false;}
			if($('#dateWriteEnd0Day').val() == null){alert('종료날짜 일을 설정해주세요'); return false;}
			if($('#dateWriteEnd0Hour').val() == null){alert('종료날짜 시간을 설정해주세요'); return false;}
			if($('#dateWriteEnd0Min').val() == null){alert('종료날짜 분을 설정해주세요'); return false;}
			
			let startDateVal = $('#dateWriteStart0Year').val() + '-' + $('#dateWriteStart0Month').val() + '-' + $('#dateWriteStart0Day').val() + ' ' + $('#dateWriteStart0Hour').val() + ':' + $('#dateWriteStart0Min').val();
			let endDateVal = $('#dateWriteEnd0Year').val() + '-' + $('#dateWriteEnd0Month').val() + '-' + $('#dateWriteEnd0Day').val() + ' ' + $('#dateWriteEnd0Hour').val() + ':' + $('#dateWriteEnd0Min').val();
			
			let compareStartDate = new Date(startDateVal + ':00');
			let compareEndDate = new Date(endDateVal + ':00');
			
			if(compareStartDate > compareEndDate){alert('종료날짜가 시작날짜보다 작을 수 없습니다.'); return false;}
			
			let currentDate = new Date();
			if(compareStartDate < currentDate){alert('시작날짜가 현재날짜보다 작을 수 없습니다.'); return false;}
			
			$('#dateWriteStartDate').val(startDateVal);
			$('#dateWriteEndDate').val(endDateVal);
			
			$('#dateWriteText').addClass('active');
			$('#dateWriteText').find('> span').text(startDateVal + ' ~ ' + endDateVal);
			
			popupManager.removePopLatest(true);
		}
	}
	
	,resetDateWrite : function() {
		$('[name="dateWriteStart0Year"]').val("");
		$('[name="dateWriteStart0Month"]').val("");
		$('[name="dateWriteStart0Day"]').val("");
		$('[name="dateWriteStart0Hour"]').val("00");
		$('[name="dateWriteStart0Min"]').val("00");
		
		$('[name="dateWriteEnd0Year"]').val("");
		$('[name="dateWriteEnd0Month"]').val("");
		$('[name="dateWriteEnd0Day"]').val("");
		$('[name="dateWriteEnd0Hour"]').val("00");
		$('[name="dateWriteEnd0Min"]').val("00");
	}
	
	,completeWorkWritePopup : function(){
		if(confirm('등록하시겠습니까?')){
			let title = $('#workTitle').val();
			if(title == '' || typeof(title) == "undefined"){alert('제목을 입력해주세요'); $('#workTitle').focus(); return false;}
			let workClassType = $('#workClassType').val();
			
			let sex;
			if(workClassType != 1){
				sex = $('[name="workSex"]:checked').val();
				if(sex == '' || typeof(sex) == "undefined"){alert('성별을 선택해주세요'); return false;}	
			} else {
				sex = $('#memberSex').val();
			}
			
			let region = $('#regionWriteList').val().substring(1, $('#regionWriteList').val().length - 1);
			if(region == '' || typeof(region) == "undefined"){alert('지역을 선택해주세요'); return false;}
			let category = $('#categoryWriteList').val().substring(1, $('#categoryWriteList').val().length - 1);;
			if(category == '' || typeof(category) == "undefined"){alert('카테고리를 선택해주세요'); return false;}
			let contents = $('#workContents').val();
			if(contents == '' || typeof(contents) == "undefined"){alert('제목을 입력해주세요'); $('#workTitle').focus(); return false;}
			let workStartDate = $('#dateWriteStartDate').val();
			if(workStartDate == '' || typeof(workStartDate) == "undefined"){alert('시작기간을 입력해주세요'); return false;}
			let workEndDate = $('#dateWriteEndDate').val();
			if(workEndDate == '' || typeof(workEndDate) == "undefined"){alert('종료기간을 입력해주세요'); return false;}
			let workMemCategory = $('#workMemCategory').val();
			let workPayment = $('#workPayment').val().replace(/\,/g,'');
			if(workPayment == '' || typeof(workPayment) == "undefined"){alert('금액을 입력해주세요'); $('#workPayment').focus(); return false;}
			
			let params = JSON.stringify({title : title, sex : sex, region : region, category : category, contents : contents, startDate : workStartDate, endDate : workEndDate, memCategory : workMemCategory, classType : workClassType, payment : workPayment});
			
			$.ajax({
				url : "/work/insertData"
				,contentType : 'application/json; charset=UTF-8'
				,dataType : "json"
				,data : params
				,type : "post"
				,async : false
				,timeoutDelay : 90000
				,success : function(result){
					if(result.result){
						alert('등록되었습니다.');
						window.location.reload();
					}
				}
				,error:function(request,status,error){
			    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			});	
		}
	}
	
	,removeEvent : function(){
		
	}
	,destroy : function(){
		
	}
}

$(document).ready(function(){
	mainWrite.init();
})