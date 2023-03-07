<%@page import="com.kimbyungman.spring.manpower.dto.MemberDto"%>
<%
	String pageTitle = "회사소개";
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
	<title>김병만인력관리 - 고객센터 회사소개</title>
	<%@ include file="../../../common/headInfo/css.jsp" %>
    <%@ include file="../../headInfo/css.jsp" %>
    <%@ include file="../../../common/headInfo/javascript.jsp" %>
    <%@ include file="../../headInfo/javascript.jsp" %>
    <script type="text/javascript" src="<c:url value='/client/js/personal/serviceCenter.js'/>"></script>
    <script>
    	let footerIdx = 2;
    	let headerPcTabIdx = 1;
    </script>
</head>
<body>
    <%@ include file="../inc/header.jsp" %>
    <%@ include file="../inc/headerPc.jsp" %>
    <section class="col-12 sub_wrap">
    </section>
	<%@ include file="../inc/footer.jsp" %>
	<%@ include file="../inc/footerPc.jsp" %>
</body>
</html>