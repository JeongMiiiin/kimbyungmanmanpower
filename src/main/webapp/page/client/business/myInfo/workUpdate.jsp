<%@page import="com.kimbyungman.spring.manpower.dto.MemberDto"%>
<%
	String pageTitle = "구인내역 변경";
	int memCategory = session.getAttribute("memberInfo") != null ? ((MemberDto) session.getAttribute("memberInfo")).getCategory() : -1;
	session.setAttribute("memCategory", memCategory);
	
	if(memCategory > 2){
		pageTitle = "구직내역 변경";
	}
	
	String pageCategory = request.getParameter("pageCategory");
	
	if(pageCategory.equals("recentDeal")){
		pageTitle = "최근 거래내역";
	}
	
	if(pageCategory.equals("recentApply")){
		pageTitle = "최근 지원내역";
	}
	
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>김병만인력관리 - 마이페이지 <%=pageTitle %></title>
	<%@ include file="../../../common/headInfo/css.jsp" %>
    <%@ include file="../../headInfo/css.jsp" %>
    <%@ include file="../../../common/headInfo/javascript.jsp" %>
    <%@ include file="../../headInfo/javascript.jsp" %>
     <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script type="text/javascript" src="<c:url value='/client/js/business/workUpdate.js'/>"></script>
    <script>
    	let footerIdx = 3;
    </script>
