let regionValue = {"수도권" :{"서울특별시" : [ "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구" ],
            "경기도" : [ "수원시 장안구", "수원시 권선구", "수원시 팔달구", "수원시 영통구", "성남시 수정구", "성남시 중원구", "성남시 분당구", "의정부시", "안양시 만안구", "안양시 동안구", "부천시", "광명시", "평택시", "동두천시", "안산시 상록구", "안산시 단원구", "고양시 덕양구", "고양시 일산동구",
                "고양시 일산서구", "과천시", "구리시", "남양주시", "오산시", "시흥시", "군포시", "의왕시", "하남시", "용인시 처인구", "용인시 기흥구", "용인시 수지구", "파주시", "이천시", "안성시", "김포시", "화성시", "광주시", "양주시", "포천시", "여주시", "연천군", "가평군", "양평군" ],
            "인천광역시" : [ "계양구", "미추홀구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군" ]},
        "강원권" :{"강원도" : [ "춘천시", "원주시", "강릉시", "동해시", "태백시", "속초시", "삼척시", "홍천군", "횡성군", "영월군", "평창군", "정선군", "철원군", "화천군", "양구군", "인제군", "고성군", "양양군" ]},
        "충청권" :{"충청북도" : [ "청주시 상당구", "청주시 서원구", "청주시 흥덕구", "청주시 청원구", "충주시", "제천시", "보은군", "옥천군", "영동군", "증평군", "진천군", "괴산군", "음성군", "단양군" ],
            "충청남도" : [ "천안시 동남구", "천안시 서북구", "공주시", "보령시", "아산시", "서산시", "논산시", "계룡시", "당진시", "금산군", "부여군", "서천군", "청양군", "홍성군", "예산군", "태안군" ],
            "대전광역시" : [ "대덕구", "동구", "서구", "유성구", "중구" ], "세종특별자치시" : [ "세종특별자치시" ]},
        "전라권" :{"전라북도" : [ "전주시 완산구", "전주시 덕진구", "군산시", "익산시", "정읍시", "남원시", "김제시", "완주군", "진안군", "무주군", "장수군", "임실군", "순창군", "고창군", "부안군" ],
            "전라남도" : [ "목포시", "여수시", "순천시", "나주시", "광양시", "담양군", "곡성군", "구례군", "고흥군", "보성군", "화순군", "장흥군", "강진군", "해남군", "영암군", "무안군", "함평군", "영광군", "장성군", "완도군", "진도군", "신안군" ],
            "광주광역시" : [ "광산구", "남구", "동구", "북구", "서구" ]},
        "경상권" : {"경상북도" : [ "포항시 남구", "포항시 북구", "경주시", "김천시", "안동시", "구미시", "영주시", "영천시", "상주시", "문경시", "경산시", "군위군", "의성군", "청송군", "영양군", "영덕군", "청도군", "고령군", "성주군", "칠곡군", "예천군", "봉화군", "울진군", "울릉군" ],
            "경상남도" : [ "창원시 의창구", "창원시 성산구", "창원시 마산합포구", "창원시 마산회원구", "창원시 진해구", "진주시", "통영시", "사천시", "김해시", "밀양시", "거제시", "양산시", "의령군", "함안군", "창녕군", "고성군", "남해군", "하동군", "산청군", "함양군", "거창군", "합천군" ],
            "부산광역시" : [ "강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구", "기장군" ],
            "대구광역시" : [ "남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군" ],
            "울산광역시" : [ "남구", "동구", "북구", "중구", "울주군" ]},
        "제주권" : {"제주특별자치도" : [ "서귀포시", "제주시" ]}
};

