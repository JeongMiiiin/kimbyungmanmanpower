<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="../"></c:set> 
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>카테고리관리 - 수정</title>
	<%@ include file="../../common/headInfo/css.jsp" %>
    <%@ include file="../headInfo/css.jsp" %>
    <%@ include file="../../common/headInfo/javascript.jsp" %>
    <%@ include file="../headInfo/javascript.jsp" %>
	<script type="text/javascript" src="<c:url value='/adm/js/category/update.js'/>"></script>
</head>
<body>

<%@ include file="../inc/header.jsp" %>
    <section class="col-12 admin_contents_wrap">
    	<div class="col-12 admin_contents_con">
    		<h1 class="col-12 page_title">
	    		<a href="/adm/category/list">카테고리관리 - 수정</a>
	    	</h1>
	    	<div class="col-12 admin_contents">
				<div class="col-12 admin_form_style_0_wrap">
					<form class="col-12 admin_form_style_0_con" action="/adm/category/updateAction" method="post" data-common-update-form>
						<input type="hidden" id="sn" name="sn" value="${updateData.sn}"/>
						<div class="col-12 admin_form_style_0">
							<div class="col-12 col-md-0 label_box">
								<label for="title">성명</label>
							</div>
							<div class="col-12 col-md-0 input_box">
								<div class="col-12 mw-200 admin_input_style_0_con">
									<input type="text" class="admin_input_style_0" name="title" id="title" value="${updateData.title}" data-common-update-essential-input="카테고리를 입력해주세요" placeholder="카테고리를 입력해주세요"/>
								</div>
							</div>
						</div>
						<div class="col-12 admin_form_style_0">
							<div class="col-12 col-md-0 label_box type_essential">
								<span>사용여부</span>
							</div>
							<div class="col-12 admin_radio_style_0_con">
								<div class="col-0 admin_radio_style_0">
									<input type="radio" id="status0" name="status" value="0" <c:if test="${updateData.status eq 0}">checked</c:if>/>
									<label for="status0">사용</label>
								</div>
								<div class="col-0 admin_radio_style_0">
									<input type="radio" id="status1" name="status" value="1" <c:if test="${updateData.status eq 1}">checked</c:if>/>
									<label for="status1">사용안함</label>
								</div>
							</div>
						</div>
					</form>
					<div class="col-12 mt30 admin_btn_style_0_con">
						<a href="/adm/category/list?${searchDto.qustr}" class="admin_btn_style_0 bg_grey mr10" data-common-update-cancel-btn>
							<span>취소</span>
						</a>
						<a href="javascript:void(0)" class="admin_btn_style_0 mr10" data-common-update-complete-btn>
							<span>수정</span>
						</a>
						<a href="/adm/category/delete?sn=${updateData.sn}" class="admin_btn_style_0 cancel_btn" data-common-update-delete-btn>
							<span>삭제</span>
						</a>
					</div>
				</div>
	    	</div>
    	</div>
    </section>
<%@ include file="../inc/footer.jsp" %>


</body>
</html>