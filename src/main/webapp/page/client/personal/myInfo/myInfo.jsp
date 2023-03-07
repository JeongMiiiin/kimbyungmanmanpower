<%@page import="com.kimbyungman.spring.manpower.dto.MemberDto"%>

<%
	String pageTitle = "마이페이지";
	int memCategory = session.getAttribute("memberInfo") != null ? ((MemberDto) session.getAttribute("memberInfo")).getCategory() : -1; 

%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>김병만인력관리 - 마이페이지 정보 수정</title>
	<%@ include file="../../../common/headInfo/css.jsp" %>
    <%@ include file="../../headInfo/css.jsp" %>
    <%@ include file="../../../common/headInfo/javascript.jsp" %>
    <%@ include file="../../headInfo/javascript.jsp" %>
    <script type="text/javascript" src="<c:url value='/client/js/personal/myInfo.js'/>"></script>
    <script>
    	let footerIdx = 3;
    	let headerPcIdx = 2;
    </script>
</head>
<body>
	<%@ include file="../inc/headerPc.jsp" %>
    <%@ include file="../inc/headerIntro.jsp" %>
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
    <section class="col-12 sub_wrap">
    	<div class="col-12 hidden-md">
    		<ul class="col-12 mb27 my_info_tab_list_con">
	    		<%
	    		if(memCategory > 2){
	    			%>
	    			<li>
		    			<a href="/personal/myInfo/page?tabIdx=0">
		    				<span>
		    				구직내역
		    				</span>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="/personal/myInfo/page?tabIdx=1">
		    				<span>지원내역</span>
		    			</a>
		    		</li>
	    			<%
	    		} else {
	    			%>
	    			<li>
		    			<a href="/personal/myInfo/page?tabIdx=0">
		    				<span>
		    				구인내역
		    				</span>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="/personal/myInfo/page?tabIdx=1">
		    				<span>결제내역</span>
		    			</a>
		    		</li>
		    		<%
	    		}
	    		%>
	    		<li class="active">
	    			<a href="javascript:void(0)">
	    				<span>정보수정</span>
	    			</a>
	    		</li>
	    		<li>
	    			<a href="/personal/myInfo/page?tabIdx=3">
	    				<span>채팅내역</span>
	    			</a>
	    		</li>
	    		<%
	    		if(memCategory > 2){
	    			%>
	    			<li>
		    			<a href="/personal/myInfo/page?tabIdx=4">
		    				<span>어필정보관리</span>
		    			</a>
		    		</li>
	    			<%	
	    		}
	    		%>
	    	</ul>
    	</div>
    	<div class="col-12 col-center mw-1390 mt-md-67 pl20 pr20 my_info_pc_wrap">
    		<div class="col-12 col-md-3 hidden show-md-block my_info_pc_tab_list_con">
    			<div class="col-12 mb17 my_info_pc_tab_list_title">마이페이지</div>
    			<ul class="col-12 my_info_pc_tab_list">
    				<%
		    		if(memCategory > 2){
		    			%>
		    			<li><a href="/personal/myInfo/page?tabIdx=0"><span>구직내역</span></a></li>
			    		<li><a href="/personal/myInfo/page?tabIdx=1"><span>지원내역</span></a></li>
		    			<%
		    		} else {
		    			%>
		    			<li><a href="/personal/myInfo/page?tabIdx=0"><span>구인내역</span></a></li>
			    		<li><a href="/personal/myInfo/page?tabIdx=1"><span>결제내역</span></a></li>
			    		<%
		    		}
		    		%>
    				<li class="active"><a href="javascript:void(0)"><span>정보수정</span></a></li>
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
    		<form class="col-12 col-md-9 my_info_update_list_con" action="/personal/myInfo/updateMyInfo" enctype="multipart/form-data" method="POST" data-common-update-form id="updateMyInfoForm">
	    		<input type="hidden" name="sn" value="${myInfo.sn}"/>
	    		<input type="hidden" name="certificationPhone" value="1"/>
	    		<input type="hidden" name="permissionFileList"/>
	    		<input type="hidden" name="healthCertificateFileList"/>
	    		<input type="hidden" name="etcFileList"/>
	    		<input type="hidden" name="completeFileList"/>
	    		<div class="col-12 my_info_update_list">
	    			<div class="col-12 label_box"><span>알림 수신 여부</span></div>
	    			<div class="col-12 input_box">
	    				<div class="col-0 mr20 checkbox_style_0_con">
	    					<input type="radio" class="checkbox_style_0" name="noticeAgree" id="noticeAgree0" value="0" <c:if test='${myInfo.noticeAgree eq 0}'>checked</c:if>/>
	    					<label for="noticeAgree0">허용</label>
	    				</div>
	    				<div class="col-0 checkbox_style_0_con">
	    					<input type="radio" class="checkbox_style_0" name="noticeAgree" id="noticeAgree1" value="1" <c:if test='${myInfo.noticeAgree eq 1}'>checked</c:if>/>
	    					<label for="noticeAgree1">허용안함</label>
	    				</div>
	    			</div>
	    		</div>
	    		<div class="col-12 my_info_update_list">
	    			<div class="col-12 label_box"><label for="name">이름</label></div>
	    			<div class="col-12 input_box">
	    				<input type="text" class="input_style_1" id="name" name="name" value="${myInfo.name}"/>
	    			</div>
	    		</div>
	    		<div class="col-12 my_info_update_list type_phone">
	    			<div class="col-12 label_box"><label for="phoneNum">휴대 전화 번호</label></div>
	    			<div class="col-12 input_box">
	    				<input type="number" name="phoneNum" id="phoneNum" value="${myInfo.phone0}${myInfo.phone1}${myInfo.phone2}" class="input_style_1" placeholder="휴대전화번호를 '-'없이 입력해주세요" pattern="\d*"/>
	    				<div class="col-0 ml10 btn_style_1_con">
	    					<a href="javascript:void(0)" class="btn_style_1" onclick="myInfo.certificatePhoneNum()"><span>재인증</span></a>
	    				</div>
	    			</div>
	    		</div>
	    		<div class="col-12 my_info_update_list" id="certificationCodeCon" style="display: none;">
					<div class="col-12 label_box"><label for="submitCode">인증번호</label></div>
					<div class="col-12 input_box">
						<input type="text" id="submitCode" name="submitCode" class="input_style_0" placeholder="인증번호를 입력해주세요." maxlength="6"/>
					</div>
					<div class="col-12 mt10 btn_style_1_con">
	    					<a href="javascript:void(0)" class="col-12 tc btn_style_1" onclick="myInfo.submitCertificateNum()"><span>인증번호 확인</span></a>
	    				</div>
				</div>
	    		<%
	    		if(memCategory > 2){
	    			%>
	    			<div class="col-12 my_info_update_list type_phone">
		    			<div class="col-12 label_box"><label for="bankNum">계좌번호</label></div>
		    			<div class="col-12 input_box">
		    				<div class="col-12 mb20">
		    					<select name="bankName" class="select_style_0">
									<option value="002" <c:if test="${updateData.bankName eq '002'}">selected</c:if>>산업은행</option>
											<option value="003" <c:if test="${updateData.bankName eq '003'}">selected</c:if>>기업은행</option>
											<option value="004" <c:if test="${updateData.bankName eq '004'}">selected</c:if>>국민은행</option>
											<option value="007" <c:if test="${updateData.bankName eq '007'}">selected</c:if>>수협</option>
											<option value="011" <c:if test="${updateData.bankName eq '011'}">selected</c:if>>농협</option>
											<option value="012" <c:if test="${updateData.bankName eq '012'}">selected</c:if>>지역농축협</option>
											<option value="020" <c:if test="${updateData.bankName eq '020'}">selected</c:if>>우리은행</option>
											<option value="023" <c:if test="${updateData.bankName eq '023'}">selected</c:if>>SC제일은행</option>
											<option value="027" <c:if test="${updateData.bankName eq '027'}">selected</c:if>>한국씨티은행</option>
											<option value="031" <c:if test="${updateData.bankName eq '031'}">selected</c:if>>대구은행</option>
											<option value="032" <c:if test="${updateData.bankName eq '032'}">selected</c:if>>부산은행</option>
											<option value="034" <c:if test="${updateData.bankName eq '034'}">selected</c:if>>광주은행</option>
											<option value="035" <c:if test="${updateData.bankName eq '035'}">selected</c:if>>제주은행</option>
											<option value="037" <c:if test="${updateData.bankName eq '037'}">selected</c:if>>전북은행</option>
											<option value="039" <c:if test="${updateData.bankName eq '039'}">selected</c:if>>경남은행</option>
											<option value="045" <c:if test="${updateData.bankName eq '045'}">selected</c:if>>새마을금고</option>
											<option value="048" <c:if test="${updateData.bankName eq '048'}">selected</c:if>>신협</option>
											<option value="050" <c:if test="${updateData.bankName eq '050'}">selected</c:if>>저축은행</option>
											<option value="054" <c:if test="${updateData.bankName eq '054'}">selected</c:if>>HSBC은행</option>
											<option value="055" <c:if test="${updateData.bankName eq '055'}">selected</c:if>>도이치은행</option>
											<option value="057" <c:if test="${updateData.bankName eq '057'}">selected</c:if>>JP모간체이스은행</option>
											<option value="060" <c:if test="${updateData.bankName eq '060'}">selected</c:if>>BOA은행</option>
											<option value="061" <c:if test="${updateData.bankName eq '061'}">selected</c:if>>BNP파리바은행</option>
											<option value="062" <c:if test="${updateData.bankName eq '062'}">selected</c:if>>중국공상은행</option>
											<option value="064" <c:if test="${updateData.bankName eq '064'}">selected</c:if>>산림조합</option>
											<option value="067" <c:if test="${updateData.bankName eq '067'}">selected</c:if>>중국건설은행</option>
											<option value="071" <c:if test="${updateData.bankName eq '071'}">selected</c:if>>우체국</option>
											<option value="081" <c:if test="${updateData.bankName eq '081'}">selected</c:if>>하나은행</option>
											<option value="088" <c:if test="${updateData.bankName eq '088'}">selected</c:if>>신한은행</option>
											<option value="089" <c:if test="${updateData.bankName eq '089'}">selected</c:if>>케이뱅크</option>
											<option value="090" <c:if test="${updateData.bankName eq '090'}">selected</c:if>>카카오뱅크</option>
											<option value="209" <c:if test="${updateData.bankName eq '209'}">selected</c:if>>유안타증권</option>
											<option value="218" <c:if test="${updateData.bankName eq '218'}">selected</c:if>>KB증권</option>
											<option value="227" <c:if test="${updateData.bankName eq '227'}">selected</c:if>>KTB투자증권</option>
											<option value="238" <c:if test="${updateData.bankName eq '238'}">selected</c:if>>미래에셋대우</option>
											<option value="240" <c:if test="${updateData.bankName eq '240'}">selected</c:if>>삼성증권</option>
											<option value="243" <c:if test="${updateData.bankName eq '243'}">selected</c:if>>한국투자증권</option>
											<option value="247" <c:if test="${updateData.bankName eq '247'}">selected</c:if>>NH투자증권</option>
											<option value="261" <c:if test="${updateData.bankName eq '261'}">selected</c:if>>교보증권</option>
											<option value="262" <c:if test="${updateData.bankName eq '262'}">selected</c:if>>하이투자증권</option>
											<option value="263" <c:if test="${updateData.bankName eq '263'}">selected</c:if>>현대차증권</option>
											<option value="264" <c:if test="${updateData.bankName eq '264'}">selected</c:if>>키움증권</option>
											<option value="265" <c:if test="${updateData.bankName eq '265'}">selected</c:if>>이베스트투자증권</option>
											<option value="266" <c:if test="${updateData.bankName eq '266'}">selected</c:if>>SK증권</option>
											<option value="267" <c:if test="${updateData.bankName eq '267'}">selected</c:if>>대신증권</option>
											<option value="269" <c:if test="${updateData.bankName eq '269'}">selected</c:if>>한화투자증권</option>
											<option value="270" <c:if test="${updateData.bankName eq '270'}">selected</c:if>>하나금융투자</option>
											<option value="278" <c:if test="${updateData.bankName eq '278'}">selected</c:if>>신한금융투자</option>
											<option value="279" <c:if test="${updateData.bankName eq '279'}">selected</c:if>>DB금융투자</option>
											<option value="280" <c:if test="${updateData.bankName eq '280'}">selected</c:if>>유진투자증권</option>
											<option value="287" <c:if test="${updateData.bankName eq '287'}">selected</c:if>>메리츠종합금융증권</option>
											<option value="288" <c:if test="${updateData.bankName eq '288'}">selected</c:if>>카카오페이증권</option>
											<option value="290" <c:if test="${updateData.bankName eq '290'}">selected</c:if>>부국증권</option>
											<option value="291" <c:if test="${updateData.bankName eq '291'}">selected</c:if>>신영증권</option>
											<option value="292" <c:if test="${updateData.bankName eq '292'}">selected</c:if>>케이프투자증권</option>
											<option value="294" <c:if test="${updateData.bankName eq '294'}">selected</c:if>>펀드온라인코리아</option>
		    					</select>
		    				</div>
		    				<input type="text" name="bankNum" id="bankNum" value="${myInfo.bankNum}" class="input_style_1"/>
		    				<div class="col-0 ml10 btn_style_1_con">
		    					<a href="javascript:void(0)" class="btn_style_1" onclick="myInfo.certificateBankNum()"><span>재인증</span></a>
		    				</div>
		    			</div>
		    		</div>
		    		<div class="col-12 my_info_update_list">
		    			<div class="col-12 label_box"><span>허가증</span></div>
		    			<div class="col-12 input_box">
		    				<div class="col-12 file_input_style_0_con">
		    					<c:set var="permissionListLen" value="0"/>
		    					<c:forEach var="permissionList" items="${myInfo.permissionFileNameList}" varStatus="status">
		    						<input type="file" id="permissionFile${status.index}" name="permissionFile${status.index}" data-common-file-input accept=".gif, .jpg, .png" data-file-seq="${permissionList.seq}"/>
		    						<c:set var="permissionListLen" value="${permissionListLen + 1}"/>	
		    					</c:forEach>
		    					<input type="file" id="permissionFile${permissionListLen}" name="permissionFile${permissionListLen}" data-common-file-input accept=".gif, .jpg, .png"/>
			    				<ul>
			    					<c:forEach var="permissionList" items="${myInfo.permissionFileNameList}" varStatus="status">
			    						<li><a href="javascript:void(0)" data-file-delete-btn data-target-file="permissionFile${status.index}"><span>${permissionList.name}</span><span class="file_delete_btn" data-file-delete-btn data-target-file="permissionFile${status.index}">파일삭제</span></a></li>
			    					</c:forEach>
									<li><a href="javascript:void(0)" class="file_add_btn" data-file-insert-btn data-target-file="permissionFile${permissionListLen}"><span>파일등록</span></a></li>
								</ul>
							</div>
		    			</div>
		    		</div>
		    		<div class="col-12 my_info_update_list">
		    			<div class="col-12 label_box"><span>보건증</span></div>
		    			<div class="col-12 input_box">
		    				<div class="col-12 file_input_style_0_con">
			    				<c:set var="healthCertificateFileListLen" value="0"/>
		    					<c:forEach var="healthCertificateList" items="${myInfo.healthCertificateFileNameList}" varStatus="status">
		    						<input type="file" id="healthCertificateFile${status.index}" name="healthCertificateFile${status.index}" data-common-file-input accept=".gif, .jpg, .png" data-file-seq="${healthCertificateList.seq}"/>
		    						<c:set var="healthCertificateListLen" value="${healthCertificateListLen + 1}"/>	
		    					</c:forEach>
		    					<input type="file" id="healthCertificateFile${healthCertificateListLen}" name="healthCertificateFile${healthCertificateListLen}" data-common-file-input accept=".gif, .jpg, .png"/>
			    				<ul>
			    					<c:forEach var="healthCertificateList" items="${myInfo.healthCertificateFileNameList}" varStatus="status">
			    						<li><a href="javascript:void(0)" data-file-delete-btn data-target-file="healthCertificateFile${status.index}"><span>${healthCertificateList.name}</span><span class="file_delete_btn" data-file-delete-btn data-target-file="healthCertificateFile${status.index}">파일삭제</span></a></li>
			    					</c:forEach>
									<li><a href="javascript:void(0)" class="file_add_btn" data-file-insert-btn data-target-file="healthCertificateFile${healthCertificateListLen}"><span>파일등록</span></a></li>
								</ul>
							</div>
		    			</div>
		    		</div>
		    		<div class="col-12 my_info_update_list">
		    			<div class="col-12 label_box"><span>기타서류</span></div>
		    			<div class="col-12 input_box">
		    				<div class="col-12 file_input_style_0_con">
			    				<c:set var="etcFileListLen" value="0"/>
		    					<c:forEach var="etcList" items="${myInfo.etcFileNameList}" varStatus="status">
		    						<input type="file" id="etcFile${status.index}" name="etcFile${status.index}" data-common-file-input accept=".gif, .jpg, .png" data-file-seq="${etcList.seq}"/>
		    						<c:set var="etcListLen" value="${etcListLen + 1}"/>	
		    					</c:forEach>
		    					<input type="file" id="etcFile${etcListLen}" name="etcFile${etcListLen}" data-common-file-input accept=".gif, .jpg, .png"/>
			    				<ul>
			    					<c:forEach var="etcList" items="${myInfo.etcFileNameList}" varStatus="status">
			    						<li><a href="javascript:void(0)" data-file-delete-btn data-target-file="etcFile${status.index}"><span>${etcList.name}</span><span class="file_delete_btn" data-file-delete-btn data-target-file="etcFile${status.index}">파일삭제</span></a></li>
			    					</c:forEach>
									<li><a href="javascript:void(0)" class="file_add_btn" data-file-insert-btn data-target-file="etcFile${etcListLen}"><span>파일등록</span></a></li>
								</ul>
							</div>
		    			</div>
		    		</div>
		    		<div class="col-12 my_info_update_list">
		    			<div class="col-12 label_box"><span>이수증</span></div>
		    			<div class="col-12 input_box">
		    				<div class="col-12 file_input_style_0_con">
		    					<c:set var="completeListLen" value="0"/>
		    					<c:forEach var="completeList" items="${myInfo.completeFileNameList}" varStatus="status">
		    						<input type="file" id="completeFile${status.index}" name="completeFile${status.index}" data-common-file-input accept=".gif, .jpg, .png" data-file-seq="${completeList.seq}"/>
		    						<c:set var="completeListLen" value="${completeListLen + 1}"/>	
		    					</c:forEach>
		    					<input type="file" id="completeFile${completeListLen}" name="completeFile${completeListLen}" data-common-file-input accept=".gif, .jpg, .png"/>
			    				<ul>
			    					<c:forEach var="completeList" items="${myInfo.completeFileNameList}" varStatus="status">
			    						<li><a href="javascript:void(0)" data-file-delete-btn data-target-file="completeFile${status.index}"><span>${completeList.name}</span><span class="file_delete_btn" data-file-delete-btn data-target-file="completeFile${status.index}">파일삭제</span></a></li>
			    					</c:forEach>
									<li><a href="javascript:void(0)" class="file_add_btn" data-file-insert-btn data-target-file="completeFile${completeListLen}"><span>파일등록</span></a></li>
								</ul>
							</div>
							<div class="col-12 mt7 sign_up_assist_text">개인정보는 삭제 후 업로드 해주시기 바랍니다.</div>
		    			</div>
		    		</div>
	    			<%
	    		}
	    			%>
	    	</form>
    	</div>
    		<div class="col-12 col-center mw-1390 pl20 pr20 mt-md-40 mb-md-99 hidden show-md-block">
    			<div class="col-12 col-md-9 fr btn_style_0_con">
					<a href="javascript:void(0)" class="col-6 btn_style_0 type_2 type_grey" onclick="history.back()"><span>취소</span></a>
					<a href="javascript:void(0)" class="col-6 btn_style_0 type_2 type_blue" onclick="myInfo.updateMyInfo()"><span>변경</span></a>
				</div>
    		</div>
	    	<div class="col-12 mt40 pl20 pr20 btn_style_0_con hidden-md">
				<a href="javascript:void(0)" class="col-12 btn_style_0 type_blue" onclick="myInfo.updateMyInfo()">
					<span>변경</span>
				</a>
			</div>
    	
    </section>
<%@ include file="../inc/footer.jsp" %>
<%@ include file="../inc/footerPc.jsp" %>
</body>
</html>