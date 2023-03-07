<%-- <%@page import="NiceID.Check.CPClient"%> --%>
<%@page import="com.kimbyungman.spring.manpower.dto.MemberDto"%>
<%
	String pageTitle = "마이페이지";
	int memCategory = session.getAttribute("memberInfo") != null ? ((MemberDto) session.getAttribute("memberInfo")).getCategory() : -1;
%>

<%-- <%
    NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();
    
    String sSiteCode = "G8515";			// NICE로부터 부여받은 사이트 코드
    String sSitePassword = "C4IC5FMAA1SB";		// NICE로부터 부여받은 사이트 패스워드
    
    String sRequestNumber = "REQ0000000001";        	// 요청 번호, 이는 성공/실패후에 같은 값으로 되돌려주게 되므로 
                                                    	// 업체에서 적절하게 변경하여 쓰거나, 아래와 같이 생성한다.
    sRequestNumber = niceCheck.getRequestNO(sSiteCode);
    session.setAttribute("REQ_SEQ" , sRequestNumber);	// 해킹등의 방지를 위하여 세션을 쓴다면, 세션에 요청번호를 넣는다.
  	
   	String sAuthType = "";      	// 없으면 기본 선택화면, M(휴대폰), X(인증서공통), U(공동인증서), F(금융인증서), S(PASS인증서), C(신용카드)
	String customize 	= "";		//없으면 기본 웹페이지 / Mobile : 모바일페이지
	
    // CheckPlus(본인인증) 처리 후, 결과 데이타를 리턴 받기위해 다음예제와 같이 http부터 입력합니다.
	//리턴url은 인증 전 인증페이지를 호출하기 전 url과 동일해야 합니다. ex) 인증 전 url : http://www.~ 리턴 url : http://www.~
    String sReturnUrl = "http://cnj0012.cafe24.com/business/myInfo/successCertification";      // 성공시 이동될 URL
    String sErrorUrl = "http://cnj0012.cafe24.com/business/myInfo/failCertification";          // 실패시 이동될 URL

    // 입력될 plain 데이타를 만든다.
    String sPlainData = "7:REQ_SEQ" + sRequestNumber.getBytes().length + ":" + sRequestNumber +
                        "8:SITECODE" + sSiteCode.getBytes().length + ":" + sSiteCode +
                        "9:AUTH_TYPE" + sAuthType.getBytes().length + ":" + sAuthType +
                        "7:RTN_URL" + sReturnUrl.getBytes().length + ":" + sReturnUrl +
                        "7:ERR_URL" + sErrorUrl.getBytes().length + ":" + sErrorUrl +
                        "9:CUSTOMIZE" + customize.getBytes().length + ":" + customize;
    
    String sMessage = "";
    String sEncData = "";
    
    int iReturn = niceCheck.fnEncode(sSiteCode, sSitePassword, sPlainData);
    if( iReturn == 0 )
    {
        sEncData = niceCheck.getCipherData();
    }
    else if( iReturn == -1)
    {
        sMessage = "암호화 시스템 에러입니다.";
    }    
    else if( iReturn == -2)
    {
        sMessage = "암호화 처리오류입니다.";
    }    
    else if( iReturn == -3)
    {
        sMessage = "암호화 데이터 오류입니다.";
    }    
    else if( iReturn == -9)
    {
        sMessage = "입력 데이터 오류입니다.";
    }    
    else
    {
        sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn;
    }
%> --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>김병만인력관리 - 마이페이지 정보 수정</title>
	<%@ include file="../../../common/headInfo/css.jsp" %>
    <%@ include file="../../headInfo/css.jsp" %>
    <%@ include file="../../../common/headInfo/javascript.jsp" %>
    <%@ include file="../../headInfo/javascript.jsp" %>
    <script type="text/javascript" src="<c:url value='/client/js/business/myInfo.js'/>"></script>
    <script>
    	let footerIdx = 1;
    	let headerPcIdx = 0;
    </script>
