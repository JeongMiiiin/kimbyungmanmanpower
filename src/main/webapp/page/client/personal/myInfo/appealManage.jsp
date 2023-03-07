<%@page import="com.kimbyungman.spring.manpower.dto.MemberDto"%>
<%
	String pageTitle = "마이페이지";
	int memCategory = session.getAttribute("memberInfo") != null ? ((MemberDto) session.getAttribute("memberInfo")).getCategory() : -1;
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>김병만인력관리 - 마이페이지 최근 게시물</title>
	<%@ include file="../../../common/headInfo/css.jsp" %>
    <%@ include file="../../headInfo/css.jsp" %>
    <%@ include file="../../../common/headInfo/javascript.jsp" %>
    <%@ include file="../../headInfo/javascript.jsp" %>
    <script type="text/javascript" src="<c:url value='/client/js/personal/appealManage.js'/>"></script>
    <script>let footerIdx = 3;</script>
</head>
<body>
	<%@ include file="../inc/headerPc.jsp" %>
    <%@ include file="../inc/headerIntro.jsp" %>
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
    <section class="col-12 sub_wrap type_2">
    	<div class="col-12 hidden-md">
    		<ul class="col-12 mb27 my_info_tab_list_con">
	    		<li>
	    			<a href="/personal/myInfo/page?tabIdx=0">
	    				<span>구인내역</span>
	    			</a>
	    		</li>
	    		<li>
	    			<a href="/personal/myInfo/page?tabIdx=1">
	    				<span>결제내역</span>
	    			</a>
	    		</li>
	    		<li>
	    			<a href="/personal/myInfo/page?tabIdx=2">
	    				<span>정보수정</span>
	    			</a>
	    		</li>
	    		<li>
	    			<a href="/personal/myInfo/page?tabIdx=3">
	    				<span>채팅내역</span>
	    			</a>
	    		</li>
	    		<li class="active">
	    			<a href="javascript:void(0)">
	    				<span>어필정보관리</span>
	    			</a>
	    		</li>
	    	</ul>
    	</div>
    	<div class="col-12 col-center mw-1390 mt67 pl20 pr20 hidden show-md-block my_info_pc_wrap">
    		<div class="col-12 col-md-3 mt12 my_info_pc_tab_list_con">
    			<div class="col-12 mb17 my_info_pc_tab_list_title">마이페이지</div>
    			<ul class="col-12 my_info_pc_tab_list">
		    		<li><a href="/personal/myInfo/page?tabIdx=0"><span>구직내역</span></a></li>
			    	<li><a href="/personal/myInfo/page?tabIdx=1"><span>지원내역</span></a></li>
    				<li><a href="/personal/myInfo/page?tabIdx=2"><span>정보수정</span></a></li>
    				<li><a href="/personal/myInfo/page?tabIdx=3"><span>채팅내역</span></a></li>
	    			<li class="active"><a href="javascript:void(0)"><span>어필정보관리</span></a></li>
    			</ul>
    		</div>
    		<div class="col-12 col-md-9">
    			<div class="col-12 mb20 btn_style_0_con">
		    		<div class="col-0 pl30 pr30 fr btn_style_0 type_blue type_plus" onclick="appealManage.openPopup()" style="padding-top: 9px; padding-bottom: 9px;"><span>등록</span></div>
		    	</div>
    			<div class="col-12 work_pc_list_wrap">
    				<div class="col-12 work_pc_list_title_con">
    					<div class="col-12 work_pc_list_title">어필정보</div>
    				</div>
    				<ul class="col-12 appeal_pc_list_con">
    					<c:forEach var="appealList" items="${resultList}">
			    			<li data-appeal-sn="${appealList.sn}">
			    				<div class="col-12 text_box">
			    					<div class="col-12 appeal_list_title">${appealList.title}</div>
					    			<div class="col-12 appeal_list_date">등록일 : ${appealList.createDateStr}</div>
					    			<div class="col-12 appeal_list_contents">${appealList.contents}</div>
			    				</div>
			    				<div class="col-12 btn_box">
			    					<div class="col-12 btn_style_0_con">
										<div class="col-0 btn_style_0 type_grey type_3" onclick="appealManage.openPopup($(this).closest('li'))" style="padding: 5px 40px; background-color: #A5B4C1; border-color: #A5B4C1;">
											<span style="color: #fff;">수정</span>
										</div>
										<div class="col-0 btn_style_0 type_3" onclick="appealManage.deleteData(${appealList.sn})" style="padding: 5px 40px;">
											<span style="color: #8B94A1;">삭제</span>
										</div>
									</div>
			    				</div>
				    		</li>
			    		</c:forEach>
			    		<c:if test="${empty resultList}">
			    			<li class="no_data"><span>어필정보가 존재하지 않습니다.</span></li>
			    		</c:if>
    				</ul>
    			</div>
    		</div>
    	</div>
    	
    	<div class="col-12 hidden-md mb20 pl20 pr20 btn_style_0_con">
    		<div class="col-12 btn_style_0 type_blue type_plus" onclick="appealManage.openPopup()"><span>등록</span></div>
    	</div>
    	<ul class="col-12 hidden-md pl20 pr20 appeal_list_con">
    		<c:forEach var="appealList" items="${resultList}">
    			<li data-appeal-sn="${appealList.sn}">
	    			<div class="col-12 appeal_list_date">등록일 : ${appealList.createDateStr}</div>
	    			<div class="col-12 appeal_list_title">${appealList.title}</div>
	    			<div class="col-12 appeal_list_contents">${appealList.contents}</div>
	    			<div class="col-12 btn_style_0_con">
						<div class="col-0 btn_style_0 type_3" onclick="appealManage.openPopup($(this).closest('li'))">
							<span>수정</span>
						</div>
						<div class="col-0 btn_style_0 type_3" onclick="appealManage.deleteData(${appealList.sn})">
							<span>삭제</span>
						</div>
					</div>
	    		</li>
    		</c:forEach>
    		<c:if test="${empty resultList}">
    			<li class="no_data"><span>어필정보가 존재하지 않습니다.</span></li>
    		</c:if>
    	</ul>
    </section>
    <%@ include file="../inc/footerPc.jsp" %>
	<%@ include file="../inc/footer.jsp" %>
