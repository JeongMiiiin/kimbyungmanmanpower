<%@page import="java.time.LocalDate"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	LocalDate now = LocalDate.now();
	int nowYear = now.getYear() + 2;
	
	int[] nowYearList = new int[3];
	for(int i=0; i < 3; i++){
		nowYearList[i] = nowYear - i;
	}
	session.setAttribute("birthYear", nowYearList);
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- 지역선택 팝업 -->
<div class="col-12 popup_style_1_wrap" id="regionFilterSelectPopup">
	<div class="col-12 popup_con" style="max-width: 480px;">
		<div class="col-12 popup_inner">
			<div class="col-12 pl20 pr20 mb30 popup_title_con">
				<div class="col-12 popup_title">지역선택</div>
			</div>
			<ul class="col-12 pl20 pr20 main_filter_popup_select_con">
				<input type="hidden" name="regionFilterSelectPopList" id="regionFilterSelectPopList" value="[]"/>
				<li>
					<input type="hidden" name="regionFilter0" id="regionFilter0"/>
					<div class="col-12 label_box">권역</div>
					<a href="javascript:void(0)" class="col-12 input_box" onclick="mainFilter.open2DepthFilterPopup(0,0)"><span>권역을 선택해주세요.</span></a>
				</li>
				<li>
					<input type="hidden" name="regionFilter1" id="regionFilter1"/>
					<div class="col-12 label_box">도시</div>
					<a href="javascript:void(0)" class="col-12 input_box" onclick="mainFilter.open2DepthFilterPopup(0,1)"><span>도시를 선택해주세요.</span></a>
				</li>
				<li>
					<input type="hidden" name="regionFilter2" id="regionFilter2"/>
					<div class="col-12 label_box">지역</div>
					<a href="javascript:void(0)" class="col-12 input_box" onclick="mainFilter.open2DepthFilterPopup(0,2)"><span>지역을 선택해주세요.</span></a>
				</li>
			</ul>
			<ul class="col-12 main_filter_popup_select_result_list_con" id="regionFilterSelectPopListCon">
			</ul>
			<div class="col-12 mt30 pl20 pr20 pb100 pb-md-40 main_filter_popup_select_btn_con">
				<div class="col-4 main_filter_popup_select_btn cancel_btn">
					<a href="javascript:void(0)" onclick="popupManager.removePopLatest(true)"><span>취소</span></a>
				</div>
				<div class="col-8 main_filter_popup_select_btn">
					<a href="javascript:void(0)" onclick="mainFilter.complete2DepthRegionFilter()"><span>적용하기</span></a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 카테고리선택 팝업 -->
<div class="col-12 popup_style_1_wrap" id="categoryFilterSelectPopup">
	<div class="col-12 popup_con" style="max-width: 480px;">
		<div class="col-12 popup_inner">
			<div class="col-12 pl20 pr20 mb30 popup_title_con">
				<div class="col-12 popup_title">카테고리 선택</div>
			</div>
			<ul class="col-12 pl20 pr20 main_filter_popup_select_con">
				<input type="hidden" name="categoryFilterSelectPopList" id="categoryFilterSelectPopList" value="[]"/>
				<li>
					<input type="hidden" name="categoryFilter0" id="categoryFilter0"/>
					<div class="col-12 label_box">대분류</div>
					<a href="javascript:void(0)" class="col-12 input_box" onclick="mainFilter.open2DepthFilterPopup(1,0)"><span>대분류를 선택해주세요.</span></a>
				</li>
				<li>
					<input type="hidden" name="categoryFilter1" id="categoryFilter1"/>
					<div class="col-12 label_box">소분류</div>
					<a href="javascript:void(0)" class="col-12 input_box" onclick="mainFilter.open2DepthFilterPopup(1,1)"><span>소분류를 선택해주세요.</span></a>
				</li>
			</ul>
			<ul class="col-12 main_filter_popup_select_result_list_con" id="categoryFilterSelectPopListCon">
			</ul>
			<div class="col-12 mt30 pl20 pr20 pb100 pb-md-40 main_filter_popup_select_btn_con">
				<div class="col-4 main_filter_popup_select_btn cancel_btn">
					<a href="javascript:void(0)" onclick="popupManager.removePopLatest(true)"><span>취소</span></a>
				</div>
				<div class="col-8 main_filter_popup_select_btn">
					<a href="javascript:void(0)" onclick="mainFilter.complete2DepthCategoryFilter()"><span>적용하기</span></a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 날짜선택 팝업 -->
