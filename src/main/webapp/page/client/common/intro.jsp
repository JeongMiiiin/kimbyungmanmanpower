<%
	int headerPcIdx = 0;
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>김병만 인력관리 - 선택</title>
    <%@ include file="../../common/headInfo/css.jsp" %>
    <%@ include file="../headInfo/css.jsp" %>
    <%@ include file="../../common/headInfo/javascript.jsp" %>
    <%@ include file="../headInfo/javascript.jsp" %>
    <script type="text/javascript" src="<c:url value='/client/js/intro.js'/>"></script>
</head>

<body>
	<%@ include file="../inc/headerPc.jsp" %>
	<section class="col-12 intro_wrap">	
		<div class="col-12 tc mb30 intro_logo_con">
			<img src="<c:url value='/client/img/intro_logo_white_img_000.png'/>" style="width: 116px;"/>
		</div>
		<div class="col-12 mb30 tc intro_img_con">
			<img src="<c:url value='/client/img/intro_img_000.png'/>"/>
		</div>
		<div class="col-12 mb30 intro_title_con">
			<span>김병만인력관리</span> 이용을 위해<br/>
			구인구직(개인) 또는 기업을 선택해주세요
		</div>
		<ul class="col-12 intro_list_con">
			<li class="personal">
				<a href="/personal/main"><span>구인구직(개인)</span></a>
			</li>
			<li class="business">
				<a href="/business/main"><span>기업/단체</span></a>
			</li>
		</ul>
	</section>
	<%@ include file="../inc/footerPc.jsp" %>
	<div class="col-12 intro_pc_popup_wrap" id="introPcPopup" data-popup-page-access-block>
		<div class="col-12 popup_con">
			<div class="col-12 popup_inner">
				<div class="col-12 mb27 tc">
					<img src="<c:url value='/client/img/footer_pc_logo_img_000.png'/>" style="width: 116px;"/>
				</div>
				<div class="col-12 mb27 tc intro_pc_title">김병만인력관리 이용을 위해<br/>구인구직(개인) 또는 기업을 선택해 주세요.</div>
				<ul class="col-12 intro_pc_list">
					<li>
						<a href="/personal/main"><span>구인구직(개인)</span></a>
					</li>
					<li>
						<a href="/business/main"><span>기업/단체</span></a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>