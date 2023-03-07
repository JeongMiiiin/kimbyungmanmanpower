<%@page import="java.time.LocalDate"%>
<%@page import="com.kimbyungman.spring.manpower.dto.MemberDto"%>
<%
	String pageTitle = "회원가입";
	int memCategory = session.getAttribute("memberInfo") != null ? ((MemberDto) session.getAttribute("memberInfo")).getCategory() : -1;
	
	LocalDate now = LocalDate.now();
	int nowYear = now.getYear();
	
	int[] nowYearList = new int[100];
	for(int i=0; i < 100; i++){
		nowYearList[i] = nowYear - i;
	}
	session.setAttribute("birthYear", nowYearList);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="birthMonth">1,2,3,4,5,6,7,8,9,10,11,12</c:set>
<c:set var="birthDay">1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31</c:set>
<c:set var="nationList">가나,가봉,감비아,건지,과델로프,과테말라,괌,그라나다,그루지아,그리스,그린랜드,기네비소,기니,기야나,나미비아,나우루,나이지리아,남아프리카,남조지아 & 남샌드위치 군도,네덜란드,네덜란드 열도,네팔,노르웨이,노포크 섬,뉴질랜드,뉴 칼레도니아,니우에,니제르,니카라과,대만,덴마크,도미니카,도미니카 공화국,독일,동티모르,라오스,라이베리아,라트비아,러시아,레바논,레소토,루마니아,룩셈부르크,르완다,리비아,리투아니아,리히텐슈타인,마다카스카르,마샬군도,마이크로네시아,마카오,마케도니아,마티니크,말라위,말레이시아,말리,맨섬,메요트,멕시코,모나코,모로코,모리셔스,모리타니,모잠비크,몬세라,몬테네그로,몰도바,몰디브,몰타,몽골,미국,미국령 버진군도,미국의 군도,미얀마(버마),바누아투,바레인,바베이도스,바티칸시티,바하마,방글라데시,버뮤다,베네주엘라,베닌,베트남,벨기에,벨로루시,벨리즈,보빗 군도,보스니아-헤르체코비나,보츠와나,볼리비아,부룬디,부르키나 파소,부탄,북마리아나 군도,북한,불가리아,브라질,브루나이,사모아,사우디 아라비아,사이프러스,산마리노,상토메 프린스페,서부 사하라,세네갈,세르비아,세르비아 몬테네그로,세이쉘,세인트 루시아,세인트 빈센트 그레나딘,세인트 키츠 네비스,세인트 피레 미켈론,세인트 헬레나,소말리아,솔로몬 군도,수단,수리남,스리랑카,스발비드 군도,스와질랜드,스웨덴,스위스,스페인,슬로바키아,슬로베니아,시리아,시에라 리온,싱가포르,아랍에미리트 연합,아루바,아르메니아,아르헨티나,아메리칸 사모아,아이슬란드,아이티,아일랜드,아제르바이잔,아프가니스탄,안도라,안타티카(남극),안티가 바부다,알랜드 군도,알바니아,알제리,앙골라,앙귈라,에리트리아,에스토니아,에콰도르,엘살바도르,영국,영국령 버진군도,영국령 인도양,예멘,오만,오스트리아,온두라스,왈라스 & 퓨투나,요르단,우간다,우루과이,우즈베키스탄,우크라이나,이디오피아,이라크,이란,이스라엘,이집트,이탈리아,인도,인도네시아,일본,자메이카,잠비아,저지,적도 기니,중국,중앙아프리카,지부티,지브랄타,짐바브웨,챠드,체코공화국,칠레,카메룬,카보 베르데,카자흐스탄,카타르,캄보디아,캐나다,케냐,케이만 군도,코모로스,코스타리카,코코스 군도,코트디봐르,콜롬비아,콩고,콩고 민주공화국,쿠바,쿠웨이트,쿡 아일랜드,크로아티아,크리스마스 아일랜드,키르기스,키리바티,타지크스탄,탄자니아,태국,터키,토고,토켈라우,통가,투르크 & 카이코스 군도,투르크멘,투발루,튀니지,트리니다드 토바고,파나마,파라과이,파로에 군도,파키스탄,파푸아 뉴기니,팔라우,팔레스타인 지구,페루,포르투갈,포클랜드 군도,폴란드,푸에르토리코,프랑스,프랑스령 가이아나,프랑스령 남부지역,프랑스령 리유니온,프랑스령 폴리네시아,피지,피트카이른,핀란드,필리핀,한국,허드 앤 맥도날드 군도,헝가리,호주,홍콩</c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>김병만인력관리 - 회원가입 정보 기입</title>
	<%@ include file="../../../common/headInfo/css.jsp" %>
	<%@ include file="../../headInfo/css.jsp" %>
    <%@ include file="../../../common/headInfo/javascript.jsp" %>
    <%@ include file="../../headInfo/javascript.jsp" %>
    <script type="text/javascript" src="<c:url value='/client/js/business/signUp4.js'/>"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<%@ include file="../inc/headerPc.jsp" %>
    <%@ include file="../inc/header.jsp" %>
    <section class="col-12 col-center mw-635 pt40 pl20 pr20 contents_wrap">
    	<div class="col-12 tc mb37 hidden show-md login_text">회원가입<br/>정보 입력</div>
		<form class="col-12 mb40 form_style_0_con" method="post" action="/business/signUpAction" enctype="multipart/form-data" data-common-update-form>
			<input type="hidden" name="phoneNum" value="${phoneNum}"/>
			<input type="hidden" name="businessNum" value="${businessNum}"/>
			<input type="hidden" name="representativeName" value="${representativeName}"/>
			<input type="hidden" name="category" value="1"/>
			<div class="col-12 form_style_0">
				<div class="col-12 label_box">
					<label for="name">상호명</label>
				</div>
				<div class="col-12 input_box">
					<input type="text" id="name" name="name" class="input_style_0" placeholder="상호명을 입력해주세요" data-common-update-essential-input="상호명을 입력해주세요" value="${businessName}" readonly/>
				</div>
			</div>
			<div class="col-12 form_style_0">
				<div class="col-12 label_box">
					<label for="password">비밀번호</label>
				</div>
				<div class="col-12 input_box">
					<input type="password" id="password" name="password" class="input_style_0" maxlength="10" placeholder="비밀번호를 입력해주세요" data-common-update-essential-input="비밀번호를 입력해주세요"/>
					<div class="col-12 mt15 sign_up_assist_text" style="display: none;">영문, 숫자, 특수기호 조합으로 6-15자리 이상 입력해주세요.</div>
				</div>
			</div>
			<div class="col-12 form_style_0">
				<div class="col-12 label_box">
					<label for="confirmPassword">비밀번호 확인</label>
				</div>
				<div class="col-12 input_box">
					<input type="password" id="confirmPassword" name="confirmPassword" class="input_style_0" maxlength="15" placeholder="비밀번호를 다시 입력해주세요" data-common-update-essential-input="비밀번호를 다시 입력해주세요"/>
					<div class="col-12 mt15 sign_up_assist_text active correct" style="display: none;">비밀번호가 일치합니다.</div>
					<div class="col-12 mt15 sign_up_assist_text incorrect" style="display: none;">비밀번호가 일치하지 않습니다.</div>
				</div>
			</div>
			<div class="col-12 form_style_0 type_zipcode">
				<div class="col-12 label_box">
					<span>우편번호</span>
				</div>
				<div class="col-12 input_box">
					<input type="text" id="zipCode" name="zipCode" class="input_style_0" placeholder="우편번호" readonly data-common-update-essential-input="우편번호를 검색해주세요"/>
					<a href="javascript:void(0)" class="zip_code_popup_btn"><span>우편 번호</span></a>
					<input type="text" id="address0" name="address0" class="mt10 input_style_0" placeholder="우편번호 검색 시 자동 입력됩니다." readonly onclick="signUp4.findZipCode()" data-common-update-essential-input="우편번호를 검색해주세요"/>
				</div>
				<div id="zipCodeWrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:absolute; top: 0; left: 0; z-index: 100;">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="signUp4.closeZipCode()" alt="접기 버튼">
					</div>
			</div>
			<div class="col-12 form_style_0">
				<div class="col-12 label_box">
					<label for="address1">상세 주소</label>
				</div>
				<div class="col-12 input_box">
					<input type="text" id="address1" name="address1" class="input_style_0" placeholder="건물, 아파트, 동/호수 입력" data-common-update-essential-input="상세주소를 입력해주세요"/>
				</div>
			</div>
			<div class="col-12 form_style_0">
				<div class="col-12 label_box">
					<label for="managerName">담당자명</label>
				</div>
				<div class="col-12 input_box">
					<input type="text" id="managerName" name="managerName" class="input_style_0" placeholder="담당자명을 입력해주세요" data-common-update-essential-input="담당자명을 입력해주세요"/>
				</div>
			</div>
			<div class="col-12 form_style_0 type_email">
				<div class="col-12 label_box">
					<label for="email0">이메일</label>
				</div>
				<div class="col-12 input_box">
					<input type="text" id="email0" name="email0" class="input_style_0" placeholder="이메일 아이디 입력" data-common-update-essential-input="이메일 아이디를 입력해주세요"/>
					<div class="col-0 mt9 mt-md-12 ml7 mr7 addr_text">@</div>
					<input type="text" id="email1" name="email1" class="input_style_0" data-common-update-essential-input="이메일 도메인을 입력해주세요"/>
					<select class="select_style_0" name="emailDomain" required>
						<option value="" disabled selected></option>
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="empal.com">empal.com</option>
						<option value="yahoo.com">yahoo.com</option>
						<option value="paran.com">paran.com</option>
						<option value="직접선택">직접선택</option>
					</select>	
				</div>
			</div>
			<div class="col-12 form_style_0">
				<div class="col-12 label_box">
					<span>담당자 국적</span>
				</div>
				<div class="col-12 input_box">
					<select class="select_style_0" name="nationality" data-common-update-essential-input="국적을 선택해주세요">
						<option value="" selected disabled>국적을 선택해주세요</option>
						<c:forEach var="nationVal" items="${nationList}" varStatus="status">
							  <option value="${status.index}">${nationVal}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="col-12 form_style_0">
				<div class="col-12 label_box">
					<span>담당자 성별</span>
				</div>
				<div class="col-12 input_box">
					<div class="col-12 radio_style_1_con">
						<div class="col-6 radio_style_1">
							<input type="radio" name="sex" value="0" id="sex0" checked/>
							<label for="sex0">남자</label>
						</div>
						<div class="col-6 radio_style_1">
							<input type="radio" name="sex" value="1" id="sex1"/>
							<label for="sex1">여자</label>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 form_style_0 type_birth">
				<div class="col-12 label_box">
					<span>담당자 생년월일</span>
				</div>
				<div class="col-12 input_box">
					<select class="select_style_0" name="birth0" data-common-update-essential-input="생년월일 년을 선택해주세요">
						<c:forEach var="yearVal" items="${birthYear}">
							  <option value="${yearVal}">${yearVal}</option>
						</c:forEach>
					</select>
					<div class="col-0 mt5 mt-md-13 ml7 mr7 addr_text">년</div>
					<select class="select_style_0" name="birth1" data-common-update-essential-input="생년월일 월을 선택해주세요">
						<c:forEach var="monthVal" items="${birthMonth}">
							  <option value="${monthVal}">${monthVal}</option>
						</c:forEach>
					</select>
					<div class="col-0 mt5 mt-md-13 ml7 mr7 addr_text">월</div>
					<select class="select_style_0" name="birth2" data-common-update-essential-input="생년월일 일을 선택해주세요">
						<c:forEach var="dayVal" items="${birthDay}">
							  <option value="${dayVal}">${dayVal}</option>
						</c:forEach>
					</select>
					<div class="col-0 mt5 mt-md-13 ml7 addr_text">일</div>
				</div>
			</div>
		</form>
		<div class="col-12 mb-md-99 btn_style_0_con hidden show-md">
			<a href="/business/login" class="col-6 btn_style_0 type_2 type_grey"><span>취소</span></a>
			<a href="javascript:void(0)" class="col-6 btn_style_0 type_2 type_blue" onclick="signUp4.submitForm()"><span>가입하기</span></a>
		</div>
		<div class="col-12 btn_style_0_con hidden-md">
			<a href="javascript:void(0)" class="col-12 btn_style_0 type_complete" onclick="signUp4.submitForm()">
				<span>가입하기</span>
			</a>
		</div>
		    
    </section>
    <%@ include file="../inc/footerPc.jsp" %>
</body>
</html>