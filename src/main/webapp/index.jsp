<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <title>JSP Redirect</title>
    </head>
    <body>
       <%
          String redirectURL = "/intro";
          response.sendRedirect(redirectURL);
        %>
    </body>
</html>