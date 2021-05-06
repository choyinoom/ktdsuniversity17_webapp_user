<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value='/resources/css/memberForm.css'/>" rel="stylesheet">
<title>가입축하</title>
</head>
<body>
	<div class="celebration_container">
		<section class="banner" id="memberform__banner">
				<h1>회원가입</h1>
		</section>
		
		<div class="celebration_message">가입을 축하합니다</div>
		<img id="celebration_img" src="${contextPath}/resources/image/celebration.png">
		<div class="celebration_button">
		<button id="celebration_home" onclick="location.href='${contextPath}/'">홈으로</button>
		<button id="celebration_enroll" onclick="location.href='${contextPath}/course/listCourses.do'">수강신청</button>
		</div>
		
		
		
	</div>

</body>
</html>