<div class="col-12 popup_style_1_wrap" id="dateFilterSelectPopup">
	<div class="col-12 popup_con" style="max-width: 480px;">
		<div class="col-12 popup_inner">
			<div class="col-12 pl20 pr20 mb30 popup_title_con">
				<div class="col-12 popup_title">날짜선택</div>
			</div>
			<ul class="col-12 pl20 pr20 main_filter_popup_select_con type_date">
				<input type="hidden" name="dateFilterSelectPopList" id="dateFilterSelectPopList" value=""/>
				<li>
					<input type="hidden" name="dateFilterStart0" id="dateFilterStart0"/>
					<div class="col-12 label_box">시작날짜</div>
					<div class="col-12 input_box">
						<div class="col-12">
							<select name="dateFilterStart0Year" id="dateFilterStart0Year" class="select_style_0"><option value="" disabled selected>선택</option>
								<c:forEach var="yearVal" items="${birthYear}">
									  <option value="${yearVal}">${yearVal}</option>
								</c:forEach>
							</select>
							<div class="col-0 mt5 mt-md-13 ml7 mr7 addr_text">년</div>
							<select name="dateFilterStart0Month" id="dateFilterStart0Month" class="select_style_0"><option value="" disabled selected>선택</option>
								<option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option>
								<option value="10">10</option><option value="11">11</option><option value="12">12</option>
							</select>
							<div class="col-0 mt5 mt-md-13 ml7 mr7 addr_text">월</div>
							<select name="dateFilterStart0Day" id="dateFilterStart0Day" class="select_style_0"><option value="" disabled selected>선택</option>
								<option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option>
								<option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option>
								<option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option>
								<option value="30">30</option><option value="31">31</option>
							</select>
							<div class="col-0 mt5 mt-md-13 ml7 addr_text">일</div>
						</div>
						<div class="col-12 type_time">
							<select name="dateFilterStart0Hour" id="dateFilterStart0Hour" class="select_style_0"><option value="" disabled selected>선택</option>
								<option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option>
								<option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option>
								<option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option>
							</select>
							<div class="col-0 mt5 mt-md-13 ml7 mr7 addr_text">:</div>
							<select name="dateFilterStart0Min" id="dateFilterStart0Min" class="select_style_0"><option value="" disabled selected>선택</option>
								<option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option>
								<option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option>
								<option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option>
								<option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option>
								<option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option>
								<option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option>
							</select>
						</div>
					</div>
				</li>
				<li>
					<input type="hidden" name="dateFilterEnd1" id="dateFilterEnd1"/>
					<div class="col-12 label_box">종료날짜</div>
					<div class="col-12 input_box">
						<div class="col-12">
							<select name="dateFilterEnd0Year" id="dateFilterEnd0Year" class="select_style_0"><option value="" disabled selected>선택</option>
								<c:forEach var="yearVal" items="${birthYear}">
									  <option value="${yearVal}">${yearVal}</option>
								</c:forEach>
							</select>
							<div class="col-0 mt5 mt-md-13 ml7 mr7 addr_text">년</div>
							<select name="dateFilterEnd0Month" id="dateFilterEnd0Month" class="select_style_0"><option value="" disabled selected>선택</option>
								<option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option>
								<option value="10">10</option><option value="11">11</option><option value="12">12</option>
							</select>
							<div class="col-0 mt5 mt-md-13 ml7 mr7 addr_text">월</div>
							<select name="dateFilterEnd0Day" id="dateFilterEnd0Day" class="select_style_0"><option value="" disabled selected>선택</option>
								<option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option>
								<option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option>
								<option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option>
								<option value="30">30</option><option value="31">31</option>
							</select>
							<div class="col-0 mt5 mt-md-13 ml7 addr_text">일</div>
						</div>
						<div class="col-12 type_time">
							<select name="dateFilterEnd0Hour" id="dateFilterEnd0Hour" class="select_style_0">
								<option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option>
								<option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option>
								<option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option>
							</select>
							<div class="col-0 mt5 mt-md-13 ml7 mr7 addr_text">:</div>
							<select name="dateFilterEnd0Min" id="dateFilterEnd0Min" class="select_style_0">
								<option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option>
								<option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option>
								<option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option>
								<option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option>
								<option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option>
								<option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option>
							</select>
						</div>
					</div>
				</li>
			</ul>
			<div class="col-12 mt30 pl20 pr20 pb100 pb-md-40 main_filter_popup_select_btn_con">
				<div class="col-4 main_filter_popup_select_btn cancel_btn">
					<a href="javascript:void(0)" onclick="popupManager.removePopLatest(true)"><span>취소</span></a>
				</div>
				<div class="col-8 main_filter_popup_select_btn">
					<a href="javascript:void(0)" onclick="mainFilter.complete2DepthDateFilter()"><span>적용하기</span></a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 권역선택팝업 -->
<div class="col-12 popup_style_2_wrap" id="regionFilter2DepthSelectPopup0">
	<div class="col-12 popup_con">
		<div class="col-12 popup_inner">
			<div class="col-12 mb24 popup_title_con">
				<div class="col-12 popup_title">권역</div>
			</div>
			<ul class="col-12 main_filter_popup_2depth_select_con" id="regionFilter0Select">
				<li>
					<a href="javascript:void(0)">수도권</a>
				</li>
				<li>
					<a href="javascript:void(0)">강원권</a>
				</li>
				<li>
					<a href="javascript:void(0)">충청권</a>
				</li>
				<li>
					<a href="javascript:void(0)">전라권</a>
				</li>
				<li>
					<a href="javascript:void(0)">경상권</a>
				</li>
				<li>
					<a href="javascript:void(0)">제주권</a>
				</li>
			</ul>
		</div>
	</div>
</div>
<!-- 도시선택팝업 -->
<div class="col-12 popup_style_2_wrap" id="regionFilter2DepthSelectPopup1">
	<div class="col-12 popup_con">
		<div class="col-12 popup_inner">
			<div class="col-12 mb24 popup_title_con">
				<div class="col-12 popup_title">도시</div>
			</div>
			<ul class="col-12 main_filter_popup_2depth_select_con" id="regionFilter1Select">
			</ul>
		</div>
	</div>
</div>
<!-- 지역선택팝업 -->
<div class="col-12 popup_style_2_wrap" id="regionFilter2DepthSelectPopup2">
	<div class="col-12 popup_con">
		<div class="col-12 popup_inner">
			<div class="col-12 mb24 popup_title_con">
				<div class="col-12 popup_title">지역</div>
			</div>
			<ul class="col-12 main_filter_popup_2depth_select_con" id="regionFilter2Select">
			</ul>
		</div>
	</div>
