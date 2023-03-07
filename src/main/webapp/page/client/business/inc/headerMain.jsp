<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<header class="col-12 main_header_wrap">
	<a href="javascript:void(0)" class="header_main_logo_con" onclick="main.resetMain()">
		<img src="<c:url value='/client/img/main_header_logo_icon.png'/>"/>
	</a>
	<ul class="info_list_con">
		<%if(memCategory == -1){
			%>
			<li>
				<a href="/business/signUp?stepIdx=1">
					<img src="<c:url value='/client/img/main_header_signup_icon.png'/>"/><br/>
					<span>회원가입</span>
				</a>
			</li>
			<li>
				<a href="/business/login">
					<img src="<c:url value='/client/img/main_header_lock_icon.png'/>"/><br/>
					<span>로그인</span>
				</a>
			</li>
			<%
		} else {
			%>
			<li></li>
			<li>
				<a href="/business/logout">
					<img src="<c:url value='/client/img/main_header_lock_icon.png'/>"/><br/>
					<span>로그아웃</span>
				</a>
			</li>	
			<%
		}%>
		
	</ul>
</header>