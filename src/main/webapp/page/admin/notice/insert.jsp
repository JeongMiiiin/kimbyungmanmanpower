<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>공지사항 - 등록</title>
	<%@ include file="../../common/headInfo/css.jsp" %>
    <%@ include file="../headInfo/css.jsp" %>
    <%@ include file="../../common/headInfo/javascript.jsp" %>
    <%@ include file="../headInfo/javascript.jsp" %>
	<script type="text/javascript" src="<c:url value='/adm/js/notice/update.js'/>"></script>
</head>
<body>


<%@ include file="../inc/header.jsp" %>
    <section class="col-12 admin_contents_wrap">
    	<div class="col-12 admin_contents_con">
    		<h1 class="col-12 page_title">
	    		<a href="/adm/notice/list">공지사항</a>
	    	</h1>
	    	<div class="col-12 admin_contents">
				<form class="col-12 admin_form_style_0_wrap" action="/adm/notice/insertAction" method="post" data-common-update-form>
					<input type="hidden" name="checkDuplicateId" value="0">
					<div class="col-12 admin_form_style_0_con">
						<div class="col-12 admin_form_style_0">
							<div class="col-12 col-md-0 label_box">
								<label for="title">
									제목
								</label>
							</div>
							<div class="col-12 col-md-0 input_box">
								<div class="col-12 mw-200">
									<input type="text" class="admin_input_style_0" name="title" id="title" data-common-update-essential-input="제목을 입력해주세요"/>
								</div>
							</div>
						</div>
						<div class="col-12 admin_form_style_0">
							<div class="col-12 col-md-0 label_box">
								<span>공지여부</span>
							</div>
							<div class="col-12 col-md-0 input_box">
								<div class="col-12 admin_radio_style_0_con">
									<div class="col-0 mr20 admin_radio_style_0">
										<input type="radio" id="isNoticeY" name="isNotice" value="0" checked/>
										<label for="isNoticeY">예</label>
									</div>
									<div class="col-0 admin_radio_style_0">
										<input type="radio" id="isNoticeN" name="isNotice" value="1"/>
										<label for="isNoticeN">아니오</label>
									</div>
								</div>
							</div>
						</div>
						<div class="col-12 admin_form_style_0">
							<div class="col-12 col-md-0 label_box">
								<label for="contents">
									상세내용
								</label>
							</div>
							<div class="col-12 col-md-0 input_box">
								<div class="col-12 mw-600">
									<textarea class="admin_textarea_style_0" name="contents" id="contents" data-common-update-essential-input="상세내용을 입력해주세요" placeholder="상세내용을 입력해주세요"></textarea>
								</div>
							</div>
						</div>
						<div class="col-12 admin_form_style_0">
							<div class="col-12 col-md-0 label_box">
								<label for="imageFile">
									이미지
								</label>
							</div>
							<div class="col-12 col-md-0 input_box">
								<div class="col-12 admin_file_input_style_0_wrap">
									<div class="col-12 mw-200 mr20">
										<input type="file" name="imageFile" id="imageFile" data-common-file-input data-file-seq="" accept=".gif, .jpg, .png"/>
										<input type="text" class="admin_input_style_0" name="imageFileText" id="imageFileText" data-file-text-input data-target-file="imageFile" readonly/>
									</div>
									<div>
										<a href="javascript:void(0)" class="admin_btn_style_1 mr10" data-file-insert-btn data-target-file="imageFile">파일등록</a>
										<a href="javascript:void(0)" class="admin_btn_style_1" data-file-delete-btn data-target-file="imageFile">파일삭제</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 mt30 admin_btn_style_0_con">
							<a href="/adm/notice/list?${searchDto.qustr}" class="admin_btn_style_0 bg_grey mr10" data-common-update-cancel-btn>
								<span>취소</span>
							</a>
							<a href="javascript:void(0)" class="admin_btn_style_0" data-common-insert-complete-btn>
								<span>등록</span>
							</a>
						</div>
				</form>
	    	</div>
    	</div>
    </section>
<%@ include file="../inc/footer.jsp" %>


</body>
</html>