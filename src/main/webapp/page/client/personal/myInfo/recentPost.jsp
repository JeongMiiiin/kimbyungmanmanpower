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
	<title>김병만인력관리 - 마이페이지 최근 게시물</title>
	<%@ include file="../../../common/headInfo/css.jsp" %>
    <%@ include file="../../headInfo/css.jsp" %>
    <%@ include file="../../../common/headInfo/javascript.jsp" %>
    <%@ include file="../../headInfo/javascript.jsp" %>
    <script type="text/javascript" src="<c:url value='/client/js/personal/recentPost.js'/>"></script>
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
	    			<li class="active">
		    			<a href="javascript:void(0)">
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
	    			<li class="active">
		    			<a href="javascript:void(0)">
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
    	<div class="col-12 col-center mw-1390 mt67 pl20 pr20 hidden show-md-block my_info_pc_wrap">
    		<div class="col-12 col-md-3 my_info_pc_tab_list_con">
    			<div class="col-12 mb17 my_info_pc_tab_list_title">마이페이지</div>
    			<ul class="col-12 my_info_pc_tab_list">
    				<%
		    		if(memCategory > 2){
		    			%>
		    			<li class="active"><a href="javascript:void(0)"><span>구직내역</span></a></li>
			    		<li><a href="/personal/myInfo/page?tabIdx=1"><span>지원내역</span></a></li>
		    			<%
		    		} else {
		    			%>
		    			<li class="active"><a href="javascript:void(0)"><span>구인내역</span></a></li>
			    		<li><a href="/personal/myInfo/page?tabIdx=1"><span>결제내역</span></a></li>
			    		<%
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
    		<div class="col-12 col-md-9">
    			<div class="col-12 mt47 work_pc_list_wrap">
    				<div class="col-12 work_pc_list_title_con">
    					<div class="col-12 work_pc_list_title">
    						<%
					    		if(memCategory > 2){
					    			%>
					    			구직내역
					    			<%
					    		} else {
					    			%>
					    			구인내역
						    		<%
					    		}
					    		%>
    					</div>
    				</div>
    				<ul class="col-12 work_pc_list_contents_con">
    					<c:forEach var="result" items="${resultList}">
		    				<c:choose>
		    					<c:when test="${result ne null}">
		    						<li onclick="window.location.href='/personal/myInfo/workView?sn=${result.sn}&pageCategory=recentPost'">
		    							<div class="col-12 mw-430">
		    								<div class="col-12 my_info_work_list_title">
						    					${result.title}
						    				</div>
						    				<ul class="col-12 my_info_work_list_info">
						    					<%-- <li>
						    						<span>조회수</span>
						    						<span>
						    							${result.hits}
						    						</span>
						    					</li> --%>
						    					<li>
						    						<span>작성일</span>
						    						<span>${result.createDateStr}</span>
						    					</li>
						    				</ul>
		    							</div>
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
    	<div class="col-12 hidden-md pl20 pr20 my_info_work_list_wrap">
    		<div class="col-12 my_info_work_list_headline">
    			<%
	    		if(memCategory > 2){
	    			%>
	    			최근 구직내역
	    			<%
	    		} else {
	    			%>
	    			최근 구인내역
		    		<%
	    		}
	    		%>
    		</div>
    		<ul class="col-12 my_info_work_list_con">
    			<c:forEach var="result" items="${resultList}">
    				<c:choose>
    					<c:when test="${result ne null}">
    						<li onclick="window.location.href='/personal/myInfo/workView?sn=${result.sn}&pageCategory=recentPost'">
		    					<div class="col-12 my_info_work_list_title">
			    					${result.title}
			    				</div>
			    				<ul class="col-12 my_info_work_list_info">
			    					<%-- <li>
			    						<span>조회수</span>
			    						<span>
			    							${result.hits}
			    						</span>
			    					</li> --%>
			    					<li>
			    						<span>작성일</span>
			    						<span>${result.createDateStr}</span>
			    					</li>
			    				</ul>
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
    </section>
    
<%@ include file="../inc/footer.jsp" %>
<%@ include file="../inc/footerPc.jsp" %>
</body>
</html>