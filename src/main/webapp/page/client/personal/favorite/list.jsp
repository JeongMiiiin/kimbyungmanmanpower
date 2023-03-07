<%@page import="com.kimbyungman.spring.manpower.dto.MemberDto"%>
<%
	String pageTitle = "즐겨찾기";
	int memCategory = session.getAttribute("memberInfo") != null ? ((MemberDto) session.getAttribute("memberInfo")).getCategory() : -1;
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>김병만 인력관리 - 즐겨찾기</title>
    <%@ include file="../../../common/headInfo/css.jsp" %>
    <%@ include file="../../headInfo/css.jsp" %>
    <%@ include file="../../../common/headInfo/javascript.jsp" %>
    <%@ include file="../../headInfo/javascript.jsp" %>
    <script type="text/javascript" src="<c:url value='/client/js/personal/favorite.js'/>"></script>
    <script>let footerIdx = 1;</script>
    <script>let memCategory = <%=memCategory%>;</script>
</head>

<script>let favoriteList = [];</script>
<c:forEach var="favoriteList" items="${workList}">
	<script>
		favoriteList.push(${favoriteList.sn});
	</script>
</c:forEach>

<body>
	<%@ include file="../inc/headerPc.jsp" %>
	<%@ include file="../inc/header.jsp" %>
	<%
		//로그인 체크
		int loginCheck = session.getAttribute("memberInfo") != null ? ((MemberDto) session.getAttribute("memberInfo")).getSn() : -1; 
		if(loginCheck == -1){
			%>
			<script>
				$(function(){
					alert('로그인을 진행해주시기 바랍니다.');
					window.location.replace("/personal/login");
				})
			</script>
	<%		
		return;	
		}
	%>
	<section class="col-12 pt30 sub_wrap">
		<ul class="col-12 hidden-md pl20 pr20 work_list_con">
			<c:forEach var="workList" items="${workList}">
				<c:set var="regionList" value="${fn:split(workList.region,',')}"></c:set>
				<li onclick="favorite.openWorkViewPopup(${workList.sn})">
					<a href="javascript:void(0)" class="favorite_icon active" onclick="favorite.updateFavorite(${workList.sn})" data-favorite-sn="${workList.sn}">즐겨찾기 버튼</a>
					<div class="col-12 work_list_inner">
						<div class="col-12 work_list_title">${workList.title}</div>
						<ul class="col-12 work_region_list">
							<c:forEach var="regionList" items="${regionList}">
								<c:if test="${regionList ne '[]'}">
									<li><span>${regionList}</span></li>
								</c:if>
							</c:forEach>
						</ul>
						<div class="col-12 work_list_contents">${workList.contents}</div>
					</div>	
				</li>	
			</c:forEach>
			<c:if test="${empty workList}">
				<li class="no_data">
					<span>즐겨찾기로 추가한 게시물이 없습니다.</span>
				</li>
			</c:if>
		</ul>
		<div class="col-12 col-center mw-1020 mt40 pl20 pr20 hidden show-md-block work_pc_list_wrap">
			<div class="col-12 work_pc_list_title_con">
				<div class="col-12 work_pc_list_title">즐겨찾기</div>
			</div>
			<ul class="col-12 work_pc_list_contents_con has_favorite">
				<c:forEach var="workList" items="${workList}">
					<c:set var="regionList" value="${fn:split(workList.region,',')}"></c:set>
					<li onclick="favorite.openWorkViewPopup(${workList.sn})">
						<a href="javascript:void(0)" class="favorite_icon active" onclick="favorite.updateFavorite(${workList.sn})" data-favorite-sn="${workList.sn}">즐겨찾기 버튼</a>
						<div class="col-12 work_list_inner">
							<ul class="col-12 work_region_list">
								<c:forEach var="regionList" items="${regionList}">
									<c:if test="${regionList ne '[]'}">
										<li><span>${regionList}</span></li>
									</c:if>
								</c:forEach>
							</ul>
							<div class="col-12 work_list_title">${workList.title}</div>
							<div class="col-12 work_list_contents">${workList.contents}</div>
						</div>	
					</li>	
				</c:forEach>
				<c:if test="${empty workList}">
					<li class="no_data">
						<span>즐겨찾기로 추가한 게시물이 없습니다.</span>
					</li>
				</c:if>
			</ul>
		</div>
	</section>
	<%@ include file="../inc/footer.jsp" %>
	<%@ include file="../inc/footerPc.jsp" %>
	<!-- 구인/구직내역 상세 팝업 -->
