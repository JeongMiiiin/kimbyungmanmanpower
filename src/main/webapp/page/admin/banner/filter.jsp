<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<form method="get" id="filterForm" action="/adm/banner/list" class="col-12 admin_filter_style_0_wrap" data-common-filter-form>
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
					분류
				</th>
				<td>
					<div class="admin_select_style_0_wrap">
						<select name="searchCategory" id="searchCategory">
							<option value="">선택</option>
							<option value="0" <c:if test="${searchDto.searchCategory eq 0}">selected</c:if>>메인</option>
							<option value="1" <c:if test="${searchDto.searchCategory eq 1}">selected</c:if>>이벤트</option>
							<option value="2" <c:if test="${searchDto.searchCategory eq 2}">selected</c:if>>소개</option>
						</select>
					</div>
				</td>
				<td></td>
			</tr>
		</tbody>
	</table>
	<div class="col-12 col-lg-0 admin_filter_style_0_btn_con">
		<a href="/adm/banner/list" class="admin_btn_style_0 mr5">
			<span>초기화</span>
		</a>
		<a href="javascript:void(0)" class="admin_btn_style_0 mr5" data-common-filter-btn>
			<span>검색</span>
		</a>
		<a href="/adm/banner/insert?${searchDto.qustr}" class="admin_btn_style_0">
			<span>등록</span>
		</a>
	</div>
</form>