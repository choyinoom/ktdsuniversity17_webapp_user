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
<link rel="stylesheet"
	href="<c:url 
value='/resources/css/loginForm.css'/>">

</head>

<body>
	<!--  배너 	-->
	<div class="banner" id="login__banner">
		<div class="layer">
			<h1>로그인</h1>
		</div>
	</div>

	
	<div class="mx-auto grid ai-center" id="login__container">
		<!-- 로그인폼 -->
		<form name="frmLogin" method="post"	action="${contextPath}/member/login.do" class="login__form">
			<input type="text" name="id" placeholder="아이디" required>
			<input type="password" name="pw" placeholder="비밀번호" required>
			<input type="submit" id="login__btn" value="로그인">
			<c:choose>
				<c:when test="${result=='loginFailed' }">
					<c:if test="${failedCount != null && failedCount >= 5}">
						<p>로그인에 5회이상 실패하였습니다.</p>
					</c:if>
					<c:if test="${failedCount == null }">
						<p>존재하지 않는 아이디이거나, 잘못된 비밀번호 입니다.</p>
			
					</c:if>
				</c:when>
			</c:choose>
		</form>
		<!-- 도움 받기 -->
		<div id="login__help">
			<div id="find__pw">
			<span><b>비밀번호를 잊어버리셨나요?</b><br></span>
			<a href="${contextPath}/member/findPwdForm.do">비밀번호 찾기</a>	
		</div>
		<div id="join">
			<span><b>회원이 아니신가요?</b><br></span>
			<a href="${contextPath}/member/joinAgree.do">회원가입하기</a>
		</div>
		</div>
		
	</div>
</body>
</html>
