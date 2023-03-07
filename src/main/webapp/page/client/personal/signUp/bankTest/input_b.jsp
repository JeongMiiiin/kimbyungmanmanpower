<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	/************************************************************************************************
		NICE평가정보 Copyright(c) KOREA INFOMATION SERVICE INC. ALL RIGHTS RESERVED
		
		서비스명 : 계좌확인 서비스 
		페이지명 : 계좌확인 입력 페이지 - 계좌 예금주명 확인
	*************************************************************************************************/
%>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>NICE평가정보 계좌확인 서비스</title>
	<style type="text/css">
		input, select{
			margin: 2px;
			padding: 4px;
		}

		button {
			margin: 10px 2px;
			padding: 10px;
		}

		#form_bc {
			margin: auto;
			width: 700px;
			border: 1px solid black;
			padding: 10px;
		}
	</style>
	<script>
		function bcSubmit(bcType){
			if(bcType == "A"){
				// 계좌 소유주 확인
				document.form_bc.service.value = "1";
				document.form_bc.svcGbn.value = "5";
			}
			else if(bcType == "B"){
				// 계좌 예금주명 확인
				document.form_bc.service.value = "2";
				document.form_bc.svcGbn.value = "2";
			}
			else
			{
				// 계좌 유효성 확인
				document.form_bc.service.value = "3";
				document.form_bc.svcGbn.value = "4";
			}
			document.form_bc.action = "request.jsp";
			document.form_bc.submit();
		} 
	</script>
</head>
<body>
	<!-- NICE 계좌인증 form -->
	<form name="form_bc" method="post">
		<!-- 서비스구분 (1: 소유주 확인, 2: 예금주명 확인, 3: 계좌 유효성 확인) -->
		<input type="hidden" name="service" value="">
		<!-- 업무구분 (5: 소유주 확인, 2: 예금주명 확인, 4: 계좌 유효성 확인) -->
		<input type="hidden" name="svcGbn" value="">
		<!-- 계좌구분 (1:개인계좌, 2:법인계좌) -->
		<input type="radio" name="strGbn" id="strGbn1" value="1" checked="checked">
		<label for="strGbn1">개인계좌</label>
		<input type="radio" name="strGbn" id="strGbn2" value="2">
		<label for="strGbn2">법인계좌</label>
		<br>
		<!-- 은행코드 -->
		<label for="strBankCode">은행코드</label>
		<select name="strBankCode">
			<option value="002">산업은행</option>
			<option value="003">기업은행</option>
			<option value="004">국민은행</option>
			<option value="007">수협</option>
			<option value="011">농협</option>
			<option value="012">지역농축협</option>
			<option value="020">우리은행</option>
			<option value="023">SC제일은행</option>
			<option value="027">한국씨티은행</option>
			<option value="031">대구은행</option>
			<option value="032">부산은행</option>
			<option value="034">광주은행</option>
			<option value="035">제주은행</option>
			<option value="037">전북은행</option>
			<option value="039">경남은행</option>
			<option value="045">새마을금고</option>
			<option value="048">신협</option>
			<option value="050">저축은행</option>
			<option value="054">HSBC은행</option>
			<option value="055">도이치은행</option>
			<option value="057">JP모간체이스은행</option>
			<option value="060">BOA은행</option>
			<option value="061">BNP파리바은행</option>
			<option value="062">중국공상은행</option>
			<option value="064">산림조합</option>
			<option value="067">중국건설은행</option>
			<option value="071">우체국</option>
			<option value="081">하나은행</option>
			<option value="088">신한은행</option>
			<option value="089">케이뱅크</option>
			<option value="090">카카오뱅크</option>
			<option value="209">유안타증권</option>
			<option value="218">KB증권</option>
			<option value="227">KTB투자증권</option>
			<option value="238">미래에셋대우</option>
			<option value="240">삼성증권</option>
			<option value="243">한국투자증권</option>
			<option value="247">NH투자증권</option>
			<option value="261">교보증권</option>
			<option value="262">하이투자증권</option>
			<option value="263">현대차증권</option>
			<option value="264">키움증권</option>
			<option value="265">이베스트투자증권</option>
			<option value="266">SK증권</option>
			<option value="267">대신증권</option>
			<option value="269">한화투자증권</option>
			<option value="270">하나금융투자</option>
			<option value="278">신한금융투자</option>
			<option value="279">DB금융투자</option>
			<option value="280">유진투자증권</option>
			<option value="287">메리츠종합금융증권</option>
			<option value="288">카카오페이증권</option>
			<option value="290">부국증권</option>
			<option value="291">신영증권</option>
			<option value="292">케이프투자증권</option>
			<option value="294">펀드온라인코리아</option>
		</select>
		<!-- 계좌번호 -->
		<label for="strAccountNo">계좌번호</label>
		<input type="text" name="strAccountNo" maxlength="40" size="40" value="">
		<br>
		<!-- 예금주명 -->
		<label for="name">예금주명</label>
		<input type="text" name="name" maxlength="40" size="16" value="">
		<br>
		<!-- 계좌인증 버튼 -->
		<button onclick="javascript:bcSubmit('B');">계좌 예금주명 확인</button> (계좌번호 + 예금주명)
	</form>	
</body>
</html>