</div>
<!-- 카테고리 대분류선택팝업 -->
<div class="col-12 popup_style_2_wrap" id="categoryFilter2DepthSelectPopup0">
	<div class="col-12 popup_con">
		<div class="col-12 popup_inner">
			<div class="col-12 mb24 popup_title_con">
				<div class="col-12 popup_title">대분류</div>
			</div>
			<ul class="col-12 main_filter_popup_2depth_select_con" id="categoryFilter0Select">
				<li>
					<a href="javascript:void(0)">이사</a>
				</li>
				<li>
					<a href="javascript:void(0)">청소업체</a>
				</li>
				<li>
					<a href="javascript:void(0)">인테리어</a>
				</li>
				<li>
					<a href="javascript:void(0)">야외시공</a>
				</li>
				<li>
					<a href="javascript:void(0)">부동산</a>
				</li>
				<li>
					<a href="javascript:void(0)">철거/정리</a>
				</li>
				<li>
					<a href="javascript:void(0)">펫/반려동물</a>
				</li>
				<li>
					<a href="javascript:void(0)">문/창문</a>
				</li>
				<li>
					<a href="javascript:void(0)">수도/보일러/전기</a>
				</li>
				<li>
					<a href="javascript:void(0)">가전제품</a>
				</li>
				<li>
					<a href="javascript:void(0)">가구</a>
				</li>
				<li>
					<a href="javascript:void(0)">도우미</a>
				</li>
				<li>
					<a href="javascript:void(0)">서빙•주방 알바</a>
				</li>
				<li>
					<a href="javascript:void(0)">매장관리•판매 알바</a>
				</li>
				<li>
					<a href="javascript:void(0)">서비스•행사 알바</a>
				</li>
				<li>
					<a href="javascript:void(0)">문화•여가•생활 알바</a>
				</li>
				<li>
					<a href="javascript:void(0)">방송•미디어 알바</a>
				</li>
				<li>
					<a href="javascript:void(0)">사무직 알바</a>
				</li>
				<li>
					<a href="javascript:void(0)">생산•기능•노무 알바</a>
				</li>
				<li>
					<a href="javascript:void(0)">운전•배달•유통 알바</a>
				</li>
				<li>
					<a href="javascript:void(0)">병원•간호•연구 알바</a>
				</li>
				<li>
					<a href="javascript:void(0)">기타</a>
				</li>
			</ul>
		</div>
	</div>
</div>

<!-- 카테고리 소분류선택팝업 -->
<div class="col-12 popup_style_2_wrap" id="categoryFilter2DepthSelectPopup1">
	<div class="col-12 popup_con">
		<div class="col-12 popup_inner">
			<div class="col-12 mb24 popup_title_con">
				<div class="col-12 popup_title">소분류</div>
			</div>
			<ul class="col-12 main_filter_popup_2depth_select_con" id="categoryFilter1Select">
			</ul>
		</div>
	</div>
</div>

<!-- 구인/구직내역 상세 팝업 -->
<div class="col-12 popup_style_3_wrap" id="workViewPopup">
	<div class="col-12 popup_con">
		<div class="col-12 popup_inner">
			<div class="col-12 popup_title_con">
				<div class="col-12 popup_title">상세 내용</div>
				<a href="javascript:void(0)" class="popup_favorite_icon">즐겨찾기 버튼</a>
			</div>
			<ul class="col-12 popup_contents_con">
				<li>
					<div class="col-0 label_box">제목</div>
					<div class="col-0 input_box" id="workViewTitle"></div>
				</li>
				<li>
					<div class="col-0 label_box">성별</div>
					<div class="col-0 input_box" id="workViewSex"></div>
				</li>
				<li>
					<div class="col-0 label_box">지역</div>
					<div class="col-0 input_box" id="workViewRegion"></div>
				</li>
				<li>
					<div class="col-0 label_box">카테고리</div>
					<div class="col-0 input_box" id="workViewCategory"></div>
				</li>
				<li>
					<div class="col-0 label_box">내용</div>
					<div class="col-0 input_box" id="workViewContents"></div>
				</li>
				<li class="type_date">
					<div class="col-0 label_box">기간</div>
					<div class="col-0 input_box" id="workViewDate"><span></span><span>~</span><span></span></div>
				</li>
				<li>
					<div class="col-0 label_box">금액</div>
					<div class="col-0 input_box tr" id="workViewPayment"></div>
				</li>
			</ul>
			<div class="col-12 mt30 pl20 pr20 pb40 popup_style_3_btn_con">
				<div class="col-4 popup_style_3_btn cancel_btn">
					<a href="javascript:void(0)" onclick="popupManager.removePopLatest(true)"><span>닫기</span></a>
				</div>
				<div class="col-8 popup_style_3_btn">
					<a href="javascript:void(0)" id="workApplyBtn"><span>지원하기</span></a>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 지원하기 팝업 -->
