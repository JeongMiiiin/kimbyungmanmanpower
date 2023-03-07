<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<header class="col-12 header_pc_wrap">
	<div class="col-12 header_pc_con">
		<div class="col-12 col-md-0 left_box">
			<div class="col-0 logo_box">
				<a href="/personal/main">
					<img src="<c:url value='/client/img/footer_pc_logo_img_000.png'/>"/>
				</a>
			</div>
			<ul class="col-0 menu_list">
				<li>
					<a href="/favorite/list"><span>즐겨찾기</span></a>
				</li>
				<li>
					<a href="/personal/serviceCenter/page?tabIdx=1"><span>공지사항</span></a>
				</li>
				<li>
					<a href="/personal/myInfo/page?tabIdx=0"><span>마이페이지</span></a>
				</li>
			</ul>
			
		</div>
		<div class="col-12 col-md-0 right_box">
			<% if(memCategory == -1){
				%>
					<a href="/personal/login" class="header_pc_lock_icon">로그인 버튼</a>
				<% 
			} else {
				%>
				<a href="/personal/logout" class="header_pc_lock_icon">로그아웃 버튼</a>
				<%
			}
			%>
			<div class="col-0 header_pc_list">
				<a href="/personal/serviceCenter/page?tabIdx=2"><span>앱가이드</span></a>
				<ul>
					<li class="active"><a href="/personal/serviceCenter/page?tabIdx=2"><span>앱가이드</span></a></li>
					<li><a href="/personal/serviceCenter/page?tabIdx=3"><span>회사소개</span></a></li>
					<li><a href="/personal/serviceCenter/page?tabIdx=4"><span>약관 및 정책</span></a></li>
					<li><a href="/personal/serviceCenter/page?tabIdx=5"><span>도움말</span></a></li>
				</ul>
			</div>
		</div>
	</div>
</header>