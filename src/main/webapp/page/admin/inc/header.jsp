<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%

	//로그인 체크
	String loginCheck = (String) session.getAttribute("userId"); 
	if(loginCheck == null){
		%>
		<script>
			$(function(){
				alert('로그인을 진행해주시기 바랍니다.');
				window.location.href="/adm/login";
			})
		</script>
<%		
	return;	
	}
%>
<header class="col-12 header_wrap">
	<div class="col-12 origin_header_wrap">
		<div class="col-12 header_con">
			<a href="javascript:void(0)" class="hamburger_con" onclick="header.openClickHeader()">
				<span></span>
			</a>
			<ul class="util_con">
				<li>
					<a href="/adm/logout" class="logout_btn">
						로그아웃
					</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="col-12 click_header_wrap">
		<div class="col-12 header_con">
			<h1 class="col-0 logo_con">
				<a href="/adm/member/list">
					<img src="<c:url value='/common/img/logo.png'/>" alt="김병만 인력관리" style="width: 78px;"/>
				</a>
			</h1>
			<a href="javascript:void(0)" class="x_icon_con" onclick="header.closeClickHeader()">
			</a>
		</div>
		
		<ul class="col-12 gnb_wrap">
			<li>
				<a href="/adm/member/list" target="_self">
					<span>
						회원관리
					</span>
				</a>
			</li>
			<li>
				<a href="/adm/work/list" target="_self">
					<span>
						게시물관리
					</span>
				</a>
			</li>
			<li>
				<a href="/adm/banner/list" target="_self">
					<span>
						배너관리
					</span>
				</a>
			</li>
			<li>
				<a href="/adm/notice/list" target="_self">
					<span>
						공지사항
					</span>
				</a>
			</li>
			<li>
				<a href="/adm/deal/list" target="_self">
					<span>
						결제관리
					</span>
				</a>
			</li>
			<li>
				<a href="/adm/declaration/list" target="_self">
					<span>
						신고하기관리
					</span>
				</a>
			</li>
			<li>
				<a href="/adm/category/list" target="_self">
					<span>
						카테고리관리
					</span>
				</a>
			</li>
		</ul>
	</div>
	
</header>