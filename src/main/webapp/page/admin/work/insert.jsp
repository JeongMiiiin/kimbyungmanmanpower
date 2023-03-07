<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>배너관리 - 등록</title>
	<%@ include file="../../common/headInfo/css.jsp" %>
    <%@ include file="../headInfo/css.jsp" %>
    <%@ include file="../../common/headInfo/javascript.jsp" %>
    <%@ include file="../headInfo/javascript.jsp" %>
	<script type="text/javascript" src="<c:url value='/adm/js/banner/update.js'/>"></script>
</head>
<body>


<%@ include file="../inc/header.jsp" %>
    <section class="col-12 admin_contents_wrap">
    	<div class="col-12 admin_contents_con">
    		<h1 class="col-12 page_title">
	    		<a href="/adm/banner/list">배너관리</a>
	    	</h1>
	    	<div class="col-12 admin_contents">
				<form class="col-12 admin_form_style_0_wrap" action="/adm/banner/insertAction" method="post" enctype="multipart/form-data" data-common-update-form>
					<input type="hidden" name="deleteFileSeqList" id="deleteFileSeqList">
					<div class="col-12 admin_form_style_0_con">
						<div class="col-12 admin_form_style_0">
							<div class="col-12 col-md-0 label_box type_essential">
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
								<span>
									분류
								</span>
							</div>
							<div class="col-12 col-md-0 input_box">
								<div class="col-12 mw-200 admin_select_style_0_wrap">
									<select name="category" id="category" class="admin_select_style_0" data-common-update-essential-input="분류를 선택해주세요">
										<option value="">선택</option>
										<option value="0">메인</option>
										<option value="1">이벤트</option>
										<option value="2">소개</option>
									</select>
								</div>
							</div>
						</div>
						<div class="col-12 admin_form_style_0">
							<div class="col-12 col-md-0 label_box">
								<label for="link">
									링크
								</label>
							</div>
							<div class="col-12 col-md-0 input_box">
								<div class="col-12 mw-200">
									<input type="text" class="admin_input_style_0" name="link" id="link" data-common-update-essential-input="링크를 입력해주세요"/>
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
										<input type="file" name="imageFile" id="imageFile" data-common-update-essential-input="이미지를 첨부해주세요" data-common-file-input data-file-seq="" accept=".gif, .jpg, .png"/>
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
							<a href="/adm/banner/list?${searchDto.qustr}" class="admin_btn_style_0 bg_grey mr10" data-common-update-cancel-btn>
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