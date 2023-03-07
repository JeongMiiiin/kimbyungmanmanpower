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
	<title>김병만인력관리 - 마이페이지 채팅내역</title>
	<%@ include file="../../../common/headInfo/css.jsp" %>
    <%@ include file="../../headInfo/css.jsp" %>
    <%@ include file="../../../common/headInfo/javascript.jsp" %>
    <%@ include file="../../headInfo/javascript.jsp" %>
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
		    				<span>구직내역</span>
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
		    				<span>구인내역</span>
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
	    		<li>
	    			<a href="/personal/myInfo/page?tabIdx=2">
	    				<span>정보수정</span>
	    			</a>
	    		</li>
	    		<li class="active">
	    			<a href="javascript:void(0)">
	    				<span>채팅내역</span>
	    			</a>
	    		</li>
	    	</ul>
    	</div>
    	<div class="col-12 col-center mw-1390 mt67 pl20 pr20 hidden show-md-block my_info_pc_wrap">
    		<div class="col-12 col-md-3 my_info_pc_tab_list_con">
    			<div class="col-12 mb17 my_info_pc_tab_list_title">마이페이지</div>
    			<ul class="col-12 my_info_pc_tab_list">
    				<%
		    		if(memCategory > 2){
		    			%>
		    			<li><a href="/personal/myInfo/page?tabIdx=1"><span>구직내역</span></a></li>
			    		<li><a href="/personal/myInfo/page?tabIdx=1"><span>지원내역</span></a></li>
		    			<%
		    		} else {
		    			%>
		    			<li><a href="/personal/myInfo/page?tabIdx=0"><span>구인내역</span></a></li>
			    		<li><a href="/personal/myInfo/page?tabIdx=1"><span>결제내역</span></a></li>
			    		<%
		    		}
		    		%>
    				<li><a href="/personal/myInfo/page?tabIdx=2"><span>정보수정</span></a></li>
    				<li class="active"><a href="javascript:void(0)"><span>채팅내역</span></a></li>
    				<%
			    		if(memCategory > 2){
			    			%>
			    			<li><a href="/personal/myInfo/page?tabIdx=4"><span>어필정보관리</span></a></li>
			    			<%	
			    		}
	    			%>
    			</ul>
    		</div>
    		<div class="col-12 col-md-9">
    			<div class="col-12 mt47 work_pc_list_wrap">
    				<div class="col-12 work_pc_list_title_con">
    					<div class="col-12 work_pc_list_title">
    						채팅내역
    					</div>
    				</div>
    				<ul class="col-12 work_pc_list_contents_con">
    					<c:forEach var="list" items="${resultList}">
		    				<c:choose>
		    					<c:when test="${list ne null}">
		    						<li onclick="window.location.href='/personal/liveChat?chatSn=${list.sn}'">
		    							<c:if test="${list.recentMsgSn ne 0 }">
		    								<div class="col-12 user_name">
					    						<c:choose>
						    						<c:when test="${memberSn eq list.recentMsgSn}">나</c:when>
						    						<c:otherwise>
						    							<c:choose>
								    						<c:when test="${memberSn eq list.user1Sn}">${list.user2Name}</c:when>
								    						<c:otherwise>
								    							${list.user1Name}
								    						</c:otherwise>
								    					</c:choose>		
						    						</c:otherwise>
						    					</c:choose>
						    				</div>
		    							</c:if>
					    				<div class="col-12 recent_msg">
					    					<c:choose>
						    					<c:when test="${list.recentMsgSn ne 0 }">${list.recentMsg}</c:when>
						    					<c:otherwise>
						    							<c:choose>
								    						<c:when test="${memberSn eq list.user1Sn}">${list.user2Name}</c:when>
								    						<c:otherwise>
								    							${list.user1Name}
								    						</c:otherwise>
								    					</c:choose>	
					    								님과의 채팅방
						    					</c:otherwise>
						    				</c:choose>
					    				</div>
					    				<span class="col-0 recent_date">
					    					<c:choose>
					    						<c:when test="${list.recentMsgDateStr eq '' || list.recentMsgDateStr eq null}">${list.createDateStr}</c:when>
					    						<c:otherwise>
					    							${list.recentMsgDateStr}
					    						</c:otherwise>
					    					</c:choose>
					    				</span>
				    				</li>
		    					</c:when>
		    					<c:otherwise>
		    						<li class="no_data">
				    					<span>최근 내역이 없습니다.</span>
				    				</li>
		    					</c:otherwise>
		    				</c:choose>
		    			</c:forEach>
		    			<c:if test="${empty resultList}">
		    				<li class="no_data">
		    					<span>최근 내역이 없습니다.</span>
		    				</li>
		    			</c:if>
    				</ul>
    			</div>
    		</div>
		</div>
    	<div class="col-12 hidden-md my_info_work_list_wrap">
    		<ul class="col-12 my_info_chat_con">
    			<c:forEach var="list" items="${resultList}">
    				<li onclick="window.location.href='/personal/liveChat?chatSn=${list.sn}'">
    					<c:if test="${list.recentMsgSn ne 0 }">
		    								<div class="col-12 user_name">
					    						<c:choose>
						    						<c:when test="${memberSn eq list.recentMsgSn}">나</c:when>
						    						<c:otherwise>
						    							<c:choose>
								    						<c:when test="${memberSn eq list.user1Sn}">${list.user2Name}</c:when>
								    						<c:otherwise>
								    							${list.user1Name}
								    						</c:otherwise>
								    					</c:choose>		
						    						</c:otherwise>
						    					</c:choose>
						    				</div>
		    							</c:if>
	    				<div class="col-12 recent_msg">
	    					<c:choose>
						    	<c:when test="${list.recentMsgSn ne 0 }">${list.recentMsg}</c:when>
						    	<c:otherwise>
						    		<c:choose>
										<c:when test="${memberSn eq list.user1Sn}">${list.user2Name}</c:when>
								    	<c:otherwise>
								    		${list.user1Name}
								    	</c:otherwise>
								    </c:choose>	
					    			님과의 채팅방
						    	</c:otherwise>
						    </c:choose>
	    				</div>
	    				<span class="col-0 recent_date">
	    					<c:choose>
	    						<c:when test="${list.recentMsgDateStr eq '' || list.recentMsgDateStr eq null}">${list.createDateStr}</c:when>
	    						<c:otherwise>
	    							${list.recentMsgDateStr}
	    						</c:otherwise>
	    					</c:choose>
	    				</span>
    				</li>
    			</c:forEach>
    			<c:if test="${empty resultList }">
    				<li class="no_data"><span>최근 내역이 없습니다.</span></li>
    			</c:if>
    		</ul>
    	</div>
    </section>
<%@ include file="../inc/footer.jsp" %>
<%@ include file="../inc/footerPc.jsp" %>
</body>
</html>