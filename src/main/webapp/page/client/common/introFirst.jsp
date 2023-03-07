<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>김병만 인력관리 - 모바일용 첫 화면</title>
    <%@ include file="../../common/headInfo/css.jsp" %>
    <%@ include file="../headInfo/css.jsp" %>
    <%@ include file="../../common/headInfo/javascript.jsp" %>
    <%@ include file="../headInfo/javascript.jsp" %>
    <script>
	$(function(){
		let goUrl = "/intro";
	
		let app_token = new URL(window.location.href).searchParams.get('app_token');
		
		if(app_token != null){
			goUrl += "?app_token=" + app_token;
		}
		/*
		setTimeout(function(){
			window.location.replace(goUrl);
			}, 2000);
		
		})
		*/
    </script>
</head>

<body>
	<section class="col-12" style="width: 100vw; height: 100vh; display: flex; flex-wrap: wrap; justify-content: center; align-items: center; background-color: #fff; padding: 20px;">
		<div class="col-12 tc">
			<img src="<c:url value='/client/img/intro_logo_img_000.png'/>" style="max-width: 50%;"/>
		</div>
	</section>
</body>
</html>