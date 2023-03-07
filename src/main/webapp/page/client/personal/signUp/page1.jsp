<%@page import="com.kimbyungman.spring.manpower.dto.MemberDto"%>
<%
	String pageTitle = "회원가입";
	int memCategory = session.getAttribute("memberInfo") != null ? ((MemberDto) session.getAttribute("memberInfo")).getCategory() : -1;
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>김병만인력관리 - 회원가입 약관동의</title>
	<%@ include file="../../../common/headInfo/css.jsp" %>
	<%@ include file="../../headInfo/css.jsp" %>
    <%@ include file="../../../common/headInfo/javascript.jsp" %>
    <%@ include file="../../headInfo/javascript.jsp" %>
    <script type="text/javascript" src="<c:url value='/client/js/personal/signUp1.js'/>"></script>
</head>
<body>
	<%@ include file="../inc/headerPc.jsp" %>
    <%@ include file="../inc/header.jsp" %>
    <section class="col-12 col-center mw-md-635 pt40 pl20 pr20 login_wrap">
    	<div class="col-12">
    		<div class="col-12 tc mb37 hidden show-md login_text">회원가입<br/>약관 및 동의</div>
    		<ul class="col-12 mb40 signup_agree_con">
	    		<li class="type_all">
	    			<div class="col-12 checkbox_style_0_con type_all">
						<input type="checkbox" name="checkAll" id="checkAll" class="checkbox_style_0"/>
						<label for="checkAll"><a href="javascript:void(0)" onclick="$('#checkAll').trigger('click')">전체 동의</a> (선택 포함)</label>
					</div>
	    		</li>
	    		<li>
	    			<div class="col-12 checkbox_style_0_con type_2">
						<input type="checkbox" name="termsOfService" id="termsOfService" class="checkbox_style_0"/>
						<label for="termsOfService"><a href="javascript:void(0)" onclick="popupManager.add('#termsofServicePopup')">이용약관 동의</a> <span class="essential">(필수)</span></label>
					</div>
	    		</li>
	    		<li>
	    			<div class="col-12 checkbox_style_0_con type_2">
						<input type="checkbox" name="privacyUsageAgree" id="privacyUsageAgree" class="checkbox_style_0"/>
						<label for="privacyUsageAgree"><a href="javascript:void(0)" onclick="popupManager.add('#privacyPolicyPopup')">개인정보 수집 이용 동의</a> <span class="essential">(필수)</span></label>
					</div>
	    		</li>
	    		<li>
	    			<div class="col-12 checkbox_style_0_con type_2">
						<input type="checkbox" name="locationUsageAgree" id="locationUsageAgree" class="checkbox_style_0"/>
						<label for="locationUsageAgree"><a href="javascript:void(0)">위치기반 서비스 이용약관 동의</a> <span>(선택)</span></label>
					</div>
	    		</li>
	    	</ul>
			<div class="col-12 btn_style_0_con">
				<a href="javascript:void(0)" class="col-12 btn_style_0" onclick="signUp1.nextStep()">
					<span>다음</span>
				</a>
			</div>
    	</div>
    </section>
    <%@ include file="../inc/footerPc.jsp" %>
</body>
</html>
