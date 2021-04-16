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
<title>컨소시엄소개</title>
<link href="<c:url value='/resources/css/company.css'/>"
	rel="stylesheet">
</head>
<body>
	<div class="consortium__container">
		<img id="consortium__banner"
			src="${contextPath}/resources/image/consortium_banner.png">
		<div class="consortium__content">
			<img id="consortium__content"
				src="${contextPath}/resources/image/consortium_content.png">
		</div>
	</div>
</body>
</html>