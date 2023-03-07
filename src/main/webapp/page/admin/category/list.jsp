<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>카테고리관리</title>
	<%@ include file="../../common/headInfo/css.jsp" %>
    <%@ include file="../headInfo/css.jsp" %>
    <%@ include file="../../common/headInfo/javascript.jsp" %>
    <%@ include file="../headInfo/javascript.jsp" %>
	<script type="text/javascript" src="<c:url value='/adm/js/category/list.js'/>"></script>
	<script>
		let pagingActiveIndex = "${searchDto.pageIndex}"
	</script>
</head>
<body>

	<%@ include file="../inc/header.jsp" %>
    <section class="col-12 admin_contents_wrap">
    	<div class="col-12 admin_contents_con">
    		<h1 class="col-12 page_title">
	    		카테고리 관리 (기업/단체)
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
			                <div>
			                </div>
						</div>
						<table class="col-12">
							<colgroup>
								<col width="60px"/>
								<col width="auto"/>
								<col width="140px"/>
								<col width="120px"/>
								<col width="160px"/>
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>카테고리</th>
									<th>상태</th>
									<th>등록일</th>
									<th>비고</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${resultList}" varStatus="status">
								<tr>
									<td>${fn:length(resultList) - status.index}</td>
									<td>${list.title}</td>
									<td>
										<c:choose>
											<c:when test="${list.status eq 0}">사용</c:when>
											<c:otherwise>사용안함</c:otherwise>
										</c:choose>
									</td>
									<td>${list.createDateStr}</td>
									<td>
										<c:choose>
											<c:when test="${list.status eq 0 }">
												<a href="javascript:void(0)" class="admin_btn_style_1 skyblue reject_btn" onclick="categoryList.updateStatus(${list.sn}, 1)">
													<span>상태변경</span>
												</a>
											</c:when>
											<c:otherwise>
												<a href="javascript:void(0)" class="admin_btn_style_1 skyblue reject_btn" onclick="categoryList.updateStatus(${list.sn}, 0)">
													<span>상태변경</span>
												</a>
											</c:otherwise>
										</c:choose>
										
									</td>
								</tr>
								</c:forEach>
								<c:if test="${empty resultList}">
							    	<tr class="no_data">
							    		<td colspan="5">결과가 존재하지 않습니다.</td>
								    </tr>
							    </c:if>
							</tbody>
						</table>
						<!-- Paging[s] -->
						<div class="col-12 admin_pagination_style_0_con no-print">
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


</body>
</html>