<div class="col-12 popup_style_0_wrap" id="applySelectPopup">
	<div class="col-12 popup_con">
		<div class="col-12 popup_inner">
			<div class="col-12 popup_header_con">
				<div class="col-12 tc popup_header_title">지원하기</div>
				<a href="javascript:void(0)" class="popup_header_close_btn" onclick="popupManager.removePopLatest(true)">닫기 버튼</a>
			</div>
			<div class="col-12 pt17 pl20 pr20 popup_contents_con">
				<div class="col-12">
					<div class="col-12 appeal_popup_headline">나의 어필정보를 입력해주세요!</div>
					<div class="col-12 mb20">
						<textarea name="appealContents" id="appealContents" class="textarea_style_0" placeholder="어필정보를 입력해주세요. (최대 400자)" style="height: 330px;"></textarea>
					</div>
					<div class="col-12 btn_style_0_con">
						<div class="col-12 btn_style_0 type_plus type_grey" onclick="main.openAppealInfo()"><span>불러오기</span></div>
					</div>
				</div>
				<div class="col-12 btn_style_0_con">
					<div class="col-12 btn_style_0 type_complete type_lightgrey" id="confirmApplyBtn"><span>완료</span></div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 어필정보 템플릿선택팝업 -->
<div class="col-12 popup_style_2_wrap" id="appealTemplateSelectPopup">
	<div class="col-12 popup_con">
		<div class="col-12 popup_inner">
			<div class="col-12 mb24 popup_title_con">
				<div class="col-12 popup_title">템플릿 선택</div>
			</div>
			<ul class="col-12 pl20 pr20 appeal_template_select_con">
				<li>
					<div class="col-0 checkbox_style_0_con appeal_template_checkbox">
						<input type="radio" class="checkbox_style_0" name="appealTemplateSelect" id="appealTemplateSelect0"/>
						<label for="appealTemplateSelect0"></label>
					</div>
					<div class="col-12 appeal_template_date">2022. 06. 30</div>
					<div class="col-12 appeal_template_title">제 특기는 **입니다. 잘 부탁드립니다.</div>
					<a href="javascript:void(0)" class="appeal_template_view_btn"><span>상세</span></a>
				</li>
			</ul>
			<div class="col-12 mt30 pl20 pr20 pb40 popup_style_3_btn_con">
				<div class="col-3 popup_style_3_btn cancel_btn">
					<a href="javascript:void(0)" onclick="popupManager.removePopLatest(true)"><span>닫기</span></a>
				</div>
				<div class="col-9 popup_style_3_btn">
					<a href="javascript:void(0)" onclick="main.selectAppealTemplate()"><span>선택완료</span></a>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 어필정보 템플릿 상세 팝업 -->
<div class="col-12 popup_style_3_wrap" id="appealTemplateViewPopup">
	<div class="col-12 popup_con">
		<div class="col-12 popup_inner">
			<div class="col-12 popup_title_con">
				<div class="col-12 popup_title">상세 내용</div>
			</div>
			<ul class="col-12 popup_contents_con">
				<li>
					<div class="col-0 label_box">제목</div>
					<div class="col-0 input_box" id="appealTemplateViewTitle"></div>
				</li>
				<li>
					<div class="col-0 label_box">내용</div>
					<div class="col-0 input_box" id="appealTemplateViewContents"></div>
				</li>
			</ul>
			<div class="col-12 mt30 pl20 pr20 pb40 popup_style_3_btn_con">
				<div class="col-12 popup_style_3_btn cancel_btn">
					<a href="javascript:void(0)" onclick="popupManager.removePopLatest(true)"><span>닫기</span></a>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 지원 확인 팝업 -->
<div class="col-12 popup_style_3_wrap" id="workApplyConfirmPopup">
	<div class="col-12 popup_con">
		<div class="col-12 popup_inner">
			<div class="col-12 popup_title_con type_2">
				<div class="col-12 popup_title">지원하기</div>
			</div>
			<div class="col-12 mb14 popup_sub_title">정말로 지원하시겠습니까?</div>
			<div class="col-12 mt30 pl20 pr20 pb40 popup_style_3_btn_con">
				<div class="col-6 popup_style_3_btn cancel_btn">
					<a href="javascript:void(0)" onclick="popupManager.removePopLatest(true)"><span>취소</span></a>
				</div>
				<div class="col-6 popup_style_3_btn type_grey">
					<a href="javascript:void(0)" id="completeApplyBtn"><span>확인</span></a>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 게시글 작성 팝업 -->