let workUpdate = {
	
	region0Select : null
	,region1Select : null
	,region2Select : null
	,regionStatusVal : 0
	,category0Select : null
	,categoryStatusVal : 0
	,passwordVal : null
	,confirmPasswordStatus : true
	
	,init : function(){
		this.getCategory();
		this.region0Select = $('#regionWrite0Select');
		this.region1Select = $('#regionWrite1Select');
		this.region2Select = $('#regionWrite2Select');
		this.category0Select = $('#categoryWrite0Select');
		this.passwordVal = $('#workPassword').val();
		
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
				$('a[onclick="workUpdate.complete2DepthDateWrite()"]').addClass('active');
			} else {
				$('a[onclick="workUpdate.complete2DepthDateWrite()"]').removeClass('active');
			}
		});
		
		$('[name="workPassword"]').on('keyup', function(){
			if(_this.passwordVal != $(this).val()){
				_this.confirmPasswordStatus = false;
			} else {
				_this.confirmPasswordStatus = true;
			}
		});
		
		$('[name="workConfirmPassword"]').on('keyup', function(){
			if($(this).val() != $('[name="workPassword"]').val()){
				_this.confirmPasswordStatus = false;
				$(this).siblings('.sign_up_assist_text.correct').hide();
				$(this).siblings('.sign_up_assist_text.incorrect').show();
			} else {
				_this.confirmPasswordStatus = true;
				$(this).siblings('.sign_up_assist_text.incorrect').hide();
				$(this).siblings('.sign_up_assist_text.correct').show();
			}
		});
		
	}
	
	,getCategory : function(){
		let params = JSON.stringify({});
		
		$.ajax({
			url : "/category/getCategory"
			,contentType : 'application/json; charset=UTF-8'
			,dataType : "json"
			,data : params
			,type : "post"
			,async : false
			,timeoutDelay : 90000
			,success : function(result){
				if(result.length > 0){
					for(let i = 0; i < result.length; i++){
						let targetCategory = result[i].title;
						$('#categoryWrite0Select').append('<li><a href="javascript:void(0)">' + targetCategory + '</a></li>');
					}
				}
		
			}
			,error:function(request,status,error){
		    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
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
		if($('#regionWriteList').val() != ''){
			$('#regionWriteSelectPopList').val($('#regionWriteList').val());
			let currentList = $('#regionWriteList').val().substring(0, $('#regionWriteList').val().length).split(',');
			currentList.forEach(function(value){
				$('#regionWriteSelectPopListCon').append('<li><div><span>' + value + '</span><a href="javascript:void(0)" class="main_filter_popup_select_result_delete_btn" onclick="workUpdate.deleteRegionWrite(\'' + value + '\', $(this), 1)"></a></div></li>');	
			})
		} else {
			$('a[onclick="workUpdate.complete2DepthRegionWrite()"]').removeClass('active');
			$('#regionWriteSelectPopList').val('');
			$('#regionWriteSelectPopListCon').empty();
		}
		this.resetRegionWrite();
	}
	
	,settingCategoryPopup : function(){
		if($('#categoryWriteList').val() != ''){
			$('#categoryWriteSelectPopList').val($('#categoryWriteList').val());
			let currentList = $('#categoryWriteList').val().substring(0, $('#categoryWriteList').val().length).split(',');
			currentList.forEach(function(value){
				$('#categoryWriteSelectPopListCon').append('<li><div><span>' + value + '</span><a href="javascript:void(0)" class="main_filter_popup_select_result_delete_btn" onclick="workUpdate.deleteCategoryWrite(\'' + value + '\', $(this), 1)"></a></div></li>');	
			})
		} else {
			$('a[onclick="workUpdate.complete2DepthCategoryWrite()"]').removeClass('active');
			$('#categoryWriteSelectPopList').val('');
			$('#categoryWriteSelectPopListCon').empty();
		}
		this.resetCategoryWrite();
	}
	
	,settingDatePopup : function(){
		if($('[name="startDate"]').val() != null && $('[name="startDate"]').val() != "" && $('[name="endDate"]').val() != null && $('[name="endDate"]').val() != ""){
			$('a[onclick="workUpdate.complete2DepthDateWrite()"]').addClass('active');
		} else {
			$('a[onclick="workUpdate.complete2DepthDateWrite()"]').removeClass('active');
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
				$('a[onclick="workUpdate.complete2DepthRegionWrite()"]').addClass('active');
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
		
		if(this.regionStatusVal == 0) $('a[onclick="workUpdate.complete2DepthRegionWrite()"]').removeClass('active');
		
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
		
		if(currentVal == ''){
			currentVal = addTarget;
		} else {
			
			if(_this.regionStatusVal == 2){
				if(currentVal.indexOf(addTarget) > -1){
					alert('중복된 지역입니다.');
					$('#regionWrite2').val('');
					$('#regionWrite2').siblings('a').removeClass('active');
					$('#regionWrite2').siblings('a').find('> span').text('지역을 선택해주세요.');
					return false;
				} else {
					currentVal += "," + addTarget;	
				}	
			} else {
				if(currentVal.indexOf(addTarget + ",") > -1 || currentVal.indexOf(addTarget + "]") > -1 || (currentVal.indexOf(addTarget) > -1 && currentVal.length == addTarget.length)){
					alert('중복된 지역입니다.');
					return false;
				} else {
					currentVal += "," + addTarget;	
				}
			}

		}
		
		$('#regionWriteSelectPopList').val(currentVal);
		
		$('#regionWriteSelectPopListCon').prepend('<li><div><span>' + addTarget + '</span><a href="javascript:void(0)" class="main_filter_popup_select_result_delete_btn" onclick="workUpdate.deleteRegionWrite(\'' + addTarget + '\', $(this), 1)"></a></div></li>');
		$('a[onclick="workUpdate.complete2DepthRegionWrite()"]').addClass('active');
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
				
				if($('#regionWriteSelectPopList').val() != ''){
					let currentList = $('#regionWriteList').val().substring(0, $('#regionWriteList').val().length).split(",");
					currentList.forEach(function(value){
						$('#workWriteRegionList').append('<li><div><span>' + value + '</span><a href="javascript:void(0)" class="popup_work_select_list_delete_btn" onclick="workUpdate.deleteRegionWrite(\'' + value + '\', $(this), 0)"></a></div></li>')
					});	
				}
				
				$('#regionWriteSelectPopList').val('');
				$('#regionWriteSelectPopListCon').empty();
				popupManager.removePopLatest(true);
			}
			break;
		}
	}
	
	,open2DepthCategoryWritePopup : function(depth){
		popupManager.add("#categoryWrite2DepthSelectPopup0");
	}
	
	,select2DepthCategoryWrite : function(depth, target){
		let _this = this;
		let targetVal = $(target).text();
		let selectInput = $('#categoryWrite0');
		
		selectInput.val(targetVal);
		selectInput.siblings('a').addClass('active');
		selectInput.siblings('a').find('> span').text(targetVal);
		if(depth == 0) 	_this.addCategoryWrite();
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
		$('#categoryWrite0').siblings('a').find('> span').text('카테고리를 선택해주세요.');
	}
	
	,addCategoryWrite : function(){
		let _this = this;
		
		let currentVal = $('#categoryWriteSelectPopList').val();
		
		let addTarget = "";
		if(_this.categoryStatusVal > 1){
			addTarget = $('#categoryWrite1').val();
		} else {
			addTarget = $('#categoryWrite0').val();	
		}
		
		if(currentVal == ''){
			currentVal = addTarget;
		} else {
			if(currentVal.indexOf(addTarget) > -1){
				alert('중복된 카테고리입니다.');
				return false;
			} else {
				currentVal += "," + addTarget;	
			}
		}
		
		$('#categoryWriteSelectPopList').val(currentVal);
		
		$('#categoryWriteSelectPopListCon').prepend('<li><div><span>' + addTarget + '</span><a href="javascript:void(0)" class="main_filter_popup_select_result_delete_btn" onclick="workUpdate.deleteCategoryWrite(\'' + addTarget + '\', $(this), 1)"></a></div></li>');
		$('a[onclick="workUpdate.complete2DepthCategoryWrite()"]').addClass('active');
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
					let currentList = $('#categoryWriteList').val().substring(0, $('#categoryWriteList').val().length).split(",");
					currentList.forEach(function(value){
						$('#workWriteCategoryList').append('<li><div><span>' + value + '</span><a href="javascript:void(0)" class="popup_work_select_list_delete_btn" onclick="workUpdate.deleteCategoryWrite(\'' + value + '\', $(this), 0)"></a></div></li>')
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
			
			$('[name="startDate"]').val(startDateVal);
			$('[name="endDate"]').val(endDateVal);
			
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
	
	,updateForm : function(sn, pageCategory){
		if(confirm('변경하시겠습니까?')){
			
			if( !this.confirmPasswordStatus ){
				alert('비밀번호 확인이 일치하지 않습니다. 다시 확인해 주세요.');
				$('[name="workConfirmPassword"]').focus();
				return false;
			}
			
			let title = $('#workTitle').val();
			if(title == '' || typeof(title) == "undefined"){alert('제목을 입력해주세요'); $('#workTitle').focus(); return false;}
			let password = $('#workPassword').val();
			if(password == '' || typeof(password) == "undefined"){alert('비밀번호를 입력해주세요'); $('#workPassword').focus(); return false;}
			let sex = $('[name="sex"]:checked').val();
			if(sex == '' || typeof(sex) == "undefined"){alert('성별을 선택해주세요'); return false;}
			let region = $('#regionWriteList').val().substring(0, $('#regionWriteList').val().length);
			if(region == '' || typeof(region) == "undefined"){alert('지역을 선택해주세요'); return false;}
			let category = $('#categoryWriteList').val().substring(0, $('#categoryWriteList').val().length);
			if(category == '' || typeof(category) == "undefined"){alert('카테고리를 선택해주세요'); return false;}
			let contents = $('#workContents').val();
			if(contents == '' || typeof(contents) == "undefined"){alert('제목을 입력해주세요'); $('#workTitle').focus(); return false;}
			let workStartDate = $('#dateWriteStartDate').val();
			if(workStartDate == '' || typeof(workStartDate) == "undefined"){alert('시작기간을 입력해주세요'); return false;}
			let workEndDate = $('#dateWriteEndDate').val();
			if(workEndDate == '' || typeof(workEndDate) == "undefined"){alert('종료기간을 입력해주세요'); return false;}
			let workPayment = $('#workPayment').val().replace(/\,/g,'');
			if(workPayment == '' || typeof(workPayment) == "undefined"){workPayment = -1;}
			let workNumbers = $('#workNumbers').val();
			if(workNumbers == '' || typeof(workNumbers) == "undefined"){alert('인원을 선택해주세요'); return false;}
			
			let params = JSON.stringify({sn : sn, title : title, password : password, sex : sex, region : region, category : category, contents : contents, startDate : workStartDate, endDate : workEndDate, payment : workPayment, numbers : workNumbers});
			
			$.ajax({
				url : "/work/updateData"
				,contentType : 'application/json; charset=UTF-8'
				,dataType : "json"
				,data : params
				,type : "post"
				,async : false
				,timeoutDelay : 90000
				,success : function(result){
					if(result.result){
						alert('변경되었습니다.');
						window.location.href='/business/myInfo/workView?sn=' + sn + '&pageCategory=' + pageCategory;
					} else {
						alert('변경에 실패했습니다. 잠시 후 다시 시도해주세요');
					}
				}
				,error:function(request,status,error){
			    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			});	
		}
	}
	
	,deleteAction : function(sn){
		if(confirm('삭제하시겠습니까?')){
			let params = JSON.stringify({sn : sn});
			$.ajax({
					url : "/work/deleteData"
					,contentType : 'application/json; charset=UTF-8'
					,dataType : "json"
					,data : params
					,type : "post"
					,async : false
					,timeoutDelay : 90000
					,success : function(result){
						if(result.result){
							alert('변경되었습니다.');
							window.location.href='/business/myInfo/page?tabIdx=0';
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
	workUpdate.init();
})