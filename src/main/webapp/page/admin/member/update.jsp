<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.time.LocalDate"%>
<%
LocalDate now = LocalDate.now();
int nowYear = now.getYear();

int[] nowYearList = new int[100];
for(int i=0; i < 100; i++){
	nowYearList[i] = nowYear - i;
}
session.setAttribute("birthYear", nowYearList);
%>
<c:set var="contextPath" value="../"></c:set>
<c:set var="birthMonth">01,02,03,04,05,06,07,08,09,10,11,12</c:set>
<c:set var="birthDay">01,02,03,04,05,06,07,08,09,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31</c:set>
<c:set var="nationList">가나,가봉,감비아,건지,과델로프,과테말라,괌,그라나다,그루지아,그리스,그린랜드,기네비소,기니,기야나,나미비아,나우루,나이지리아,남아프리카,남조지아 & 남샌드위치 군도,네덜란드,네덜란드 열도,네팔,노르웨이,노포크 섬,뉴질랜드,뉴 칼레도니아,니우에,니제르,니카라과,대만,덴마크,도미니카,도미니카 공화국,독일,동티모르,라오스,라이베리아,라트비아,러시아,레바논,레소토,루마니아,룩셈부르크,르완다,리비아,리투아니아,리히텐슈타인,마다카스카르,마샬군도,마이크로네시아,마카오,마케도니아,마티니크,말라위,말레이시아,말리,맨섬,메요트,멕시코,모나코,모로코,모리셔스,모리타니,모잠비크,몬세라,몬테네그로,몰도바,몰디브,몰타,몽골,미국,미국령 버진군도,미국의 군도,미얀마(버마),바누아투,바레인,바베이도스,바티칸시티,바하마,방글라데시,버뮤다,베네주엘라,베닌,베트남,벨기에,벨로루시,벨리즈,보빗 군도,보스니아-헤르체코비나,보츠와나,볼리비아,부룬디,부르키나 파소,부탄,북마리아나 군도,북한,불가리아,브라질,브루나이,사모아,사우디 아라비아,사이프러스,산마리노,상토메 프린스페,서부 사하라,세네갈,세르비아,세르비아 몬테네그로,세이쉘,세인트 루시아,세인트 빈센트 그레나딘,세인트 키츠 네비스,세인트 피레 미켈론,세인트 헬레나,소말리아,솔로몬 군도,수단,수리남,스리랑카,스발비드 군도,스와질랜드,스웨덴,스위스,스페인,슬로바키아,슬로베니아,시리아,시에라 리온,싱가포르,아랍에미리트 연합,아루바,아르메니아,아르헨티나,아메리칸 사모아,아이슬란드,아이티,아일랜드,아제르바이잔,아프가니스탄,안도라,안타티카(남극),안티가 바부다,알랜드 군도,알바니아,알제리,앙골라,앙귈라,에리트리아,에스토니아,에콰도르,엘살바도르,영국,영국령 버진군도,영국령 인도양,예멘,오만,오스트리아,온두라스,왈라스 & 퓨투나,요르단,우간다,우루과이,우즈베키스탄,우크라이나,이디오피아,이라크,이란,이스라엘,이집트,이탈리아,인도,인도네시아,일본,자메이카,잠비아,저지,적도 기니,중국,중앙아프리카,지부티,지브랄타,짐바브웨,챠드,체코공화국,칠레,카메룬,카보 베르데,카자흐스탄,카타르,캄보디아,캐나다,케냐,케이만 군도,코모로스,코스타리카,코코스 군도,코트디봐르,콜롬비아,콩고,콩고 민주공화국,쿠바,쿠웨이트,쿡 아일랜드,크로아티아,크리스마스 아일랜드,키르기스,키리바티,타지크스탄,탄자니아,태국,터키,토고,토켈라우,통가,투르크 & 카이코스 군도,투르크멘,투발루,튀니지,트리니다드 토바고,파나마,파라과이,파로에 군도,파키스탄,파푸아 뉴기니,팔라우,팔레스타인 지구,페루,포르투갈,포클랜드 군도,폴란드,푸에르토리코,프랑스,프랑스령 가이아나,프랑스령 남부지역,프랑스령 리유니온,프랑스령 폴리네시아,피지,피트카이른,핀란드,필리핀,한국,허드 앤 맥도날드 군도,헝가리,호주,홍콩</c:set> 
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>사용자관리 - 수정</title>
	<%@ include file="../../common/headInfo/css.jsp" %>
    <%@ include file="../headInfo/css.jsp" %>
    <%@ include file="../../common/headInfo/javascript.jsp" %>
    <%@ include file="../headInfo/javascript.jsp" %>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="<c:url value='/adm/js/member/update.js'/>"></script>
