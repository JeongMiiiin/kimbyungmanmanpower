<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>신고하기관리</title>
	<%@ include file="../../common/headInfo/css.jsp" %>
    <%@ include file="../headInfo/css.jsp" %>
    <%@ include file="../../common/headInfo/javascript.jsp" %>
    <%@ include file="../headInfo/javascript.jsp" %>
	<script type="text/javascript" src="<c:url value='/adm/js/declaration/list.js'/>"></script>
	<script>
		let pagingActiveIndex = "${searchDto.pageIndex}"
	</script>
</head>
<body>

<%@ include file="../inc/header.jsp" %>

    <section class="col-12 admin_contents_wrap">
    	<div class="col-12 admin_contents_con">
	    	<h1 class="col-12 page_title">
	    		신고하기관리
	    	</h1>
	    	<div class="col-12 admin_contents">
				<div class="col-12 admin_table_style_0_wrap">
					<%@ include file="filter.jsp" %>
					<div class="col-12 admin_table_style_0">
						<div class="col-12 admin_table_style_0_header">
							<div>
			                	<div class="total_cnt_con mr20">
			                		<span>
			                			Total
			                		</span>
			                		<span class="total_cnt">
			                			<span class="fontweight500">${totCnt}</span>건
			                		</span>
			                	</div>
				            </div>
						</div>
						<table class="col-12">
							<colgroup>
								<col width="60px"/>
								<col width="auto"/>
								<col width="120px"/>
								<col width="120px"/>
								<col width="120px"/>
								<col width="120px"/>
								<col width="180px"/>
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>신고자</th>
									<th>피신고자</th>
									<th>상태</th>
									<th>신고일</th>
									<th>비고</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${resultList}" varStatus="status">
							    <tr>
							    	<td>${fn:length(resultList) - status.index}</td>
							    	<td>
							    		${list.workTitle}
							    	</td>
							    	<td>
							    	${list.memberName}
							    	</td>
							    	<td>
							    	${list.recipientName}
							    	</td>
							    	<td>
							    		<c:choose>
							        		<c:when test="${list.status eq 0}">승인대기</c:when>
							        		<c:when test="${list.status eq 1}">승인</c:when>
							        		<c:when test="${list.status eq 2}">거절</c:when>
							        		<c:otherwise>
							        			신고자 취소
							        		</c:otherwise>
							        	</c:choose>
							    	</td>
							    	<td>${list.createDateStr}</td>
							    	<td>
							    		<c:choose>
							        		<c:when test="${list.status eq 0}">
							        			<a href="javascript:void(0)" class="admin_btn_style_1" onclick="declarationList.openPopup(${list.category})"><span>사유</span></a>
									    		<a href="javascript:void(0)" class="admin_btn_style_1 skyblue" onclick="declarationList.updateStatus(${list.sn},${list.workSn},${list.recipientSn},1)"><span>승인</span></a>
									    		<a href="javascript:void(0)" class="admin_btn_style_1 grey" onclick="declarationList.updateStatus(${list.sn},${list.workSn},${list.recipientSn},2)"><span>거절</span></a>
							        		</c:when>
							        		<c:otherwise>
							        			<a href="javascript:void(0)" class="admin_btn_style_1" onclick="declarationList.openPopup(${list.category})"><span>사유</span></a>
							        		</c:otherwise>
							        	</c:choose>
							    	</td>
							    </tr>  
							    </c:forEach>
							    <c:if test="${empty resultList}">
							    	<tr class="no_data">
							    		<td colspan="7">결과가 존재하지 않습니다.</td>
								    </tr>
							    </c:if>
							</tbody>
						</table>
						<!-- Paging[s] -->
						<div class="col-12 admin_pagination_style_0_con">
							<ul class="admin_pagination_style_0">
									  <c:if test="${searchDto.prev}">
									  <li class="admin_pagination_btn prev" id="dataTable_previous">
									 		 <a href="javascript:void(0);" onclick="commonList.fn_go_page(${searchDto.startDate - 1}); return false;" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
									  </li>
									  </c:if>
									  <c:forEach var="num" begin="${searchDto.startDate}" end="${searchDto.endDate}">
									  <li class="admin_pagination">
									 		 <a href="javascript:void(0);" onclick="commonList.fn_go_page(${num}); return false;" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link" title="${num}">${num}</a>
									  </li>
									  </c:forEach>
									  
									  <c:if test="${searchDto.next}">
									  <li class="admin_pagination_btn next" id="dataTable_next">
									 		 <a href="javascript:void(0);" onclick="commonList.fn_go_page(${searchDto.endDate + 1}); return false;" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Next</a>
									  </li>
									  </c:if>
								  </ul>
						</div>
						<!-- Paging[e] -->
					</div>
				</div>
	    	</div>
		</div>
    </section>
<%@ include file="../inc/footer.jsp" %>

<!-- 구인/구직내역 상세 팝업 -->
<div class="col-12 admin_popup_style_0_wrap" id="declarationViewPopup">
	<div class="col-12 popup_con">
		<div class="col-12 popup_inner" style="max-width: 700px;">
			<div class="col-12 popup_title_con">
				<div class="col-12 popup_title">상세 내용</div>
			</div>
			<div class="col-12 popup_contents_con">
				<div class="col-12 pb27 popup_contents"></div>
			</div>
		</div>
	</div>
</div>

</body>
</html>