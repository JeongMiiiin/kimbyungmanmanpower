<%@page import="com.kimbyungman.spring.manpower.dto.MemberDto"%>
<%
	String pageTitle = "구인내역 상세";
	int memCategory = session.getAttribute("memberInfo") != null ? ((MemberDto) session.getAttribute("memberInfo")).getCategory() : -1;
	session.setAttribute("memCategory", memCategory);
	
	if(memCategory > 2){
		pageTitle = "구직내역 상세";
	}
	
	String pageCategory = request.getParameter("pageCategory");
	
	if(pageCategory.equals("recentDeal")){
		pageTitle = "최근 거래내역 상세";
	}
	
	if(pageCategory.equals("recentApply")){
		pageTitle = "최근 지원내역 상세";
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
    <script type="text/javascript" src="<c:url value='/client/js/personal/workView.js'/>"></script>
    <script>
    	let footerIdx = 3;
    	let headerPcIdx = 2;
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
    				<%
		    		if(memCategory > 2){
		    			if(pageTitle.equals("구직내역 상세")){
		    				%>
		    				<li class="active"><a href="javascript:void(0)"><span>구직내역</span></a></li>
			    			<li><a href="/personal/myInfo/page?tabIdx=1"><span>지원내역</span></a></li>
		    			<%	
		    			} else {
		    				%>
		    				<li><a href="/personal/myInfo/page?tabIdx=0"><span>구직내역</span></a></li>
			    			<li class="active"><a href="javascript:void(0)"><span>지원내역</span></a></li>
		    				<%
		    			}
		    		} else {
		    			if(pageTitle.equals("구인내역 상세")){
		    				%>
		    				<li class="active"><a href="javascript:void(0)"><span>구인내역</span></a></li>
			    		<li><a href="/personal/myInfo/page?tabIdx=1"><span>결제내역</span></a></li>
		    			<%	
		    			} else {
		    				%>
		    				<li><a href="/personal/myInfo/page?tabIdx=0"><span>구인내역</span></a></li>
			    			<li class="active"><a href="javascript:void(0)"><span>결제내역</span></a></li>
		    				<%
		    			}
		    		}
		    		%>
    				<li><a href="/personal/myInfo/page?tabIdx=2"><span>정보수정</span></a></li>
    				<li><a href="/personal/myInfo/page?tabIdx=3"><span>채팅내역</span></a></li>
    				<%
			    		if(memCategory > 2){
			    			%>
			    			<li><a href="/personal/myInfo/page?tabIdx=4"><span>어필정보관리</span></a></li>
			    			<%	
			    		}
	    			%>
    			</ul>
    		</div>
    		<div class="col-12 mt-md-47 col-md-9 my_info_work_view_wrap">
	    		<div class="col-12 mb12 pl20 pr20 pl-md-0 pr-md-0 my_info_work_view_headline">상세 내용</div>
	    		<input type="hidden" name="workSn" id="workSn" value="${viewData.sn}"/>
	    		<input type="hidden" name="workTitle" id="workTitle" value="${viewData.title}"/>
	    		<input type="hidden" name="buyerName" id="buyerName" value="${viewData.memName}"/>
	    		<input type="hidden" name="buyerPhoneNum" id="buyerPhoneNum" value="${viewData.memPhoneNum}"/>
	    		<input type="hidden" name="buyerEmail" id="buyerEmail" value="${viewData.buyerEmail}"/>
	    		<input type="hidden" name="buyerAddr" id="buyerAddr" value="${viewData.buyerAddr}"/>
	    		<input type="hidden" name="buyerZipCode" id="buyerZipCode" value="${viewData.buyerZipCode}"/>
	    		<input type="hidden" name="workMemberSn" id="workMemberSn" value="${viewData.memberSn}"/>
	    		<input type="hidden" name="workPayment" id="workPayment" value="${viewData.payment}"/>
	    		<input type="hidden" name="impUid" id="impUid" value=""/>
	    		<input type="hidden" name="merchantUid" id="merchantUid" value=""/>
	    		<ul class="col-12 pl20 pr20 pl-md-0 pr-md-0 my_info_work_view_list_con">
	    			<li>
	    				<div class="col-0 label_box">제목</div>
	    				<div class="col-0 input_box">${viewData.title}</div>
	    			</li>
	    			<li>
	    				<div class="col-0 label_box">성별</div>
	    				<div class="col-0 input_box">
	    					<c:choose>
	    						<c:when test="${viewData.sex eq 0}">남</c:when>
	    						<c:when test="${viewData.sex eq 1}">여</c:when>
	    						<c:otherwise>무관</c:otherwise>
	    					</c:choose>
	    				</div>
	    			</li>
	    			<li>
	    				<div class="col-0 label_box">지역</div>
	    				<div class="col-0 input_box">${viewData.region}</div>
	    			</li>
	    			<li>
	    				<div class="col-0 label_box">카테고리</div>
	    				<div class="col-0 input_box">${viewData.category}</div>
	    			</li>
	    			<li>
	    				<div class="col-0 label_box">내용</div>
	    				<div class="col-0 input_box">${viewData.contents}</div>
	    			</li>
	    			<li class="type_date">
						<div class="col-0 label_box">기간</div>
						<div class="col-0 input_box">
							<span>${fn:substring(viewData.startDateStr,2,10)} <br class="hidden-md"/><c:set var="startHour" value="${fn:substring(viewData.startTime,0,2)}"/><c:if test="${startHour > 11 }">PM</c:if><c:if test="${startHour < 12 }">AM</c:if> ${viewData.startTime}</span>
							<span>~</span>
							<span>${fn:substring(viewData.endDateStr,2,10)} <br class="hidden-md"/><c:set var="endHour" value="${fn:substring(viewData.endTime,0,2)}"/><c:if test="${endHour > 11 }">PM</c:if><c:if test="${endHour < 12 }">AM</c:if> ${viewData.endTime}</span>
						</div>
					</li>
					<li>
						<div class="col-0 label_box">금액</div>
						<div class="col-0 input_box"><fmt:formatNumber value="${viewData.payment}" pattern="#,###" />원</div>
					</li>
	    		</ul>
	    		<%
		    		if(pageTitle.equals("구인내역 상세") || pageTitle.equals("구직내역 상세")){
		    			%>
		    			<div class="col-12 mt20 mt-md-30 btn_style_0_con">
			    			<a href="/personal/myInfo/workUpdate?sn=${viewData.sn}&pageCategory=<%=pageCategory%>" class="col-0 btn_style_0 type_2">
			    				<span>수정</span>
			    			</a>
			    			<a href="/personal/myInfo/page?tabIdx=0" class="col-6 btn_style_0 type_2 type_grey">
			    				<span>목록</span>
			    			</a>
			    		</div>
		    			<%
		    		}
		    			%>
	    		<c:if test="${viewData.classType eq 0 && memCategory eq 2 }">
	    			<c:choose>
	    				<c:when test="${viewData.status eq 0}">
	    					<div class="col-12 mt27 mt-md-47 pl20 pl-md-0 pr20 pr-md-0 my_info_work_apply_list_wrap">
			    				<div class="col-12 mb12 my_info_work_view_headline">지원내역</div>
			    				<ul class="col-12 my_info_work_apply_list_con">
			    					<c:forEach var="applyData" items="${viewData.applyList}">
			    						<li>
			    							<div class="col-12 col-md-0">
			    								<div class="col-12 my_info_work_apply_list_title">${applyData.memberName}</div>
				    							<div class="col-12 my_info_work_apply_list_status">
				    								<span>상태</span>
				    								<span>
				    									<c:choose>
						    								<c:when test="${applyData.status eq 0}">지원중</c:when>
						    								<c:when test="${applyData.status eq 1}">선정완료</c:when>
						    								<c:when test="${applyData.status eq 2}">거절</c:when>
						    								<c:when test="${applyData.status eq 3}">신고</c:when>
							    							<c:otherwise>지급완료</c:otherwise>
						    							</c:choose>
				    								</span>
				    							</div>
				    							<div class="col-12 my_info_work_apply_list_contents" data-apply-member-sn="${applyData.memberSn}">${applyData.appealContents}</div>
			    							</div>
			    							<div class="col-12 my_info_work_apply_btn_con mt-10">
			    								<input type="hidden" name="applyMemberSn${applyData.sn}" id="applyMemberSn${applyData.sn}" value="${applyData.memberSn}"/>
			    								<div class="col-4 my_info_work_apply_btn"><span onclick="workView.attemptApplyStatus(${applyData.sn}, ${viewData.sn}, 1)">선택</span></div>
			    								<div class="col-4 my_info_work_apply_btn reject_btn"><span onclick="workView.attemptApplyStatus(${applyData.sn}, ${viewData.sn}, 2)">거절</span></div>
			    								<div class="col-4 my_info_work_apply_btn view_btn"><span onclick="workView.viewApplyMember(${applyData.memberSn})">보기</span></div>
			    							</div>
			    						</li>
			    					</c:forEach>
			    					<c:if test="${empty viewData.applyList}">
			    						<li class="no_data">지원자가 없습니다</li>
			    					</c:if>
			    				</ul>
			    			</div>
	    				</c:when>
	    				<c:otherwise>
	    					<div class="col-12 mt27 pl20 pr20 my_info_work_apply_list_wrap">
			    				<div class="col-12 mb12 my_info_work_view_headline">선정자</div>
			    				<ul class="col-12 my_info_work_apply_list_con">
			    					<c:forEach var="applyData" items="${viewData.applyList}">
			    						<input type="hidden" name="selectApplySn" id="selectApplySn" value="${applyData.sn}"/>
			    							<input type="hidden" name="selectApplyMemberSn" id="selectApplyMemberSn" value="${applyData.memberSn}"/>
			    							<li>
				    							<div class="col-12 my_info_work_apply_list_title">${applyData.memberName}</div>
				    							<div class="col-12 my_info_work_apply_list_status">
				    								<span>상태</span>
				    								<span>
				    									<c:choose>
						    								<c:when test="${applyData.status eq 0}">지원중</c:when>
						    								<c:when test="${applyData.status eq 1}">선정완료</c:when>
						    								<c:when test="${applyData.status eq 2}">거절</c:when>
						    								<c:when test="${applyData.status eq 3}">신고</c:when>
						    								<c:otherwise>지급완료</c:otherwise>
						    							</c:choose>
				    								</span>
				    							</div>
				    							<div class="col-12 my_info_work_apply_list_contents" data-apply-member-sn="${applyData.memberSn}">${applyData.appealContents}</div>
				    							<div class="col-12 my_info_work_apply_btn_con mt-10">
				    								<div class="col-6 my_info_work_apply_btn"><span onclick="workView.contactMember(${applyData.memberSn}, '${applyData.memberName}')">채팅</span></div>
				    								<div class="col-6 my_info_work_apply_btn view_btn"><span onclick="workView.viewApplyMember(${applyData.memberSn})">보기</span></div>
				    							</div>
				    						</li>
			    					</c:forEach>
			    					<c:if test="${empty viewData.applyList}">
			    						<li class="no_data">지원자가 없습니다</li>
			    					</c:if>
			    				</ul>
			    				<c:if test="${viewData.status eq 1}">
			    					<div class="col-12 mt40 btn_style_0_con my_info_work_complete_btn_con">
				    					<div class="col-4">
				    						<div class="col-12 btn_style_0 type_red" onclick="workView.openDeclarationPopup()"><span>신고</span></div>
				    					</div>
				    					<div class="col-8">
				    						<div class="col-12 btn_style_0 type_blue" onclick="workView.completeDeal(${viewData.sn})"><span>완료</span></div>
				    					</div>
				    				</div>
			    				</c:if>
			    				<c:if test="${viewData.status eq 3}">
			    					
			    					<div class="col-12 mt40 btn_style_0_con my_info_work_complete_btn_con">
				    					<div class="col-12">
				    						<div class="col-12 btn_style_0 type_grey" onclick="workView.cancelDeclaration()"><span>신고취소</span></div>
				    					</div>
				    				</div>
			    				</c:if>
			    			</div>
	    				</c:otherwise>
	    			</c:choose>
	    		</c:if>
		    </div>
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

</body>
</html>