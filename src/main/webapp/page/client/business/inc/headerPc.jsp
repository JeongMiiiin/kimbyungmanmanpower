<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<header class="col-12 header_pc_wrap">
	<div class="col-12 header_pc_con">
		<div class="col-12 col-md-0 left_box">
			<div class="col-0 logo_box">
				<a href="/business/main">
					<img src="<c:url value='/client/img/footer_pc_logo_img_000.png'/>"/>
				</a>
			</div>
			<ul class="col-0 menu_list">
				<li>
					<a href="/business/myInfo/page?tabIdx=0"><span>마이페이지</span></a>
				</li>
			</ul>
			
		</div>
		<div class="col-12 col-md-0 right_box">
			<% if(memCategory == -1){
				%>
					<a href="/business/login" class="header_pc_lock_icon">로그인 버튼</a>
				<% 
			} else {
				%>
				<a href="/business/logout" class="header_pc_lock_icon">로그아웃 버튼</a>
				<%
			}
			%>
		</div>
	</div>
</header>