<div class="col-12 popup_style_0_wrap" id="workWritePopup">
	<div class="col-12 popup_con">
		<div class="col-12 popup_inner">
			<div class="col-12 popup_header_con">
				<div class="col-12 tc popup_header_title">게시글 작성</div>
				<a href="javascript:void(0)" class="popup_header_close_btn" onclick="popupManager.removePopLatest(true)">닫기 버튼</a>
			</div>
			<div class="col-12 pt17 pl20 pr20 popup_contents_con">
				<form class="col-12 mb50 popup_work_write_con">
					<input type="hidden" name="workMemCategory" id="workMemCategory" value="0"/>
					<% if(memCategory > 2){
						%>
						<input type="hidden" name="workClassType" id="workClassType" value="1"/>
						<%	
					} else {
						%>
						<input type="hidden" name="workClassType" id="workClassType" value="0"/>
						<%	
					}%>
					<div class="col-12 popup_work_write">
						<div class="col-12 label_box">제목</div>
						<div class="col-12 input_box">
							<input type="text" name="workTitle" id="workTitle" class="input_style_0" placeholder="제목을 입력해주세요"/>
						</div>
					</div>
					<% if(memCategory < 3){
						%>
						<div class="col-12 popup_work_write">
							<div class="col-12 label_box">성별</div>
							<div class="col-12 input_box">
								<div class="col-12 radio_style_1_con">
									<div class="col-4 radio_style_1">
										<input type="radio" name="workSex" value="2" id="workSex2" checked/>
										<label for="workSex2">무관</label>
									</div>
									<div class="col-4 radio_style_1">
										<input type="radio" name="workSex" value="0" id="workSex0"/>
										<label for="workSex0">남</label>
									</div>
									<div class="col-4 radio_style_1">
										<input type="radio" name="workSex" value="1" id="workSex1"/>
										<label for="workSex1">여</label>
									</div>
								</div>
							</div>
						</div>
					<%	
					} else {
						%>
						<input type="hidden" name="memberSex" id="memberSex" value="${memberInfo.sex}"/>
						<%		
					}
					%>
					<div class="col-12 popup_work_write">
						<div class="col-12 label_box">지역</div>
						<div class="col-12 input_box">
							<input type="hidden" name="regionWriteList" id="regionWriteList" class="input_style_0" value="[]"/>
							<a href="javascript:void(0)" class="popup_work_write_open_btn" onclick="mainWrite.openWritePopup(0)"><span>지역을 선택해주세요.</span></a>
						</div>
						<ul class="col-12 popup_work_select_list" id="workWriteRegionList">
						</ul>
					</div>
					<div class="col-12 popup_work_write">
						<div class="col-12 label_box">카테고리</div>
						<div class="col-12 input_box">
							<input type="hidden" name="categoryWriteList" id="categoryWriteList" class="input_style_0" value="[]"/>
							<a href="javascript:void(0)" class="popup_work_write_open_btn" onclick="mainWrite.openWritePopup(1)"><span>카테고리를 선택해주세요.</span></a>
						</div>
						<ul class="col-12 popup_work_select_list" id="workWriteCategoryList">
						</ul>
					</div>
					<div class="col-12 popup_work_write">
						<div class="col-12 label_box">내용</div>
						<div class="col-12 input_box">
							<textarea class="textarea_style_0" placeholder="내용을 입력해주세요" name="workContents" id="workContents"></textarea>
						</div>
					</div>
					<div class="col-12 popup_work_write">
						<div class="col-12 label_box">기간</div>
						<div class="col-12 input_box">
							<input type="hidden" name="dateWriteStartDate" id="dateWriteStartDate" class="input_style_0" readonly/>
							<input type="hidden" name="dateWriteEndDate" id="dateWriteEndDate" class="input_style_0" readonly/>
							<a href="javascript:void(0)" class="popup_work_write_open_btn" onclick="mainWrite.openWritePopup(2)" id="dateWriteText"><span>기간을 선택해주세요.</span></a>
						</div>
					</div>
					<div class="col-12 popup_work_write type_payment">
						<div class="col-12 label_box">금액</div>
						<div class="col-12 input_box">
							<input type="number" name="workPayment" id="workPayment" class="input_style_0" value="" pattern="\d*"/>
							<div class="col-0 addr_text">원</div>
						</div>
						<div class="col-12 mt12 payment_assist_text">*최대 100만원까지 입력 가능합니다.</div>
					</div>
				</form>
				<div class="col-12 pb100 pb-md-0 btn_style_0_con">
					<div class="col-12 btn_style_0 type_complete type_blue" onclick="mainWrite.completeWorkWritePopup()"><span>등록</span></div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 지역선택 팝업 -->
<div class="col-12 popup_style_1_wrap" id="regionWriteSelectPopup">
	<div class="col-12 popup_con" style="max-width: 480px;">
		<div class="col-12 popup_inner">
			<div class="col-12 pl20 pr20 mb30 popup_title_con">
				<div class="col-12 popup_title">지역선택</div>
			</div>
			<ul class="col-12 pl20 pr20 main_filter_popup_select_con">
				<input type="hidden" name="regionWriteSelectPopList" id="regionWriteSelectPopList" value="[]"/>
				<li>
					<input type="hidden" name="regionWrite0" id="regionWrite0"/>
					<div class="col-12 label_box">권역</div>
					<a href="javascript:void(0)" class="col-12 input_box" onclick="mainWrite.open2DepthWritePopup(0,0)"><span>권역을 선택해주세요.</span></a>
				</li>
				<li>
					<input type="hidden" name="regionWrite1" id="regionWrite1"/>
					<div class="col-12 label_box">도시</div>
					<a href="javascript:void(0)" class="col-12 input_box" onclick="mainWrite.open2DepthWritePopup(0,1)"><span>도시를 선택해주세요.</span></a>
				</li>
				<li>
					<input type="hidden" name="regionWrite2" id="regionWrite2"/>
					<div class="col-12 label_box">지역</div>
					<a href="javascript:void(0)" class="col-12 input_box" onclick="mainWrite.open2DepthWritePopup(0,2)"><span>지역을 선택해주세요.</span></a>
				</li>
			</ul>
			<ul class="col-12 main_filter_popup_select_result_list_con" id="regionWriteSelectPopListCon">
			</ul>
			<div class="col-12 mt30 pl20 pr20 pb100 pb-md-40 main_filter_popup_select_btn_con">
				<div class="col-4 main_filter_popup_select_btn cancel_btn">
					<a href="javascript:void(0)" onclick="popupManager.removePopLatest(true)"><span>취소</span></a>
				</div>
				<div class="col-8 main_filter_popup_select_btn">
					<a href="javascript:void(0)" onclick="mainWrite.complete2DepthRegionWrite()"><span>적용하기</span></a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 카테고리선택 팝업 -->
