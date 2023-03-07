<%@page import="com.kimbyungman.spring.manpower.dto.MemberDto"%>
<%
	String pageTitle = "비밀번호 찾기";
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
	<title>김병만인력관리 - 비밀번호 찾기</title>
	<%@ include file="../../../common/headInfo/css.jsp" %>
	<%@ include file="../../headInfo/css.jsp" %>
    <%@ include file="../../../common/headInfo/javascript.jsp" %>
    <%@ include file="../../headInfo/javascript.jsp" %>
    <script type="text/javascript" src="<c:url value='/client/js/personal/findPassword.js'/>"></script>
</head>
<body>
	<%@ include file="../inc/headerPc.jsp" %>
    <%@ include file="../inc/headerArrow.jsp" %>
    <section class="col-12 col-center mw-md-635 pt40 pl20 pr20 login_wrap">
    	<div class="col-12">
    		<div class="col-12 tc mb30 show hidden-md">
				<img src="<c:url value='/client/img/intro_logo_img_000.png'/>"/>
			</div>
			<div class="col-12 tc mb37 hidden show-md login_text">비밀번호 재설정</div>
			<form class="col-12 mb20 form_style_0_con" action="/personal/loginAction" method="post" id="personalLoginForm">
				<div class="col-12 form_style_0">
					<div class="col-12 label_box">
						<label for="userName">이름</label>
					</div>
					<div class="col-12 input_box">
						<input type="text" id="userName" name="userName" class="input_style_0" placeholder="이름을 입력해주세요."/>
					</div>
				</div>
				<div class="col-12 form_style_0">
					<div class="col-12 label_box">
						<label for="phoneNum">휴대 전화 번호</label>
					</div>
					<div class="col-12 input_box">
						<input type="number" id="phoneNum" name="phoneNum" class="input_style_0" placeholder="휴대 전화 번호를 '-'없이 입력해주세요." maxlength="11" pattern="\d*"/>
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
							<a href="javascript:void(0)">인증번호 재발송</a>
						</li>
					</ul>
				</div>
				<div class="col-12 tc find_pass_toast_con">
					<span>임시 비밀번호가<br/>
					문자로 발송되었습니다.
					</span>
				</div>
			</form>
			<div class="col-12 btn_style_0_con">
				<a href="javascript:void(0)" class="col-12 btn_style_0" id="findPasswordBtn">
					<span>인증번호 발송</span>
				</a>
			</div>
    	</div>
    </section>
    <%@ include file="../inc/footerPc.jsp" %>
</body>
</html>