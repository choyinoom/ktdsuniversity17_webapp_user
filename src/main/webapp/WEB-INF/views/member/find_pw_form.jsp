<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 찾기</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value='/resources/css/findPw.css'/>">
</head>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		$("#email_btn").click(function() {
			$.ajax({
				url : '${contextPath}/member/find_pw.do',
				type : "POST",
				data : {
					id : $("#id").val(),
					email : $("#email").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
</script>

<body>

	<!--  배너 	-->
	<section class="banner" id="findPw__banner">
		<h1>비밀번호 찾기</h1>
	</section>

	<form name="findPw" id="findPwForm">
		<div class="findPw_container">

			<div class="findPw_menu">
				<button class="menu_button">비밀번호 찾기</button>
			</div>

			<div class="findPw_id">

				<input type="text" id="id" name="id" placeholder="회원가입한 아이디를 입력하세요." required><br>
				<div class="findPw_email">
					<input type="text" id="email" name="email" placeholder="회원가입한 이메일 주소를 입력하세요." required><br>
				</div>


			</div>
		</div>

		<div class="findPw_under">
			<button type="button" id="email_btn">이메일로 발송</button>
			<button type="button" id="cancel_btn" onclick="history.go(-1);">취소</button>
		</div>
	</form>
</body>
</html>