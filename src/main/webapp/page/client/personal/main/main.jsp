<%@page import="com.kimbyungman.spring.manpower.dto.MemberDto"%>
<%
	int memCategory = session.getAttribute("memberInfo") != null ? ((MemberDto) session.getAttribute("memberInfo")).getCategory() : -1;
	int memSn = session.getAttribute("memberInfo") != null ? ((MemberDto) session.getAttribute("memberInfo")).getSn() : -1;
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
    <title>김병만 인력관리 - 메인</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
	<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    <%@ include file="../../../common/headInfo/css.jsp" %>
    <%@ include file="../../headInfo/css.jsp" %>
    <%@ include file="../../../common/headInfo/javascript.jsp" %>
    <%@ include file="../../headInfo/javascript.jsp" %>
    <script type="text/javascript" src="<c:url value='/client/js/personal/main.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/client/js/personal/mainFilter.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/client/js/personal/mainWrite.js'/>"></script>
    <script>let footerIdx = 0;</script>
    <script>let memCategory = <%=memCategory%>;</script>
    <script>let memSn = <%=memSn%>;</script>
</head>

<script>let favoriteList = [];</script>
<c:forEach var="favoriteList" items="${favoriteList}">
	<script>
		favoriteList.push(${favoriteList.work_sn});
	</script>
</c:forEach>