<div class="col-12 popup_style_3_wrap" id="workViewPopup">
	<div class="col-12 popup_con">
		<div class="col-12 popup_inner">
			<div class="col-12 popup_title_con">
				<div class="col-12 popup_title">상세 내용</div>
				<a href="javascript:void(0)" class="popup_favorite_icon">즐겨찾기 버튼</a>
			</div>
			<ul class="col-12 popup_contents_con">
				<li>
					<div class="col-0 label_box">제목</div>
					<div class="col-0 input_box" id="workViewTitle"></div>
				</li>
				<li>
					<div class="col-0 label_box">성별</div>
					<div class="col-0 input_box" id="workViewSex"></div>
				</li>
				<li>
					<div class="col-0 label_box">지역</div>
					<div class="col-0 input_box" id="workViewRegion"></div>
				</li>
				<li>
					<div class="col-0 label_box">카테고리</div>
					<div class="col-0 input_box" id="workViewCategory"></div>
				</li>
				<li>
					<div class="col-0 label_box">내용</div>
					<div class="col-0 input_box" id="workViewContents"></div>
				</li>
				<li class="type_date">
					<div class="col-0 label_box">기간</div>
					<div class="col-0 input_box" id="workViewDate"><span></span><span>~</span><span></span></div>
				</li>
				<li>
					<div class="col-0 label_box">금액</div>
					<div class="col-0 input_box tr" id="workViewPayment"></div>
				</li>
			</ul>
			<div class="col-12 mt30 pl20 pr20 pb40 popup_style_3_btn_con">
				<div class="col-4 popup_style_3_btn cancel_btn">
					<a href="javascript:void(0)" onclick="popupManager.removePopLatest(true)"><span>닫기</span></a>
				</div>
				<div class="col-8 popup_style_3_btn">
					<a href="javascript:void(0)" id="workApplyBtn"><span>지원하기</span></a>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 지원하기 팝업 -->
<div class="col-12 popup_style_0_wrap" id="applySelectPopup">
	<div class="col-12 popup_con">
		<div class="col-12 popup_inner">
			<div class="col-12 popup_header_con">
				<div class="col-12 tc popup_header_title">지원하기</div>
				<a href="javascript:void(0)" class="popup_header_close_btn" onclick="popupManager.removePopLatest(true)">닫기 버튼</a>
			</div>
			<div class="col-12 pt17 pl20 pr20 popup_contents_con">
				<div class="col-12">
					<div class="col-12 appeal_popup_headline">나의 어필정보를 입력해주세요!</div>
					<div class="col-12 mb20">
						<textarea name="appealContents" id="appealContents" class="textarea_style_0" placeholder="어필정보를 입력해주세요. (최대 400자)" style="height: 330px;"></textarea>
					</div>
					<div class="col-12 btn_style_0_con">
						<div class="col-12 btn_style_0 type_plus type_grey" onclick="favorite.openAppealInfo()"><span>불러오기</span></div>
					</div>
				</div>
				<div class="col-12 btn_style_0_con">
					<div class="col-12 btn_style_0 type_complete type_lightgrey" id="completeApplyBtn"><span>완료</span></div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 어필정보 템플릿선택팝업 -->
<div class="col-12 popup_style_2_wrap" id="appealTemplateSelectPopup">
	<div class="col-12 popup_con">
		<div class="col-12 popup_inner">
			<div class="col-12 mb24 popup_title_con">
				<div class="col-12 popup_title">템플릿 선택</div>
			</div>
			<ul class="col-12 pl20 pr20 appeal_template_select_con">
				<li>
					<div class="col-0 checkbox_style_0_con appeal_template_checkbox">
						<input type="radio" class="checkbox_style_0" name="appealTemplateSelect" id="appealTemplateSelect0"/>
						<label for="appealTemplateSelect0"></label>
					</div>
					<div class="col-12 appeal_template_date">2022. 06. 30</div>
					<div class="col-12 appeal_template_title">제 특기는 **입니다. 잘 부탁드립니다.</div>
					<a href="javascript:void(0)" class="appeal_template_view_btn"><span>상세</span></a>
				</li>
			</ul>
			<div class="col-12 mt30 pl20 pr20 pb40 popup_style_3_btn_con">
				<div class="col-3 popup_style_3_btn cancel_btn">
					<a href="javascript:void(0)" onclick="popupManager.removePopLatest(true)"><span>닫기</span></a>
				</div>
				<div class="col-9 popup_style_3_btn">
					<a href="javascript:void(0)" onclick="favorite.selectAppealTemplate()"><span>선택완료</span></a>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 어필정보 템플릿 상세 팝업 -->
<div class="col-12 popup_style_3_wrap" id="appealTemplateViewPopup">
	<div class="col-12 popup_con">
		<div class="col-12 popup_inner">
			<div class="col-12 popup_title_con">
				<div class="col-12 popup_title">상세 내용</div>
			</div>
			<ul class="col-12 popup_contents_con">
				<li>
					<div class="col-0 label_box">제목</div>
					<div class="col-0 input_box" id="appealTemplateViewTitle"></div>
				</li>
				<li>
					<div class="col-0 label_box">내용</div>
					<div class="col-0 input_box" id="appealTemplateViewContents"></div>
				</li>
			</ul>
			<div class="col-12 mt30 pl20 pr20 pb40 popup_style_3_btn_con">
				<div class="col-12 popup_style_3_btn cancel_btn">
					<a href="javascript:void(0)" onclick="popupManager.removePopLatest(true)"><span>닫기</span></a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
