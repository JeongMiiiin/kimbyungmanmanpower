<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>게시물관리 - 상세</title>
	<%@ include file="../../common/headInfo/css.jsp" %>
    <%@ include file="../headInfo/css.jsp" %>
    <%@ include file="../../common/headInfo/javascript.jsp" %>
    <%@ include file="../headInfo/javascript.jsp" %>
</head>
<body>


<%@ include file="../inc/header.jsp" %>
    <section class="col-12 admin_contents_wrap">
    	<div class="col-12 admin_contents_con">
    		<h1 class="col-12 page_title">
	    		<a href="/adm/work/list">게시물관리</a>
	    	</h1>
	    	<div class="col-12 admin_contents">
				<div class="col-12 admin_form_style_0_wrap">
					<div class="col-12 admin_form_style_0_con type_view">
						<div class="col-12 admin_form_style_0">
							<div class="col-12 col-md-0 label_box">
								<span>제목</span>
							</div>
							<div class="col-12 col-md-0 input_box">
								<span>${viewData.title}</span>
							</div>
						</div>
						<div class="col-12 admin_form_style_0">
							<div class="col-12 col-md-0 label_box">
								<span>회원구분</span>
							</div>
							<div class="col-12 col-md-0 input_box">
								<span>
									<c:choose>
							        	<c:when test="${viewData.memCategory eq 0}">개인</c:when>
							        	<c:otherwise>
							        		기업/단체
							        	</c:otherwise>
							        </c:choose>
								</span>
							</div>
						</div>
						<div class="col-12 admin_form_style_0">
							<div class="col-12 col-md-0 label_box">
								<span>분류</span>
							</div>
							<div class="col-12 col-md-0 input_box">
								<span>
									<c:choose>
							        	<c:when test="${viewData.classType eq 0}">구인</c:when>
							        	<c:otherwise>
							        		구직
							        	</c:otherwise>
							    	</c:choose>
								</span>
							</div>
						</div>
						<div class="col-12 admin_form_style_0">
							<div class="col-12 col-md-0 label_box">
								<span>카테고리</span>
							</div>
							<div class="col-12 col-md-0 input_box">
								<span>
									${viewData.category}
								</span>
							</div>
						</div>
						<div class="col-12 admin_form_style_0">
							<div class="col-12 col-md-0 label_box">
								<span>지역</span>
							</div>
							<div class="col-12 col-md-0 input_box">
								<span>
									${viewData.region}
								</span>
							</div>
						</div>
						<div class="col-12 admin_form_style_0">
							<div class="col-12 col-md-0 label_box">
								<span>인원</span>
							</div>
							<div class="col-12 col-md-0 input_box">
								<span>
									<c:choose>
										<c:when test="${viewData.memCategory eq 0}">1명</c:when>
							        	<c:otherwise>
							        		<c:choose>
							        			<c:when test="${viewData.numbers eq 0}">1 ~ 50명</c:when>
								        		<c:when test="${viewData.numbers eq 1}">51 ~ 100명</c:when>
								        		<c:when test="${viewData.numbers eq 2}">101 ~ 150명</c:when>
									        	<c:otherwise>
									        		150명 이상
									        	</c:otherwise>
							        		</c:choose>
							        	</c:otherwise>
							    	</c:choose>
								</span>
							</div>
						</div>
						<div class="col-12 admin_form_style_0">
							<div class="col-12 col-md-0 label_box">
								<span>기간</span>
							</div>
							<div class="col-12 col-md-0 input_box">
								<span>
									<c:choose>
										<c:when test="${viewData.startDateStr eq '0000-00-00'}">
											협의
										</c:when>
										<c:otherwise>
											${viewData.startDateStr} ${viewData.startTime} ~ ${viewData.endDateStr} ${viewData.endTime}
										</c:otherwise>
									</c:choose>
								</span>
							</div>
						</div>
						<div class="col-12 admin_form_style_0">
							<div class="col-12 col-md-0 label_box">
								<span>금액</span>
							</div>
							<div class="col-12 col-md-0 input_box">
								<span>
									<c:choose>
										<c:when test="${viewData.payment ne -1}">
											<fmt:formatNumber value="${viewData.payment}" pattern="#,###" />원
										</c:when>
										<c:otherwise>
											협의
										</c:otherwise>
									</c:choose>
								</span>
							</div>
						</div>
						<div class="col-12 admin_form_style_0">
							<div class="col-12 col-md-0 label_box">
								<span>상세내용</span>
							</div>
							<div class="col-12 col-md-0 input_box">
								<span>
									${viewData.contents}
								</span>
							</div>
						</div>
						<c:if test="${viewData.memCategory eq 1}">
							<div class="col-12 admin_form_style_0">
								<div class="col-12 col-md-0 label_box">
									<span>담당자</span>
								</div>
								<div class="col-12 col-md-0 input_box">
									<span>
										${viewData.memName}
									</span>
								</div>
							</div>
							<div class="col-12 admin_form_style_0">
								<div class="col-12 col-md-0 label_box">
									<span>담당자 전화번호</span>
								</div>
								<div class="col-12 col-md-0 input_box">
									<span>
										${viewData.memPhoneNum}
									</span>
								</div>
							</div>
						</c:if>
					</div>
					<div class="col-12 mt30 admin_btn_style_0_con">
						<a href="/adm/work/list" class="admin_btn_style_0 mr10 bg_grey">
							<span>목록</span>
						</a>
						<a href="/adm/work/delete?sn=${viewData.sn}&${searchDto.qustr}" class="admin_btn_style_0 cancel_btn" data-common-view-delete-btn>
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