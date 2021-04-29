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
<title>로그인창</title>
<c:choose>
	<c:when test="${result=='loginFailed' }">
		<script>
			window.onload = function() {
				alert("아이디나 비밀번호가 틀립니다.다시 로그인 하세요!");
			}
		</script>
	</c:when>
</c:choose>
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
		</form>
		<!-- 도움 받기 -->
		<div id="login__help">
			<div id="find__pw">
			<span><b>비밀번호를 잊어버리셨나요?</b><br></span>
			<a href="${contextPath}/member/find_pw_form.do">비밀번호 찾기</a>	
		</div>
		<div id="join">
			<span><b>회원이 아니신가요?</b><br></span>
			<a href="${contextPath}/member/joinAgree.do">회원가입하기</a>
		</div>
		</div>
		
	</div>
	
	 

</body>
</html>