</head>
<body>
	<%@ include file="../inc/headerPc.jsp" %>
    <%@ include file="../inc/headerIntro.jsp" %>
    <%
		//로그인 체크
		int loginCheck = session.getAttribute("memberInfo") != null ? ((MemberDto) session.getAttribute("memberInfo")).getSn() : -1; 
		if(loginCheck == -1){
			%>
			<script>
				$(function(){
					alert('로그인을 진행해주시기 바랍니다.');
					window.location.replace("/business/login");
				})
			</script>
	<%		
		return;	
		}
	%>
    <section class="col-12 sub_wrap">
    	<div class="col-12 hidden-md">
    		<ul class="col-12 mb27 my_info_tab_list_con">
	    		<li>
	    			<a href="/business/myInfo/page?tabIdx=0">
	    				<span>구인내역</span>
	    			</a>
	    		</li>
	    		<li class="active">
	    			<a href="javascript:void(0)">
	    				<span>정보수정</span>
	    			</a>
	    		</li>
	    	</ul>
    	</div>
    	<div class="col-12 col-center mw-1390 mt-md-67 pl20 pr20 my_info_pc_wrap">
    		<div class="col-12 col-md-3 hidden show-md-block my_info_pc_tab_list_con">
    			<div class="col-12 mb17 my_info_pc_tab_list_title">마이페이지</div>
    			<ul class="col-12 my_info_pc_tab_list">
    				<li>
    					<a href="/business/myInfo/page?tabIdx=0"><span>구인내역</span></a>
		    		</li>
		    		<li class="active">
		    			<a href="javascript:void(0)"><span>정보수정</span></a>
		    		</li>
    			</ul>
    		</div>
    		<form class="col-12 col-md-9 mb40 my_info_update_list_con" action="/business/myInfo/updateMyInfo" enctype="multipart/form-data" method="POST" data-common-update-form id="updateMyInfoForm">
	    		<input type="hidden" name="sn" value="${myInfo.sn}"/>
	    		<input type="hidden" name="certificationPhone" value="1"/>
	    		<div class="col-12 my_info_update_list">
	    			<div class="col-12 label_box"><span>알림 수신 여부</span></div>
	    			<div class="col-12 input_box">
	    				<div class="col-0 mr20 checkbox_style_0_con">
	    					<input type="radio" class="checkbox_style_0" name="noticeAgree" id="noticeAgree0" value="0" <c:if test='${myInfo.noticeAgree eq 0}'>checked</c:if>/>
	    					<label for="noticeAgree0">허용</label>
	    				</div>
	    				<div class="col-0 checkbox_style_0_con">
	    					<input type="radio" class="checkbox_style_0" name="noticeAgree" id="noticeAgree1" value="1" <c:if test='${myInfo.noticeAgree eq 1}'>checked</c:if>/>
	    					<label for="noticeAgree1">허용안함</label>
	    				</div>
	    			</div>
	    		</div>
	    		<div class="col-12 my_info_update_list">
	    			<div class="col-12 label_box"><label for="name">상호명</label></div>
	    			<div class="col-12 input_box">
	    				<input type="text" class="input_style_1" name="name" value="${myInfo.name}"/>
	    			</div>
	    		</div>
	    		<div class="col-12 my_info_update_list">
	    			<div class="col-12 label_box"><label for="representativeName">대표자명</label></div>
	    			<div class="col-12 input_box">
	    				<input type="text" class="input_style_1" name="representativeName" value="${myInfo.representativeName}"/>
	    			</div>
	    		</div>
	    		<div class="col-12 my_info_update_list type_phone">
	    			<div class="col-12 label_box"><label for="phoneNum">휴대 전화 번호</label></div>
	    			<div class="col-12 input_box">
	    				<input type="number" name="phoneNum" id="phoneNum" value="${myInfo.phone0}${myInfo.phone1}${myInfo.phone2}" class="input_style_1" placeholder="휴대전화번호를 '-'없이 입력해주세요" maxlength="11" pattern="\d*"/>
	    				<div class="col-0 ml10 btn_style_1_con">
	    					<a href="javascript:void(0)" class="btn_style_1" onclick="myInfo.certificatePhoneNum()"><span>재인증</span></a>
	    				</div>
	    			</div>
	    		</div>
	    		<div class="col-12 my_info_update_list type_phone">
	    			<div class="col-12 label_box"><label for="businessNum">사업자 등록번호</label></div>
	    			<div class="col-12 input_box">
	    				<input type="text" name="businessNum" id="businessNum" value="${myInfo.businessNum}" class="input_style_1"/>
	    				<div class="col-0 ml10 btn_style_1_con">
	    					<a href="javascript:void(0)" class="btn_style_1" onclick="myInfo.certificateBusinessNum()"><span>재인증</span></a>
	    				</div>
	    			</div>
	    		</div>
	    	</form>
    	</div>
    	<div class="col-12 col-center mw-1390 pl20 pr20 mt-md-40 mb-md-99 hidden show-md-block">
    			<div class="col-12 col-md-9 fr btn_style_0_con">
					<a href="javascript:void(0)" class="col-6 btn_style_0 type_2 type_grey" onclick="history.back()"><span>취소</span></a>
					<a href="javascript:void(0)" class="col-6 btn_style_0 type_2 type_blue" onclick="myInfo.updateMyInfo()"><span>변경</span></a>
				</div>
    		</div>
	    	<div class="col-12 mt40 pl20 pr20 btn_style_0_con hidden-md">
				<a href="javascript:void(0)" class="col-12 btn_style_0 type_blue" onclick="myInfo.updateMyInfo()">
					<span>변경</span>
				</a>
			</div>
    </section>
<%@ include file="../inc/footer.jsp" %>
<%@ include file="../inc/footerPc.jsp" %>
</body>
</html>