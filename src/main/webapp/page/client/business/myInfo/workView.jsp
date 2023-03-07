<%@page import="com.kimbyungman.spring.manpower.dto.MemberDto"%>

<%
	String pageTitle = "구인내역 상세";
	int memCategory = session.getAttribute("memberInfo") != null ? ((MemberDto) session.getAttribute("memberInfo")).getCategory() : -1;
	
	String pageCategory = request.getParameter("pageCategory");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>김병만인력관리 - 마이페이지 <%=pageTitle %></title>
	<%@ include file="../../../common/headInfo/css.jsp" %>
    <%@ include file="../../headInfo/css.jsp" %>
    <%@ include file="../../../common/headInfo/javascript.jsp" %>
    <%@ include file="../../headInfo/javascript.jsp" %>
    <script type="text/javascript" src="<c:url value='/client/js/personal/workView.js'/>"></script>
    <script>let footerIdx = 3;</script>
</head>
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
					window.location.replace("/business/login");
				})
			</script>
	<%		
		return;	
		}
	%>
    <section class="col-12 pt27 sub_wrap">
    	<div class="col-12 col-center mw-1390 mt-md-67 pl-md-20 pr-md-20 my_info_pc_wrap">
    		<div class="col-12 col-md-3 hidden show-md-block my_info_pc_tab_list_con">
    			<div class="col-12 mb17 my_info_pc_tab_list_title">마이페이지</div>
    			<ul class="col-12 my_info_pc_tab_list">
    				<li class="active">
		    			<a href="javascript:void(0)">
		    				<span>구인내역</span>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="/business/myInfo/page?tabIdx=1">
		    				<span>정보수정</span>
		    			</a>
		    		</li>
    			</ul>
    		</div>
    		<div class="col-12 mt-md-47 col-md-9 my_info_work_view_wrap">
	    		<div class="col-12 mb12 pl20 pr20 my_info_work_view_headline">상세 내용</div>
	    		<input type="hidden" name="workSn" id="workSn" value="${viewData.sn}"/>
	    		<ul class="col-12 pl20 pr20 my_info_work_view_list_con">
	    			<li>
	    				<div class="col-0 label_box">제목</div>
	    				<div class="col-0 input_box">${viewData.title}</div>
	    			</li>
	    			<li>
	    				<div class="col-0 label_box">성별</div>
	    				<div class="col-0 input_box">
	    					<c:choose>
	    						<c:when test="${viewData.sex eq 0}">남</c:when>
	    						<c:when test="${viewData.sex eq 1}">여</c:when>
	    						<c:otherwise>무관</c:otherwise>
	    					</c:choose>
	    				</div>
	    			</li>
	    			<li>
	    				<div class="col-0 label_box">지역</div>
	    				<div class="col-0 input_box">${viewData.region}</div>
	    			</li>
	    			<li>
	    				<div class="col-0 label_box">카테고리</div>
	    				<div class="col-0 input_box">${viewData.category}</div>
	    			</li>
	    			<li>
	    				<div class="col-0 label_box">내용</div>
	    				<div class="col-0 input_box">${viewData.contents}</div>
	    			</li>
	    			<li class="type_date">
						<div class="col-0 label_box">기간</div>
						<div class="col-0 input_box">
							<span>${fn:substring(viewData.startDateStr,2,10)} <br class="hidden-md"/><c:set var="startHour" value="${fn:substring(viewData.startTime,0,2)}"/><c:if test="${startHour > 11 }">PM</c:if><c:if test="${startHour < 12 }">AM</c:if> ${viewData.startTime}</span>
							<span>~</span>
							<span>${fn:substring(viewData.endDateStr,2,10)} <br class="hidden-md"/><c:set var="endHour" value="${fn:substring(viewData.endTime,0,2)}"/><c:if test="${endHour > 11 }">PM</c:if><c:if test="${endHour < 12 }">AM</c:if> ${viewData.endTime}</span>
						</div>
					</li>
					<li>
	    				<div class="col-0 label_box">인원</div>
	    				<div class="col-0 input_box">
	    					<c:choose>
	    						<c:when test="${viewData.numbers eq 0}">1 ~ 50명</c:when>
	    						<c:when test="${viewData.numbers eq 1}">51 ~ 100명</c:when>
	    						<c:when test="${viewData.numbers eq 2}">101 ~ 150명</c:when>
	    						<c:otherwise>
	    							150명 이상
	    						</c:otherwise>
	    					</c:choose>
	    				</div>
	    			</li>
					<li>
						<div class="col-0 label_box">금액</div>
						<div class="col-0 input_box">
							<c:choose>
								<c:when test="${viewData.payment ne -1}">
									<fmt:formatNumber value="${viewData.payment}" pattern="#,###" />원
								</c:when>
								<c:otherwise>
									협의
								</c:otherwise>
							</c:choose>
						</div>
					</li>
	    		</ul>
	    		<div class="col-12 mt20 mt-md-30 btn_style_0_con">
			    	<a href="/business/myInfo/workUpdate?sn=${viewData.sn}&pageCategory=<%=pageCategory%>" class="col-0 btn_style_0 type_2">
			    		<span>수정</span>
			    	</a>
			    	<a href="/business/myInfo/page?tabIdx=0" class="col-6 btn_style_0 type_2 type_grey">
			    		<span>목록</span>
			    	</a>
			    </div>
		    </div>
    	</div>    	
    </section>
<%@ include file="../inc/footer.jsp" %>
<%@ include file="../inc/footerPc.jsp" %>
</body>
</html>