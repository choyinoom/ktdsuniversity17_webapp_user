<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>

<html>
<head>
<meta charset="UTF-8">
<title>ERROR</title>
</head>
<body>
<div class="error_container" style="display:flex; justify-content: center;">
	<div class="error_img" style="position : absolute; width:100%; height: 100vh;">
	<img src="${contextPath}/resources/image/errorpage.png">
	</div>
	<div class="error_button" style="position:relative; top:750px;">
		<a style="border-radius:12px;  font-weight : bold; text-decoration: none; padding : 20px; width : 100px; height : 50px; font-size: 20px; color:#EFEFEF; background:#E91B23;" href="${contextPath}/">홈으로 돌아가기</a>
	</div>
	</div>
</body>
</html>