<div class="col-12 popup_style_1_wrap" id="categoryWriteSelectPopup">
	<div class="col-12 popup_con" style="max-width: 480px;">
		<div class="col-12 popup_inner">
			<div class="col-12 pl20 pr20 mb30 popup_title_con">
				<div class="col-12 popup_title">카테고리 선택</div>
			</div>
			<ul class="col-12 pl20 pr20 main_filter_popup_select_con">
				<input type="hidden" name="categoryWriteSelectPopList" id="categoryWriteSelectPopList" value="[]"/>
				<li>
					<input type="hidden" name="categoryWrite0" id="categoryWrite0"/>
					<div class="col-12 label_box">대분류</div>
					<a href="javascript:void(0)" class="col-12 input_box" onclick="mainWrite.open2DepthWritePopup(1,0)"><span>대분류를 선택해주세요.</span></a>
				</li>
				<li>
					<input type="hidden" name="categoryFilter1" id="categoryWrite1"/>
					<div class="col-12 label_box">소분류</div>
					<a href="javascript:void(0)" class="col-12 input_box" onclick="mainWrite.open2DepthWritePopup(1,1)"><span>소분류를 선택해주세요.</span></a>
				</li>
			</ul>
			<ul class="col-12 main_filter_popup_select_result_list_con" id="categoryWriteSelectPopListCon">
			</ul>
			<div class="col-12 mt30 pl20 pr20 pb100 pb-md-40 main_filter_popup_select_btn_con">
				<div class="col-4 main_filter_popup_select_btn cancel_btn">
					<a href="javascript:void(0)" onclick="popupManager.removePopLatest(true)"><span>취소</span></a>
				</div>
				<div class="col-8 main_filter_popup_select_btn">
					<a href="javascript:void(0)" onclick="mainWrite.complete2DepthCategoryWrite()"><span>적용하기</span></a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 날짜선택 팝업 -->
<div class="col-12 popup_style_1_wrap" id="dateWriteSelectPopup">
	<div class="col-12 popup_con" style="max-width: 480px;">
		<div class="col-12 popup_inner">
			<div class="col-12 pl20 pr20 mb30 popup_title_con">
				<div class="col-12 popup_title">날짜선택</div>
			</div>
			<ul class="col-12 pl20 pr20 main_filter_popup_select_con type_date">
				<input type="hidden" name="dateWriteSelectPopList" id="dateWriteSelectPopList" value=""/>
				<li>
					<input type="hidden" name="dateWriteStart0" id="dateWriteStart0"/>
					<div class="col-12 label_box">시작날짜</div>
					<div class="col-12 input_box">
						<div class="col-12">
							<select name="dateWriteStart0Year" id="dateWriteStart0Year" class="select_style_0"><option value="" disabled selected>선택</option>
								<c:forEach var="yearVal" items="${birthYear}">
									  <option value="${yearVal}">${yearVal}</option>
								</c:forEach>
							</select>
							<div class="col-0 mt5 mt-md-13 ml7 mr7 addr_text">년</div>
							<select name="dateWriteStart0Month" id="dateWriteStart0Month" class="select_style_0"><option value="" disabled selected>선택</option>
								<option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option>
								<option value="10">10</option><option value="11">11</option><option value="12">12</option>
							</select>
							<div class="col-0 mt5 mt-md-13 ml7 mr7 addr_text">월</div>
							<select name="dateWriteStart0Day" id="dateWriteStart0Day" class="select_style_0"><option value="" disabled selected>선택</option>
								<option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option>
								<option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option>
								<option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option>
								<option value="30">30</option><option value="31">31</option>
							</select>
							<div class="col-0 mt5 mt-md-13 ml7 addr_text">일</div>
						</div>
						<div class="col-12 type_time">
							<select name="dateWriteStart0Hour" id="dateWriteStart0Hour" class="select_style_0">
								<option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option>
								<option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option>
								<option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option>
							</select>
							<div class="col-0 mt5 mt-md-13 ml7 mr7 addr_text">:</div>
							<select name="dateWriteStart0Min" id="dateWriteStart0Min" class="select_style_0">
								<option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option>
								<option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option>
								<option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option>
								<option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option>
								<option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option>
								<option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option>
							</select>
						</div>
					</div>
				</li>
				<li>
					<input type="hidden" name="dateWriteEnd1" id="dateWriteEnd1"/>
					<div class="col-12 label_box">종료날짜</div>
					<div class="col-12 input_box">
						<div class="col-12">
							<select name="dateWriteEnd0Year" id="dateWriteEnd0Year" class="select_style_0"><option value="" disabled selected>선택</option>
								<c:forEach var="yearVal" items="${birthYear}">
									  <option value="${yearVal}">${yearVal}</option>
								</c:forEach>
							</select>
							<div class="col-0 mt5 mt-md-13 ml7 mr7 addr_text">년</div>
							<select name="dateWriteEnd0Month" id="dateWriteEnd0Month" class="select_style_0"><option value="" disabled selected>선택</option>
								<option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option>
								<option value="10">10</option><option value="11">11</option><option value="12">12</option>
							</select>
							<div class="col-0 mt5 mt-md-13 ml7 mr7 addr_text">월</div>
							<select name="dateWriteEnd0Day" id="dateWriteEnd0Day" class="select_style_0"><option value="" disabled selected>선택</option>
								<option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option>
								<option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option>
								<option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option>
								<option value="30">30</option><option value="31">31</option>
							</select>
							<div class="col-0 mt5 mt-md-13 ml7 addr_text">일</div>
						</div>
						<div class="col-12 type_time">
							<select name="dateWriteEnd0Hour" id="dateWriteEnd0Hour" class="select_style_0">
								<option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option>
								<option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option>
								<option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option>
							</select>
							<div class="col-0 mt5 mt-md-13 ml7 mr7 addr_text">:</div>
							<select name="dateWriteEnd0Min" id="dateWriteEnd0Min" class="select_style_0">
								<option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option>
								<option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option>
								<option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option>
								<option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option>
								<option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option>
								<option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option>
							</select>
						</div>
					</div>
				</li>
			</ul>
			<div class="col-12 mt30 pl20 pr20 pb100 pb-md-40 main_filter_popup_select_btn_con">
				<div class="col-4 main_filter_popup_select_btn cancel_btn">
					<a href="javascript:void(0)" onclick="popupManager.removePopLatest(true)"><span>취소</span></a>
				</div>
				<div class="col-8 main_filter_popup_select_btn">
					<a href="javascript:void(0)" onclick="mainWrite.complete2DepthDateWrite()"><span>적용하기</span></a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 권역선택팝업 -->
