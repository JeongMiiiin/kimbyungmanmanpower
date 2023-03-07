<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<form method="get" id="filterForm" action="/adm/work/list" class="col-12 admin_filter_style_0_wrap" data-common-filter-form>
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
					제목
				</th>
				<td>
					<input type="text" class="admin_input_style_0" id="searchTitle" name="searchTitle" value="${searchDto.searchTitle}"/>
				</td>
				<th>
					회원구분
				</th>
				<td>
					<div class="admin_select_style_0_wrap">
						<select name="searchMemCategory" id="searchMemCategory">
							<option value="-1">선택</option>
							<option value="0" <c:if test="${searchDto.searchMemCategory eq 0}">selected</c:if>>개인</option>
							<option value="1" <c:if test="${searchDto.searchMemCategory eq 1}">selected</c:if>>기업/단체</option>
						</select>
					</div>
				</td>
				<td></td>
			</tr>
			<tr>
				<th>기간</th>
				<td colspan="3">
					<div class="col-12 admin_filter_style_0_date_range">
						<input type="text" class="admin_input_style_0" id="searchStartDate" name="searchStartDate" value="${searchDto.searchStartDate}" autocomplete="off" data-common-datepicker readonly/>
						<span class="addr_text">~</span>
						<input type="text" class="admin_input_style_0" id="searchEndDate" name="searchEndDate" value="${searchDto.searchEndDate}" autocomplete="off" data-common-datepicker readonly/>
					</div>
				</td>
				<td></td>
			</tr>
		</tbody>
	</table>
	<div class="col-12 col-lg-0 admin_filter_style_0_btn_con">
		<a href="/adm/work/list" class="admin_btn_style_0 mr5">
			<span>초기화</span>
		</a>
		<a href="javascript:void(0)" class="admin_btn_style_0 mr5" data-common-filter-btn>
			<span>검색</span>
		</a>
	</div>
</form>