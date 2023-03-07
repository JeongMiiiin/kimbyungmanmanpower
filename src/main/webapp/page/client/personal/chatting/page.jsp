<%@page import="com.kimbyungman.spring.manpower.dto.MemberDto"%>
<%
	String pageTitle = "채팅";
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
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script type="text/javascript" src="<c:url value='/client/js/personal/chatting.js'/>"></script>
</head>

<body>
    <%@ include file="../inc/headerChat.jsp" %>
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
    <section class="col-12 mt62 pt20 sub_wrap type_3">
    	<input type="hidden" name="chatSn" id="chatSn" value="${viewData.sn}"/>
    	<input type="hidden" name="userSn" id="userSn" value="${memberInfo.getSn()}"/>
    	<input type="hidden" name="userName" id="userName" value="${memberInfo.getName()}"/>
    	<input type="hidden" name="sessionId" id="sessionId" value=""/>
    	<div class="col-12 chatting_wrap">
    	<ul class="col-12 pl20 pr20 chatting_contents_con">
    		<c:set var="compareDate" value=""/>
    		<c:forEach var="list" items="${historyList}">
    			<c:if test="${list ne ''}">
    				<c:set var="userDateFilter" value="${fn:split(list,'time,')[0]}"/>
	    			<c:set var="test" value="${fn:split(list,'time,')[1]}"/>
	    			<c:set var="userDate" value="${fn:split(userDateFilter,' ')[0]}"/>
	    			<c:set var="userDay" value="${fn:split(userDateFilter,' ')[1]}"/>
	    			<c:set var="userHours" value="${fn:split(fn:split(userDateFilter,' ')[2],':')[0]}"/>
	    			<c:set var="userMinutes" value="${fn:split(fn:split(userDateFilter,' ')[2],':')[1]}"/>
	    			<c:set var="userFilter" value="${fn:split(list,'time,')[1]}"/>
	    			<c:set var="userSn" value="${fn:split(userFilter,' ')[0]}"/>
	    			<c:set var="userName" value="${fn:split(fn:split(userFilter,' ')[1],')')[0]}"/>
	    			<c:set var="userContents" value="${fn:split(userFilter,')')[1]}"/>
	    			<c:if test="${compareDate ne userDate}">
	    				<c:set var="compareDate" value="${userDate}"/>
	    				<li class="tc type_date">
	    					<span>
	    					${fn:split(userDate,'-')[0]}년 ${fn:split(userDate,'-')[1]}월 ${fn:split(userDate,'-')[2]}일&nbsp;
	    					<c:choose>
	    						<c:when test="${userDay eq 0}">일요일</c:when>
	    						<c:when test="${userDay eq 1}">월요일</c:when>
	    						<c:when test="${userDay eq 2}">화요일</c:when>
	    						<c:when test="${userDay eq 3}">수요일</c:when>
	    						<c:when test="${userDay eq 4}">목요일</c:when>
	    						<c:when test="${userDay eq 5}">금요일</c:when>
	    						<c:otherwise>토요일</c:otherwise>
	    					</c:choose>
	    					</span>
	    				</li>
	    			</c:if>
	    			<li <c:if test="${userSn eq memberInfo.getSn()}">class="my_msg"</c:if>>
	    				<c:if test="${userSn ne memberInfo.getSn()}">
	    					<div class="col-12 user_name">${userName}</div>		
	    				</c:if>
	    				<div class="col-12 chatting_contents">
	    					<span>${userContents}</span>
	    					<span class="time">
	    					<c:choose>
	    						<c:when test="${userHours > 12}">
		    						오후 <c:set var="resultHours" value="${userHours - 12}"/>${resultHours}:${userMinutes}
								</c:when>
	    						<c:when test="${userHours eq 12 }">12:${userMinutes}</c:when>
	    						<c:otherwise>
	    							오전 ${userHours}:${userMinutes}
	    						</c:otherwise>
	    					</c:choose>
	    					</span>
	    				</div>
	    			</li>
    			</c:if>
    		</c:forEach>
    		<input type="hidden" name="recentDate" id="recentDate" value="${compareDate}"/>
    	</ul>
    	<div class="col-12 chatting_input_con">
    		<input type="text" id="chattingInput" name="chattingInput" placeholder="메세지를 입력해 주세요"/>
    		<a href="javascript:void(0)" id="chattingSendBtn"><span>전송</span></a>
    	</div>
    	</div>
    </section>
</body>
</html>
