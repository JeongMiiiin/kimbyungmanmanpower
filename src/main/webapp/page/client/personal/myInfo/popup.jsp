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
					<a href="javascript:void(0)" class="col-12 input_box" onclick="workUpdate.open2DepthWritePopup(0,0)"><span>권역을 선택해주세요.</span></a>
				</li>
				<li>
					<input type="hidden" name="regionWrite1" id="regionWrite1"/>
					<div class="col-12 label_box">도시</div>
					<a href="javascript:void(0)" class="col-12 input_box" onclick="workUpdate.open2DepthWritePopup(0,1)"><span>도시를 선택해주세요.</span></a>
				</li>
				<li>
					<input type="hidden" name="regionWrite2" id="regionWrite2"/>
					<div class="col-12 label_box">지역</div>
					<a href="javascript:void(0)" class="col-12 input_box" onclick="workUpdate.open2DepthWritePopup(0,2)"><span>지역을 선택해주세요.</span></a>
				</li>
			</ul>
			<ul class="col-12 main_filter_popup_select_result_list_con" id="regionWriteSelectPopListCon">
			</ul>
			<div class="col-12 mt30 pl20 pr20 pb100 pb-md-40 main_filter_popup_select_btn_con">
				<div class="col-4 main_filter_popup_select_btn cancel_btn">
					<a href="javascript:void(0)" onclick="popupManager.removePopLatest(true)"><span>취소</span></a>
				</div>
				<div class="col-8 main_filter_popup_select_btn">
					<a href="javascript:void(0)" onclick="workUpdate.complete2DepthRegionWrite()"><span>적용하기</span></a>
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
					<a href="javascript:void(0)" class="col-12 input_box" onclick="workUpdate.open2DepthWritePopup(1,0)"><span>대분류를 선택해주세요.</span></a>
				</li>
				<li>
					<input type="hidden" name="categoryFilter1" id="categoryWrite1"/>
					<div class="col-12 label_box">소분류</div>
					<a href="javascript:void(0)" class="col-12 input_box" onclick="workUpdate.open2DepthWritePopup(1,1)"><span>소분류를 선택해주세요.</span></a>
				</li>
			</ul>
			<ul class="col-12 main_filter_popup_select_result_list_con" id="categoryWriteSelectPopListCon">
			</ul>
			<div class="col-12 mt30 pl20 pr20 pb100 pb-md-40 main_filter_popup_select_btn_con">
				<div class="col-4 main_filter_popup_select_btn cancel_btn">
					<a href="javascript:void(0)" onclick="popupManager.removePopLatest(true)"><span>취소</span></a>
				</div>
				<div class="col-8 main_filter_popup_select_btn">
					<a href="javascript:void(0)" onclick="workUpdate.complete2DepthCategoryWrite()"><span>적용하기</span></a>
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
					<a href="javascript:void(0)" onclick="workUpdate.complete2DepthDateWrite()"><span>적용하기</span></a>
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