<div class="col-12 popup_style_2_wrap" id="regionWrite2DepthSelectPopup0">
	<div class="col-12 popup_con">
		<div class="col-12 popup_inner">
			<div class="col-12 mb24 popup_title_con">
				<div class="col-12 popup_title">권역</div>
			</div>
			<ul class="col-12 main_filter_popup_2depth_select_con" id="regionWrite0Select">
				<li>
					<a href="javascript:void(0)">수도권</a>
				</li>
				<li>
					<a href="javascript:void(0)">강원권</a>
				</li>
				<li>
					<a href="javascript:void(0)">충청권</a>
				</li>
				<li>
					<a href="javascript:void(0)">전라권</a>
				</li>
				<li>
					<a href="javascript:void(0)">경상권</a>
				</li>
				<li>
					<a href="javascript:void(0)">제주권</a>
				</li>
			</ul>
		</div>
	</div>
</div>
<!-- 도시선택팝업 -->
<div class="col-12 popup_style_2_wrap" id="regionWrite2DepthSelectPopup1">
	<div class="col-12 popup_con">
		<div class="col-12 popup_inner">
			<div class="col-12 mb24 popup_title_con">
				<div class="col-12 popup_title">도시</div>
			</div>
			<ul class="col-12 main_filter_popup_2depth_select_con" id="regionWrite1Select">
			</ul>
		</div>
	</div>
</div>
<!-- 지역선택팝업 -->
<div class="col-12 popup_style_2_wrap" id="regionWrite2DepthSelectPopup2">
	<div class="col-12 popup_con">
		<div class="col-12 popup_inner">
			<div class="col-12 mb24 popup_title_con">
				<div class="col-12 popup_title">지역</div>
			</div>
			<ul class="col-12 main_filter_popup_2depth_select_con" id="regionWrite2Select">
			</ul>
		</div>
	</div>
</div>
<!-- 카테고리 대분류선택팝업 -->
<div class="col-12 popup_style_2_wrap" id="categoryWrite2DepthSelectPopup0">
	<div class="col-12 popup_con">
		<div class="col-12 popup_inner">
			<div class="col-12 mb24 popup_title_con">
				<div class="col-12 popup_title">대분류</div>
			</div>
			<ul class="col-12 main_filter_popup_2depth_select_con" id="categoryWrite0Select">
				<li>
					<a href="javascript:void(0)">이사</a>
				</li>
				<li>
					<a href="javascript:void(0)">청소업체</a>
				</li>
				<li>
					<a href="javascript:void(0)">인테리어</a>
				</li>
				<li>
					<a href="javascript:void(0)">야외시공</a>
				</li>
				<li>
					<a href="javascript:void(0)">부동산</a>
				</li>
				<li>
					<a href="javascript:void(0)">철거/정리</a>
				</li>
				<li>
					<a href="javascript:void(0)">펫/반려동물</a>
				</li>
				<li>
					<a href="javascript:void(0)">문/창문</a>
				</li>
				<li>
					<a href="javascript:void(0)">수도/보일러/전기</a>
				</li>
				<li>
					<a href="javascript:void(0)">가전제품</a>
				</li>
				<li>
					<a href="javascript:void(0)">가구</a>
				</li>
				<li>
					<a href="javascript:void(0)">도우미</a>
				</li>
				<li>
					<a href="javascript:void(0)">서빙•주방 알바</a>
				</li>
				<li>
					<a href="javascript:void(0)">매장관리•판매 알바</a>
				</li>
				<li>
					<a href="javascript:void(0)">서비스•행사 알바</a>
				</li>
				<li>
					<a href="javascript:void(0)">문화•여가•생활 알바</a>
				</li>
				<li>
					<a href="javascript:void(0)">방송•미디어 알바</a>
				</li>
				<li>
					<a href="javascript:void(0)">사무직 알바</a>
				</li>
				<li>
					<a href="javascript:void(0)">생산•기능•노무 알바</a>
				</li>
				<li>
					<a href="javascript:void(0)">운전•배달•유통 알바</a>
				</li>
				<li>
					<a href="javascript:void(0)">병원•간호•연구 알바</a>
				</li>
				<li>
					<a href="javascript:void(0)">기타</a>
				</li>
			</ul>
		</div>
	</div>
</div>

