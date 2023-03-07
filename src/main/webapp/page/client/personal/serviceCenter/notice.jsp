<%@page import="com.kimbyungman.spring.manpower.dto.MemberDto"%>
<%
	String pageTitle = "공지사항";
	int memCategory = session.getAttribute("memberInfo") != null ? ((MemberDto) session.getAttribute("memberInfo")).getCategory() : -1;
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>김병만인력관리 - 고객센터 공지사항</title>
	<%@ include file="../../../common/headInfo/css.jsp" %>
    <%@ include file="../../headInfo/css.jsp" %>
    <%@ include file="../../../common/headInfo/javascript.jsp" %>
    <%@ include file="../../headInfo/javascript.jsp" %>
    <script type="text/javascript" src="<c:url value='/client/js/personal/notice.js'/>"></script>
    <script>
    	let footerIdx = 2;
    	let headerPcIdx = 1;
    	let pagingActiveIndex = "${searchDto.pageIndex}";
    </script>
</head>
<body>
	<%@ include file="../inc/headerPc.jsp" %>
    <%@ include file="../inc/header.jsp" %>
    <section class="col-12 sub_wrap">
    	<form method="get" id="filterForm" action="/personal/serviceCenter/page" class="col-12" data-common-filter-form style="display: none;">
    		<input type="hidden" id="tabIdx" name="tabIdx" value="1"/>
			<input type="hidden" id="pageIndex" name="pageIndex" value="${searchDto.pageIndex}" />
		</form>
    	<div class="col-12 tc mt67 mb87 hidden show-md login_text">공지사항</div>
		<div class="col-12 hidden-md pt10 notice_list_con">
			<c:forEach var="noticeList" items="${noticeList}">
				<div class="col-12 notice_list">
					<div class="col-12 notice_list_title_con">
						<div class="col-12 notice_list_title">
							[공지]${noticeList.title}
						</div>
						<div class="col-12 notice_list_date">
							${noticeList.createDateStr}
						</div>
					</div>
					<div class="col-12 notice_list_contents_con">
						<div class="col-12 notice_list_contents">
							${noticeList.contents}
						</div>
						<div class="col-12 notice_list_img">
							<img src="/file/display?fileSeq=${noticeList.imgFileSeq}" class="mt20"/>
						</div>
					</div>
				</div>
			</c:forEach>
			<c:if test="${empty noticeList}">
				<div class="col-12 notice_list no_data">
					<span>등록된 공지사항이 없습니다</span>
				</div>
			</c:if>
		</div>
		<div class="col-12 col-center mw-1300 pl20 pr20 hidden show-md-block">
			<div class="col-12 table_style_0_con">
				<table class="col-12 table_style_0">
					<colgroup>
						<col width="80px"/>
						<col width="auto"/>
						<col width="130px"/>
					</colgroup>
					<thead>
						<tr>
							<th>NO</th>
							<th>제목</th>
							<th>등록일자</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="list" items="${noticeList}" varStatus="status">
						<tr>
							<td style="vertical-align: top;">${fn:length(noticeList) - status.index}</td>
							<td class="table_link">[공지]${list.title}<div class="col-12 notice_list_contents_con"><div class="col-12 notice_list_contents">${list.contents}</div></div></td>
							<td style="vertical-align: top;">${list.createDateStr}</td>
						</tr>
						</c:forEach>
						<c:if test="${empty noticeList}">
							<tr class="no_data">
								<td colspan="3">등록된 공지사항이 없습니다</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
		<c:if test="${not empty noticeList}">
			<!-- Paging[s] -->
			<div class="col-12 mt15 mt-md-55 pagination_style_0_wrap">
				<ul class="pagination_style_0_con">
					<c:if test="${searchDto.prev}">
						<li class="pagination_style_0_btn prev" id="dataTable_previous">
							 <a href="javascript:void(0);" onclick="commonList.fn_go_page(${searchDto.startDate - 1}); return false;" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
						</li>
					</c:if>
					<c:forEach var="num" begin="${searchDto.startDate}" end="${searchDto.endDate}">
						<li class="pagination_style_0">
							 <a href="javascript:void(0);" onclick="commonList.fn_go_page(${num}); return false;" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link" title="${num}">${num}</a>
						</li>
					</c:forEach>
					<c:if test="${searchDto.next}">
						<li class="pagination_style_0_btn next" id="dataTable_next">
							 <a href="javascript:void(0);" onclick="commonList.fn_go_page(${searchDto.endDate + 1}); return false;" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Next</a>
						</li>
					</c:if>
				</ul>
			</div>
			<!-- Paging[e] -->
		</c:if>
	</section>
<%@ include file="../inc/footer.jsp" %>
<%@ include file="../inc/footerPc.jsp" %>
</body>
</html>