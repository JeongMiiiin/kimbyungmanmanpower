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

let categoryValue = {"이사" : ["원룸/소형 이사","용달/화물 운송","국내 이사","가정이사 (투룸 이상)","사무실/상업공간 이사","짐 보관","무진동차량/냉동차량/냉장차량"],
	"청소업체" : ["이사/입주 청소 업체","에어컨 청소","거주 청소 업체","세탁기 청소","정리수납 컨설팅","줄눈 시공","해충방역","누수 탐지","침대/매트리스 청소","사무실/상업공간 청소 업체","바퀴벌레 퇴치","곰팡이 제거","하수구 청소","소파 청소","냉장고 청소","시스템에어컨 청소",
"계단/화장실 청소","비둘기 퇴치","건물 외부 청소 (외벽/유리창)","단열/결로 시공","보일러/수도 배관 청소","가전제품 청소","악취 제거","후드 청소","바닥 청소 (왁스 코팅)","카페트 청소","건물 내부 청소 (바닥/계단/화장실)","새집/헌집증후군 시공","방역소독",",준공 청소","단체 세탁","실외기 청소","시설/건물 관리","입주 사전점검 대행","비데 렌탈•구입•청소","유품정리/특수청소","화재 복구/청소","닥트/환풍구 청소","온풍기/냉난방기 청소",",물탱크/저수조 청소","가구 청소","어항/수족관 제작 및 관리","침수 복구•청소","수질 관리/녹조 제거","라돈 저감 시공","대기 측정/관리"],
	"인테리어" : ["집 인테리어","상업공간 인테리어","아파트 인테리어","조명 인테리어","욕실/화장실 리모델링","주택 건축","주택 리모델링","집 수리","홈 스타일링","미술품 구매 및 렌탈","식물 관리/렌탈","미장 시공","도배 시공","장판 시공","도배장판 시공","인테리어 필름 시공","페인트 시공","아트월 시공","타일 시공","줄눈 시공","나노코팅 시공","수영장/스파 시공","주방 리모델링","주방후드 교체/설치","닥트 설치 및 수리","환풍기 교체/설치","싱크대 교체","빨래건조대 설치 및 수리","마루 시공","마루 보수","바닥재 시공","에폭시 바닥 시공","카페트 시공","층간소음매트 시공","방음 시공","가벽/파티션 인테리어","칸막이 시공","중문 시공","몰딩 시공","베란다/발코니 확장","단열/결로 시공","탄성/바이오세라믹 코트","코킹 시공","수납 가구 제작 (신발장/붙박이장 등)","신발장 시공","붙박이장 시공","가구 리폼","벽난로 설치•수리","앙카/해먹 설치","에어커튼 설치","핸드레일 설치 및 수리","소방설비 설치 및 수리","체육시설/운동기구 설치","업소용 주방기구 구매","업소용 주방기구 판매"],
	"야외시공" : ["간판 제작","고보라이트 제작•설치","벽화 시공","외벽 리모델링","옥상공사/방수","지붕 공사","조경 공사","어닝/차양 시공","데크 시공","인조잔디 시공","수영장/스파 시공","조형물 시공","LED 제작","용접 시공","집진기 설치•수리","대형천막 시공","비닐하우스 시공","정화조 설치 및 수리","장애인 편의시설 설치","체육시설/운동기구 설치","그물망 설치 (안전망/스포츠망 등)","주차시스템 설치 (차단기/차량인식기 등)","전기차 충전기 설치/수리","대문자바라 설치","스테인레스 제작(자전거 거치대, 국기게양대)","아스팔트/콘크리트 시공","차선 도색/제거","굴착기 대여","벌초/예초"],
	"부동산" : ["집 사기","집 팔기","감정평가","집 전세/월세 구하기","집 전세/월세 내놓기","사무실 임대"],
	"철거/정리" : ["철거","폐기물 처리","정리수납 컨설팅"],
	"펫/반려동물" : ["반려동물 훈련","반려견 산책","펫 호텔","펫 시터 (주인 집에서)","펫 시터 (시터 집에서)","펫 미용","펫 미용용품 만들기 레슨","펫 사료/간식 만들기 레슨","펫 미용용품 제작","펫 사료/간식 제작","펫 홈 클리닝","반려동물 장례","반려동물관리 레슨"],
	"문/창문" : ["문 설치 및 수리","도어 시공","중문 시공","샷시 설치 및 수리","외풍차단/틈막이 시공","유리 제작 및 시공","유리 필름/시트 시공","단열필름 시공","블라인드/커튼 제작/설치/수리","방충망 설치 및 수리","방범창 설치 및 수리","열쇠/도어락 설치 및 수리"],
	"수도/보일러/전기" : ["누수 탐지","수도 관련 설치 및 수리","보일러 설치 및 수리","온수기 설치 및 수리","전기 배선 설치 및 수리","인터넷/랜 공사","랜선 정리","도시가스 공사","승강기 유지보수","태양광발전/패널 설치"],
	"가전제품" : ["휴대폰/태블릿/스마트기기 수리","전자제품 수리","에어컨 설치 및 수리","냉장고 설치 및 수리","세탁기 설치 및 수리","벽걸이TV 설치 및 철거","인덕션(전기레인지) 설치","식기세척기 설치•수리","음식물처리기 설치 및 수리","비데 렌탈•구입•청소","핸드드라이어 설치•수리","음향/영상기기 설치","CCTV 설치","IoT 설치","컴퓨터 수리","조립PC 구매","아이폰 수리","신규 핸드폰구매","알뜰폰/선불폰 개통","전동킥보드/전동휠 수리"],
	"가구" : ["수납 가구 제작 (신발장/붙박이장 등)","붙박이장 시공","가구/목공예 제작","가구 수리","가구 리폼","피아노 운반","가구 조립/설치","피아노 조율/수리","신발장 시공","가구 이동•재배치","악기 조율/수리","액자 제작","도금 (가구/설비/조형물 등)","수제악기 제작"],
	"도우미" : ["가사 도우미","등하원 도우미","집 청소 도우미","산후/육아/아이돌보미","실버/간병 도우미","요리 도우미","경호원 (신변보호/의전/경비 등)"],
	"서빙•주방 알바" : ["일반음식점 알바","레스토랑 알바","패스트푸드•치킨•피자전문점 알바","커피•디저트전문점 알바","베이커리•도넛•떡집 알바","일반주점•호프 알바","결혼•연회•장례도우미 알바","급식•푸드코트 알바","기타 서빙•주방 알바"],
	"매장관리•판매 알바" : ["편의점 알바","마트•유통점 알바","백화점•면세점•아울렛 알바","의류•잡화매장 알바","인터넷쇼핑몰•소셜커머스•홈쇼핑 알바","뷰티•헬스스토어 알바","PC방•오락실•게임장 알바","볼링•당구•스크린골프장 알바","노래방•멀티방•만화카페 알바","스터디룸•독서실•고시원 알바","휴대폰•전자제품매장 알바","서점•문구•팬시점 알바","가구•침구•생활소품점 알바","농수산•청과•축산점 알바","화훼•꽃집 알바","약국 알바","기타 매장관리•판매 알바"],
	"서비스•행사 알바" : ["안내데스크•매표 알바","주차관리•주차도우미 알바","보안•경비•경호 알바","부분•피팅모델 알바","이벤트•행사스텝 알바","기타 서비스•행사 알바"],
	"문화•여가•생활 알바" : ["호텔•리조트•숙박시설 알바","놀이공원•테마파크 알바","여행•캠프•레포츠 알바","영화•공연•전시장 알바","이색테마•키즈카페 알바","찜질방•사우나•스파 알바","피트니스•스포츠 알바","기타 문화•여가•생활 알바"],
	"방송•미디어 알바" : ["보조출연•방청 알바","방송스텝•촬영보조 알바","조명•음향•무대 알바","방송사•프로덕션 알바","신문•잡지•출판사 알바","기타 방송•미디어 알바"],
	"사무직 알바" : ["사무보조•문서작성 알바","자료조사•리서치 알바","경리•회계•총무 알바","비서 알바","공공기관•공기업•협회 알바","학교•도서관•교육기관 알바","기타 사무직 알바"],
	"생산•기능•노무 알바" : ["제조•가공 알바","포장•조립 알바","품질검사•관리 알바","입출고•창고관리 알바","상하차•소화물분류 알바","공사•건설현장 알바","전기•가스공사 알바","기계정비•수리•설치•A/S 알바","기타 생산•기능•노무 알바"],
	"운전•배달•유통 알바" : ["운송•이사 알바","배달•택배•퀵서비스 알바","운전•기사 알바","화물•중장비•특수차운전 알바","유통•도소매 알바","기타 운전•배달•유통 알바"],
	"병원•간호•연구 알바" : ["간호조무사•간호사 알바","간병•요양보호사 알바","원무•코디네이터 알바","외래보조•병동보조 알바","수의사•수의간호사 알바","실험•연구보조 알바","기타 병원•간호•연구 알바"],
	"기타" : ["기타 알바"]
};

