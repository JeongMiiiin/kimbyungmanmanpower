<%@page import="com.kimbyungman.spring.manpower.dto.MemberDto"%>
<%
	String pageTitle = "구인, 구직 선택";
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
	<title>김병만인력관리 - 회원가입 구인, 구직 선택</title>
	<%@ include file="../../../common/headInfo/css.jsp" %>
	<%@ include file="../../headInfo/css.jsp" %>
    <%@ include file="../../../common/headInfo/javascript.jsp" %>
    <%@ include file="../../headInfo/javascript.jsp" %>
    <script type="text/javascript" src="<c:url value='/client/js/personal/signUp3.js'/>"></script>
</head>
<body>
	<%@ include file="../inc/headerPc.jsp" %>
    <%@ include file="../inc/header.jsp" %>
    <section class="col-12 col-center mw-md-635 pt40 pl20 pr20 login_wrap">
    	<div class="col-12">
    		<div class="col-12 tc mb37 hidden show-md login_text">회원가입<br/>구인/구직 선택</div>
    		<div class="col-12 mb40 sign_up_text hidden-md">구인자인지 구직자인지 선택해주세요.</div>
    		<ul class="col-12 sign_up_select_list">
    			<li>
    				<div class="col-12 btn_style_0_con">
						<a href="/personal/signUp?stepIdx=4&category=1" class="col-12 btn_style_0 type_blue">
							<span>구인자</span>
						</a>
					</div>
    			</li>
    			<li>
    				<div class="col-12 btn_style_0_con">
						<a href="/personal/signUp?stepIdx=4&category=2" class="col-12 btn_style_0 type_grey">
							<span>구직자</span>
						</a>
					</div>
    			</li>
    		</ul>
    	</div>
    </section>
    <%@ include file="../inc/footerPc.jsp" %>
</body>
</html>