<!-- 게시글 작성 팝업 -->
<div class="col-12 popup_style_3_wrap" id="appealManageUpdatePopup">
	<div class="col-12 popup_con" style="max-width: 480px;">
		<div class="col-12 popup_inner">
			<div class="col-12 popup_title_con">
				<div class="col-12 tc popup_title">어필정보</div>
			</div>
			<div class="col-12 pt17 pl20 pr20 popup_contents_con">
				<form class="col-12 mb50 popup_work_write_con">
					<div class="col-12 popup_work_write">
						<div class="col-12 label_box">제목</div>
						<div class="col-12 input_box">
							<input type="text" name="title" id="title" class="input_style_0" placeholder="제목을 입력해주세요"/>
						</div>
					</div>
					<div class="col-12 popup_work_write">
						<div class="col-12 label_box">내용</div>
						<div class="col-12 input_box">
							<textarea class="textarea_style_0" placeholder="내용을 입력해주세요" name="contents" id="contents" placeholder="내용을 입력해주세요"></textarea>
						</div>
					</div>
				</form>
			</div>
			<div class="col-12 btn_style_0_con popup_2_btn">
				<div class="col-6 btn_style_0 type_lightgrey" onclick="popupManager.removePopLatest(true)"><span>취소</span></div>
				<div class="col-6 btn_style_0 type_blue" onclick="appealManage.submitPopup()"><span>등록</span></div>
			</div>
		</div>
	</div>
</div>
</body>
</html>

