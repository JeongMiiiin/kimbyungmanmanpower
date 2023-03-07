<%@page import="com.kimbyungman.spring.manpower.dto.MemberDto"%>
<%
	String pageTitle = "휴대폰 인증";
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
	<title>김병만인력관리 - 회원가입 휴대폰 인증</title>
	<%@ include file="../../../common/headInfo/css.jsp" %>
	<%@ include file="../../headInfo/css.jsp" %>
    <%@ include file="../../../common/headInfo/javascript.jsp" %>
    <%@ include file="../../headInfo/javascript.jsp" %>
    <script type="text/javascript" src="<c:url value='/client/js/personal/signUp2.js'/>"></script>
</head>
<body>
	<%@ include file="../inc/headerPc.jsp" %>
    <%@ include file="../inc/header.jsp" %>
    <section class="col-12 col-center mw-md-635 pt40 pl20 pr20 login_wrap">
    	<div class="col-12">
    		<div class="col-12 tc mb37 hidden show-md login_text">회원가입<br/>휴대폰 인증</div>
    		<div class="col-12 mb40 sign_up_text hidden-md">회원가입을 위해서는 휴대폰 인증이 필요합니다.</div>
			<div class="col-12 mb40 form_style_0_con">
				<div class="col-12 form_style_0">
					<div class="col-12 label_box">
						<label for="phoneNum">휴대 전화 번호</label>
					</div>
					<div class="col-12 input_box">
						<input type="number" id="phoneNum" name="phoneNum" class="input_style_0" placeholder="휴대 전화번호를 '-'없이 입력해주세요." maxlength="11" pattern="\d*"/>
						<a href="javascript:void(0)" class="sign_up_phone_num_delete_btn" style="display: none;">전화번호 지우기 버튼</a>
						<span class="sign_up_phone_num_complete_btn" style="display: none;">전화번호 확인 아이콘</span>
					</div>
				</div>
				<div class="col-12 form_style_0" id="certificationCodeCon" style="display: none;">
					<div class="col-12 label_box">
						<label for="submitCode">인증번호</label>
					</div>
					<div class="col-12 input_box">
						<input type="text" id="submitCode" name="submitCode" class="input_style_0" placeholder="인증번호를 입력해주세요." maxlength="6"/>
						<span class="col-0 timer_text" id="timerText"></span>
					</div>
					<ul class="col-12 mt15 login_list_con">
						<li>
							<a href="javascript:void(0)" onclick="signUp2.reSendMsg()">인증번호 재발송</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-12 btn_style_0_con">
				<a href="javascript:void(0)" class="col-12 btn_style_0" id="signUp2CompleteBtn">
					<span>인증번호 발송</span>
				</a>
			</div>
    	</div>
    </section>
    <%@ include file="../inc/footerPc.jsp" %>
</body>
</html>