</head>
<body>
	<%@ include file="../inc/headerPc.jsp" %>
    <%@ include file="../inc/header.jsp" %>
    <%
		//로그인 체크
		int loginCheck = session.getAttribute("memberInfo") != null ? ((MemberDto) session.getAttribute("memberInfo")).getSn() : -1; 
		if(loginCheck == -1){
			%>
			<script>
				$(function(){
					alert('로그인을 진행해주시기 바랍니다.');
					window.location.replace("/personal/login");
				})
			</script>
	<%		
		return;	
		}
	%>
    <section class="col-12 pt27 sub_wrap">
    	<div class="col-12 col-center mw-1390 mt-md-67 pl-md-20 pr-md-20 my_info_pc_wrap">
    		<div class="col-12 col-md-3 hidden show-md-block my_info_pc_tab_list_con">
    			<div class="col-12 mb17 my_info_pc_tab_list_title">마이페이지</div>
    			<ul class="col-12 my_info_pc_tab_list">
    				<li class="active">
		    			<a href="javascript:void(0)">
		    				<span>구인내역</span>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="/business/myInfo/page?tabIdx=1">
		    				<span>정보수정</span>
		    			</a>
		    		</li>
    			</ul>
    		</div>
    		<form class="col-12 mt-md-47 col-md-9 my_info_work_view_wrap" action="/personal/myInfo/workUpdateAction" enctype="multipart/form-data" data-common-update-form>
	    		<div class="col-12 mb12 pl20 pr20 pl-md-0 pr-md-0 my_info_work_view_headline">상세 내용</div>
	    		<input type="hidden" name="workSn" id="workSn" value="${updateData.sn}"/>
	    		<ul class="col-12 pl20 pr20 pl-md-0 pr-md-0 my_info_work_view_list_con type_update">
	    			<li>
	    				<div class="col-0 label_box">
	    					<label for="workTitle">제목</label>
	    				</div>
	    				<div class="col-0 input_box">
	    					<input type="text" name="title" id="workTitle" class="input_style_0" value="${updateData.title}"/>
	    				</div>
	    			</li>
	    			<li>
	    				<div class="col-0 label_box">
	    					<label for="workPassword">비밀번호</label>
	    				</div>
	    				<div class="col-0 input_box">
	    					<input type="password" name="workPassword" id="workPassword" class="input_style_0" value="${updateData.password}"/>
	    				</div>
	    			</li>
	    			<li>
	    				<div class="col-0 label_box">
	    					<label for="workConfirmPassword">비밀번호 확인</label>
	    				</div>
	    				<div class="col-0 input_box">
	    					<input type="password" name="workConfirmPassword" id="workConfirmPassword" class="input_style_0" value="${updateData.password}"/>
	    					<div class="col-12 mt15 sign_up_assist_text active correct" style="display: none;">비밀번호가 일치합니다.</div>
							<div class="col-12 mt15 sign_up_assist_text incorrect" style="display: none;">비밀번호가 일치하지 않습니다.</div>
	    				</div>
	    			</li>
	    			<li>
	    				<div class="col-0 label_box">성별</div>
	    				<div class="col-0 input_box">
	    					<div class="col-12 radio_style_1_con">
									<div class="col-4 radio_style_1">
										<input type="radio" name="sex" value="2" id="workSex2" <c:if test="${updateData.sex eq 2}">checked</c:if>/>
										<label for="workSex2">무관</label>
									</div>
									<div class="col-4 radio_style_1">
										<input type="radio" name="sex" value="0" id="workSex0" <c:if test="${updateData.sex eq 0}">checked</c:if>/>
										<label for="workSex0">남</label>
									</div>
									<div class="col-4 radio_style_1">
										<input type="radio" name="sex" value="1" id="workSex1" <c:if test="${updateData.sex eq 1}">checked</c:if>/>
										<label for="workSex1">여</label>
									</div>
								</div>
	    				</div>
	    			</li>
	    			<li>
	    				<div class="col-0 label_box">지역</div>
	    				<div class="col-0 input_box">
	    					<input type="hidden" name="regionWriteList" id="regionWriteList" class="input_style_0" value="${updateData.region}"/>
							<a href="javascript:void(0)" class="popup_work_write_open_btn" onclick="workUpdate.openWritePopup(0)"><span>지역을 선택해주세요.</span></a>
							<ul class="col-12 popup_work_select_list" id="workWriteRegionList">
							<c:forEach var="list" items="${fn:split(updateData.region,',')}">
								<li><div><span>${list}</span><a href="javascript:void(0)" class="popup_work_select_list_delete_btn" onclick="workUpdate.deleteRegionWrite('${list}', $(this), 0)"></a></div></li>
							</c:forEach>
						</ul>
						</div>
	    			</li>
	    			<li>
	    				<div class="col-0 label_box">카테고리</div>
	    				<div class="col-0 input_box">
	    					<input type="hidden" name="categoryWriteList" id="categoryWriteList" class="input_style_0" value="${updateData.category}"/>
							<a href="javascript:void(0)" class="popup_work_write_open_btn" onclick="workUpdate.openWritePopup(1)"><span>카테고리를 선택해주세요.</span></a>
							<ul class="col-12 popup_work_select_list" id="workWriteCategoryList">
								<c:forEach var="list" items="${fn:split(updateData.category,',')}">
									<li><div><span>${list}</span><a href="javascript:void(0)" class="popup_work_select_list_delete_btn" onclick="workUpdate.deleteCategoryWrite('${list}', $(this), 0)"></a></div></li>
								</c:forEach>
							</ul>
						</div>
	    			</li>
	    			<li>
	    				<div class="col-0 label_box">내용</div>
	    				<div class="col-0 input_box">
	    					<textarea class="textarea_style_0" placeholder="내용을 입력해주세요" name="workContents" id="workContents">${updateData.contents}</textarea>
						</div>
	    			</li>
	    			<li class="type_date">
						<div class="col-0 label_box">기간</div>
						<div class="col-0 input_box">
							<input type="hidden" name="startDate" id="dateWriteStartDate" class="input_style_0" value="${fn:replace(updateData.startDateStr,'.','-')} ${updateData.startTime}" readonly/>
							<input type="hidden" name="endDate" id="dateWriteEndDate" class="input_style_0" value="${fn:replace(updateData.endDateStr,'.','-')} ${updateData.endTime}" readonly/>
							<a href="javascript:void(0)" class="popup_work_write_open_btn active" onclick="workUpdate.openWritePopup(2)" id="dateWriteText">
								<span>
									<span>${fn:substring(updateData.startDateStr,2,10)} <br class="hidden-md"/><c:set var="startHour" value="${fn:substring(updateData.startTime,0,2)}"/><c:if test="${startHour > 11 }">PM</c:if><c:if test="${startHour < 12 }">AM</c:if> ${updateData.startTime}</span>
									<span>~</span>
									<span>${fn:substring(updateData.endDateStr,2,10)} <br class="hidden-md"/><c:set var="endHour" value="${fn:substring(updateData.endTime,0,2)}"/><c:if test="${endHour > 11 }">PM</c:if><c:if test="${endHour < 12 }">AM</c:if> ${updateData.endTime}</span>
								</span>
							</a>
						</div>
					</li>
					<li>
						<div class="col-0 label_box">인원</div>
						<div class="col-0 input_box">
							<select name="workNumbers" id="workNumbers" class="select_style_0">
								<option value="0" <c:if test="${updateData.numbers eq 0}">selected</c:if>>1 ~ 50명</option>
								<option value="1" <c:if test="${updateData.numbers eq 1}">selected</c:if>>51 ~ 100명</option>
								<option value="2" <c:if test="${updateData.numbers eq 2}">selected</c:if>>101 ~ 150명</option>
								<option value="3" <c:if test="${updateData.numbers eq 3}">selected</c:if>>150명 이상</option>
							</select>
						</div>
					</li>
					<li class="type_payment">
						<div class="col-0 label_box">금액</div>
						<div class="col-0 input_box">
							<c:choose>
								<c:when test="${updateData.payment ne -1}">
									<input type="number" name="workPayment" id="workPayment" class="input_style_0" value="${updateData.payment}" pattern="\d*"/><div class="col-0 addr_text">원</div>
								</c:when>
								<c:otherwise>
									<input type="number" name="workPayment" id="workPayment" class="input_style_0" value="" pattern="\d*"/><div class="col-0 addr_text">원</div>
								</c:otherwise>
							</c:choose>
						</div>
					</li>
	    		</ul>
	    		<div class="col-12 mt20 mt-md-30 btn_style_0_con">
	    			<a href="javascript:void(0)" class="col-6 btn_style_0 type_2" onclick="workUpdate.updateForm(${updateData.sn}, '<%=pageCategory%>')">
	    				<span>완료</span>
	    			</a>
	    			<a href="javascript:void(0)" class="col-6 btn_style_0 type_2 type_grey" onclick="workUpdate.deleteAction(${updateData.sn})">
	    				<span>삭제</span>
	    			</a>
	    		</div>
		    </form>
    	</div>
    </section>