<body>
	<%@ include file="../inc/headerPc.jsp" %>
	<%@ include file="../inc/headerMain.jsp" %>
	<section class="col-12 main_wrap">
		<a href="javascript:void(0)" class="main_write_btn" onclick="main.openWorkWritePopup(<%=memCategory%>)">
			<%if(memCategory == 3){ %>
			<span>구직하기</span>
			<%} else if(memCategory == 2){
				%>
				<span>구인하기</span>	
				<%
			} else {
				%>
				<span>글쓰기</span>
				<%
			} %>
		</a>
		<div class="col-12 col-center mw-1390 mt-md-70 mb30 banner_swiper_wrap swiper-container">
			<div class="col-12 banner_swiper_con swiper-wrapper">
				<c:forEach var="bannerList" items="${MainBannerList}">
					<div class="col-12 banner_swiper_list swiper-slide">
						<a href="${bannerList.link}" class="col-12 banner_swiper_list_inner">
							<div class="col-12 banner_swiper_list_bg_con">
								<img src="/file/display?fileSeq=${bannerList.imgFileSeq}"/>
							</div>
							<%-- <div class="col-12 banner_swiper_list_contents_con">
								<div class="col-12 banner_swiper_title_con">
									<span>${bannerList.title}</span>
								</div>			
							</div> --%>
						</a>
					</div>	
				</c:forEach>
			</div>
			<div class="col-0 banner_swiper_pagination_con"></div>
			<div class="col-0 banner_swiper_btn prev"></div>
			<div class="col-0 banner_swiper_btn next"></div>
		</div>
		<ul class="col-12 col-center mw-1390 mb90 pl20 pr20 main_event_pc_banner_list hidden show-md-block">
			<c:forEach var="bannerList" items="${EventBannerList}">
				<li>
					<%-- <div class="col-12 main_event_pc_banner_text_con">
						${bannerList.title}
					</div> --%>
					<div class="col-12 main_event_pc_banner_bg_con">
						<img src="/file/display?fileSeq=${bannerList.imgFileSeq}"/>
					</div>
				</li>
			</c:forEach>
		</ul>
		<div class="col-12 col-center mw-1390 pl20 pr20 work_pc_list_wrap hidden show-md-block">
			<div class="col-12 work_pc_list_title_con type_2">
				<div class="col-12 work_pc_list_title">구인/구직 내역</div>
				<div class="col-0 btn_style_0_con">
					<div class="btn_style_0 type_5" onclick="popupManager.add('#mainFilterPcPopup')"><span>상세검색</span></div>
				</div>
			</div>
		</div>
		<div class="col-12 hidden-md mb30 pl20 pr20 main_filter_wrap">
			<div class="col-12 mb15 main_filter_title_con">검색</div>
			<div class="col-12 mb40 main_filter_con">
				<div class="col-12 main_filter type_btn">
					<div class="col-0 label_box"><span>분류</span></div>
					<div class="col-0 input_box">
						<div class="col-12 radio_style_1_con">
							<div class="col-6 radio_style_1">
								<input type="checkbox" name="filterClass" value="0" id="filterClass0"/>
								<label for="filterClass0">구인</label>
							</div>
							<div class="col-6 radio_style_1">
								<input type="checkbox" name="filterClass" value="1" id="filterClass1"/>
								<label for="filterClass1">구직</label>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 main_filter">
					<input type="hidden" name="regionFilterList" id="regionFilterList" value="[]"/>
					<div class="col-0 label_box"><span>지역</span></div>
					<div class="col-0 input_box">
						<a href="javascript:void(0)" class="col-12 main_filter_popup_btn" onclick="mainFilter.openFilterPopup(0)"><span>지역을 선택해주세요.</span></a>
					</div>
					<ul class="col-12 main_filter_select_list" id="regionList"></ul>
				</div>
				<div class="col-12 main_filter">
					<input type="hidden" name="categoryFilterList" id="categoryFilterList" value="[]"/>
					<div class="col-0 label_box"><span>카테고리</span></div>
					<div class="col-0 input_box">
						<a href="javascript:void(0)" class="col-12 main_filter_popup_btn" onclick="mainFilter.openFilterPopup(1)"><span>카테고리를 선택해주세요.</span></a>
					</div>
					<ul class="col-12 main_filter_select_list" id="categoryList"></ul>
				</div>
				<div class="col-12 main_filter">
					<input type="hidden" name="dateFilterStartDate" id="dateFilterStartDate" value=""/>
					<input type="hidden" name="dateFilterEndDate" id="dateFilterEndDate" value=""/>
					<div class="col-0 label_box"><span>기간</span></div>
					<div class="col-0 input_box">
						<div class="col-12 radio_style_1_con">
							<div class="col-4 col-md-20 radio_style_1">
								<input type="checkbox" name="dateFileterSelect" id="dateFileterSelect0" value="week1"/>
								<label for="dateFileterSelect0">1주일</label>
							</div>
							<div class="col-4 col-md-20 radio_style_1">
								<input type="checkbox" name="dateFileterSelect" id="dateFileterSelect1" value="month3"/>
								<label for="dateFileterSelect1">3개월</label>
							</div>
							<div class="col-4 col-md-20 radio_style_1">
								<input type="checkbox" name="dateFileterSelect" id="dateFileterSelect2" value="month6"/>
								<label for="dateFileterSelect2">6개월</label>
							</div>
							<div class="col-4 col-md-20 mt20 mt-md-0 radio_style_1">
								<input type="checkbox" name="dateFileterSelect" id="dateFileterSelect3" value="year1"/>
								<label for="dateFileterSelect3">1년</label>
							</div>
							<div class="col-4 col-md-20 mt20 mt-md-0 radio_style_1">
								<input type="checkbox" name="dateFileterSelect" id="dateFileterSelect4" value="year3"/>
								<label for="dateFileterSelect4">3년</label>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 main_filter type_btn">
					<div class="col-0 label_box"><span>성별</span></div>
					<div class="col-0 input_box">
						<div class="col-12 radio_style_1_con">
							<div class="col-4 radio_style_1">
								<input type="checkbox" name="filterSex" value="0" id="filterSex0"/>
								<label for="filterSex0">남</label>
							</div>
							<div class="col-4 radio_style_1">
								<input type="checkbox" name="filterSex" value="1" id="filterSex1"/>
								<label for="filterSex1">여</label>
							</div>
							<div class="col-4 radio_style_1">
								<input type="checkbox" name="filterSex" value="2" id="filterSex2"/>
								<label for="filterSex2">무관</label>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 main_filter type_payment">
					<div class="col-0 label_box"><span>금액</span></div>
					<div class="col-0 input_box">
						<input type="number" name="filterStartPayment" id="filterStartPayment" class="input_style_0" pattern="\d*"/>
						<div class="col-0 mt10 ml10 mr10 addr_text">~</div>
						<input type="number" name="filterEndPayment" id="filterEndPayment" class="input_style_0" pattern="\d*"/>
					</div>
				</div>
			</div>
			<a href="javascript:void(0)" class="col-12 main_filter_complete_btn" onclick="mainFilter.submitSearchFilter()"><span>검색</span></a>
		</div>
		<ul class="col-12 col-center mw-1390 pl20 pr20 work_list_con" id="mainWorkList">
			<c:forEach var="workList" items="${workList}">
				<c:set var="regionList" value="${fn:split(workList.region,',')}"></c:set>
				<li onclick="main.openWorkViewPopup(${workList.sn}, ${workList.class_type})">
					<a href="javascript:void(0)" class="favorite_icon" onclick="main.updateFavorite(${workList.sn})" data-favorite-sn="${workList.sn}">즐겨찾기 버튼</a>
					<div class="col-12 work_list_inner">
						<div class="col-12 work_pc_reverse">
							<div class="col-12 work_list_title">${workList.title}</div>
							<ul class="col-12 work_region_list">
								<c:forEach var="regionList" items="${regionList}">
									<c:if test="${regionList ne '[]'}">
										<li><span>${regionList}</span></li>
									</c:if>
								</c:forEach>
							</ul>
						</div>
						<div class="col-12 work_list_contents">${workList.contents}</div>
					</div>	
				</li>	
			</c:forEach>
			<c:if test="${empty workList}">
				<li class="no_data">
					<span>게시물이 존재하지 않습니다.</span>
				</li>
			</c:if>
		</ul>
	</section>
	<%@ include file="../inc/footer.jsp" %>
	<%@ include file="../inc/footerPc.jsp" %>
	<%@ include file="popup.jsp" %>
</body>
</html>