let mainFilter = {

	region0Select : null
	,region1Select : null
	,region2Select : null
	,regionStatusVal : 0
	,category0Select : null
	,category1Select : null
	,categoryStatusVal : 0

	,init : function(){
		this.region0Select = $('#regionFilter0Select');
		this.region1Select = $('#regionFilter1Select');
		this.region2Select = $('#regionFilter2Select');
		this.category0Select = $('#categoryFilter0Select');
		this.category1Select = $('#categoryFilter1Select');
		this.registEvent();
	}
	,registEvent : function(){
		let _this = this;
		
		$('input[type="checkbox"][name="filterClass"]').on('click', function(){
			if($(this).prop('checked')){
				$('input[type="checkbox"][name="filterClass"]').prop('checked', false);
				$(this).prop('checked', true);		
			}
		});
		
		$('input[type="checkbox"][name="filterPcClass"]').on('click', function(){
			if($(this).prop('checked')){
				$('input[type="checkbox"][name="filterPcClass"]').prop('checked', false);
				$(this).prop('checked', true);		
			}
		});
		
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
		
		$('input[type="checkbox"][name="dateFileterSelect"]').on('click', function(){
			if($(this).prop('checked')){
				$('input[type="checkbox"][name="dateFileterSelect"]').prop('checked', false);
				$(this).prop('checked', true);		
			}
		});
		
		$('input[type="checkbox"][name="dateFileterPcSelect"]').on('click', function(){
			if($(this).prop('checked')){
				$('input[type="checkbox"][name="dateFileterPcSelect"]').prop('checked', false);
				$(this).prop('checked', true);		
			}
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
			$('a[onclick="mainFilter.complete2DepthRegionFilter()"]').removeClass('active');
			$('#regionFilterSelectPopList').val('[]');
			$('#regionFilterSelectPopListCon').empty();
		}
		this.resetRegionFilter();
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
	
	,settingDatePopup : function(){
		if($('[name="dateFilterStartDate"]').val() != null && $('[name="dateFilterStartDate"]').val() != "" && $('[name="dateFilterEndDate"]').val() != null && $('[name="dateFilterEndDate"]').val() != "" && $('[name="dateFilterPcStartDate"]').val() != null && $('[name="dateFilterPcStartDate"]').val() != "" && $('[name="dateFilterPcEndDate"]').val() != null && $('[name="dateFilterPcEndDate"]').val() != ""){
			$('a[onclick="mainWrite.complete2DepthDateFilter()"]').addClass('active');
		} else {
			$('a[onclick="mainWrite.complete2DepthDateFilter()"]').removeClass('active');
			this.resetDateFilter();
		}
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
		switch(depth){
			case 1 :
				$('a[onclick="mainFilter.complete2DepthRegionFilter()"]').addClass('active');
				$('#regionFilter2').val('');
				$('#regionFilter2').siblings('a').removeClass('active');
				$('#regionFilter2').siblings('a').find('> span').text('지역을 선택해주세요.');
				break;
			case 2 :
				_this.addRegionFilter();
				break;
			default :
				$('#regionFilter1').val('');
				$('#regionFilter1').siblings('a').removeClass('active');
				$('#regionFilter1').siblings('a').find('> span').text('도시를 선택해주세요.');
				$('#regionFilter2').val('');
				$('#regionFilter2').siblings('a').removeClass('active');
				$('#regionFilter2').siblings('a').find('> span').text('지역을 선택해주세요.');
				break;
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
		if(depth == 1){
			_this.change2DepthCategoryFilter($('#categoryFilter0').val());
		} else {
			popupManager.add("#categoryFilter2DepthSelectPopup0");
		}
	}
	
	,select2DepthCategoryFilter : function(depth, target){
		let _this = this;
		let targetVal = $(target).text();
		let selectInput = '';
		_this.categoryStatusVal = Number(depth) + 1;
		
		if(depth != 1){
			selectInput = $('#categoryFilter0');
		} else {
			selectInput = $('#categoryFilter1');
		}
		
		selectInput.val(targetVal);
		selectInput.siblings('a').addClass('active');
		selectInput.siblings('a').find('> span').text(targetVal);
		if(depth == 0){
			$('a[onclick="mainFilter.complete2DepthCategoryFilter()"]').addClass('active');
			$('#categoryFilter1').val('');
			$('#categoryFilter1').siblings('a').removeClass('active');
			$('#categoryFilter1').siblings('a').find('> span').text('소분류를 선택해주세요.');
		}
		if(depth == 1) 	_this.addCategoryFilter();
		popupManager.removePopLatest(true);
	}
	
	,change2DepthCategoryFilter(category0){
		let _this = this;
		let category1List = categoryValue[category0];
			_this.category1Select.empty();
			category1List.forEach(function(value){
				_this.category1Select.append('<li><a href="javascript:void(0)">' + value + '</a></li');
			})
			
			//대분류선택 이벤트
			_this.category1Select.find('> li > a').on('click', function(){
				_this.select2DepthCategoryFilter(1,$(this));		
			});
			
			popupManager.add('#categoryFilter2DepthSelectPopup1');
	}
	
	,resetCategoryFilter : function(){
		$('#categoryFilter0').val('');
		$('#categoryFilter0').siblings('a').removeClass('active');
		$('#categoryFilter0').siblings('a').find('> span').text('대분류를 선택해주세요.');
		$('#categoryFilter1').val('');
		$('#categoryFilter1').siblings('a').removeClass('active');
		$('#categoryFilter1').siblings('a').find('> span').text('소분류를 선택해주세요.');
		
		this.categoryStatusVal = 0;
	}
	
	,addCategoryFilter : function(){
		let _this = this;
		
		let currentVal = $('#categoryFilterSelectPopList').val()
		let currentList = currentVal.substring(0,currentVal.indexOf(']'));
		
		let addTarget = "";
		if(_this.categoryStatusVal > 1){
			addTarget = $('#categoryFilter1').val();
		} else {
			addTarget = $('#categoryFilter0').val();	
		}
		
		if(currentVal == '[]'){
			currentList += addTarget;
		} else {
			if(_this.categoryStatusVal > 1){
				if(currentVal.indexOf(addTarget) > -1){
					alert('중복된 카테고리입니다.');
					$('#categoryFilter1').val('');
					$('#categoryFilter1').siblings('a').removeClass('active');
					$('#categoryFilter1').siblings('a').find('> span').text('소분류를 선택해주세요.');
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
		
		$('#categoryFilterSelectPopList').val(currentList);
		
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
			$('#categoryFilterList').val(curr0 + curr1);				
		} else {
			$('#categoryFilterSelectPopList').val(curr0 + curr1);
		}
		
		$(target).parent().parent().remove();
	}
	
	,complete2DepthCategoryFilter : function(){
		let _this = this;
		if(_this.categoryStatusVal == 0){
			if(confirm('적용하시겠습니까?')){
				$('#categoryFilterList').val($('#categoryFilterSelectPopList').val());
				$('#categoryList').empty();
				
				$('#categoryFilterPcList').val($('#categoryFilterSelectPopList').val());
				$('#categoryPcList').empty();
				
				if($('#categoryFilterSelectPopList').val() != '[]'){
					let currentList = $('#categoryFilterList').val().substring(1, $('#categoryFilterList').val().length - 1).split(",");
					currentList.forEach(function(value){
						$('#categoryList').append('<li><div><span>' + value + '</span><a href="javascript:void(0)" class="main_filter_popup_select_result_delete_btn" onclick="mainFilter.deleteCategoryFilter(\'' + value + '\', $(this), 0)"></a></div></li>')
						$('#categoryPcList').append('<li><div><span>' + value + '</span><a href="javascript:void(0)" class="main_filter_popup_select_result_delete_btn" onclick="mainFilter.deleteCategoryFilter(\'' + value + '\', $(this), 0)"></a></div></li>')
					});	
				}
				
				$('#categoryFilterSelectPopList').val('[]');
				$('#categoryFilterSelectPopListCon').empty();
				popupManager.removePopLatest(true);
			}	
		} else {
			_this.addCategoryFilter();
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
				filterClass += $(this).val() + ",";
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
		
		if(typeof($('[name="dateFileterPcSelect"]:checked').val()) != "undefined"){
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
		if($('#filterPcStartPayment').val() != '') filterStartPayment = Number($('#filterPcStartPayment').val().replaceAll(',',''));
		
		let filterEndPayment = Number($('#filterEndPayment').val().replaceAll(',',''));
		if($('#filterPcEndPayment').val() != '') filterStartPayment = Number($('#filterPcEndPayment').val().replaceAll(',',''));
		
		let params = JSON.stringify({filterMemCategory : 0, filterClass : filterClass, filterSex : filterSex, filterRegion : regionFilterList, filterCategory : categoryFilterList, filterStartDate : dateFilterStartDate, filterEndDate : dateFilterEndDate, filterStartPayment : filterStartPayment, filterEndPayment : filterEndPayment});
		
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
				
				$('#mainWorkList').append('<li onclick="main.openWorkViewPopup(' + workTarget["sn"] + ')"><a href="javascript:void(0)" class="favorite_icon">즐겨찾기 버튼</a>' +
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