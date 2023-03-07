<%@page import="com.kimbyungman.spring.manpower.dto.MemberDto"%>
<%
	String pageTitle = "로그인";
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
	<title>김병만인력관리 - 로그인</title>
	<%@ include file="../../../common/headInfo/css.jsp" %>
	<%@ include file="../../headInfo/css.jsp" %>
    <%@ include file="../../../common/headInfo/javascript.jsp" %>
    <%@ include file="../../headInfo/javascript.jsp" %>
    <script type="text/javascript" src="<c:url value='/client/js/personal/login.js'/>"></script>
</head>
<body>
	<%@ include file="../inc/headerPc.jsp" %>
    <%@ include file="../inc/header.jsp" %>
    <section class="col-12 col-center mw-md-400 pt40 pl20 pr20 login_wrap">
    	<div class="col-12">
    		<div class="col-12 tc mb30 show hidden-md">
				<img src="<c:url value='/client/img/intro_logo_img_000.png'/>"/>
			</div>
			<div class="col-12 tc mb37 hidden show-md login_text">로그인</div>
			<form class="col-12 mb20 form_style_0_con" action="/personal/loginAction" method="post" id="personalLoginForm">
				<div class="col-12 form_style_0">
					<div class="col-12 label_box hidden-md">
						<label for="phoneNum">휴대 전화 번호</label>
					</div>
					<div class="col-12 input_box">
						<input type="number" id="phoneNum" name="phoneNum" class="input_style_0" placeholder="휴대 전화번호를 '-'없이 입력해주세요." maxlength="11" pattern="\d*"/>
					</div>
				</div>
				<div class="col-12 form_style_0">
					<div class="col-12 label_box hidden-md">
						<label for="userPw">비밀번호</label>
					</div>
					<div class="col-12 input_box">
						<input type="password" id="userPw" name="userPw" class="input_style_0" placeholder="비밀번호를 입력해주세요."/>
					</div>
				</div>
			</form>
			<ul class="col-12 mb40 login_list_con">
				<li>
					<a href="/personal/findPassword">비밀번호 찾기</a>
				</li>
			</ul>
			<div class="col-12 btn_style_0_con">
				<a href="javascript:void(0)" class="col-12 btn_style_0" onclick="login.formSubmit()">
					<span>로그인</span>
				</a>
				<a href="/personal/signUp?stepIdx=1" class="col-12 mt10 btn_style_0 type_4">
					<span>회원가입</span>
				</a>
			</div>
    	</div>
    </section>
    <%@ include file="../inc/footerPc.jsp" %>
</body>
</html>