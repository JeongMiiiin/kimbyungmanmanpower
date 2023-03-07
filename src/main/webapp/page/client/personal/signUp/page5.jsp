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
	<title>김병만인력관리 - 회원가입 완료</title>
	<%@ include file="../../../common/headInfo/css.jsp" %>
	<%@ include file="../../headInfo/css.jsp" %>
    <%@ include file="../../../common/headInfo/javascript.jsp" %>
    <%@ include file="../../headInfo/javascript.jsp" %>
    <script type="text/javascript" src="<c:url value='/client/js/personal/signUp5.js'/>"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<%@ include file="../inc/headerPc.jsp" %>
    <%@ include file="../inc/header.jsp" %>
    <section class="col-12 col-center mw-635 pt40 pl20 pr20 login_wrap">
    	<div class="col-12 tc mb37 hidden show-md login_text">회원가입<br/>완료되었습니다.</div>
    </section>
    <%@ include file="../inc/footerPc.jsp" %>
    <div class="col-12 popup_style_3_wrap" id="noticeAgreePopup" data-popup-page-access-block>
		<div class="col-12 popup_con">
			<div class="col-12 popup_inner">
				<div class="col-12 popup_title_con type_2">
					<div class="col-12 popup_title">알림 동의</div>
				</div>
				<div class="col-12 mb14 popup_sub_title">앱의 최신소식을받으시겠습니까?</div>
				<div class="col-12 mt30 pl20 pr20 pb40 popup_style_3_btn_con">
					<div class="col-6 popup_style_3_btn cancel_btn">
						<a href="javascript:void(0)" id="noticeDisagreeBtn"><span>동의안함</span></a>
					</div>
					<div class="col-6 popup_style_3_btn">
						<a href="javascript:void(0)" id="noticeAgreeBtn"><span>동의</span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>