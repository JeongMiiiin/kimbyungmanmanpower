<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<form method="get" id="filterForm" action="/reserve/adm/reserveManageList/list" class="col-12 admin_filter_style_0_wrap" data-common-filter-form>
	<input type="hidden" id="pageIndex" name="pageIndex" value="${searchDto.pageIndex}" />
	<table class="col-12 col-lg-0 admin_filter_style_0_con">
		<colgroup>
			<col width="100px"/>
			<col width="400px"/>
			<col width="100px"/>
			<col width="400px"/>
			<col width="auto"/>
		</colgroup>
		<tbody>
			<tr>
				<th>
					카테고리검색
				</th>
				<td>
					<input type="text" class="admin_input_style_0" id="searchName" name="searchName" value="${searchDto.searchName}"/>
				</td>
				<th>
					상태검색
				</th>
				<td>
					<div class="admin_select_style_0_wrap">
						<select name="searchStatus" id="searchStatus">
							<option value="" <c:if test="${searchDto.searchStatus eq -1}">selected</c:if>>전체</option>
							<option value="0" <c:if test="${searchDto.searchStatus eq 0}">selected</c:if>>사용</option>
							<option value="1" <c:if test="${searchDto.searchStatus eq 1}">selected</c:if>>사용안함</option>
						</select>
					</div>
				</td>
				<td></td>
			</tr>
		</tbody>
	</table>
	<div class="col-12 col-lg-0 admin_filter_style_0_btn_con">
		<a href="/adm/category/list" class="admin_btn_style_0 mr5">
			<span>초기화</span>
		</a>
		<a href="javascript:void(0)" class="admin_btn_style_0 mr5" data-common-filter-btn>
			<span>검색</span>
		</a>
		<a href="/adm/category/insert?${searchDto.qustr}" class="admin_btn_style_0">
			<span>등록</span>
		</a>
	</div>
</form>