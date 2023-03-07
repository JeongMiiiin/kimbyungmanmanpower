<%
	String pageTitle = "고객센터";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>김병만인력관리 - 고객센터</title>
	<%@ include file="../../../common/headInfo/css.jsp" %>
    <%@ include file="../../headInfo/css.jsp" %>
    <%@ include file="../../../common/headInfo/javascript.jsp" %>
    <%@ include file="../../headInfo/javascript.jsp" %>
    <script>let footerIdx = 2;</script>
</head>
<body>
    <%@ include file="../inc/headerIntro.jsp" %>
    <section class="col-12 sub_wrap">
		<div class="col-12 pt27 service_center_intro_wrap">
			<div class="col-12 service_center_intro_con">
				<div class="col-12 service_center_intro_title">
					가이드
				</div>
				<ul class="col-12 service_center_intro_list">
					<li>
						<a href="/personal/serviceCenter/page?tabIdx=1"><span>공지사항</span></a>
					</li>
					<li class="app_guide">
						<a href="/personal/serviceCenter/page?tabIdx=2"><span>앱가이드</span></a>
					</li>
				</ul>
			</div>
			<div class="col-12 service_center_intro_con">
				<div class="col-12 service_center_intro_title">
					김병만인력관리 서비스
				</div>
				<ul class="col-12 service_center_intro_list">
					<li class="company_info">
						<a href="/personal/serviceCenter/page?tabIdx=3"><span>회사소개</span></a>
					</li>
					<li class="terms_and_policy">
						<a href="/personal/serviceCenter/page?tabIdx=4"><span>약관 및 정책</span></a>
					</li>
					<li class="help">
						<a href="/personal/serviceCenter/page?tabIdx=5"><span>도움말</span></a>
					</li>
				</ul>
			</div>
		</div>
	</section>
<%@ include file="../inc/footer.jsp" %>
</body>
</html>