<!-- 카테고리 소분류선택팝업 -->
<div class="col-12 popup_style_2_wrap" id="categoryWrite2DepthSelectPopup1">
	<div class="col-12 popup_con">
		<div class="col-12 popup_inner">
			<div class="col-12 mb24 popup_title_con">
				<div class="col-12 popup_title">소분류</div>
			</div>
			<ul class="col-12 main_filter_popup_2depth_select_con" id="categoryWrite1Select">
			</ul>
		</div>
	</div>
</div>

<!-- pc 상세검색 필터 팝업 -->
<div class="col-12 popup_style_4_wrap" id="mainFilterPcPopup">
	<div class="col-12 popup_con">
		<div class="col-12 popup_inner">
			<div class="col-12 mb24 popup_title_con">
				<div class="col-12 popup_title">상세 검색</div>
			</div>
			<div class="col-12 pb20 pl20 pr20 popup_contents_con">
				<div class="col-12 mb20 main_pc_filter_con">
					<div class="col-12 main_pc_filter">
						<div class="col-12 label_box"><span>분류</span></div>
						<div class="col-12 input_box">
							<div class="col-12 radio_style_1_con">
								<div class="col-6 radio_style_1">
									<input type="checkbox" name="filterPcClass" value="0" id="filterPcClass0"/>
									<label for="filterPcClass0">구인</label>
								</div>
								<div class="col-6 radio_style_1">
									<input type="checkbox" name="filterPcClass" value="1" id="filterPcClass1"/>
									<label for="filterPcClass1">구직</label>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 main_pc_filter">
						<input type="hidden" name="regionFilterPcList" id="regionFilterPcList" value="[]"/>
						<div class="col-12 label_box"><span>지역</span></div>
						<div class="col-12 input_box">
							<a href="javascript:void(0)" class="col-12 main_filter_popup_btn" onclick="mainFilter.openFilterPopup(0)"><span>지역을 선택해주세요.</span></a>
						</div>
						<ul class="col-12 main_filter_select_list" id="regionPcList"></ul>
					</div>
					<div class="col-12 main_pc_filter">
						<input type="hidden" name="categoryFilterPcList" id="categoryFilterPcList" value="[]"/>
						<div class="col-12 label_box"><span>카테고리</span></div>
						<div class="col-12 input_box">
							<a href="javascript:void(0)" class="col-12 main_filter_popup_btn" onclick="mainFilter.openFilterPopup(1)"><span>카테고리를 선택해주세요.</span></a>
						</div>
						<ul class="col-12 main_filter_select_list" id="categoryPcList"></ul>
					</div>
					<div class="col-12 main_pc_filter">
						<input type="hidden" name="dateFilterPcStartDate" id="dateFilterPcStartDate" value=""/>
						<input type="hidden" name="dateFilterPcEndDate" id="dateFilterPcEndDate" value=""/>
						<div class="col-12 label_box"><span>기간</span></div>
						<div class="col-12 input_box">
							<div class="col-12 radio_style_1_con">
								<div class="col-4 col-md-20 radio_style_1">
									<input type="checkbox" name="dateFileterPcSelect" id="dateFileterPcSelect0" value="week1"/>
									<label for="dateFileterPcSelect0">1주일</label>
								</div>
								<div class="col-4 col-md-20 radio_style_1">
									<input type="checkbox" name="dateFileterPcSelect" id="dateFileterPcSelect1" value="month3"/>
									<label for="dateFileterPcSelect1">3개월</label>
								</div>
								<div class="col-4 col-md-20 radio_style_1">
									<input type="checkbox" name="dateFileterPcSelect" id="dateFileterPcSelect2" value="month6"/>
									<label for="dateFileterPcSelect2">6개월</label>
								</div>
								<div class="col-4 col-md-20 mt20 mt-md-0 radio_style_1">
									<input type="checkbox" name="dateFileterPcSelect" id="dateFileterPcSelect3" value="year1"/>
									<label for="dateFileterPcSelect3">1년</label>
								</div>
								<div class="col-4 col-md-20 mt20 mt-md-0 radio_style_1">
									<input type="checkbox" name="dateFileterPcSelect" id="dateFileterPcSelect4" value="year3"/>
									<label for="dateFileterPcSelect4">3년</label>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 main_pc_filter type_btn">
						<div class="col-12 label_box"><span>성별</span></div>
						<div class="col-12 input_box">
							<div class="col-12 radio_style_1_con">
								<div class="col-4 radio_style_1">
									<input type="checkbox" name="filterPcSex" value="0" id="filterPcSex0"/>
									<label for="filterPcSex0">남</label>
								</div>
								<div class="col-4 radio_style_1">
									<input type="checkbox" name="filterPcSex" value="1" id="filterPcSex1"/>
									<label for="filterPcSex1">여</label>
								</div>
								<div class="col-4 radio_style_1">
									<input type="checkbox" name="filterPcSex" value="2" id="filterPcSex2"/>
									<label for="filterPcSex2">무관</label>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 main_pc_filter type_payment">
						<div class="col-12 label_box"><span>금액</span></div>
						<div class="col-12 input_box">
							<input type="number" name="filterPcStartPayment" id="filterPcStartPayment" class="input_style_0" pattern="\d*"/>
							<div class="col-0 mt10 ml10 mr10 addr_text">~</div>
							<input type="number" name="filterPcEndPayment" id="filterPcEndPayment" class="input_style_0" pattern="\d*"/>
						</div>
					</div>
				</div>
				<a href="javascript:void(0)" class="col-12 main_pc_filter_complete_btn" onclick="mainFilter.submitSearchFilter(true)"><span>검색</span></a>
			</div>
		</div>
	</div>
</div>