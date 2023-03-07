<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<form method="get" id="filterForm" action="/adm/member/list" class="col-12 admin_filter_style_0_wrap" data-common-filter-form>
	<input type="hidden" id="pageIndex" name="pageIndex" value="${searchDto.pageIndex}" />
	<table class="col-12 col-lg-0 admin_filter_style_0_con">
		<colgroup>
			<col width="100px"/>
			<col width="400px"/>
			<col width="100px"/>
			<col width="200px"/>
			<col width="auto"/>
		</colgroup>
		<tbody>
			<tr>
				<th>
					키워드검색
				</th>
				<td>
					<div class="admin_search_select_category_text_con">
						<c:choose>
							<c:when test="${searchDto.searchWorkTitle ne '' && not empty searchDto.searchWorkTitle}">
								<div class="admin_select_style_0_wrap">
									<select name="keyword_select" id="keywordSelect" data-keyword-select="keyword">
										<option value="">선택</option>
										<option value="searchWorkTitle" selected>제목</option>
										<option value="searchBuyerName">결제자</option>
										<option value="searchRecipientName">수급자</option>
									</select>
								</div>
								<input type="text" class="admin_input_style_0" id="searchWorkTitle" name="searchWorkTitle" value="${searchDto.searchWorkTitle}" data-keyword-input="keyword"/>		
						 	</c:when>
						 	<c:when test="${searchDto.searchBuyerName ne '' && not empty searchDto.searchBuyerName}">
						 		<div class="admin_select_style_0_wrap">
									<select name="keyword_select" id="keywordSelect" data-keyword-select="keyword">
										<option value="">선택</option>
										<option value="searchWorkTitle">제목</option>
										<option value="searchBuyerName" selected>결제자</option>
										<option value="searchRecipientName">수급자</option>
									</select>
								</div>
								<input type="text" class="admin_input_style_0" id="searchBuyerName" name="searchBuyerName" value="${searchDto.searchBuyerName}" data-keyword-input="keyword"/>		
						 	</c:when>
						 	<c:when test="${searchDto.searchRecipientName ne '' && not empty searchDto.searchRecipientName}">
						 		<div class="admin_select_style_0_wrap">
									<select name="keyword_select" id="keywordSelect" data-keyword-select="keyword">
										<option value="">선택</option>
										<option value="searchWorkTitle">제목</option>
										<option value="searchBuyerName">결제자</option>
										<option value="searchRecipientName" selected>수급자</option>
									</select>
								</div>
								<input type="text" class="admin_input_style_0" id="searchRecipientName" name="searchRecipientName" value="${searchDto.searchRecipientName}" data-keyword-input="keyword"/>		
						 	</c:when>
						 	<c:otherwise>
						 		<div class="admin_select_style_0_wrap">
									<select name="keyword_select" id="keywordSelect" data-keyword-select="keyword">
										<option value="" selected>선택</option>
										<option value="searchWorkTitle">제목</option>
										<option value="searchBuyerName">결제자</option>
										<option value="searchRecipientName">수급자</option>
									</select>
								</div>
						 		<input type="text" class="admin_input_style_0" id="" name="" value="" data-keyword-input="keyword"/>
						 	</c:otherwise>
						</c:choose>
					</div>
				</td>
				<th>
					상태
				</th>
				<td>
					<div class="admin_select_style_0_wrap">
						<select name="searchStatus" id="searchStatus">
							<option value="">선택</option>
							<option value="0" <c:if test="${searchDto.searchStatus eq 0}">selected</c:if>>지급대기</option>
							<option value="1" <c:if test="${searchDto.searchStatus eq 1}">selected</c:if>>지급완료</option>
							<option value="2" <c:if test="${searchDto.searchStatus eq 2}">selected</c:if>>지급취소</option>
						</select>
					</div>
				</td>
				<td></td>
			</tr>
		</tbody>
	</table>
	<div class="col-12 col-lg-0 admin_filter_style_0_btn_con">
		<a href="/adm/deal/list" class="admin_btn_style_0 mr5">
			<span>초기화</span>
		</a>
		<a href="javascript:void(0)" class="admin_btn_style_0 mr5" data-common-filter-btn>
			<span>검색</span>
		</a>
	</div>
</form>