<%@ include file="../inc/footer.jsp" %>
<%@ include file="../inc/footerPc.jsp" %>

<!-- 지원자 내역 상세 팝업 -->
<div class="col-12 popup_style_3_wrap" id="applyViewPopup">
	<div class="col-12 popup_con">
		<div class="col-12 popup_inner">
			<div class="col-12 popup_title_con">
				<div class="col-12 popup_title">상세 내용</div>
			</div>
			<ul class="col-12 popup_contents_con">
				<li>
					<div class="col-0 label_box">이름</div>
					<div class="col-0 input_box" id="applyViewName"></div>
				</li>
				<li>
					<div class="col-0 label_box">어필정보</div>
					<div class="col-0 input_box" id="applyViewAppeal"></div>
				</li>
				<li>
					<div class="col-0 label_box">허가증</div>
					<div class="col-0 input_box" id="applyViewPermissionFile"></div>
				</li>
				<li>
					<div class="col-0 label_box">보건증</div>
					<div class="col-0 input_box" id="applyViewHealthCertificateFile"></div>
				</li>
				<li>
					<div class="col-0 label_box">기타서류</div>
					<div class="col-0 input_box" id="applyViewEtcFile"></div>
				</li>
			</ul>
			<div class="col-12 mt30 pl20 pr20 pb40 popup_style_3_btn_con">
				<div class="col-4 popup_style_3_btn cancel_btn">
					<a href="javascript:void(0)" onclick="popupManager.removePopLatest(true)"><span>닫기</span></a>
				</div>
				<div class="col-8 popup_style_3_btn">
					<a href="javascript:void(0)" id="applyMemberContactBtn"><span>연락하기</span></a>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 신고 선택 팝업 -->
<div class="col-12 popup_style_3_wrap" id="selectDeclarationPopup">
	<div class="col-12 popup_con">
		<div class="col-12 popup_inner">
			<div class="col-12 popup_title_con type_2">
				<div class="col-12 popup_title">신고하기</div>
			</div>
			<div class="col-12 mb14 popup_sub_title">정말로 신고하시겠습니까?</div>
			<ul class="col-12 popup_contents_con type_2">
				<li>
					<div class="col-12 label_box">사유</div>
					<div class="col-12 input_box">
						<select name="selectDeclarationReason" class="select_style_0">
							<option value="" disabled selected>사유를 선택해주세요</option>
							<option value="0">이행하지 않음</option>
							<option value="1">태도불량</option>
							<option value="2">지각</option>
						</select>
					</div>
				</li>
			</ul>
			<div class="col-12 mt30 pl20 pr20 pb40 popup_style_3_btn_con">
				<div class="col-6 popup_style_3_btn cancel_btn">
					<a href="javascript:void(0)" onclick="popupManager.removePopLatest(true)"><span>취소</span></a>
				</div>
				<div class="col-6 popup_style_3_btn type_grey">
					<a href="javascript:void(0)" onclick="workView.completeDeclaration()"><span>확인</span></a>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="popup.jsp" %>
</body>
</html>