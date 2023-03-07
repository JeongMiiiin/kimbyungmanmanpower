<%@page import="com.kimbyungman.spring.manpower.dto.MemberDto"%>
<%
	String pageTitle = "사업자 인증";
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
	<title>김병만인력관리 - 회원가입 사업자 인증</title>
	<%@ include file="../../../common/headInfo/css.jsp" %>
	<%@ include file="../../headInfo/css.jsp" %>
    <%@ include file="../../../common/headInfo/javascript.jsp" %>
    <%@ include file="../../headInfo/javascript.jsp" %>
    <script type="text/javascript" src="<c:url value='/client/js/business/signUp3.js'/>"></script>
</head>
<body>
	<%@ include file="../inc/headerPc.jsp" %>
    <%@ include file="../inc/header.jsp" %>
    <section class="col-12 col-center mw-md-635 pt40 pl20 pr20 login_wrap">
    	<div class="col-12">
    		<div class="col-12 tc mb37 hidden show-md login_text">회원가입<br/>사업자 인증</div>
    		<div class="col-12 mb40 sign_up_text hidden-md">기업, 단체회원은 가입을 위해 사업자 등록번호 인증이 필요합니다.</div>
	    	<div class="col-12 mb40 form_style_0_con">
	    		<div class="col-12 form_style_0">
					<div class="col-12 label_box">
						<label for="businessName">상호명</label>
					</div>
					<div class="col-12 input_box">
						<input type="text" id="businessName" name="businessbusinessName" class="input_style_0" placeholder="상호명을 입력해주세요."/>
					</div>
				</div>
				<div class="col-12 form_style_0">
					<div class="col-12 label_box">
						<label for="businessNum">사업자 등록 번호</label>
					</div>
					<div class="col-12 input_box">
						<input type="text" id="businessNum" name="businessNum" class="input_style_0" placeholder="사업자 등록번호를 입력해주세요." maxlength="10"/>
					</div>
				</div>
				<div class="col-12 form_style_0">
					<div class="col-12 label_box">
						<label for="representativeName">대표자명</label>
					</div>
					<div class="col-12 input_box">
						<input type="text" id="representativeName" name="representativeName" class="input_style_0" placeholder="대표자명을 입력해주세요."/>
					</div>
				</div>
			</div>
			<div class="col-12 btn_style_0_con">
				<a href="javascript:void(0)" class="col-12 btn_style_0 type_blue" id="signUp3CompleteBtn">
					<span>인증</span>
				</a>
			</div>
    	</div>
    </section>
    <%@ include file="../inc/footerPc.jsp" %>
</body>
</html>