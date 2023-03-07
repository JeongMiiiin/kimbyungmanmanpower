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


let mainFilter = {

	region0Select : null
	,region1Select : null
	,region2Select : null
	,regionStatusVal : 0
	,category0Select : null
	,category1Select : null

	,init : function(){
		this.region0Select = $('#regionFilter0Select');
		this.region1Select = $('#regionFilter1Select');
		this.region2Select = $('#regionFilter2Select');
		this.category0Select = $('#categoryFilter0Select');
		
		this.getCategory();
		
		this.registEvent();
		
	}
	,registEvent : function(){
		let _this = this;
		
		$('input[type="checkbox"][name="filterSex"]').on('click', function(){
			if($(this).prop('checked')){
				$('input[type="checkbox"][name="filterSex"]').prop('checked', false);
				$(this).prop('checked', true);		
			}
		});
		
		$('input[type="checkbox"][name="filterPcSex"]').on('click', function(){
			if($(this).prop('checked')){
				$('input[type="checkbox"][name="filterPcSex"]').prop('checked', false);
				$(this).prop('checked', true);		
			}
		});
		
		//권역선택 이벤트
		this.region0Select.find('> li > a').on('click', function(){
			_this.select2DepthRegionFilter(0,$(this));		
		});
		
		//대분류선택 이벤트
		this.category0Select.find('> li > a').on('click', function(){
			_this.select2DepthCategoryFilter(0,$(this));		
		});
		
		$('#filterStartPayment').on('keyup', function(e){
			let value = e.target.value != '' ? Number(e.target.value.replaceAll(',','')) : '';
			if(isNaN(value)){
				if(value != ''){
					$(this).val(0);	
				}
			} else {
				$(this).val(value);
			}
			
		});
		
		$('#filterPcStartPayment').on('keyup', function(e){
			let value = e.target.value != '' ? Number(e.target.value.replaceAll(',','')) : '';
			if(isNaN(value)){
				if(value != ''){
					$(this).val(0);	
				}
			} else {
				$(this).val(value);
			}
			
		});
		
		$('#filterEndPayment').on('keyup', function(e){
			let value = e.target.value != '' ? Number(e.target.value.replaceAll(',','')) : '';
			if(isNaN(value)){
				if(value != ''){
					$(this).val(0);	
				}
			} else {
				$(this).val(value);
			}
			
		});
		
		$('#filterPcEndPayment').on('keyup', function(e){
			let value = e.target.value != '' ? Number(e.target.value.replaceAll(',','')) : '';
			if(isNaN(value)){
				if(value != ''){
					$(this).val(0);	
				}
			} else {
				$(this).val(value);
			}
			
		});
		
	}
	
	,openFilterPopup : function(category){
		let _this = this;
		switch(category){
			case 0 : popupManager.add("#regionFilterSelectPopup"); _this.settingRegionPopup(); break;
			case 1 : popupManager.add("#categoryFilterSelectPopup");_this.settingCategoryPopup(); break;
			default : popupManager.add("#dateFilterSelectPopup"); _this.settingDatePopup(); break;
		}
		
	}
	
	,settingRegionPopup : function(){
		if($('#regionFilterList').val() != '[]'){
			$('#regionFilterSelectPopList').val($('#regionFilterList').val());
			let currentList = $('#regionFilterList').val().substring(1, $('#regionFilterList').val().length - 1).split(',');
			currentList.forEach(function(value){
				$('#regionFilterSelectPopListCon').append('<li><div><span>' + value + '</span><a href="javascript:void(0)" class="main_filter_popup_select_result_delete_btn" onclick="mainFilter.deleteRegionFilter(\'' + value + '\', $(this), 1)"></a></div></li>');	
			})
		} else {
			$('#regionFilterSelectPopList').val('[]');
			$('#regionFilterSelectPopListCon').empty();
		}
		this.resetRegionFilter();
	}
	
	,settingDatePopup : function(){
		if($('[name="dateFilterStartDate"]').val() != null && $('[name="dateFilterStartDate"]').val() != "" && $('[name="dateFilterEndDate"]').val() != null && $('[name="dateFilterEndDate"]').val() != "" && $('[name="dateFilterPcStartDate"]').val() != null && $('[name="dateFilterPcStartDate"]').val() != "" && $('[name="dateFilterPcEndDate"]').val() != null && $('[name="dateFilterPcEndDate"]').val() != ""){
			
		} else {
			this.resetDateFilter();
		}
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
						$('#categoryFilter0Select').append('<li><a href="javascript:void(0)">' + targetCategory + '</a></li>');
						$('#categoryWrite0Select').append('<li><a href="javascript:void(0)">' + targetCategory + '</a></li>');
					}
				}
		
			}
			,error:function(request,status,error){
		    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
		
	}
	
	,settingCategoryPopup : function(){
		if($('#categoryFilterList').val() != '[]'){
			$('#categoryFilterSelectPopList').val($('#categoryFilterList').val());
			let currentList = $('#categoryFilterList').val().substring(1, $('#categoryFilterList').val().length - 1).split(',');
			currentList.forEach(function(value){
				$('#categoryFilterSelectPopListCon').append('<li><div><span>' + value + '</span><a href="javascript:void(0)" class="main_filter_popup_select_result_delete_btn" onclick="mainFilter.deleteCategoryFilter(\'' + value + '\', $(this), 1)"></a></div></li>');	
			})
		} else {
			$('a[onclick="mainFilter.complete2DepthCategoryFilter()"]').removeClass('active');
			$('#categoryFilterSelectPopList').val('[]');
			$('#categoryFilterSelectPopListCon').empty();
		}
		this.resetCategoryFilter();
	}
	
	,open2DepthFilterPopup : function(category, depth){
		if(category == 0){
			this.open2DepthRegionFilterPopup(depth);
		} else {
			this.open2DepthCategoryFilterPopup(depth);
		}
	}
	
	,open2DepthRegionFilterPopup : function(depth){
		let _this = this;
		switch(depth){
			case 1 :
				if($('#regionFilter0').val() == ''){
					alert('권역을 선택해주세요');
				} else {
					_this.change2DepthRegionFilter(1, $('#regionFilter0').val());
				}
				break;
			case 2 :
				if($('#regionFilter0').val() == ''){
					alert('권역을 선택해주세요');
				} else if($('#regionFilter1').val() == ''){
					alert('도시를 선택해주세요');
				} else {
					_this.change2DepthRegionFilter(2, $('#regionFilter0').val(), $('#regionFilter1').val());
				}
				break;
			default : popupManager.add("#regionFilter2DepthSelectPopup0"); break;
		}
	}
	
	,select2DepthRegionFilter : function(depth, target){
		let _this = this;
		let targetVal = $(target).text();
		let selectInput = '';
		_this.regionStatusVal = Number(depth);
		switch(depth){
			case 1 :
				selectInput = $('#regionFilter1');			
				break;
			case 2 :
				selectInput = $('#regionFilter2');
				break;
			default :
				selectInput = $('#regionFilter0');	 
				break;
		}
		
		selectInput.val(targetVal);
		selectInput.siblings('a').addClass('active');
		selectInput.siblings('a').find('> span').text(targetVal);
		if(depth == 1){
			$('a[onclick="mainFilter.complete2DepthRegionFilter()"]').addClass('active');
			$('#regionFilter2').val('');
			$('#regionFilter2').siblings('a').removeClass('active');
			$('#regionFilter2').siblings('a').find('> span').text('지역을 선택해주세요.');
		}
		
		if(depth == 2) 	_this.addRegionFilter();
		if(depth == 0) {
			$('#regionFilter1').val('');
			$('#regionFilter1').siblings('a').removeClass('active');
			$('#regionFilter1').siblings('a').find('> span').text('도시를 선택해주세요.');
			$('#regionFilter2').val('');
			$('#regionFilter2').siblings('a').removeClass('active');
			$('#regionFilter2').siblings('a').find('> span').text('지역을 선택해주세요.');
		}
		popupManager.removePopLatest(true);
	}
	
	,change2DepthRegionFilter(depth, region0, region1){
		let _this = this;
		if(depth == 1){
			let region1List = Object.keys(regionValue[region0]);
			_this.region1Select.empty();
			region1List.forEach(function(value){
				_this.region1Select.append('<li><a href="javascript:void(0)">' + value + '</a></li');
			})
			
			//도시선택 이벤트
			_this.region1Select.find('> li > a').on('click', function(){
				_this.select2DepthRegionFilter(1,$(this));		
			});
			
			popupManager.add('#regionFilter2DepthSelectPopup1');
			
		} else {
			let region2List = regionValue[region0][region1];
			_this.region2Select.empty();
			region2List.forEach(function(value){
				_this.region2Select.append('<li><a href="javascript:void(0)">' + value + '</a></li');
			})
			
			//지역선택 이벤트
			_this.region2Select.find('> li > a').on('click', function(){
				_this.select2DepthRegionFilter(2,$(this));		
			});
			
			popupManager.add('#regionFilter2DepthSelectPopup2');
		}
	}
	
	,resetRegionFilter : function(){
		$('#regionFilter0').val('');
		$('#regionFilter0').siblings('a').removeClass('active');
		$('#regionFilter0').siblings('a').find('> span').text('권역을 선택해주세요.');
		$('#regionFilter1').val('');
		$('#regionFilter1').siblings('a').removeClass('active');
		$('#regionFilter1').siblings('a').find('> span').text('도시를 선택해주세요.');
		$('#regionFilter2').val('');
		$('#regionFilter2').siblings('a').removeClass('active');
		$('#regionFilter2').siblings('a').find('> span').text('지역을 선택해주세요.');
		
		if(this.regionStatusVal == 0) $('a[onclick="mainFilter.complete2DepthRegionFilter()"]').removeClass('active');
		
		this.regionStatusVal = 0;
	}
	
	,addRegionFilter : function(){
		let _this = this;
		
		let addTarget = "";
		if(_this.regionStatusVal == 2){
			addTarget = $('#regionFilter1').val() + " " + $('#regionFilter2').val();	
		} else {
			addTarget = $('#regionFilter1').val();
		}
		
		let currentVal = $('#regionFilterSelectPopList').val();
		let currentList = currentVal.substring(0,currentVal.indexOf(']'));
		
		if(currentVal == '[]'){
			currentList += addTarget;
		} else {
			
			if(_this.regionStatusVal == 2){
				if(currentVal.indexOf(addTarget) > -1){
					alert('중복된 지역입니다.');
					$('#regionFilter2').val('');
					$('#regionFilter2').siblings('a').removeClass('active');
					$('#regionFilter2').siblings('a').find('> span').text('지역을 선택해주세요.');
					return false;
				} else {
					currentList += "," + addTarget;	
				}	
			} else {
				if(currentVal.indexOf(addTarget + ",") > -1 || currentVal.indexOf(addTarget + "]") > -1 || (currentVal.indexOf(addTarget) > -1 && currentVal.length == addTarget.length + 2)){
					alert('중복된 지역입니다.');
					$('#regionFilter1').val('');
					$('#regionFilter1').siblings('a').removeClass('active');
					$('#regionFilter1').siblings('a').find('> span').text('도시를 선택해주세요.');
					return false;
				} else {
					currentList += "," + addTarget;	
				}
			}
		}
		currentList += ']';
		
		$('#regionFilterSelectPopList').val(currentList);
		
		$('#regionFilterSelectPopListCon').prepend('<li><div><span>' + addTarget + '</span><a href="javascript:void(0)" class="main_filter_popup_select_result_delete_btn" onclick="mainFilter.deleteRegionFilter(\'' + addTarget + '\', $(this), 1)"></a></div></li>');
		this.resetRegionFilter();
	}
	
	,deleteRegionFilter : function(targetText, target, depth){
		let currentList = '';
		if(depth == 0){
			currentList = $('#regionFilterList').val();
		} else {
			currentList = $('#regionFilterSelectPopList').val();
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
			$('#regionFilterList').val(curr0 + curr1);				
		} else {
			$('#regionFilterSelectPopList').val(curr0 + curr1);
		}
		
		$(target).parent().parent().remove();
	}
	
	,complete2DepthRegionFilter : function(){
		let _this = this;
		
		switch(_this.regionStatusVal){
			case 1 :
				_this.addRegionFilter();
				break;
			default :
				if(confirm('적용하시겠습니까?')){
					$('#regionFilterList').val($('#regionFilterSelectPopList').val());
					$('#regionList').empty();
					
					$('#regionFiltePcList').val($('#regionFilterSelectPopList').val());
					$('#regionPcList').empty();
					
					if($('#regionFilterSelectPopList').val() != '[]'){
						let currentList = $('#regionFilterList').val().substring(1, $('#regionFilterList').val().length - 1).split(",");
						currentList.forEach(function(value){
							$('#regionList').append('<li><div><span>' + value + '</span><a href="javascript:void(0)" class="main_filter_popup_select_result_delete_btn" onclick="mainFilter.deleteRegionFilter(\'' + value + '\', $(this), 0)"></a></div></li>')
							$('#regionPcList').append('<li><div><span>' + value + '</span><a href="javascript:void(0)" class="main_filter_popup_select_result_delete_btn" onclick="mainFilter.deleteRegionFilter(\'' + value + '\', $(this), 0)"></a></div></li>')
						});	
					}
					
					$('#regionFilterSelectPopList').val('[]');
					$('#regionFilterSelectPopListCon').empty();
					popupManager.removePopLatest(true);
				}
				break;
		}
	}
	
	,open2DepthCategoryFilterPopup : function(depth){
		let _this = this;
		popupManager.add("#categoryFilter2DepthSelectPopup0");
	}
	
	,select2DepthCategoryFilter : function(depth, target){
		let _this = this;
		let targetVal = $(target).text();
		let selectInput = $('#categoryFilter0');
		
		selectInput.val(targetVal);
		selectInput.siblings('a').addClass('active');
		selectInput.siblings('a').find('> span').text(targetVal);
		if(depth == 0) 	_this.addCategoryFilter();
		popupManager.removePopLatest(true);
	}
	
	,resetCategoryFilter : function(){
		$('#categoryFilter0').val('');
		$('#categoryFilter0').siblings('a').removeClass('active');
		$('#categoryFilter0').siblings('a').find('> span').text('카테고리를 선택해주세요.');
	}
	
	,addCategoryFilter : function(){
		let currentList = $('#categoryFilterSelectPopList').val().substring(0,$('#categoryFilterSelectPopList').val().indexOf(']'));
		let addTarget = $('#categoryFilter0').val();
		if(currentList == '['){
			currentList += addTarget;
		} else {
			
			if(currentList.indexOf(addTarget) > -1){
				alert('중복된 카테고리입니다.'); return false;
			} else {
				currentList += "," + addTarget;	
			}

		}
		currentList += ']';
		
		$('#categoryFilterSelectPopList').val(currentList);
		
		$('a[onclick="mainFilter.complete2DepthCategoryFilter()"]').addClass('active');
		
		$('#categoryFilterSelectPopListCon').prepend('<li><div><span>' + addTarget + '</span><a href="javascript:void(0)" class="main_filter_popup_select_result_delete_btn" onclick="mainFilter.deleteCategoryFilter(\'' + addTarget + '\', $(this), 1)"></a></div></li>');
		this.resetCategoryFilter();
	}
	
	,deleteCategoryFilter : function(targetText, target, depth){
		
		let currentList = '';
		if(depth == 0){
			currentList = $('#categoryFilterList').val();
		} else {
			currentList = $('#categoryFilterSelectPopList').val();
		}
		let curr0 = currentList.substring(0, currentList.indexOf(targetText));
		let curr1 = currentList.substring((currentList.indexOf(targetText) + targetText.length),(currentList.length));
		if(curr1.substring(0,1) == ",") curr1 = curr1.substring(1, curr1.length);
		
		if(depth == 0){
			$('#categoryFilterList').val(curr0 + curr1);				
		} else {
			$('#categoryFilterSelectPopList').val(curr0 + curr1);
		}
		
		$(target).parent().parent().remove();
	}
	
	,complete2DepthCategoryFilter : function(){
		if(confirm('적용하시겠습니까?')){
			$('#categoryFilterList').val($('#categoryFilterSelectPopList').val());
			$('#categoryList').empty();
			
			$('#categoryFilterPcList').val($('#categoryFilterSelectPopList').val());
			$('#categoryPcList').empty();
			
			if($('#categoryFilterSelectPopList').val() != '[]'){
				let currentList = $('#categoryFilterList').val().substring(1, $('#categoryFilterList').val().length - 1).split(",");
				currentList.forEach(function(value){
					$('#categoryList').append('<li><div><span>' + value + '</span><a href="javascript:void(0)" class="main_filter_popup_select_result_delete_btn" onclick="mainFilter.deleteRegionFilter(\'' + value + '\', $(this), 0)"></a></div></li>')
					$('#categoryPcList').append('<li><div><span>' + value + '</span><a href="javascript:void(0)" class="main_filter_popup_select_result_delete_btn" onclick="mainFilter.deleteRegionFilter(\'' + value + '\', $(this), 0)"></a></div></li>')
				});	
			}
			
			$('#categoryFilterSelectPopList').val('[]');
			$('#categoryFilterSelectPopListCon').empty();
			popupManager.removePopLatest(true);
		}
	}
	
	,complete2DepthDateFilter : function(){
		if(confirm('적용하시겠습니까?')){
			if($('#dateFilterStart0Year').val() == null){alert('시작날짜 년도를 설정해주세요'); return false;} 
			if($('#dateFilterStart0Month').val() == null){alert('시작날짜 월을 설정해주세요'); return false;}
			if($('#dateFilterStart0Day').val() == null){alert('시작날짜 일을 설정해주세요'); return false;}
			if($('#dateFilterStart0Hour').val() == null){alert('시작날짜 시간을 설정해주세요'); return false;}
			if($('#dateFilterStart0Min').val() == null){alert('시작날짜 분을 설정해주세요'); return false;}
			if($('#dateFilterEnd0Year').val() == null){alert('종료날짜 년도를 설정해주세요'); return false;}
			if($('#dateFilterEnd0Month').val() == null){alert('종료날짜 월을 설정해주세요'); return false;}
			if($('#dateFilterEnd0Day').val() == null){alert('종료날짜 일을 설정해주세요'); return false;}
			if($('#dateFilterEnd0Hour').val() == null){alert('종료날짜 시간을 설정해주세요'); return false;}
			if($('#dateFilterEnd0Min').val() == null){alert('종료날짜 분을 설정해주세요'); return false;}
			
			let startDateVal = $('#dateFilterStart0Year').val() + '-' + $('#dateFilterStart0Month').val() + '-' + $('#dateFilterStart0Day').val() + ' ' + $('#dateFilterStart0Hour').val() + ':' + $('#dateFilterStart0Min').val();
			let endDateVal = $('#dateFilterEnd0Year').val() + '-' + $('#dateFilterEnd0Month').val() + '-' + $('#dateFilterEnd0Day').val() + ' ' + $('#dateFilterEnd0Hour').val() + ':' + $('#dateFilterEnd0Min').val();
			
			let compareStartDate = new Date(startDateVal + ':00');
			let compareEndDate = new Date(endDateVal + ':00');
			
			if(compareStartDate > compareEndDate){alert('종료날짜가 시작날짜보다 작을 수 없습니다.'); return false;}
			
			$('#dateFilterStartDate').val(startDateVal);
			$('#dateFilterEndDate').val(endDateVal);
			
			$('#dateFilterText').addClass('active');
			$('#dateFilterText').find('> span').text(startDateVal + ' ~ ' + endDateVal);
			
			$('#dateFilterPcText').addClass('active');
			$('#dateFilterPcText').find('> span').text(startDateVal + ' ~ ' + endDateVal);
			
			popupManager.removePopLatest(true);
		}
	}
	
	,resetDateFilter : function() {
		$('[name="dateFilterStart0Year"]').val("");
		$('[name="dateFilterStart0Month"]').val("");
		$('[name="dateFilterStart0Day"]').val("");
		$('[name="dateFilterStart0Hour"]').val("00");
		$('[name="dateFilterStart0Min"]').val("00");
		
		$('[name="dateFilterEnd0Year"]').val("");
		$('[name="dateFilterEnd0Month"]').val("");
		$('[name="dateFilterEnd0Day"]').val("");
		$('[name="dateFilterEnd0Hour"]').val("00");
		$('[name="dateFilterEnd0Min"]').val("00");
	}
	
	,submitSearchFilter : function(popStatus){
		let _this = this;
		
		let filterClass = '';
		if(typeof($('[name="filterClass"]:checked').val()) != "undefined"){
			$('[name="filterClass"]:checked').each(function(){
				filterClass += $(this).val() + " ";
			});
		}
		
		if(typeof($('[name="filterPcClass"]:checked').val()) != "undefined"){
			filterClass = '';
			$('[name="filterPcClass"]:checked').each(function(){
				filterClass += $(this).val() + ",";
			});
		}
		
		if(filterClass.length > 0) filterClass = filterClass.substring(0, filterClass.length - 1);
		
		let filterSex = '';
		if(typeof($('[name="filterSex"]:checked').val()) != "undefined"){
			$('[name="filterSex"]:checked').each(function(){
				filterSex += $(this).val() + ",";
			});
		}
		
		if(typeof($('[name="filterPcSex"]:checked').val()) != "undefined"){
			filterSex = '';
			$('[name="filterPcSex"]:checked').each(function(){
				filterSex += $(this).val() + ",";
			});
		}
		
		if(filterSex.length > 0) filterSex = filterSex.substring(0, filterSex.length - 1);
		
		let regionFilterList = $('#regionFilterList').val().substring(1, $('#regionFilterList').val().length - 1);
		let categoryFilterList = $('#categoryFilterList').val().substring(1, $('#categoryFilterList').val().length - 1);
		let dateFilterStartDate, dateFilterEndDate;
		let nowDate = new Date();
		let nowMonth, nowDay;
		if(typeof($('[name="dateFileterSelect"]:checked').val()) != "undefined"){
			
			nowMonth = (nowDate.getMonth() + 1) > 9 ? nowDate.getMonth() + 1 : '0' + (nowDate.getMonth() + 1);
			nowDay = nowDate.getDate() > 9 ? nowDate.getDate() : '0' + nowDate.getDate();
					
			dateFilterStartDate = nowDate.getFullYear() + '-' + nowMonth + '-' + nowDay + " " + "00:00";
			
			let targetVal = $('[name="dateFileterSelect"]:checked').val();
			switch(targetVal){
				case 'week1' :					
					nowDate.setDate(nowDate.getDate() + 7);
					nowMonth = (nowDate.getMonth() + 1) > 9 ? nowDate.getMonth() + 1 : '0' + (nowDate.getMonth() + 1);
					nowDay = nowDate.getDate() > 9 ? nowDate.getDate() : '0' + nowDate.getDate();   
					
					dateFilterEndDate = nowDate.getFullYear() + '-' + nowMonth + '-' + nowDay + " " + "00:00";
					break;
				case 'month3' :
					nowDate.setMonth(nowDate.getMonth() + 3);
					nowMonth = (nowDate.getMonth() + 1) > 9 ? nowDate.getMonth() + 1 : '0' + (nowDate.getMonth() + 1);
					nowDay = nowDate.getDate() > 9 ? nowDate.getDate() : '0' + nowDate.getDate();   
					
					dateFilterEndDate = nowDate.getFullYear() + '-' + nowMonth + '-' + nowDay + " " + "00:00";
				
					break;
				case 'month6' :
				 	nowDate.setMonth(nowDate.getMonth() + 6);
					nowMonth = (nowDate.getMonth() + 1) > 9 ? nowDate.getMonth() + 1 : '0' + (nowDate.getMonth() + 1);
					nowDay = nowDate.getDate() > 9 ? nowDate.getDate() : '0' + nowDate.getDate();   
					
					dateFilterEndDate = nowDate.getFullYear() + '-' + nowMonth + '-' + nowDay + " " + "00:00";
					break;
				case 'year1' :
					nowDate.setYear(nowDate.getYear() + 1);
					nowMonth = (nowDate.getMonth() + 1) > 9 ? nowDate.getMonth() + 1 : '0' + (nowDate.getMonth() + 1);
					nowDay = nowDate.getDate() > 9 ? nowDate.getDate() : '0' + nowDate.getDate();   
					
					dateFilterEndDate = nowDate.getFullYear() + '-' + nowMonth + '-' + nowDay + " " + "00:00";
					break;
				default :
					nowDate.setYear(nowDate.getYear() + 3);
					nowMonth = (nowDate.getMonth() + 1) > 9 ? nowDate.getMonth() + 1 : '0' + (nowDate.getMonth() + 1);
					nowDay = nowDate.getDate() > 9 ? nowDate.getDate() : '0' + nowDate.getDate();   
					
					dateFilterEndDate = nowDate.getFullYear() + '-' + nowMonth + '-' + nowDay + " " + "00:00";
					break;
			}
		}
		let filterStartPayment = Number($('#filterStartPayment').val().replaceAll(',',''));
		let filterEndPayment = Number($('#filterEndPayment').val().replaceAll(',',''));
		
		let params = JSON.stringify({filterMemCategory : 1, filterClass : filterClass, filterSex : filterSex, filterRegion : regionFilterList, filterCategory : categoryFilterList, filterStartDate : dateFilterStartDate, filterEndDate : dateFilterEndDate, filterStartPayment : filterStartPayment, filterEndPayment : filterEndPayment});
		
		$.ajax({
			url : "/work/searchWork"
			,contentType : 'application/json; charset=UTF-8'
			,dataType : "json"
			,data : params
			,type : "post"
			,async : false
			,timeoutDelay : 90000
			,success : function(result){
				if(result.result){
					_this.workSearchResult(result.data);
					if(popStatus) popupManager.removePopLatest(true);
				}
		
			}
			,error:function(request,status,error){
		    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
	}
	
	,workSearchResult : function(data){
		$('#mainWorkList').empty();
		if(data.length > 0){
				let workTarget;
				let workRegion;
			for(let i=0; i < data.length; i++){
				workTarget = data[i];
				
				$('#mainWorkList').append('<li onclick="main.openWorkViewPopup(' + workTarget["sn"] + ')">' +
				'<div class="col-12 work_list_inner">' +
					'<div class="col-12 work_list_title">' + workTarget["title"] + '</div>' +
					'<ul class="col-12 work_region_list">' +
					'</ul>' +
					'<div class="col-12 work_list_contents">' + workTarget["contents"] + '</div>' +
				'</div></li>');
				 workRegion = workTarget["region"].split(',');

				 for(let j=0; j < workRegion.length; j++){
					if(workRegion[j] != ''){
						let regionTarget = $('#mainWorkList').find('> li').last().find(' > div > ul');
						regionTarget.append('<li><span>' + workRegion[j] + '</span></li>');	
					}
				}
				
			}
		} else {
			$('#mainWorkList').append('<li class="no_data"><span>검색결과가 없습니다.</span></li>');	
		}
		
	}
	
	,removeEvent : function(){
		
	}
	,destroy : function(){
		
	}
}

$(document).ready(function(){
	mainFilter.init();
})