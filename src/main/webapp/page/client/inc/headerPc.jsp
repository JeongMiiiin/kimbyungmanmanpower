<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<header class="col-12 header_pc_wrap">
	<div class="col-12 header_pc_con">
		<div class="col-12 col-md-0 left_box">
			<% if(headerPcIdx != 2){
				%>
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
					<a href="/myInfo/page?tabIdx=0"><span>마이페이지</span></a>
				</li>
			</ul>
			<%
			} else {
				%>
				<div class="col-0 logo_box">
					<a href="/business/main">
						<img src="<c:url value='/client/img/footer_pc_logo_img_000.png'/>"/>
					</a>
				</div>
				<ul class="col-0 menu_list">
					<li>
						<a href="/myInfo/page?tabIdx=0"><span>마이페이지</span></a>
					</li>
				</ul>
			<%	
			}
			%>
			
		</div>
		<div class="col-12 col-md-0 right_box">
			<a href="javascript:void(0)" class="header_pc_lock_icon"></a>
			<div class="col-0 header_pc_list">
				<div>도움말</div>
				<ul>
					<li><a href=""><span>회사소개</span></a></li>
					<li><a href=""><span>약관 및 정책</span></a></li>
					<li><a href=""><span>도움말</span></a></li>
				</ul>
			</div>
		</div>
	</div>
</header>