</head>
<body>
<%@ include file="../inc/header.jsp" %>  
    <section class="col-12 admin_contents_wrap">
    	<div class="col-12 admin_contens_con">
    		<h1 class="col-12 page_title">
	    		<a href="/adm/member/list">사용자관리</a>
	    	</h1>
	    	<div class="col-12 admin_contents">
				<form class="col-12 admin_form_style_0_wrap" action="/adm/member/updateAction" method="post" data-common-update-form>
					<div class="col-12 admin_form_style_0_con">
						<input type="hidden" id="sn" name="sn" value="${updateData.sn}"/>
						<div class="col-12 admin_form_style_0">
							<div class="col-12 col-md-0 label_box type_essential">
								<label for="name">
									<c:choose>
										<c:when test="${updateData.category eq 1}">상호명</c:when>
										<c:otherwise>이름</c:otherwise>
									</c:choose>
								</label>
							</div>
							<div class="col-12 col-md-0 input_box">
								<input type="text" class="admin_input_style_0" name="name" id="name" value="${updateData.name}" data-common-update-essential-input="
								<c:choose>
									<c:when test="${updateData.category eq 1}">상호명을 입력해주세요</c:when>
									<c:otherwise>이름을 입력해주세요</c:otherwise>
								</c:choose>
								"/>
							</div>
						</div>
						<c:if test="${updateData.category eq 1}">
							<!-- 기업(구인)회원일 때 -->
							<div class="col-12 admin_form_style_0">
								<div class="col-12 col-md-0 label_box type_essential">
									<span>사업자번호</span>
								</div>
								<div class="col-12 col-md-0 input_box">
									<span>${updateData.businessNum}</span>
								</div>
							</div>
							<div class="col-12 admin_form_style_0">
								<div class="col-12 col-md-0 label_box type_essential">
									<label for="representativeName">대표자명</label>
								</div>
								<div class="col-12 col-md-0 input_box">
									<input type="text" class="admin_input_style_0" name="representativeName" id="representativeName" value="${updateData.representativeName}" data-common-update-essential-input="담당자명을 입력해주세요"/>
								</div>
							</div>
							<div class="col-12 admin_form_style_0">
								<div class="col-12 col-md-0 label_box type_essential">
									<label for="managerName">담당자명</label>
								</div>
								<div class="col-12 col-md-0 input_box">
									<input type="text" class="admin_input_style_0" name="managerName" id="managerName" value="${updateData.managerName}" data-common-update-essential-input="담당자명을 입력해주세요"/>
								</div>
							</div>
						</c:if>
						<div class="col-12 admin_form_style_0">
							<div class="col-12 col-md-0 label_box type_essential">
								<span>구분</span>
							</div>
							<div class="col-12 col-md-0 input_box">
								<span>
									<c:choose>
							    		<c:when test="${updateData.category eq 1 }">기업/단체</c:when>
							    		<c:otherwise>개인</c:otherwise>
							    	</c:choose>
								</span>
							</div>
						</div>
						<div class="col-12 admin_form_style_0">
							<div class="col-12 col-md-0 label_box type_essential">
								<span>종류</span>
							</div>
							<div class="col-12 col-md-0 input_box">
								<span>
									<c:choose>
							    		<c:when test="${updateData.category eq 3 }">구직회원</c:when>
							    		<c:otherwise>구인회원</c:otherwise>
							    	</c:choose>
								</span>
							</div>
						</div>
						<div class="col-12 admin_form_style_0 type_phone">
							<div class="col-12 col-md-0 label_box type_essential">
								<span>전화번호</span>
							</div>
							<div class="col-12 col-md-0 input_box">
								<input type="text" name="phone0" class="admin_input_style_0" value="${updateData.phone0}" maxlength="3"/>
								<div class="col-0 ml7 mr7 addr_text">-</div>
								<input type="text" name="phone1" class="admin_input_style_0" value="${updateData.phone1}" maxlength="4"/>
								<div class="col-0 ml7 mr7 addr_text">-</div>
								<input type="text" name="phone2" class="admin_input_style_0" value="${updateData.phone2}" maxlength="4"/>
							</div>
						</div>
						<div class="col-12 admin_form_style_0 type_zipcode">
							<div class="col-12 col-md-0 label_box">
								<span>주소</span>
							</div>
							<div class="col-12 col-md-0 input_box">
								<input type="text" id="zipCode" name="zipCode" class="admin_input_style_0" placeholder="우편번호" readonly data-common-update-essential-input="우편번호를 검색해주세요" value="${updateData.zipCode}"/>
								<a href="javascript:void(0)" class="zip_code_popup_btn"><span>우편 번호</span></a>
								<input type="text" id="address0" name="address0" class="mt10 admin_input_style_0" placeholder="우편번호 검색 시 자동 입력됩니다." readonly onclick="memberUpdate.findZipCode()" data-common-update-essential-input="우편번호를 검색해주세요"  value="${updateData.address0}"/>
								<div id="zipCodeWrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:absolute; top: 0; left: 0; z-index: 100;">
									<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="signUp4.closeZipCode()" alt="접기 버튼">
								</div>
								<input type="text" id="address1" name="address1" class="mt10 admin_input_style_0" placeholder="건물, 아파트, 동/호수 입력" data-common-update-essential-input="상세주소를 입력해주세요" value="${updateData.address1}"/>
							</div>
						</div>
						<div class="col-12 admin_form_style_0 type_email">
							<div class="col-12 col-md-0 label_box type_essential">
								<span>이메일</span>
							</div>
							<div class="col-12 col-md-0 input_box">
								<input type="text" id="email0" name="email0" class="admin_input_style_0" placeholder="이메일 아이디 입력" value="${updateData.email0 }" data-common-update-essential-input="이메일 아이디를 입력해주세요"/>
								<div class="col-0 ml7 mr7 addr_text">@</div>
								<input type="text" id="email1" name="email1" class="admin_input_style_0" value="${updateData.email1}" data-common-update-essential-input="이메일 도메인을 입력해주세요"/>
								<div class="col-12 admin_select_style_0_wrap">
									<select class="admin_select_style_0" name="emailDomain" required>
										<option value="gmail.com" <c:if test="${updateData.email1 eq 'gmail.com'}">selected</c:if>>gmail.com</option>
										<option value="naver.com" <c:if test="${updateData.email1 eq 'naver.com'}">selected</c:if>>naver.com</option>
										<option value="daum.net" <c:if test="${updateData.email1 eq 'daum.net'}">selected</c:if>>daum.net</option>
										<option value="hanmail.net" <c:if test="${updateData.email1 eq 'hanmail.net'}">selected</c:if>>hanmail.net</option>
										<option value="nate.com" <c:if test="${updateData.email1 eq 'nate.com'}">selected</c:if>>nate.com</option>
										<option value="hotmail.com" <c:if test="${updateData.email1 eq 'hotmail.com'}">selected</c:if>>hotmail.com</option>
										<option value="empal.com" <c:if test="${updateData.email1 eq 'empal.com'}">selected</c:if>>empal.com</option>
										<option value="yahoo.com" <c:if test="${updateData.email1 eq 'yahoo.com'}">selected</c:if>>yahoo.com</option>
										<option value="paran.com" <c:if test="${updateData.email1 eq 'paran.com'}">selected</c:if>>paran.com</option>
										<option value="직접선택" <c:if test="${updateData.email1 ne 'gmail.com' && updateData.email1 ne 'naver.com' && updateData.email1 ne 'daum.net' && updateData.email1 ne 'hanmail.net' && updateData.email1 ne 'nate.com' && updateData.email1 ne 'hotmail.com' && updateData.email1 ne 'empal.com' && updateData.email1 ne 'yahoo.com' && updateData.email1 ne 'paran.com'}">selected</c:if>>직접선택</option>
									</select>
								</div>
							</div>
						</div>
						<div class="col-12 admin_form_style_0">
							<div class="col-12 col-md-0 label_box">
								<span>
									<c:choose>
										<c:when test="${updateData.category eq 1}">담당자 국적</c:when>
										<c:otherwise>국적</c:otherwise>
									</c:choose>
								</span>
							</div>
							<div class="col-12 col-md-0 input_box">
								<div class="col-12 admin_select_style_0_wrap">
									<select class="select_style_0" name="nationality" data-common-update-essential-input="국적을 선택해주세요">
										<c:forEach var="nationVal" items="${nationList}" varStatus="status">
											  <option value="${status.index}" <c:if test="${updateData.nationality eq status.index}">selected</c:if>>${nationVal}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<div class="col-12 admin_form_style_0">
							<div class="col-12 col-md-0 label_box">
								<span>
									<c:choose>
										<c:when test="${updateData.category eq 1}">담당자 성별</c:when>
										<c:otherwise>성별</c:otherwise>
									</c:choose>
								</span>
							</div>
							<div class="col-12 col-md-0 input_box">
								<div class="col-12 admin_radio_style_0_con">
									<div class="col-0 mr10 admin_radio_style_0">
										<input type="radio" id="sex0" name="sex" value="0" <c:if test="${updateData.sex eq 0}">checked</c:if>/>
										<label for="sex0">남</label>
									</div>
									<div class="col-0 admin_radio_style_0">
										<input type="radio" id="sex1" name="sex" value="1" <c:if test="${updateData.sex eq 1}">checked</c:if>/>
										<label for="sex1">여</label>
									</div>
								</div>
							</div>
						</div>
						<div class="col-12 admin_form_style_0 type_birth">
							<div class="col-12 col-md-0 label_box">
								<span>
									<c:choose>
										<c:when test="${updateData.category eq 1}">담당자 생년월일</c:when>
										<c:otherwise>생년월일</c:otherwise>
									</c:choose>
								</span>
							</div>
							<div class="col-12 col-md-0 input_box">
								<div class="col-0 admin_select_style_0_wrap">
									<select class="admin_select_style_0" name="birth0" data-common-update-essential-input="생년월일 년을 선택해주세요">
										<c:forEach var="yearVal" items="${birthYear}">
											  <option value="${yearVal}" <c:if test="${yearVal eq fn:split(updateData.birthStr,'-')[0]}">selected</c:if>>${yearVal}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-0 ml7 mr7 addr_text">년</div>
								<div class="col-0 admin_select_style_0_wrap">
									<select class="admin_select_style_0" name="birth1" data-common-update-essential-input="생년월일 월을 선택해주세요">
										<c:forEach var="monthVal" items="${birthMonth}">
											  <option value="${monthVal}" <c:if test="${monthVal eq fn:split(updateData.birthStr,'-')[1]}">selected</c:if>>${monthVal}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-0 ml7 mr7 addr_text">월</div>
								<div class="col-0 admin_select_style_0_wrap">
									<select class="admin_select_style_0" name="birth2" data-common-update-essential-input="생년월일 일을 선택해주세요">
										<c:forEach var="dayVal" items="${birthDay}">
											  <option value="${dayVal}" <c:if test="${monthVal eq fn:split(updateData.birthStr,'-')[2]}">selected</c:if>>${dayVal}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-0 ml7 addr_text">일</div>
							</div>
						</div>
						<c:if test="${updateData.category eq 3}">
							<!-- 개인(구직)회원일 때 -->
							<div class="col-12 admin_form_style_0">
								<div class="col-12 col-md-0 label_box">
									<span>혈압</span>
								</div>
								<div class="col-12 col-md-0 input_box">
									<div class="col-12 admin_select_style_0_wrap">
										<select class="admin_select_style_0" name="bloodPressure" data-common-update-essential-input="혈압을 선택해주세요" required>
											<option value="0" <c:if test="${updateData.bloodPressure eq 0}">selected</c:if>>100이하</option>
											<option value="1" <c:if test="${updateData.bloodPressure eq 1}">selected</c:if>>100이상 110미만</option>
											<option value="2" <c:if test="${updateData.bloodPressure eq 2}">selected</c:if>>110이상 120미만</option>
											<option value="3" <c:if test="${updateData.bloodPressure eq 3}">selected</c:if>>120이상 130미만</option>
											<option value="4" <c:if test="${updateData.bloodPressure eq 4}">selected</c:if>>130이상 140미만</option>
											<option value="5" <c:if test="${updateData.bloodPressure eq 5}">selected</c:if>>140이상 150미만</option>
											<option value="6" <c:if test="${updateData.bloodPressure eq 6}">selected</c:if>>150이상</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-12 admin_form_style_0">
								<div class="col-12 col-md-0 label_box">
									<span>차량유무</span>
								</div>
								<div class="col-12 col-md-0 input_box">
									<div class="col-12 admin_radio_style_0_con">
										<div class="col-0 mr10 admin_radio_style_0">
											<input type="radio" id="carExist0" name="carExist" value="0" <c:if test="${updateData.carExist eq 0}">checked</c:if>/>
											<label for="carExist0">유</label>
										</div>
										<div class="col-0 admin_radio_style_0">
											<input type="radio" id="carExist1" name="carExist" value="1" <c:if test="${updateData.carExist eq 1}">checked</c:if>/>
											<label for="carExist1">무</label>
										</div>
									</div>
								</div>
							</div>
							<div class="col-12 admin_form_style_0">
								<div class="col-12 col-md-0 label_box">
									<span>계좌번호</span>
								</div>
								<div class="col-12 col-md-0 input_box">
									<div class="col-12 mb15 admin_select_style_0_wrap">
										<select class="admin_select_style_0" name="bankName" data-common-update-essential-input="은행명을 선택해주세요" required>
											<option value="002" <c:if test="${updateData.bankName eq '002'}">selected</c:if>>산업은행</option>
											<option value="003" <c:if test="${updateData.bankName eq '003'}">selected</c:if>>기업은행</option>
											<option value="004" <c:if test="${updateData.bankName eq '004'}">selected</c:if>>국민은행</option>
											<option value="007" <c:if test="${updateData.bankName eq '007'}">selected</c:if>>수협</option>
											<option value="011" <c:if test="${updateData.bankName eq '011'}">selected</c:if>>농협</option>
											<option value="012" <c:if test="${updateData.bankName eq '012'}">selected</c:if>>지역농축협</option>
											<option value="020" <c:if test="${updateData.bankName eq '020'}">selected</c:if>>우리은행</option>
											<option value="023" <c:if test="${updateData.bankName eq '023'}">selected</c:if>>SC제일은행</option>
											<option value="027" <c:if test="${updateData.bankName eq '027'}">selected</c:if>>한국씨티은행</option>
											<option value="031" <c:if test="${updateData.bankName eq '031'}">selected</c:if>>대구은행</option>
											<option value="032" <c:if test="${updateData.bankName eq '032'}">selected</c:if>>부산은행</option>
											<option value="034" <c:if test="${updateData.bankName eq '034'}">selected</c:if>>광주은행</option>
											<option value="035" <c:if test="${updateData.bankName eq '035'}">selected</c:if>>제주은행</option>
											<option value="037" <c:if test="${updateData.bankName eq '037'}">selected</c:if>>전북은행</option>
											<option value="039" <c:if test="${updateData.bankName eq '039'}">selected</c:if>>경남은행</option>
											<option value="045" <c:if test="${updateData.bankName eq '045'}">selected</c:if>>새마을금고</option>
											<option value="048" <c:if test="${updateData.bankName eq '048'}">selected</c:if>>신협</option>
											<option value="050" <c:if test="${updateData.bankName eq '050'}">selected</c:if>>저축은행</option>
											<option value="054" <c:if test="${updateData.bankName eq '054'}">selected</c:if>>HSBC은행</option>
											<option value="055" <c:if test="${updateData.bankName eq '055'}">selected</c:if>>도이치은행</option>
											<option value="057" <c:if test="${updateData.bankName eq '057'}">selected</c:if>>JP모간체이스은행</option>
											<option value="060" <c:if test="${updateData.bankName eq '060'}">selected</c:if>>BOA은행</option>
											<option value="061" <c:if test="${updateData.bankName eq '061'}">selected</c:if>>BNP파리바은행</option>
											<option value="062" <c:if test="${updateData.bankName eq '062'}">selected</c:if>>중국공상은행</option>
											<option value="064" <c:if test="${updateData.bankName eq '064'}">selected</c:if>>산림조합</option>
											<option value="067" <c:if test="${updateData.bankName eq '067'}">selected</c:if>>중국건설은행</option>
											<option value="071" <c:if test="${updateData.bankName eq '071'}">selected</c:if>>우체국</option>
											<option value="081" <c:if test="${updateData.bankName eq '081'}">selected</c:if>>하나은행</option>
											<option value="088" <c:if test="${updateData.bankName eq '088'}">selected</c:if>>신한은행</option>
											<option value="089" <c:if test="${updateData.bankName eq '089'}">selected</c:if>>케이뱅크</option>
											<option value="090" <c:if test="${updateData.bankName eq '090'}">selected</c:if>>카카오뱅크</option>
											<option value="209" <c:if test="${updateData.bankName eq '209'}">selected</c:if>>유안타증권</option>
											<option value="218" <c:if test="${updateData.bankName eq '218'}">selected</c:if>>KB증권</option>
											<option value="227" <c:if test="${updateData.bankName eq '227'}">selected</c:if>>KTB투자증권</option>
											<option value="238" <c:if test="${updateData.bankName eq '238'}">selected</c:if>>미래에셋대우</option>
											<option value="240" <c:if test="${updateData.bankName eq '240'}">selected</c:if>>삼성증권</option>
											<option value="243" <c:if test="${updateData.bankName eq '243'}">selected</c:if>>한국투자증권</option>
											<option value="247" <c:if test="${updateData.bankName eq '247'}">selected</c:if>>NH투자증권</option>
											<option value="261" <c:if test="${updateData.bankName eq '261'}">selected</c:if>>교보증권</option>
											<option value="262" <c:if test="${updateData.bankName eq '262'}">selected</c:if>>하이투자증권</option>
											<option value="263" <c:if test="${updateData.bankName eq '263'}">selected</c:if>>현대차증권</option>
											<option value="264" <c:if test="${updateData.bankName eq '264'}">selected</c:if>>키움증권</option>
											<option value="265" <c:if test="${updateData.bankName eq '265'}">selected</c:if>>이베스트투자증권</option>
											<option value="266" <c:if test="${updateData.bankName eq '266'}">selected</c:if>>SK증권</option>
											<option value="267" <c:if test="${updateData.bankName eq '267'}">selected</c:if>>대신증권</option>
											<option value="269" <c:if test="${updateData.bankName eq '269'}">selected</c:if>>한화투자증권</option>
											<option value="270" <c:if test="${updateData.bankName eq '270'}">selected</c:if>>하나금융투자</option>
											<option value="278" <c:if test="${updateData.bankName eq '278'}">selected</c:if>>신한금융투자</option>
											<option value="279" <c:if test="${updateData.bankName eq '279'}">selected</c:if>>DB금융투자</option>
											<option value="280" <c:if test="${updateData.bankName eq '280'}">selected</c:if>>유진투자증권</option>
											<option value="287" <c:if test="${updateData.bankName eq '287'}">selected</c:if>>메리츠종합금융증권</option>
											<option value="288" <c:if test="${updateData.bankName eq '288'}">selected</c:if>>카카오페이증권</option>
											<option value="290" <c:if test="${updateData.bankName eq '290'}">selected</c:if>>부국증권</option>
											<option value="291" <c:if test="${updateData.bankName eq '291'}">selected</c:if>>신영증권</option>
											<option value="292" <c:if test="${updateData.bankName eq '292'}">selected</c:if>>케이프투자증권</option>
											<option value="294" <c:if test="${updateData.bankName eq '294'}">selected</c:if>>펀드온라인코리아</option>
										</select>
									</div>
									<input type="text" name="bankNum" value="${updateData.bankNum}" class="admin_input_style_0" placeholder="계좌번호를 입력해주세요" data-common-update-essential-input="계좌번호를 입력해주세요"/>
								</div>
							</div>
							<div class="col-12 admin_form_style_0">
								<div class="col-12 col-md-0 label_box">
									<label for="simpleAdvantages">간단장점</label>
								</div>
								<div class="col-12 col-md-0 input_box">
									<textarea class="admin_textarea_style_0" placeholder="간단장점을 입력해주세요" name="simpleAdvantages">${updateData.simpleAdvantages}</textarea>
								</div>
							</div>
							<div class="col-12 admin_form_style_0">
								<div class="col-12 col-md-0 label_box">
									<span>전자서명</span>
								</div>
								<div class="col-12 col-md-0 input_box">
									<a href="/file/download?fileSeq=${updateData.signFileSeq}" class="download_btn">전자서명 파일</a>
									<c:if test="${empty updateData.signFileSeq}">
			    						등록된 파일이 없습니다
			    					</c:if>
								</div>
							</div>
							<div class="col-12 admin_form_style_0">
								<div class="col-12 col-md-0 label_box">
									<span>허가증</span>
								</div>
								<div class="col-12 col-md-0 input_box">
									<c:forEach var="permissionList" items="${updateData.permissionFileNameList}" varStatus="status">
										<div class="col-12 mb15">
											<a href="/file/download?fileSeq=${permissionList.seq}" class="download_btn">${permissionList.name}</a>
										</div>
			    					</c:forEach>
			    					<c:if test="${empty updateData.permissionFileNameList}">
			    						등록된 파일이 없습니다
			    					</c:if>
								</div>
							</div>
							<div class="col-12 admin_form_style_0">
								<div class="col-12 col-md-0 label_box">
									<span>보건증</span>
								</div>
								<div class="col-12 col-md-0 input_box">
									<c:forEach var="healthCertificateList" items="${updateData.healthCertificateFileNameList}" varStatus="status">
										<div class="col-12 mb15">
											<a href="/file/download?fileSeq=${healthCertificateList.seq}" class="download_btn">${healthCertificateList.name}</a>
										</div>
			    					</c:forEach>
			    					<c:if test="${empty updateData.healthCertificateFileNameList}">
			    						등록된 파일이 없습니다
			    					</c:if>
								</div>
							</div>
							<div class="col-12 admin_form_style_0">
								<div class="col-12 col-md-0 label_box">
									<span>기타서류</span>
								</div>
								<div class="col-12 col-md-0 input_box">
									<c:forEach var="etcList" items="${updateData.etcFileNameList}" varStatus="status">
										<div class="col-12 mb15">
											<a href="/file/download?fileSeq=${etcList.seq}" class="download_btn">${etcList.name}</a>
										</div>
			    					</c:forEach>
			    					<c:if test="${empty updateData.etcFileNameList}">
			    						등록된 파일이 없습니다
			    					</c:if>
								</div>
							</div>
							<div class="col-12 admin_form_style_0">
								<div class="col-12 col-md-0 label_box">
									<span>이수증</span>
								</div>
								<div class="col-12 col-md-0 input_box">
									<c:forEach var="completeList" items="${updateData.completeFileNameList}" varStatus="status">
										<div class="col-12 mb15">
											<a href="/file/download?fileSeq=${completeList.seq}" class="download_btn">${completeList.name}</a>
										</div>
			    					</c:forEach>
			    					<c:if test="${empty updateData.completeFileNameList}">
			    						등록된 파일이 없습니다
			    					</c:if>
								</div>
							</div>
						</c:if>
					</div>
					<div class="col-12 mt30 admin_btn_style_0_con">
						<a href="/adm/member/list" class="admin_btn_style_0 bg_grey mr10" data-common-update-cancel-btn>
							<span>취소</span>
						</a>
						<a href="javascript:void(0)" class="admin_btn_style_0 mr10" data-common-update-complete-btn>
							<span>수정</span>
						</a>
						<a href="/adm/member/delete?sn=${updateData.sn}" class="admin_btn_style_0 cancel_btn" data-common-update-delete-btn>
							<span>삭제</span>
						</a>
					</div>
				</form>
	    	</div>
    	</div>
    </section>
<%@ include file="../inc/footer.jsp" %>


</body>
</html>