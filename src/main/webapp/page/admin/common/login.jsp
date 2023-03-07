<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>김병만 인력관리 - 관리자 로그인</title>
		<%@ include file="../../common/headInfo/css.jsp" %>
    	<%@ include file="../headInfo/css.jsp" %>
    	<link rel="stylesheet" href="<c:url value='/adm/css/membership.login.css'/>"/>
    	<%@ include file="../../common/headInfo/javascript.jsp" %>
    	<%@ include file="../headInfo/javascript.jsp" %>
		<script type="text/javascript" src="<c:url value='/adm/js/login.js'/>"></script>
	</head>
	<body>
		<section class="col-12 login_wrap">
			<div class="col-12 login_con">
				<div class="col-12 tc mb30 login_logo_box">
					<img src="<c:url value='/common/img/logo.png'/>" alt="김병만 인력관리"/>
				</div>
				<form class="col-12 mb30 login_form_con" action="/adm/loginAction" method="post">
					<div class="col-12 mb20 login_form_contents_con">
						<div class="col-12 login_form_contents">
							<label for="userId" class="col-12 col-0 label_box">아이디</label>
							<div class="col-12 col-0 input_box">
								<input type="text" name="userId" id="userId" placeholder="아이디를 입력해주세요."/>
								<span class="form_check_info hidden"></span>
							</div>
						</div>
						<div class="col-12 login_form_contents">
							<label for="userPw" class="col-12 col-0 label_box">비밀번호</label>
							<div class="col-12 col-0 input_box">
								<input type="password" name="userPw" id="userPw" placeholder="비밀번호를 입력해주세요."/>
								<span class="form_check_info hidden"></span>
							</div>
						</div>
					</div>
					<div class="col-12 login_form_bottom_con">
						<div class="col-12 fr login_btn_con">
							<a href="javascript:void(0)" class="col-12 login_btn" onclick="login.onLogin()">로그인</a>
						</div>
					</div>
				</form>
			</div>	
		</section>
	</body>
</html>